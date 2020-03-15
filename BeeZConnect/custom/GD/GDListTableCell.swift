

import UIKit

class GDListTableCell: UITableViewCell {
    
    var delegate: GDListCellDelegate?
    
    var toDo: ToDo? {
        didSet {
            guard let toDo = toDo else { return }
                textField.text = toDo.title
                box.id = toDo.id
                box.isToggled = toDo.status
        }
    }
    
    @objc fileprivate func handleBoxStatus() {
        if let delegate = self.delegate, let textFieldText = textField.text, let toDo = self.toDo {
            let newToDo = ToDo(id: toDo.id, title: textFieldText, status: !toDo.status)
            delegate.toggleBox(newToDo)
        }
    }
    
    let textField = GDTextField(placeholder: "TODO", leftInset: 8)
    let box = GDCheckBox()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        checkIfFrameZero()
        backgroundColor = .clear
        self.selectionStyle = .none
        setupCellUI()
    }
    
    fileprivate func setupCellUI() {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let insets: CGFloat = 4
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets * -1).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: insets * -1).isActive = true
        
        // textField
        view.addSubview(textField)
        let textInsets: CGFloat = 6
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: textInsets).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: textInsets).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: textInsets * -1).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: textInsets * -1).isActive = true
        
        // checkBox
        addSubview(box)
        let boxInsets: CGFloat = -18
        box.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        box.rightAnchor.constraint(equalTo: self.rightAnchor, constant: boxInsets).isActive = true
        box.heightAnchor.constraint(equalToConstant: 18).isActive = true
        box.widthAnchor.constraint(equalTo: box.heightAnchor, multiplier: 1).isActive = true
        box.addTarget(self, action: #selector(handleBoxStatus), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
