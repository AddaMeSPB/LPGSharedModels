
import Foundation
import BSON

public enum AttachmentType: String, Codable {
    case file, image, audio, video
}

public struct AttachmentInOutPut: Codable {
    
    public var id: ObjectId?
    public var type: AttachmentType
    public var userId: ObjectId?
    public var swapId: ObjectId?
    public var conversationId: ObjectId?
    public var imageUrlString: String?
    public var audioUrlString: String?
    public var videoUrlString: String?
    public var fileUrlString: String?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deletedAt: Date?
    
    public init(
        id: ObjectId? = nil,
        type: AttachmentType,
        userId: ObjectId? = nil,
        swapId: ObjectId? = nil,
        conversationId: ObjectId? = nil,
        imageUrlString: String? = nil,
        audioUrlString: String? = nil,
        videoUrlString: String? = nil,
        fileUrlString: String? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.type = type
        self.userId = userId
        self.swapId = swapId
        self.imageUrlString = imageUrlString
        self.audioUrlString = audioUrlString
        self.videoUrlString = videoUrlString
        self.fileUrlString = fileUrlString
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
}

extension AttachmentInOutPut: Identifiable {}

extension AttachmentInOutPut: Equatable {
    public static func < (lhs: AttachmentInOutPut, rhs: AttachmentInOutPut) -> Bool {
        guard let lhsDate = lhs.updatedAt, let rhsDate = rhs.createdAt else { return false }
        return lhsDate > rhsDate
    }
}

extension AttachmentInOutPut: Hashable {}


public struct AttachmentURL: Codable, Equatable {
    public init(
        userId: ObjectId? = nil,
        swapId: ObjectId? = nil,
        link: String
    ) {
        self.userId = userId
        self.swapId = swapId
        self.link = link
    }
    
    public let userId: ObjectId?
    public let swapId: ObjectId?
    public let link: String
}
