import Foundation

public struct AccountReserveType: Codable, Hashable, Sendable {
    /// Amount held for this reason, in native units, as a decimal string.
    public let amount: String
    /// Days money is currently held for this reason before it unlocks, or `null` when release depends on something other than time. Money already held keeps the terms it was taken under.
    public let holdPeriodDays: Nullable<Int>
    /// Percentage of each incoming payment currently held for this reason, or `null` when the reason is not a percentage of anything. Money already held keeps the release date it was given, which `unlocks_by_date` reflects.
    public let percentage: Nullable<Double>
    /// Why this part of the balance is held. `regular` is the account's standing risk reserve; `bnpl` and `sequra` cover buy-now-pay-later settlement; `preshipment_hold` covers a physical order that has not shipped yet; `fraud_hold` is held while activity is reviewed.
    public let type: AccountReserveTypeType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        holdPeriodDays: Nullable<Int>,
        percentage: Nullable<Double>,
        type: AccountReserveTypeType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.holdPeriodDays = holdPeriodDays
        self.percentage = percentage
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.holdPeriodDays = try container.decode(Nullable<Int>.self, forKey: .holdPeriodDays)
        self.percentage = try container.decode(Nullable<Double>.self, forKey: .percentage)
        self.type = try container.decode(AccountReserveTypeType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.holdPeriodDays, forKey: .holdPeriodDays)
        try container.encode(self.percentage, forKey: .percentage)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case holdPeriodDays = "hold_period_days"
        case percentage
        case type
    }
}