import Foundation

public struct AccountBalanceBreakdown: Codable, Hashable, Sendable {
    /// Amount you can spend, send, or withdraw now, in native units, as a decimal string.
    public let available: String
    /// Amount moving between the account's own destinations, such as a treasury sweep to its crypto wallet or a card top-up. In native units, as a decimal string.
    public let inTransit: String
    /// Amount from recent payments still settling, in native units, as a decimal string.
    public let pending: String
    public let pendingSettlements: [AccountBalanceSettlement]
    /// Amount held back, in native units, as a decimal string. Retrieve the account's reserves for why it is held and when it unlocks.
    public let reserve: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        available: String,
        inTransit: String,
        pending: String,
        pendingSettlements: [AccountBalanceSettlement],
        reserve: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.available = available
        self.inTransit = inTransit
        self.pending = pending
        self.pendingSettlements = pendingSettlements
        self.reserve = reserve
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.available = try container.decode(String.self, forKey: .available)
        self.inTransit = try container.decode(String.self, forKey: .inTransit)
        self.pending = try container.decode(String.self, forKey: .pending)
        self.pendingSettlements = try container.decode([AccountBalanceSettlement].self, forKey: .pendingSettlements)
        self.reserve = try container.decode(String.self, forKey: .reserve)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.available, forKey: .available)
        try container.encode(self.inTransit, forKey: .inTransit)
        try container.encode(self.pending, forKey: .pending)
        try container.encode(self.pendingSettlements, forKey: .pendingSettlements)
        try container.encode(self.reserve, forKey: .reserve)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case available
        case inTransit = "in_transit"
        case pending
        case pendingSettlements = "pending_settlements"
        case reserve
    }
}