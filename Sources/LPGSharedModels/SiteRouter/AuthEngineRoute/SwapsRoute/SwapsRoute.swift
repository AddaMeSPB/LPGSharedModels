import URLRouting
import BSON

public enum SwapsRoute: Equatable {
    case create(input: SwapInput)
    case list(SwapPageRequest)
    case user_swaps(QueryItem)

    // have convert Object id not string
    case read(ObjectId)
    case update(input: SwapModel)
    case delete(ObjectId)

    case changeStatus(Int)
}

public struct SwapsRouter: ParserPrinter {
    public var body: some Router<SwapsRoute> {
        OneOf {
            Route(.case(SwapsRoute.create)) {
                Method.post
                Body(.json(SwapInput.self))
            }

            Route(.case(SwapsRoute.read)) {
                Path { objectIdParser }
            }

            Route(.case(SwapsRoute.list)) {
                Parse(.memberwise(SwapPageRequest.init)) {
                    Query {
                        Field("page", default: 1) { Digits() }
                        Field("per", default: 10) { Digits() }
                        Field("lat", default: 59.93572512685927) { Double.parser() }
                        Field("long", default: 30.32722285814234) { Double.parser() }
                        Field("distance", default: 300000.0) { Double.parser() }
                    }
                }
            }

            Route(.case(SwapsRoute.user_swaps)) {
                Path { "my" }
                Parse(.memberwise(QueryItem.init)) {
                    Query {
                        Field("page", default: 1) { Digits() }
                        Field("per", default: 10) { Digits() }
                    }
                }
            }

            Route(.case(SwapsRoute.update)) {
                Method.put
                Body(.json(SwapModel.self))
            }

            Route(.case(SwapsRoute.delete)) {
                Method.delete
                Path { objectIdParser }
            }

            Route(.case(SwapsRoute.changeStatus)) {
                Path { "change_status" }
                Method.put
                Path { Int.parser() }
            }

        }
    }
}
