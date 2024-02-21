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

import BSON

public struct SPStatusUpdateInput: Codable, Equatable {

    public let spId: ObjectId
    public let status: SPStatus

    public init(spId: ObjectId, status: SPStatus) {
        self.spId = spId
        self.status = status
    }

}
