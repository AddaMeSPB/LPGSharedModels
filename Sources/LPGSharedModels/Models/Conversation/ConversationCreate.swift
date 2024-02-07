import BSON

public struct ConversationCreate: Codable, Equatable {

    public let title: String?
    public let type: ConversationType
    public let productId: ObjectId?
    public let opponentPhoneNumber: String?
    public let opponentEmailAddress: String?

    public init(
        title: String? = nil,
        type: ConversationType,
        productId: ObjectId?,
        opponentPhoneNumber: String?,
        opponentEmailAddress: String?
    ) {
        self.title = title
        self.type = type
        self.productId = productId
        self.opponentPhoneNumber = opponentPhoneNumber
        self.opponentEmailAddress = opponentEmailAddress
    }
}
