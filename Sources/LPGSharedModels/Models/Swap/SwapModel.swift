import Foundation
import BSON

public struct SwapModel: Codable {

    public static var collectionName = "swaps"

    public init(
        _id: ObjectId,
        title: String,
        details: String? = nil,
        distance: Double? = nil,
        addressName: String,
        geometry: Geometry,
        sponsored: Bool? = false,
        overlay: Bool? = false,
        ownerId: ObjectId,
        conversationsId: ObjectId,
        categoriesId: ObjectId,
        urlString: String,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self._id = _id
        self.title = title
        self.details = details
        self.distance = distance

        // Place information
        self.addressName = addressName
        self.geometry = geometry
        self.sponsored = sponsored
        self.overlay = overlay

        self.ownerId = ownerId
        self.conversationId = conversationsId
        self.categoryId = categoriesId
        self.urlString = urlString

        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public var _id: ObjectId
    public var title: String
    public var details: String?
    public var distance: Double?

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
    public func mapGet(attachments: [AttachmentInOutPut], userOutput: UserOutput) -> SwapOutput {
        return .init(id: self._id, title: self.title, details: self.details, distance: self.distance ?? 0.0, addressName: self.addressName, geometry: self.geometry, sponsored: self.sponsored, overlay: self.overlay, owner: userOutput, conversationId: self.conversationId, categoryId: self.categoryId, attachments: attachments, urlString: self.urlString, createdAt: self.createdAt!, updatedAt: self.updatedAt!)
    }
}


extension SwapModel: Equatable {
    public static func == (lhs: SwapModel, rhs: SwapModel) -> Bool {
        return lhs._id == rhs._id
        && lhs.createdAt == rhs.createdAt
        && lhs.addressName == rhs.addressName
        && rhs.geometry == rhs.geometry
    }
}
