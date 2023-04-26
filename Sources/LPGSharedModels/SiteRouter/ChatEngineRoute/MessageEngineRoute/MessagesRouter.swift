import Foundation
import URLRouting
import BSON

public enum MessagesRoute: Equatable {
    case create(input: MessageItem)
    case list(query: QueryItem)
    case update(input: MessageItem)
    case delete(id: ObjectId)
    
    // MessageRoute
    case find(id: ObjectId, route: MessageRoute = .find)
}

public struct MessagesRouter: ParserPrinter {

    public var body: some Router<MessagesRoute> {
        OneOf {
            Route(.case(MessagesRoute.create)) {
                Method.post
                Body(.json(MessageItem.self))
            }

            Route(.case(MessagesRoute.list)) {
                Parse(.memberwise(QueryItem.init)) {
                    Query {
                        Field("page", default: 1) { Digits() }
                        Field("per", default: 10) { Digits() }
                    }
                }
            }

            Route(.case(MessagesRoute.update)) {
                Method.put
                Body(.json(MessageItem.self))
            }

            Route(.case(MessagesRoute.delete)) {
                Method.delete
                Path { objectIdParser }
            }

            // MessageRoute
            Route(.case(MessagesRoute.find)) {
                Path { objectIdParser }
                MessageRouter()
            }
        }
    }
}
