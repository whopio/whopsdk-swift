import Foundation

public struct AccountFeeMarkups: Codable, Hashable, Sendable {
    /// The markup on card purchases settled by the subaccount.
    public let cardSpend: AccountFeeMarkup
    /// The markup on cryptocurrency token swaps.
    public let cryptoSwaps: AccountFeeMarkup
    /// Markups on deposits into the account's balance, keyed by rail: `bank` and `crypto`.
    public let deposits: [String: AccountFeeMarkup]
    /// Markups on payments, keyed by payment method: `card` (including Apple Pay and Google Pay), `ach` (US bank account and US bank transfer), and `wire`. A payment method without its own markup uses `payments`.
    public let paymentMethods: [String: AccountFeeMarkup]
    /// The markup on payments the subaccount collects without a checkout application fee, for every payment method without its own markup under `payment_methods`.
    public let payments: AccountFeeMarkup
    /// Markups on withdrawals, keyed by payout method: `bank_wire`, `next_day_bank`, `rtp`, `crypto`, and `digital_wallet`.
    public let payouts: [String: AccountFeeMarkup]
    /// The markup on transfers between Whop balances.
    public let transfers: AccountFeeMarkup
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardSpend: AccountFeeMarkup,
        cryptoSwaps: AccountFeeMarkup,
        deposits: [String: AccountFeeMarkup],
        paymentMethods: [String: AccountFeeMarkup],
        payments: AccountFeeMarkup,
        payouts: [String: AccountFeeMarkup],
        transfers: AccountFeeMarkup,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardSpend = cardSpend
        self.cryptoSwaps = cryptoSwaps
        self.deposits = deposits
        self.paymentMethods = paymentMethods
        self.payments = payments
        self.payouts = payouts
        self.transfers = transfers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardSpend = try container.decode(AccountFeeMarkup.self, forKey: .cardSpend)
        self.cryptoSwaps = try container.decode(AccountFeeMarkup.self, forKey: .cryptoSwaps)
        self.deposits = try container.decode([String: AccountFeeMarkup].self, forKey: .deposits)
        self.paymentMethods = try container.decode([String: AccountFeeMarkup].self, forKey: .paymentMethods)
        self.payments = try container.decode(AccountFeeMarkup.self, forKey: .payments)
        self.payouts = try container.decode([String: AccountFeeMarkup].self, forKey: .payouts)
        self.transfers = try container.decode(AccountFeeMarkup.self, forKey: .transfers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cardSpend, forKey: .cardSpend)
        try container.encode(self.cryptoSwaps, forKey: .cryptoSwaps)
        try container.encode(self.deposits, forKey: .deposits)
        try container.encode(self.paymentMethods, forKey: .paymentMethods)
        try container.encode(self.payments, forKey: .payments)
        try container.encode(self.payouts, forKey: .payouts)
        try container.encode(self.transfers, forKey: .transfers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardSpend = "card_spend"
        case cryptoSwaps = "crypto_swaps"
        case deposits
        case paymentMethods = "payment_methods"
        case payments
        case payouts
        case transfers
    }
}