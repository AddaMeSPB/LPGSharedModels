import BSON
import URLRouting
import Parsing

public enum ConversationRoute: Equatable {
    case find
    case joinuser(productId: ObjectId? = nil)
    case messages(MessagesRoute)
}

struct ConversationRouter: ParserPrinter {
    var body: some Router<ConversationRoute> {
        OneOf {
            Route(.case(ConversationRoute.find))

            Route(.case(ConversationRoute.joinuser)) {
                Method.put
                Path { "joinuser" }
                Optionally {
                    Path { objectIdParser }
                }
            }

            Route(.case(ConversationRoute.messages)) {
                Path { From(.utf8) { "messages".utf8 } }
                MessagesRouter()
            }
        }
    }
}
