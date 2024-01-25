//
//  QueryItem.swift
//
//
//  Created by Saroar Khandoker on 23.02.2021.
//

import Foundation

public struct QueryItem: Decodable {

  public var page: Int = 1
  public var per: Int = 10

    public init(page: Int = 1, per: Int = 10) {
        self.page = page
        self.per = per
    }

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case per = "per"
    }

    /// `Decodable` conformance.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page) ?? 1
        self.per = try container.decodeIfPresent(Int.self, forKey: .per) ?? 10
    }

    var start: Int {
        (self.page - 1) * self.per
    }

    var end: Int {
        self.page * self.per
    }

  public var parameters: [String: Any] {
    let mirror = Mirror(reflecting: self)
    let dict = Dictionary(
      uniqueKeysWithValues: mirror.children.lazy.map {
        (label: String?, value: Any) -> (String, Any)? in
        guard let label = label else { return nil }
        return (label, value)
      }.compactMap { $0 })
    return dict
  }

  public var queryItem: [URLQueryItem] {
    let mirror = Mirror(reflecting: self)
    return mirror.children.compactMap { name, value -> URLQueryItem? in
      guard let name = name else { return nil }
      return URLQueryItem(name: name, value: "\(value)")
    }
  }
}

extension QueryItem: Equatable {}
