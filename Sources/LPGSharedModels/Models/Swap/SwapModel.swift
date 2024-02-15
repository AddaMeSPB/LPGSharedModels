import Foundation
import BSON

public struct SwapModel: Codable {

    public static var collectionName = "swaps"

    public init(
        _id: ObjectId,
        title: String,
        details: String? = nil,
        distance: Double? = nil,
        status: SPStatus = .available,
        addressName: String,
        geometry: Geometry,
        sponsored: Bool? = false,
        overlay: Bool? = false,
        ownerId: ObjectId,
        conversationId: ObjectId,
        categoryId: ObjectId,
        urlString: String,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self._id = _id
        self.title = title
        self.details = details
        self.distance = distance
        self.status = status


        // Place information
        self.addressName = addressName
        self.geometry = geometry
        self.sponsored = sponsored
        self.overlay = overlay

        self.ownerId = ownerId
        self.conversationId = conversationId
        self.categoryId = categoryId
        self.urlString = urlString

        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public var _id: ObjectId
    public var title: String
    public var details: String?
    public var distance: Double?
    public var status: SPStatus

    // Place information
    public var addressName: String
    public var geometry: Geometry
    public var sponsored: Bool?
    public var overlay: Bool?

    public var ownerId: ObjectId
    public var conversationId: ObjectId
    public var categoryId: ObjectId
    public var urlString: String

    public var createdAt: Date?
    public var updatedAt: Date?

}

extension SwapModel {
    public func mapGet(
        attachments: [AttachmentInOutPut],
        userOutput: UserOutput
    ) -> SwapOutput {
        return .init(id: self._id, title: self.title, details: self.details, distance: self.distance ?? 0.0, status: status, addressName: self.addressName, geometry: self.geometry, sponsored: self.sponsored, overlay: self.overlay, owner: userOutput, conversationId: self.conversationId, categoryId: self.categoryId, attachments: attachments, urlString: self.urlString, createdAt: self.createdAt!, updatedAt: self.updatedAt!)
    }
}


extension SwapModel: Equatable {
    public static func == (lhs: SwapModel, rhs: SwapModel) -> Bool {
        return lhs._id == rhs._id &&
               lhs.title == rhs.title &&
               lhs.details == rhs.details &&
               lhs.distance == rhs.distance &&
               lhs.status == rhs.status &&
               lhs.addressName == rhs.addressName &&
               lhs.geometry == rhs.geometry &&
               lhs.sponsored == rhs.sponsored &&
               lhs.overlay == rhs.overlay &&
               lhs.ownerId == rhs.ownerId &&
               lhs.conversationId == rhs.conversationId &&
               lhs.categoryId == rhs.categoryId &&
               lhs.urlString == rhs.urlString &&
               lhs.createdAt == rhs.createdAt &&
               lhs.updatedAt == rhs.updatedAt
    }
}
