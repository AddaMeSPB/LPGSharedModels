import BSON
import Foundation

extension ConversationCreate {
    static public let exploreAreaDraff: ConversationCreate = .init(
        title: CategoryModel.exploreAreaDraff.name,
        type: .group, 
        productId: nil,
        opponentPhoneNumber: "+79211111111", opponentEmailAddress: ""
    )
    
    static public let runningDraff: ConversationCreate = .init(
        title: CategoryModel.runningDraff.name,
        type: .group,
        productId: nil,
        opponentPhoneNumber: "+79211111112", opponentEmailAddress: ""
    )
    
    static public let walkAroundDraff: ConversationCreate = .init(
        title: CategoryModel.walkAroundDraff.name,
        type: .group,
        productId: nil,
        opponentPhoneNumber: "+79211111113", opponentEmailAddress: ""
    )
    
    static public let lookingForAcompanyDraff: ConversationCreate = .init(
        title: CategoryModel.lookingForAcompanyDraff.name,
        type: .group,
        productId: nil,
        opponentPhoneNumber: "+79211111114", opponentEmailAddress: ""
    )
    
    static public let empty: ConversationCreate = .init(
        title: "",
        type: .oneToOne,
        productId: nil,
        opponentPhoneNumber: "+79211111115", opponentEmailAddress: ""
    )
}

extension AddUser: Equatable {
    public static func == (lhs: AddUser, rhs: AddUser) -> Bool {
        return lhs.conversationsId == rhs.conversationsId && lhs.usersId == rhs.usersId
    }
}

extension AddUser {
    static public let draff = AddUser(
        conversationsId: ConversationOutPut.exploreAreaDraff.id,
        usersId: UserOutput.withFirstName.id
    )
}

extension ConversationOutPut {
    static public var walkAroundDraff: ConversationOutPut = .init(
        id: ObjectId("5fabb1ebaa5f7844ccfe48c3")!,
        title: ConversationCreate.walkAroundDraff.title ?? "unknow",
        type: ConversationCreate.walkAroundDraff.type,
        admins: [.withFirstName],
        members: [.withAttachments, .withLastName],
        lastMessage: .messageItem6,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public var runningDraff: ConversationOutPut = .init(
        id: ObjectId("2fabb1ebaa5f7844ccfe48c1")!,
        title: ConversationCreate.runningDraff.title ?? "unknow",
        type: ConversationCreate.runningDraff.type,
        admins: [.withLastName],
        members: [.withAttachments, .withFirstName],
        lastMessage: .messageItem3,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public var exploreAreaDraff: ConversationOutPut = .init(
        id: ObjectId("5fabb1ebaa5f7844ccfe45c3")!,
        title: ConversationCreate.exploreAreaDraff.title ?? "unknow",
        type: ConversationCreate.exploreAreaDraff.type,
        admins: [.withFirstName],
        members: [.withAttachments, .withLastName],
        lastMessage: .messageItem2,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public var lookingForAcompanyDraff: ConversationOutPut = .init(
        id: ObjectId("2fabb1ebaa5f1844ccfe48c1")!,
        title: ConversationCreate.lookingForAcompanyDraff.title ?? "unknow",
        type: ConversationCreate.lookingForAcompanyDraff.type,
        admins: [.withLastName],
        members: [.withAttachments, .withFirstName],
        lastMessage: .messageItem1,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public let conversationsMock: [ConversationOutPut] = [
        .walkAroundDraff, .runningDraff, .exploreAreaDraff, lookingForAcompanyDraff
    ]
}

extension ConversationsResponse {
    static public var conversationResponseMock: ConversationsResponse = .init(
        items: ConversationOutPut.conversationsMock,
        metadata: Metadata.init(per: 10, total: ConversationOutPut.conversationsMock.count, page: 1)
    )
}
