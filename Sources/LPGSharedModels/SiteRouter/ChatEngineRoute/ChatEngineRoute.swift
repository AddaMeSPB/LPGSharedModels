
import URLRouting

public enum ChatEngineRoute: Equatable {
    case conversations(ConversationsRoute)
    case messages(MessagesRoute)
}

public struct ChatEngineRouter: ParserPrinter {
    public var body: some Router<ChatEngineRoute> {
        OneOf {
            Route(.case(ChatEngineRoute.conversations)) {
                Path { "conversations" }
                ConversationsRouter()
            }

            Route(.case(ChatEngineRoute.messages)) {
                Path { "messages" }
                MessagesRouter()
            }
        }
    }
}

