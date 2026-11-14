import Foundation

public struct PartnerPayoutDuration: Codable, Hashable, Sendable {
    /// Unit of the earning window. Month means a calendar month; day means a day.
    public let unit: PartnerPayoutDurationUnit
    /// Number of units in the earning window.
    public let value: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        unit: PartnerPayoutDurationUnit,
        value: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.unit = unit
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.unit = try container.decode(PartnerPayoutDurationUnit.self, forKey: .unit)
        self.value = try container.decode(Int.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.unit, forKey: .unit)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case unit
        case value
    }
}