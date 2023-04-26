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

// Timisoara
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


// BucharestCentre
extension Geometry {
    static public let nearByBucharestCentre = Geometry(type: .Point, coordinates: [44.434558, 26.096187])
    static public let nearByBucharestCentre1 = Geometry(type: .Point, coordinates: [44.437272, 26.101072])
    static public let nearByBucharestCentre2 = Geometry(type: .Point, coordinates: [44.438787, 26.093635])
    static public let nearByBucharestCentre3 = Geometry(type: .Point, coordinates: [44.436503, 26.093804])
    static public let nearByBucharestCentre4 = Geometry(type: .Point, coordinates: [44.437573, 26.102452])
    static public let nearByBucharestCentre5 = Geometry(type: .Point, coordinates: [44.439184, 26.100103])
    static public let nearByBucharestCentre6 = Geometry(type: .Point, coordinates: [44.440258, 26.098157])
    static public let nearByBucharestCentre7 = Geometry(type: .Point, coordinates: [44.435113, 26.100618])
    static public let nearByBucharestCentre8 = Geometry(type: .Point, coordinates: [44.431416, 26.097092])
    static public let nearByBucharestCentre9 = Geometry(type: .Point, coordinates: [44.433444, 26.092775])
    static public let nearByBucharestCentre10 = Geometry(type: .Point, coordinates: [44.439931, 26.088798])
    static public let nearByBucharestCentre11 = Geometry(type: .Point, coordinates: [44.432748, 26.086507])
    static public let nearByBucharestCentre12 = Geometry(type: .Point, coordinates: [44.438392, 26.084584])
    static public let nearByBucharestCentre13 = Geometry(type: .Point, coordinates: [44.441536, 26.082645])
    static public let nearByBucharestCentre14 = Geometry(type: .Point, coordinates: [44.429869, 26.091006])
    static public let nearByBucharestCentre15 = Geometry(type: .Point, coordinates: [44.430919, 26.083395])
    static public let nearByBucharestCentre16 = Geometry(type: .Point, coordinates: [44.445725, 26.087165])
    static public let nearByBucharestCentre17 = Geometry(type: .Point, coordinates: [44.427049, 26.094526])
    static public let nearByBucharestCentre18 = Geometry(type: .Point, coordinates: [44.428093, 26.086915])
    static public let nearByBucharestCentre19 = Geometry(type: .Point, coordinates: [44.435758, 26.081956])
}

extension Geometry {
    static public var nearByBucharestCentres: [Geometry] {
        return [
            .nearByBucharestCentre,
            .nearByBucharestCentre1,
            .nearByBucharestCentre2,
            .nearByBucharestCentre3,
            .nearByBucharestCentre4,
            .nearByBucharestCentre5,
            .nearByBucharestCentre6,
            .nearByBucharestCentre7,
            .nearByBucharestCentre8,
            .nearByBucharestCentre9,
            .nearByBucharestCentre10,
            .nearByBucharestCentre11,
            .nearByBucharestCentre12,
            .nearByBucharestCentre13,
            .nearByBucharestCentre14,
            .nearByBucharestCentre15,
            .nearByBucharestCentre16,
            .nearByBucharestCentre17,
            .nearByBucharestCentre18,
            .nearByBucharestCentre19
        ]
    }
}
