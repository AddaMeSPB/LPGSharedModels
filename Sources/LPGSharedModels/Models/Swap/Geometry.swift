import Foundation
import BSON

public struct Geometry: Codable, Equatable {
    public init(
        type: GeoType,
        coordinates: [Double]
    ) {
        self.type = type
        self.coordinates = coordinates
    }

    public var type: GeoType
    public var coordinates: [Double]
}

extension Geometry {
    static public var near: Geometry = .init(
        type: .Point, coordinates: [45.762442, 21.221516]
    )

    static public var near1: Geometry = .init(
        type: .Point, coordinates: [45.766393, 21.207440]
    )

    static public var near2: Geometry = .init(
        type: .Point, coordinates: [45.763133, 21.215336]
    )

    static public var near3: Geometry = .init(
        type: .Point, coordinates: [45.778340, 21.239369]
    )

    static public var near4: Geometry = .init(
        type: .Point, coordinates: [45.758044, 21.235764]
    )

    static public var near5: Geometry = .init(
        type: .Point, coordinates: [45.767025, 21.253789]
    )

    static public var near6: Geometry = .init(
        type: .Point, coordinates: [45.758104, 21.235507]
    )

    static public var near7: Geometry = .init(
        type: .Point, coordinates: [45.751516, 21.230786]
    )

    static public var near8: Geometry = .init(
        type: .Point, coordinates: [45.733965, 21.203663]
    )

    static public var near9: Geometry = .init(
        type: .Point, coordinates: [45.720904, 21.231043]
    )

    static public var near10: Geometry = .init(
        type: .Point, coordinates: [45.723241, 21.168902]
    )

    static public var near11: Geometry = .init(
        type: .Point, coordinates: [45.723181, 21.276448]
    )

    static public var near12: Geometry = .init(
        type: .Point, coordinates: [45.718147, 21.343396]
    )

    static public var near13: Geometry = .init(
        type: .Point, coordinates: [45.762442, 21.221516]
    )

    static public var near14: Geometry = .init(
        type: .Point, coordinates: [45.713653, 21.374295]
    )

    static public var near15: Geometry = .init(
        type: .Point, coordinates: [45.837063, 21.310437]
    )

    static public var near16: Geometry = .init(
        type: .Point, coordinates: [45.767415, 21.254819]
    )

    static public var near17: Geometry = .init(
        type: .Point, coordinates: [45.792077, 21.244862]
    )

    static public var nears: [Geometry] = [
        near, near1, near2, near4, near5,
        near6, near7, near8, near9, near10,
        near11, near12, near13, near14, near15,
        near16, near17
    ]

}
