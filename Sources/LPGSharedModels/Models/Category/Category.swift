import Foundation
import BSON

public struct CategoryModel: Codable {

    public static var collectionName = "categories"

    public init(
        _id: ObjectId,
        name: String
    ) {
        self._id = _id
        self.name = name
    }

    public var _id: ObjectId
    public var name: String

    public var createdAt: Date?
    public var updatedAt: Date?
    public var deletedAt: Date?

    public func toBSON() throws -> Document {
        let encoder = BSONEncoder()
        let bson = try encoder.encode(self)
        return bson
    }
}

extension CategoryModel: Equatable {
    public static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool {
        return lhs._id == rhs._id && lhs.name == rhs.name
    }
}
