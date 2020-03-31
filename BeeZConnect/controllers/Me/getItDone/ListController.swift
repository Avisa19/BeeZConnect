
import UIKit

class ListController: UIViewController, GDPopupMenuDelegate, GDNewItemDelegate {
    
    fileprivate func alertToUser() {
        let alertController = UIAlertController(title: "Already Added", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func notInList(_ text: String) -> Bool {
        var notInList = true
        self.listData.forEach { (toDo) in
            if toDo.title == text {
                notInList = false
                alertToUser()
            }
        }
        return notInList
    }
    
    func addItemToList(_ text: String) {
        if (notInList(text)) {
            CoreDataManager.shared.createData(id: Double(listData.count), title: text, status: false)
            self.listData = CoreDataManager.shared.fetchData()
            tableList.reloadData()
            self.updateItemHeaderLeft()
            self.popup.textField.text = ""
            self.popup.animatePopupView()
        }
    }
    
    func didOpenPopupMenu() {
        popup.animatePopupView()
    }
    
    fileprivate func updateItemHeaderLeft() {
        headerView.itemLeft = 0
        self.listData.forEach { (toDo) in
            if !toDo.status { headerView.itemLeft += 1 }
        }
    }
    
    fileprivate let insets: CGFloat = 20
    fileprivate let headerView = GDHeaderView(title: "stuff to get done", subTitle: "4 Left", cornerRadius: 4)
    fileprivate let bg = GDGradientView(cornerRadius: 16)
    fileprivate let tableList = GDTableView()
    fileprivate let LISTCELL_ID = "listCellID"
    fileprivate var listData: [ToDo] = []
    fileprivate var updatedToDo: ToDo?
    
    fileprivate let popup = GDNewItemPopupView()
    fileprivate var keyboardHeight: CGFloat = 333 // 346
    fileprivate var bgBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        claculateKeyboardHeight()
        self.updateItemHeaderLeft()
        popup.animatePopupView()
        self.listData = CoreDataManager.shared.fetchData()
    }
    
    fileprivate func claculateKeyboardHeight() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size {
                self.keyboardHeight = keyboardSize.height
            }
        }
    }
    
    fileprivate func setupUI() {
        
        // header
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        headerView.delegate = self
        
        // bg
        view.addSubview(bg)
        bg.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: insets).isActive = true
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets * -1).isActive = true
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 110 * -1)
        bgBottom.isActive = true
        
        // tableList
        let tableInsets: CGFloat = 10
        bg.addSubview(tableList)
        tableList.topAnchor.constraint(equalTo: bg.topAnchor, constant: tableInsets).isActive = true
        tableList.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tableInsets).isActive = true
        tableList.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: tableInsets * -1).isActive = true
        tableList.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: tableInsets * -1).isActive = true
        tableList.dataSource = self
        tableList.delegate = self
        tableList.register(GDListTableCell.self, forCellReuseIdentifier: LISTCELL_ID)
        
        // popup
        view.addSubview(popup)
        popup.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 100).isActive = true
        popup.delegate = self
        popup.textField.delegate = self
    }
}

extension ListController: UITableViewDataSource, UITableViewDelegate, GDListCellDelegate {
    func toggleBox() {
        self.listData = CoreDataManager.shared.fetchData()
        self.tableList.reloadData()
        self.updateItemHeaderLeft()
    }
    /*
    func toggleBox(_ updatedToDo: ToDo) {
        let newListData = self.listData.map { (oldToDo) -> ToDo in
            if oldToDo.id == updatedToDo.id {
                var newToDo = oldToDo
                newToDo.status = updatedToDo.status
                newToDo.title = updatedToDo.title
                return newToDo
            }
          return oldToDo
        }
        self.listData = newListData
        self.tableList.reloadData()
        self.updateItemHeaderLeft()
    }
 */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleHeader = GDLabel(frame: .init(x: 0, y: 0, width: view.frame.width, height: 44), textColor: .white, size: 18)
        if section == 0 {
            titleHeader.text = "ToDo"
        } else if section == 1 {
            titleHeader.text = "Done"
        }
        
        return titleHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        self.listData.forEach { (toDo) in
            if (section == 0 && !toDo.status) {
                count += 1
            } else if (section == 1 && toDo.status) {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LISTCELL_ID, for: indexPath) as! GDListTableCell
        cell.delegate = self
        cell.textField.delegate = self
        var itemForEachSection: [ToDo] = []
        self.listData.forEach { (toDo) in
            if (indexPath.section == 0 && !toDo.status) {
                itemForEachSection.append(toDo)
            } else if (indexPath.section == 1 && toDo.status) {
                itemForEachSection.append(toDo)
            }
        }
        cell.toDo = itemForEachSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
}

extension ListController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    fileprivate func animateLayoutIfNeeded() {
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.keyboardHeight = 333
        
        var heightToAnimate = -keyboardHeight - 20
        if popup.textField == textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.75)
            heightToAnimate -= 110
        } else {
            self.updatedToDo = CoreDataManager.shared.fetchData(title: textField.text!)
        }
        
        self.bgBottom.constant = heightToAnimate
        animateLayoutIfNeeded()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        var heightToAnimate: CGFloat = -20
        if popup.textField == textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.75)
            heightToAnimate -= 110
        } else {
            if let updatedTodo = self.updatedToDo {
                CoreDataManager.shared.deleteToDos(id: updatedTodo.id)
                CoreDataManager.shared.createData(id: updatedTodo.id, title: textField.text!, status: updatedTodo.status)
            }
        }
        
        self.bgBottom.constant = heightToAnimate
        animateLayoutIfNeeded()
    }
}
