import Foundation
import BSON

public struct ConversationModel: Codable {

    public static var collectionName = "conversations"

    public var _id: ObjectId
    public var title: String
    public var type: ConversationType
    public var lastMessage: MessageItem?

    public var admins: Set<ObjectId>
    public var members: Set<ObjectId>?

    public var createdAt: Date?
    public var updatedAt: Date?

    public init(
        _id: ObjectId,
        title: String,
        type: ConversationType,
        lastMessage: MessageItem? = nil,
        admins: Set<ObjectId>,
        members: Set<ObjectId>? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self._id = _id
        self.title = title
        self.type = type
        self.lastMessage = lastMessage
        self.admins = admins
        self.members = members
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public func toBSON() throws -> Document {
        let encoder = BSONEncoder()
        let bson = try encoder.encode(self)
        return bson
    }
}

extension ConversationModel: Equatable {
    
}
