import Foundation

public struct TradingCumulativeFunding: Codable, Hashable, Sendable {
    /// Funding paid on this market across the account's history, in USD, or `null` when unavailable.
    public let allTime: Nullable<Money>
    /// Funding paid since the position size last changed, in USD, or `null` when unavailable.
    public let sinceChange: Nullable<Money>
    /// Funding paid since the position opened, in USD, or `null` when unavailable.
    public let sinceOpen: Nullable<Money>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        allTime: Nullable<Money>,
        sinceChange: Nullable<Money>,
        sinceOpen: Nullable<Money>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.allTime = allTime
        self.sinceChange = sinceChange
        self.sinceOpen = sinceOpen
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.allTime = try container.decode(Nullable<Money>.self, forKey: .allTime)
        self.sinceChange = try container.decode(Nullable<Money>.self, forKey: .sinceChange)
        self.sinceOpen = try container.decode(Nullable<Money>.self, forKey: .sinceOpen)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.allTime, forKey: .allTime)
        try container.encode(self.sinceChange, forKey: .sinceChange)
        try container.encode(self.sinceOpen, forKey: .sinceOpen)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case allTime = "all_time"
        case sinceChange = "since_change"
        case sinceOpen = "since_open"
    }
}