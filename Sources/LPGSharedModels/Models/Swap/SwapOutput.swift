import Foundation
import BSON


public struct SwapOutput: Codable {
    public init(
        id: ObjectId,
        title: String,
        details: String?,
        distance: Double,
        addressName: String,
        geometry: Geometry,
        sponsored: Bool? = false,
        overlay: Bool? = false,
        owner: UserOutput,
        conversationId: ObjectId,
        categoryId: ObjectId,
        attachments: [AttachmentInOutPut],
        urlString: String,
        createdAt: Date,
        updatedAt: Date
    ) {
        self.id = id
        self.title = title
        self.details = details
        self.distance = distance
        self.addressName = addressName
        self.geometry = geometry
        self.sponsored = sponsored
        self.overlay = overlay
        self.owner = owner
        self.conversationId = conversationId
        self.categoryId = categoryId
        self.attachments = attachments
        self.urlString = urlString
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public var id: ObjectId
    public var title: String
    public var details: String?
    public var distance: Double

    // Place information
    public var addressName: String
    public var geometry: Geometry
    public var sponsored: Bool?
    public var overlay: Bool?

    public var owner: UserOutput
    public var conversationId: ObjectId
    public var categoryId: ObjectId

    public var attachments: [AttachmentInOutPut]

    public var urlString: String

    public var createdAt: Date
    public var updatedAt: Date
}

extension SwapOutput: Identifiable {}

extension SwapOutput: Equatable {
    static public func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.distance == rhs.distance
        && lhs.geometry == rhs.geometry
        && lhs.owner == rhs.owner
        && lhs.conversationId == rhs.conversationId
        && lhs.categoryId == rhs.categoryId
        && lhs.attachments == rhs.attachments
        && lhs.urlString == rhs.urlString
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
    }
}
