import Foundation

/// How a USD balance pays a bank in another currency: it converts into the payout method's currency, and the payout leaves from the balance in that currency. Null when the payout is paid from the requested balance directly.
public struct CreateQuotePayoutsResponseConversion: Codable, Hashable, Sendable {
    /// What the requested amount converts into, in the payout method's currency. This is an estimate when the account's USD has to settle before payout. The payout is then for what the conversion produces. `POST /payouts` answers with the payout request until that payout exists.
    public let convertedAmount: Money
    /// How much more the recipient receives than if the same amount were paid out in USD and converted at the payout provider's rate. Null when the provider has no price for that route or converting first saves nothing.
    public let estimatedSavings: Nullable<Money>
    /// The payout fee in the converted currency, taken from the converted amount.
    public let payoutFee: Money
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        convertedAmount: Money,
        estimatedSavings: Nullable<Money>,
        payoutFee: Money,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.convertedAmount = convertedAmount
        self.estimatedSavings = estimatedSavings
        self.payoutFee = payoutFee
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.convertedAmount = try container.decode(Money.self, forKey: .convertedAmount)
        self.estimatedSavings = try container.decode(Nullable<Money>.self, forKey: .estimatedSavings)
        self.payoutFee = try container.decode(Money.self, forKey: .payoutFee)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.convertedAmount, forKey: .convertedAmount)
        try container.encode(self.estimatedSavings, forKey: .estimatedSavings)
        try container.encode(self.payoutFee, forKey: .payoutFee)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case convertedAmount = "converted_amount"
        case estimatedSavings = "estimated_savings"
        case payoutFee = "payout_fee"
    }
}