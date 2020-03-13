

import UIKit


extension UIColor {
    
    static var honeyZero: UIColor { return UIColor.init(red: 235, green: 231, blue: 118) }
    static var honeyOne: UIColor { return UIColor.init(red: 245, green: 166, blue: 65) }
    static var honeyTextZero: UIColor { return UIColor.init(red: 110, green: 70, blue: 23)}
    static var honeyTextOne: UIColor { return UIColor.init(red: 68, green: 44, blue: 11)}
    static var honeyTextTwo: UIColor { return UIColor.init(red: 161, green: 148, blue: 122)}
    static var honeyTextThree: UIColor { return UIColor.init(red: 168, green: 154, blue: 128)}
    static var gdGreen: UIColor { return UIColor.init(red: 74, green: 175, blue: 177) }
    static var gdOrange: UIColor { return UIColor.init(red: 233, green: 175, blue: 80)}
    static var gdTextGreen: UIColor { return UIColor.init(red: 41, green: 105, blue: 109)}
    
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

extension UIView {
    func checkIfFrameZero() {
        if self.frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}



