import Foundation

public enum SPStatus: Int, Equatable, CaseIterable, Identifiable {
    case available = 0
    case exchanged = 1
    case givenAway = 2

    public var id: Self { self }

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
