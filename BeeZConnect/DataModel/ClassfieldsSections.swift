

import UIKit

enum ClassfieldsSections: Int, CaseIterable, CustomStringConvertible {
    case Concerts
    case Arts
    case Theatre
    case FamilyEvents
    
    var description: String {
        switch self {
        case .Concerts: return "Concerts"
        case .Arts: return "Arts"
        case .Theatre: return "Theatre"
        case .FamilyEvents: return "Family Eve"
        }
    }
}
