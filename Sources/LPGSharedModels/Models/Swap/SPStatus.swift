import Foundation

public enum SPStatus: Int, Equatable {
    case available
    case exchanged
    case givenAway

    public var humanReadable: String {
        switch self {
        case .available:
            return "Available"
        case .exchanged:
            return "Exchanged"
        case .givenAway:
            return "Given Away"
        }
    }
}

extension SPStatus: Codable {}
