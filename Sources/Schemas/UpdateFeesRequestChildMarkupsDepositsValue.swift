import Foundation

/// The new markup. Fields left out keep their current value. `null` clears the row so the markup returns to its default.
public struct UpdateFeesRequestChildMarkupsDepositsValue: Codable, Hashable, Sendable {
    /// The amount the platform adds per event, in US dollars.
    public let fixed: Double?
    /// The percentage of the transaction the platform adds, where `2` means 2%.
    public let percentage: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fixed: Double? = nil,
        percentage: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fixed = fixed
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fixed = try container.decodeIfPresent(Double.self, forKey: .fixed)
        self.percentage = try container.decodeIfPresent(Double.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fixed, forKey: .fixed)
        try container.encodeIfPresent(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fixed
        case percentage
    }
}