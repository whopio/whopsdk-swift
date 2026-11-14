import Foundation

public struct AccountFeeRate: Codable, Hashable, Sendable {
    /// The amount charged per event. `null` when unavailable.
    public let fixed: Nullable<Money>
    /// The percentage of the transaction, where `2` means 2%. `null` when unavailable.
    public let percentage: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fixed: Nullable<Money>,
        percentage: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fixed = fixed
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fixed = try container.decode(Nullable<Money>.self, forKey: .fixed)
        self.percentage = try container.decode(Nullable<Double>.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fixed, forKey: .fixed)
        try container.encode(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fixed
        case percentage
    }
}