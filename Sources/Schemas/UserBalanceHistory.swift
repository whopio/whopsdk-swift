import Foundation

public struct UserBalanceHistory: Codable, Hashable, Sendable {
    public let data: [UserBalanceHistoryPoint]
    /// Value of the most recent point, in USD.
    public let last: Double
    /// Maximum value across the window, in USD.
    public let max: Double
    /// Minimum value across the window, in USD.
    public let min: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [UserBalanceHistoryPoint],
        last: Double,
        max: Double,
        min: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.last = last
        self.max = max
        self.min = min
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([UserBalanceHistoryPoint].self, forKey: .data)
        self.last = try container.decode(Double.self, forKey: .last)
        self.max = try container.decode(Double.self, forKey: .max)
        self.min = try container.decode(Double.self, forKey: .min)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.last, forKey: .last)
        try container.encode(self.max, forKey: .max)
        try container.encode(self.min, forKey: .min)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case last
        case max
        case min
    }
}