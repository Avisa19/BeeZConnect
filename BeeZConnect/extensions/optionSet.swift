

import UIKit

struct ButtonOptions: OptionSet {
    let rawValue: Int
    
    static let roundedText = ButtonOptions(rawValue: 1 << 0)
    static let squaredIcon = ButtonOptions(rawValue: 1 << 1)

}

