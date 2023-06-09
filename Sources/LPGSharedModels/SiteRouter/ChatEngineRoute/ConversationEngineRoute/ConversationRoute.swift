
import URLRouting

public enum ConversationRoute: Equatable {
    case find
    case joinuser
    case messages(MessagesRoute)
}

struct ConversationRouter: ParserPrinter {
    var body: some Router<ConversationRoute> {
        OneOf {
            Route(.case(ConversationRoute.find))

            Route(.case(ConversationRoute.joinuser)) {
                // from client have to send this "v1/users/\(usersId)/conversations/(conversationsId)/join")
                Method.put
                Path { "joinuser" }
            }

            Route(.case(ConversationRoute.messages)) {
                Path { From(.utf8) { "messages".utf8 } }
                MessagesRouter()
            }
        }
    }
}

