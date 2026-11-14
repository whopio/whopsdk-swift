import Foundation

/// Markups on this subaccount, set by the platform it is connected to.
public struct UpdateFeesRequestMarkups: Codable, Hashable, Sendable {
    /// The markup on card purchases settled by the subaccount. `null` clears the custom markup.
    public let cardSpend: Nullable<UpdateFeesRequestMarkupsCardSpend>?
    /// The new markup. Fields left out keep their current value. `null` clears the row so the markup returns to its default.
    public let cryptoSwaps: Nullable<UpdateFeesRequestMarkupsCryptoSwaps>?
    /// Markups on deposits, keyed by rail: `bank` or `crypto`.
    public let deposits: [String: Nullable<UpdateFeesRequestMarkupsDepositsValue>]?
    /// Markups on payments, keyed by payment method: `card`, `ach`, or `wire`. `null` clears a method's markup so it uses `payments`.
    public let paymentMethods: [String: Nullable<UpdateFeesRequestMarkupsPaymentMethodsValue>]?
    /// The new markup. Fields left out keep their current value. `null` clears the row so the markup returns to its default.
    public let payments: Nullable<UpdateFeesRequestMarkupsPayments>?
    /// Markups on withdrawals, keyed by payout method. Percentage and fixed components may be negative, down to negative 100, to subsidize Whop's fee from the platform's balance in the withdrawal currency. The creator's total fee cannot go below zero. An unfunded subsidy keeps the payout pending until funded or failed by the creation deadline.
    public let payouts: [String: Nullable<UpdateFeesRequestMarkupsPayoutsValue>]?
    /// The new markup. Fields left out keep their current value. `null` clears the row so the markup returns to its default.
    public let transfers: Nullable<UpdateFeesRequestMarkupsTransfers>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardSpend: Nullable<UpdateFeesRequestMarkupsCardSpend>? = nil,
        cryptoSwaps: Nullable<UpdateFeesRequestMarkupsCryptoSwaps>? = nil,
        deposits: [String: Nullable<UpdateFeesRequestMarkupsDepositsValue>]? = nil,
        paymentMethods: [String: Nullable<UpdateFeesRequestMarkupsPaymentMethodsValue>]? = nil,
        payments: Nullable<UpdateFeesRequestMarkupsPayments>? = nil,
        payouts: [String: Nullable<UpdateFeesRequestMarkupsPayoutsValue>]? = nil,
        transfers: Nullable<UpdateFeesRequestMarkupsTransfers>? = nil,
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
        self.cardSpend = try container.decodeNullableIfPresent(UpdateFeesRequestMarkupsCardSpend.self, forKey: .cardSpend)
        self.cryptoSwaps = try container.decodeNullableIfPresent(UpdateFeesRequestMarkupsCryptoSwaps.self, forKey: .cryptoSwaps)
        self.deposits = try container.decodeIfPresent([String: Nullable<UpdateFeesRequestMarkupsDepositsValue>].self, forKey: .deposits)
        self.paymentMethods = try container.decodeIfPresent([String: Nullable<UpdateFeesRequestMarkupsPaymentMethodsValue>].self, forKey: .paymentMethods)
        self.payments = try container.decodeNullableIfPresent(UpdateFeesRequestMarkupsPayments.self, forKey: .payments)
        self.payouts = try container.decodeIfPresent([String: Nullable<UpdateFeesRequestMarkupsPayoutsValue>].self, forKey: .payouts)
        self.transfers = try container.decodeNullableIfPresent(UpdateFeesRequestMarkupsTransfers.self, forKey: .transfers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.cardSpend, forKey: .cardSpend)
        try container.encodeNullableIfPresent(self.cryptoSwaps, forKey: .cryptoSwaps)
        try container.encodeIfPresent(self.deposits, forKey: .deposits)
        try container.encodeIfPresent(self.paymentMethods, forKey: .paymentMethods)
        try container.encodeNullableIfPresent(self.payments, forKey: .payments)
        try container.encodeIfPresent(self.payouts, forKey: .payouts)
        try container.encodeNullableIfPresent(self.transfers, forKey: .transfers)
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