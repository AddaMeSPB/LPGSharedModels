
import URLRouting
import BSON

let objectIdParser = ParsePrint {
  Prefix<Substring> { $0.isHexDigit }
    .map(.string)
    .map(
      .convert(
        apply: { ObjectId($0) },
        unapply: { $0.hexString }
      )
    )
}

public enum SiteRoute: Equatable {
    case swaps(SwapsRoute)
    case chatEngine(ChatEngineRoute)
    case authEngine(AuthEngineRoute)
    case category(CategoriesRoute)
    case terms
    case privacy
}

public struct SiteRouter: ParserPrinter {

    public init() {}

    public var body: some Router<SiteRoute> {
        OneOf {
            Route(.case(SiteRoute.swaps)) {
                Path { "v1" }
                Path { "swaps" }
                SwapsRouter()
            }

            Route(.case(SiteRoute.chatEngine)) {
                Path { "v1" }
                ChatEngineRouter()
            }

            Route(.case(SiteRoute.authEngine)) {
                Path { "v1" }
                AuthEngineRouter()
            }

            Route(.case(SiteRoute.category)) {
                Path { "v1" }
                Path { "category" }
                CategoriesRouter()
            }

            Route(.case(SiteRoute.terms)) {
                Path { "terms" }
            }

            Route(.case(SiteRoute.privacy)) {
                Path { "privacy" }
            }
        }
    }
}

//public struct Router: ParserPrinter {
//    public var body: some Router<> {
//    }
//}
