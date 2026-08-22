import Foundation

/// Estimated arrival times before an amount-specific quote is requested. Null when the method is not currently eligible.
public struct ListMethodsResponseDataItemEstimatedArrival: Codable, Hashable, Sendable {
    /// Estimated instant-delivery arrival, or null when unavailable.
    public let instant: Nullable<Date>
    /// Estimated standard-delivery arrival, or null when unavailable.
    public let standard: Nullable<Date>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        instant: Nullable<Date>,
        standard: Nullable<Date>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.instant = instant
        self.standard = standard
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instant = try container.decode(Nullable<Date>.self, forKey: .instant)
        self.standard = try container.decode(Nullable<Date>.self, forKey: .standard)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.instant, forKey: .instant)
        try container.encode(self.standard, forKey: .standard)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case instant
        case standard
    }
}