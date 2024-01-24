
import BSON
import Foundation


public struct SwapInput {
    public var name: String
    public var details: String?
    public var images: [AttachmentInOutPut] = []
    public var isActive: Bool
    public var ownerId: ObjectId?
    public var conversationId: ObjectId?
    public var categoryId: ObjectId

    // Place Information
    public var addressName: String
    public var sponsored: Bool?
    public var overlay: Bool?
    public var geometry: Geometry

    public init(
        name: String,
        details: String? = nil,
        images: [AttachmentInOutPut] = [],
        isActive: Bool,
        ownerId: ObjectId? = nil,
        conversationId: ObjectId? = nil,
        categoryId: ObjectId,
        addressName: String,
        sponsored: Bool? = nil,
        overlay: Bool? = nil,
        geometry: Geometry
    ) {
        self.name = name
        self.details = details
        self.images = images
        self.isActive = isActive
        self.ownerId = ownerId
        self.conversationId = conversationId
        self.categoryId = categoryId
        self.addressName = addressName
        self.sponsored = sponsored
        self.overlay = overlay
        self.geometry = geometry
    }
}

extension SwapInput {
    public static var empty: SwapInput = .init(
        name: "", isActive: false,
        ownerId: nil, conversationId: ObjectId(),
        categoryId: ObjectId(), addressName: "",
        geometry: .init(type: .Polygon, coordinates: [0.0, 0.0])
    )
}

extension SwapInput: Codable {}
extension SwapInput: Equatable {}
