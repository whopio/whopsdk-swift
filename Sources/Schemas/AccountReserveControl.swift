import Foundation

public struct AccountReserveControl: Codable, Hashable, Sendable {
    /// Number of days reserved funds are held before release.
    public let holdPeriodDays: Int
    /// Percentage of incoming payment volume held in reserve. `null` when no reserve is applied.
    public let percentage: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        holdPeriodDays: Int,
        percentage: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.holdPeriodDays = holdPeriodDays
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.holdPeriodDays = try container.decode(Int.self, forKey: .holdPeriodDays)
        self.percentage = try container.decode(Nullable<Double>.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.holdPeriodDays, forKey: .holdPeriodDays)
        try container.encode(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case holdPeriodDays = "hold_period_days"
        case percentage
    }
}