import Foundation

/// Coarse location, shaped like the event `user` block. It belongs to the owner of the wallet the money moved into or out of — the party the event is about, never their counterparty. Omitted entirely when nothing is known.
public struct PulseEventsResponseDataItemUser: Codable, Hashable, Sendable {
    /// City name. Omitted when unknown.
    public let city: String?
    /// ISO 3166-1 alpha-2 country code. Omitted when unknown.
    public let country: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        city: String? = nil,
        country: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.city = city
        self.country = country
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.country, forKey: .country)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
    }
}