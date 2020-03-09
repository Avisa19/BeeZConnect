

import UIKit


extension UIColor {
    
    static var honeyZero: UIColor { return UIColor.init(red: 235, green: 231, blue: 118) }
    static var honeyOne: UIColor { return UIColor.init(red: 245, green: 166, blue: 65) }
    static var honeyTextZero: UIColor { return UIColor.init(red: 110, green: 70, blue: 23)}
    static var honeyTextOne: UIColor { return UIColor.init(red: 68, green: 44, blue: 11)}
    static var honeyTwo: UIColor { return UIColor.init(red: 161, green: 148, blue: 122)}
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
