import Foundation

public struct UpdateFeesRequestPlatformProcessingRegionsValue: Codable, Hashable, Sendable {
    /// The new amount per event, in US dollars (USD). `null` clears the custom amount.
    public let fixed: Nullable<Double>?
    /// The new percentage, where `2` means 2%. `null` clears the custom rate so the fee returns to its default or inherited rate.
    public let percentage: Nullable<Double>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fixed: Nullable<Double>? = nil,
        percentage: Nullable<Double>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fixed = fixed
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fixed = try container.decodeNullableIfPresent(Double.self, forKey: .fixed)
        self.percentage = try container.decodeNullableIfPresent(Double.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.fixed, forKey: .fixed)
        try container.encodeNullableIfPresent(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fixed
        case percentage
    }
}