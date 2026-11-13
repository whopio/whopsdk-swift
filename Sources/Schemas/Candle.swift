import Foundation

public struct Candle: Codable, Hashable, Sendable {
    /// The last price in the candle, in USD.
    public let close: Money
    /// The highest price in the candle, in USD.
    public let high: Money
    /// The lowest price in the candle, in USD.
    public let low: Money
    /// The first price in the candle, in USD.
    public let open: Money
    /// When the candle starts, as an ISO 8601 timestamp. The candle covers one `interval` from this time.
    public let startedAt: String
    /// The traded volume in the candle, in USD. `null` when no volume is reported.
    public let volume: Nullable<Money>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        close: Money,
        high: Money,
        low: Money,
        open: Money,
        startedAt: String,
        volume: Nullable<Money>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.close = close
        self.high = high
        self.low = low
        self.open = open
        self.startedAt = startedAt
        self.volume = volume
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.close = try container.decode(Money.self, forKey: .close)
        self.high = try container.decode(Money.self, forKey: .high)
        self.low = try container.decode(Money.self, forKey: .low)
        self.open = try container.decode(Money.self, forKey: .open)
        self.startedAt = try container.decode(String.self, forKey: .startedAt)
        self.volume = try container.decode(Nullable<Money>.self, forKey: .volume)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.close, forKey: .close)
        try container.encode(self.high, forKey: .high)
        try container.encode(self.low, forKey: .low)
        try container.encode(self.open, forKey: .open)
        try container.encode(self.startedAt, forKey: .startedAt)
        try container.encode(self.volume, forKey: .volume)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case close
        case high
        case low
        case open
        case startedAt = "started_at"
        case volume
    }
}