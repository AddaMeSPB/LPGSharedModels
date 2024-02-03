import Foundation
import BSON

public struct ConversationOutPut: Identifiable {
    public var id: ObjectId
    public var title: String
    public var type: ConversationType
    public var admins: [UserOutput]
    public var members: [UserOutput]?
    public var lastMessage: MessageItem?
    public var createdAt, updatedAt: Date
    public var deletedAt: Date?
    
    public init(
        id: ObjectId,
        title: String,
        type: ConversationType,
        admins: [UserOutput],
        members: [UserOutput]? = nil,
        lastMessage: MessageItem?,
        createdAt: Date,
        updatedAt: Date,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.type = type
        self.admins = admins
        self.members = members
        self.lastMessage = lastMessage
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
}

extension ConversationOutPut: Equatable {}

extension ConversationOutPut: Codable {}

extension ConversationOutPut: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: ConversationOutPut, rhs: ConversationOutPut) -> Bool {
        lhs.id == rhs.id &&
        lhs.lastMessage == rhs.lastMessage
    }
    
    public static func < (lhs: ConversationOutPut, rhs: ConversationOutPut) -> Bool {
        guard let lhsLstMsg = lhs.lastMessage, let rhsLstMsg = rhs.lastMessage,
              let lhsDate = lhsLstMsg.updatedAt, let rhsDate = rhsLstMsg.updatedAt
        else { return false }

        return lhsDate > rhsDate
    }
}

extension ConversationOutPut: Comparable {}

extension ConversationOutPut {

    // This computed property is now simplified to directly check for a non-empty attachments array.
    public var hasAttachments: Bool {
        return lastMessage?.sender.attachments?.isEmpty == false
    }

    // This computed property is refined for clarity and efficiency.
    public var imageUrlString: String {
        guard
            hasAttachments,
            let imageUrlString = lastMessage?.sender.attachments?.last?.imageUrlString else {
            return ""
        }

        return imageUrlString
    }
}

public struct ConversationOutPutOneToOneChat: Identifiable, Codable {
    public var id: ObjectId
    public var title: String
    public var type: ConversationType
    public var lastMessage: MessageItem?
    public var createdAt, updatedAt, deletedAt: Date?
    
    public init(
        id: ObjectId,
        title: String,
        type: ConversationType,
        lastMessage: MessageItem?,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.type = type
        self.lastMessage = lastMessage
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}
