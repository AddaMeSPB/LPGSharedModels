//
//  CategoriesRouter.swift
//  
//
//  Created by Saroar Khandoker on 17.07.2022.
//

import Foundation
import URLRouting
import BSON

public enum CategoryRoute: Equatable {
    case find
}

public struct CategoryRouter: ParserPrinter {
    public var body: some Router<CategoryRoute> {
        Route(.case(CategoryRoute.find))
    }
}

public enum CategoriesRoute: Equatable {
    case create(inupt: CategoryInput)
    case list
    case update(inupt: CategoryModel)
    case category(id: ObjectId, CategoryRoute = .find)
    case delete(id: ObjectId)
}

public struct CategoriesRouter: ParserPrinter {

    public init() {}

    public var body: some Router<CategoriesRoute> {

        OneOf {
            Route(.case(CategoriesRoute.create)) {
                Method.post
                Body(.json(CategoryInput.self))
            }

            Route(.case(CategoriesRoute.category)) {
                Path { objectIdParser }
                CategoryRouter()
            }

            Route(.case(CategoriesRoute.list))

            Route(.case(CategoriesRoute.update)) {
                Method.put
                Body(.json(CategoryModel.self))
            }

            Route(.case(CategoriesRoute.delete)) {
                Method.delete
                Path { objectIdParser }
            }
        }
    }
}
