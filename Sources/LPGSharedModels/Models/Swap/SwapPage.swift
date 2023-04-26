
public struct SwapPages: Codable {
    public let items: [SwapOutput]
    public let metadata: Metadata
}

extension SwapPages: Equatable {
    
}

public struct SwapPageRequest: Decodable {

    public var page: Int = 1
    public var per: Int = 10
    public var lat: Double = 59.93572512685927
    public var long: Double = 30.32722285814234
    public var distance: Double = 300000.0

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case per = "per"
        case lat = "lat"
        case long = "long"
        case distance = "distance"
    }

    /// `Decodable` conformance.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page) ?? 1
        self.per = try container.decodeIfPresent(Int.self, forKey: .per) ?? 10
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat) ?? 59.93572512685927
        self.long = try container.decodeIfPresent(Double.self, forKey: .long) ?? 30.32722285814234
        self.distance = try container.decodeIfPresent(Double.self, forKey: .distance) ?? 300000.0
    }

    public init(
        page: Int = 1,
        per: Int = 10,
        lat: Double  = 59.93572512685927,
        long: Double = 30.32722285814234,
        distance: Double = 300000.0
    ) {
        self.page = page
        self.per = per
        self.lat = lat
        self.long = long
        self.distance = distance
    }

    var start: Int {
        (self.page - 1) * self.per
    }

    var end: Int {
        self.page * self.per
    }
}

extension SwapPageRequest: Equatable {}
