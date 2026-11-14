import Foundation

public struct FunnelStepResult: Codable, Hashable, Sendable {
    /// The percentage of first-step entrants reaching this step; null when there are no entrants.
    public let conversionRate: Nullable<Double>
    /// The number of distinct people reaching this step.
    public let count: Int
    /// The one-based step number.
    public let step: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversionRate: Nullable<Double>,
        count: Int,
        step: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversionRate = conversionRate
        self.count = count
        self.step = step
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversionRate = try container.decode(Nullable<Double>.self, forKey: .conversionRate)
        self.count = try container.decode(Int.self, forKey: .count)
        self.step = try container.decode(Int.self, forKey: .step)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.conversionRate, forKey: .conversionRate)
        try container.encode(self.count, forKey: .count)
        try container.encode(self.step, forKey: .step)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversionRate = "conversion_rate"
        case count
        case step
    }
}