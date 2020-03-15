
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
        let newItem = ToDo(id: self.listData.count + 1, title: text, status: false)
        self.listData.append(newItem)
        tableList.reloadData()
        self.popup.textField.text = ""
        self.popup.animatePopupView()
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
    fileprivate let headerView = GDHeaderView(cornerRadius: 4)
    fileprivate let bg = GDGradientView(cornerRadius: 16)
    fileprivate let tableList = GDTableView()
    fileprivate let LISTCELL_ID = "listCellID"
    fileprivate var listData: [ToDo] = [
        ToDo(id: 1, title: "Walmart", status: true),
        ToDo(id: 2, title: "Costco", status: false),
        ToDo(id: 3, title: "WholeFood", status: true)
    ]
    
    fileprivate let popup = GDNewItemPopupView()
    fileprivate var keyboardHeight: CGFloat = 333 // 346
    fileprivate var bgBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        claculateKeyboardHeight()
        popup.animatePopupView()
    }
    
    fileprivate func claculateKeyboardHeight() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size {
                self.keyboardHeight = keyboardSize.height
                print(self.keyboardHeight)
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
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LISTCELL_ID, for: indexPath) as! GDListTableCell
        cell.delegate = self
        cell.textField.delegate = self
        cell.toDo = self.listData[indexPath.row]
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
        self.bgBottom.constant = -keyboardHeight - 110
        animateLayoutIfNeeded()
        if popup.textField == textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.75)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.bgBottom.constant = -110
        animateLayoutIfNeeded()
        if popup.textField == textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.75)
        }
    }
}
