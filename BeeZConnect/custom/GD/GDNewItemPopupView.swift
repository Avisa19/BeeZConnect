

import UIKit

class GDNewItemPopupView: GDGradientView {
    
    var delegate: GDNewItemDelegate?
    
    fileprivate let cancelButton = GDButton(title: "   cancel   ", type: .roundedText, size: 16, cornerRadius: 4)
    fileprivate let addButton = GDButton(title: "  add  ", type: .roundedText, size: 16, cornerRadius: 4)
    let textField = GDTextField(placeholder: "Buy a frame from IKEA", leftInset: 8)
    fileprivate var popupLocation: CGFloat = 80
    
    @objc fileprivate func handleCancel() {
        textField.resignFirstResponder()
        animatePopupView()
    }
    
    @objc fileprivate func handleAdd() {
        if let delegate = self.delegate, let textFieldText = textField.text {
            delegate.addItemToList(textFieldText)
        }
    }
    
    @objc func animatePopupView() {
        
        textField.resignFirstResponder()
        self.animateView(transform: CGAffineTransform(translationX: 0, y: self.popupLocation), duration: 0.3)
        if popupLocation == 80 {
            popupLocation = 0
        } else {
            popupLocation = 80
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        self.layer.cornerRadius = 14
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animatePopupView)))
        
        // cancel
        let insets: CGFloat = 12
        let height: CGFloat = 25
        addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: self.topAnchor, constant: insets).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        // add
        addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: insets).isActive = true
        addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: insets * -1).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        // textField
        addSubview(textField)
        let inset: CGFloat = 28
        textField.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: insets).isActive = true
        textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: inset).isActive = true
        textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: inset * -1).isActive = true
        textField.heightAnchor.constraint(equalToConstant: inset).isActive = true
        
        cancelButton.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    }
}
