
import URLRouting

public enum MessageRoute: Equatable {
    case find
}

public struct MessageRouter: ParserPrinter {
    public var body: some Router<MessageRoute> {
        Route(.case(MessageRoute.find))
    }
}
