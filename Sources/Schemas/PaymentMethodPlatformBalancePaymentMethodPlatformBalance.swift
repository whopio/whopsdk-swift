import Foundation

/// What is available to spend, and whether the account may spend it.
public struct PaymentMethodPlatformBalancePaymentMethodPlatformBalance: Codable, Hashable, Sendable {
    /// The account whose wallet this is. Null for the buyer's own personal wallet. A buyer sees an account's balance here when they hold permission to spend it, so a list can hold several — their own and one per account they are on.
    public let account: Nullable<PaymentMethodPlatformBalancePaymentMethodPlatformBalanceAccount>
    /// Available amount per currency. Read from the balance cache, so it is indicative — the charge revalidates against settled funds and may still refuse.
    public let balances: [PaymentMethodPlatformBalancePaymentMethodPlatformBalanceBalancesItem]
    /// Whether this balance can pay right now, which here means only whether it holds funds — an account blocked from spending is not listed at all. A zero balance is still returned so a client can show it as an option the buyer could top up.
    public let spendable: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<PaymentMethodPlatformBalancePaymentMethodPlatformBalanceAccount>,
        balances: [PaymentMethodPlatformBalancePaymentMethodPlatformBalanceBalancesItem],
        spendable: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.balances = balances
        self.spendable = spendable
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<PaymentMethodPlatformBalancePaymentMethodPlatformBalanceAccount>.self, forKey: .account)
        self.balances = try container.decode([PaymentMethodPlatformBalancePaymentMethodPlatformBalanceBalancesItem].self, forKey: .balances)
        self.spendable = try container.decode(Bool.self, forKey: .spendable)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.balances, forKey: .balances)
        try container.encode(self.spendable, forKey: .spendable)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case balances
        case spendable
    }
}