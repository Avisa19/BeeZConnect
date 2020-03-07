

import UIKit

enum MeSelectiveSection: Int, CaseIterable, CustomStringConvertible {
    
    case Location
    case Following
    case Saved
    
    var description: String {
        switch self {
        case .Location: return "Loaction"
        case .Following: return "Following"
        case .Saved: return "Saved"
        }
    }
}

struct IconImage {
    let image : UIImage
}

