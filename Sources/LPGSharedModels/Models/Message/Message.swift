//
//  Message.swift
//  
//
//  Created by Saroar Khandoker on 02.10.2020.
//

import Foundation
import BSON

public struct MessageModel: Codable {

  public static var collectionName = "messages"

  public init(
    _id: ObjectId,
    messageItem: MessageItem
  ) {
    self._id = _id
    self.conversationId =  messageItem.conversationId
    self.productId = messageItem.swap?.id
    self.senderId = messageItem.sender.id
    self.recipientId = messageItem.recipient?.id
    self.messageBody = messageItem.messageBody
    self.messageType = messageItem.messageType
    self.isRead = messageItem.isRead
    self.isDelivered = messageItem.isDelivered
  }

  public var _id: ObjectId
  public var messageBody: String
  public var messageType: MessageType
  public var isRead: Bool
  public var isDelivered: Bool

  public var conversationId: ObjectId
  public var productId: ObjectId?
  public var senderId: ObjectId
  public var recipientId: ObjectId?

  public var createdAt: Date?
  public var updatedAt: Date?

    public func toBSON() throws -> Document {
        let encoder = BSONEncoder()
        let bson = try encoder.encode(self)
        return bson
    }

}

extension MessageModel: Equatable {
    public static func == (lhs: MessageModel, rhs: MessageModel) -> Bool {
        return lhs._id == rhs._id
        && lhs.messageBody == rhs.messageBody
        && lhs.conversationId == rhs.conversationId
        && lhs.isRead == rhs.isRead
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
    }
}

/// Message Output
/// - public var id: ObjectId? = nil
/// - public var conversationId: ObjectId
/// - public var messageBody: String
/// - public var messageType: MessageType
/// - public var isRead: Bool? = nil
/// - public var isDelivered: Bool? = nil
/// - public var sender: UserOutput? = nil
/// - public var recipient: UserOutput? = nil
/// - public var createdAt: Date? = nil
/// - public var updatedAt: Date? = nil

public struct MessageItem: Identifiable {

    public var id: ObjectId
    public var conversationId: ObjectId
    public var swap: SwapOutput?
    public var messageBody: String
    public var messageType: MessageType
    public var isRead: Bool
    public var isDelivered: Bool
    public var sender: UserOutput
    public var recipient: UserOutput?
    public var createdAt: Date?
    public var updatedAt: Date?

    
    /// INIT
    /// - Parameters:
    ///   - id: ObjectId
    ///   - conversationId: ObjectId
    ///   - messageBody: messageBody description
    ///   - messageType: messageType description
    ///   - isRead: isRead description
    ///   - isDelivered: isDelivered description
    ///   - sender: sender description
    ///   - recipient: recipient description
    ///   - createdAt: createdAt description
    ///   - updatedAt: updatedAt description

    public init(
        id: ObjectId,
        conversationId: ObjectId,
        swap: SwapOutput?,
        messageBody: String,
        messageType: MessageType,
        isRead: Bool = false,
        isDelivered: Bool = false,
        sender: UserOutput,
        recipient: UserOutput?,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.conversationId = conversationId
        self.swap = swap
        self.messageBody = messageBody
        self.messageType = messageType
        self.isRead = isRead
        self.isDelivered = isDelivered
        self.sender = sender
        self.recipient = recipient
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension MessageItem: Codable  {}
extension MessageItem: Comparable  {
    public static func < (lhs: MessageItem, rhs: MessageItem) -> Bool {
      guard let lhsDate = lhs.createdAt, let rhsDate = rhs.createdAt else { return false }
      return lhsDate > rhsDate && lhs.id == rhs.id
        && lhs.messageBody == rhs.messageBody
        && lhs.conversationId == rhs.conversationId
        && lhs.isRead == rhs.isRead
    }
}
extension MessageItem: Equatable  {
    public static func == (lhs: MessageItem, rhs: MessageItem) -> Bool {
        return lhs.id == rhs.id
        && lhs.messageBody == rhs.messageBody
        && lhs.conversationId == rhs.conversationId
        && lhs.isRead == rhs.isRead
    }
}

extension MessageItem: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(messageBody)
        hasher.combine(conversationId)
        hasher.combine(isRead)
    }
}

public struct MessagePage: Codable, Equatable {
  public let items: [MessageItem]
  public let metadata: Metadata

  public init(items: [MessageItem], metadata: Metadata) {
    self.items = items
    self.metadata = metadata
  }
}

public struct LastMessage: Codable, Identifiable {
  public var id, senderID: String
  public var phoneNumber: String
  public var firstName, lastName: String?
  public var avatar, messageBody: String
  public var totalUnreadMessages: Int
  public var timestamp: Int

  public enum CodingKeys: String, CodingKey {
    case senderID = "sender_id"
    case phoneNumber = "phone_number"
    case firstName = "first_name"
    case lastName = "last_name"
    case messageBody = "message_body"
    case totalUnreadMessages = "total_unread_messages"
    case id, avatar, timestamp
  }
}

extension LastMessage: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(phoneNumber)
  }
}
