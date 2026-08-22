import Foundation

/// A withdrawal represents a request to transfer funds from a ledger account to an external payout method.
public struct WithdrawalListItem: Codable, Hashable, Sendable {
    /// The withdrawal amount as a decimal number in the specified currency (e.g., 100.00 for $100.00 USD).
    public let amount: Double
    /// The datetime the withdrawal was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for this withdrawal (e.g., 'usd', 'eur').
    public let currency: Currencies
    /// The fee charged for processing this withdrawal, in the same currency as the withdrawal amount.
    public let feeAmount: Double
    /// How the fee was applied to the withdrawal. 'exclusive' means the fee was added on top (user receives the full requested amount). 'inclusive' means the fee was deducted from the withdrawal (user receives less than requested). Null if no fee was charged.
    public let feeType: Nullable<WithdrawalFeeTypes>
    /// The unique identifier for the withdrawal.
    public let id: String
    /// An additional markup fee charged for the withdrawal, in the same currency as the withdrawal amount. Only applies to platform accounts using Whop Rails.
    public let markupFee: Double
    /// The id of the payout request (returned by POST /payouts) that this withdrawal settles. Null unless the withdrawal originated from a stablecoin payout.
    public let payoutRequestId: Nullable<String>
    /// The processing speed selected for this withdrawal ('standard' or 'instant').
    public let speed: WithdrawalSpeeds
    /// The computed lifecycle status of the withdrawal, accounting for the state of associated payouts (e.g., 'requested', 'in_transit', 'completed', 'failed').
    public let status: WithdrawalStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        createdAt: Date,
        currency: Currencies,
        feeAmount: Double,
        feeType: Nullable<WithdrawalFeeTypes>,
        id: String,
        markupFee: Double,
        payoutRequestId: Nullable<String>,
        speed: WithdrawalSpeeds,
        status: WithdrawalStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.currency = currency
        self.feeAmount = feeAmount
        self.feeType = feeType
        self.id = id
        self.markupFee = markupFee
        self.payoutRequestId = payoutRequestId
        self.speed = speed
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.feeAmount = try container.decode(Double.self, forKey: .feeAmount)
        self.feeType = try container.decode(Nullable<WithdrawalFeeTypes>.self, forKey: .feeType)
        self.id = try container.decode(String.self, forKey: .id)
        self.markupFee = try container.decode(Double.self, forKey: .markupFee)
        self.payoutRequestId = try container.decode(Nullable<String>.self, forKey: .payoutRequestId)
        self.speed = try container.decode(WithdrawalSpeeds.self, forKey: .speed)
        self.status = try container.decode(WithdrawalStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.feeAmount, forKey: .feeAmount)
        try container.encode(self.feeType, forKey: .feeType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.markupFee, forKey: .markupFee)
        try container.encode(self.payoutRequestId, forKey: .payoutRequestId)
        try container.encode(self.speed, forKey: .speed)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case currency
        case feeAmount = "fee_amount"
        case feeType = "fee_type"
        case id
        case markupFee = "markup_fee"
        case payoutRequestId = "payout_request_id"
        case speed
        case status
    }
}