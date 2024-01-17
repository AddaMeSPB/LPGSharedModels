
import Foundation
import URLRouting
import BSON

public enum ConversationsRoute: Equatable {
    case create(input: ConversationCreate)
    case list(query: QueryItem)
    case update(input: ConversationModel)
    case delete(id: ObjectId)
    
    // ConversationRoute
    case conversation(id: ObjectId, route: ConversationRoute = .find)
}

public struct ConversationsRouter: ParserPrinter {
    public var body: some Router<ConversationsRoute>  {
        
        OneOf {
            Route(.case(ConversationsRoute.create)) {
                Method.post
                Body(.json(ConversationCreate.self))
            }
            
            Route(.case(ConversationsRoute.list)) {
                Parse(.memberwise(QueryItem.init)) {
                    Query {
                        Field("page", default: 1) { Digits() }
                        Field("per", default: 10) { Digits() }
                    }
                }
            }
            
            Route(.case(ConversationsRoute.update)) {
                Method.put
                Body(.json(ConversationModel.self))
            }
            
            Route(.case(ConversationsRoute.delete)) {
                Method.delete
                Path { objectIdParser }
            }
            
            // ConversationRoute
            Route(.case(ConversationsRoute.conversation)) {
                Path { objectIdParser }
                ConversationRouter()
            }
        }
    }
}
