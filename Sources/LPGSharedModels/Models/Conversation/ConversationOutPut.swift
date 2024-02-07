import Foundation
import BSON

public struct ConversationOutPut: Identifiable {
    public var id: ObjectId
    public var title: String
    public var type: ConversationType
    public var admins: [UserOutput]
    public var members: [UserOutput]?
    public var products: [ObjectId]?
    public var lastMessage: MessageItem?
    public var createdAt, updatedAt: Date
    public var deletedAt: Date?
    
    public init(
        id: ObjectId,
        title: String,
        type: ConversationType,
        admins: [UserOutput],
        members: [UserOutput]? = nil,
        products: [ObjectId]? = nil,
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
        self.products = products
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
        return admins.last?.attachments?.last != nil
    }

    // This computed property is refined for clarity and efficiency.
    public var imageUrlString: String {
        guard
            hasAttachments,
            let imageUrlString = admins.last?.attachments?.last?.imageUrlString else {
            return ""
        }

        return imageUrlString
    }
}

//extension ConversationOutPut {
//
//    public var opponentAvatarURLString: String {
//        switch type {
//        case .group:
//            // In a group conversation, we aim to show the last image sent by an admin, if available.
//            let lastAdminImageURL = admins.compactMap { admin -> String? in
//                // Utilizing the `UserOutput` extension to get the last image attachment URL
//                admin.getLastImageAttachmentURLString()
//            }.last
//            return lastAdminImageURL ?? UserOutput.defaultAvatarURLString
//
//        case .oneToOne:
//            // In a one-to-one conversation, we show the opponent's avatar.
//            // Determine the opponent by excluding the current user from members.
//            if let opponent = members?.first(where: { $0.id != currentUserId }) {
//                return opponent.lastAvatarURLString
//            } else {
//                // Fallback if no opponent is found or if it's a conversation with oneself.
//                return UserOutput.defaultAvatarURLString
//            }
//        }
//    }
//
//    public var imageUrlString: String {
//        // This property now simply returns the determined URL for the avatar or image.
//        opponentAvatarURLString
//    }
//}

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
