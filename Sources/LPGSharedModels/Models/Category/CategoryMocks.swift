

import BSON

extension CategoryModel {
    static public var exploreAreaDraff: CategoryModel = .init(_id: ObjectId(), name: "explore area")
    static public var runningDraff: CategoryModel = .init(_id: ObjectId(), name: "running")
    static public var walkAroundDraff: CategoryModel = .init(_id: ObjectId(), name: "walk around")
    static public var lookingForAcompanyDraff: CategoryModel = .init(_id: ObjectId(), name: "looking for acompany")
}

//extension CategoryModel {
//    static public var walkAroundDraff: CategoryModel = .init(
//        id: ObjectId(),
//        name: CreateCategory.walkAroundDraff.name, url: .home
//    )
//
//    static public var runningDraff: CategoryModel = .init(
//        id: ObjectId(),
//        name: CreateCategory.runningDraff.name, url: .home
//    )
//
//    static public var exploreAreaDraff: CategoryModel = .init(
//        id: ObjectId(),
//        name: CreateCategory.exploreAreaDraff.name, url: .home
//    )
//
//    static public var lookingForAcompanyDraff: CategoryModel = .init(
//        id: ObjectId(),
//        name: CreateCategory.lookingForAcompanyDraff.name, url: .home
//    )
//}
//
//extension CategoriesResponse {
//    static public var draff: CategoriesResponse = .init(
//        categories: [.walkAroundDraff, .runningDraff, .exploreAreaDraff, .lookingForAcompanyDraff]
//    )
//}
