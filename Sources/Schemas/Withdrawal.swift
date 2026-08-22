import Foundation

/// A withdrawal represents a request to transfer funds from a ledger account to an external payout method.
public struct Withdrawal: Codable, Hashable, Sendable {
    /// The withdrawal amount as a decimal number in the specified currency (e.g., 100.00 for $100.00 USD).
    public let amount: Double
    /// The datetime the withdrawal was created.
    public let createdAt: Date
    /// The three-letter ISO currency code for this withdrawal (e.g., 'usd', 'eur').
    public let currency: Currencies
    /// A machine-readable error code describing why the payout failed. Null if no error occurred.
    public let errorCode: Nullable<PayoutErrorCodes>
    /// A human-readable message describing why the payout failed. Null if no error occurred.
    public let errorMessage: Nullable<String>
    /// The estimated time at which the funds become available in the destination account. Null if no estimate is available. As a Unix timestamp.
    public let estimatedAvailability: Nullable<Date>
    /// The fee charged for processing this withdrawal, in the same currency as the withdrawal amount.
    public let feeAmount: Double
    /// How the fee was applied to the withdrawal. 'exclusive' means the fee was added on top (user receives the full requested amount). 'inclusive' means the fee was deducted from the withdrawal (user receives less than requested). Null if no fee was charged.
    public let feeType: Nullable<WithdrawalFeeTypes>
    /// The unique identifier for the withdrawal.
    public let id: String
    /// The ledger account from which the withdrawal funds are sourced.
    public let ledgerAccount: WithdrawalLedgerAccount
    /// An additional markup fee charged for the withdrawal, in the same currency as the withdrawal amount. Only applies to platform accounts using Whop Rails.
    public let markupFee: Double
    /// The id of the payout request (returned by POST /payouts) that this withdrawal settles. Null unless the withdrawal originated from a stablecoin payout.
    public let payoutRequestId: Nullable<String>
    /// The saved payout destination used for this withdrawal (e.g., a bank account or PayPal address). Null if no payout token was used.
    public let payoutToken: Nullable<WithdrawalPayoutToken>
    /// The processing speed selected for this withdrawal ('standard' or 'instant').
    public let speed: WithdrawalSpeeds
    /// The computed lifecycle status of the withdrawal, accounting for the state of associated payouts (e.g., 'requested', 'in_transit', 'completed', 'failed').
    public let status: WithdrawalStatus
    /// The ACH trace number for tracking the payout through the banking network. Null if not available or not an ACH transaction.
    public let traceCode: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double,
        createdAt: Date,
        currency: Currencies,
        errorCode: Nullable<PayoutErrorCodes>,
        errorMessage: Nullable<String>,
        estimatedAvailability: Nullable<Date>,
        feeAmount: Double,
        feeType: Nullable<WithdrawalFeeTypes>,
        id: String,
        ledgerAccount: WithdrawalLedgerAccount,
        markupFee: Double,
        payoutRequestId: Nullable<String>,
        payoutToken: Nullable<WithdrawalPayoutToken>,
        speed: WithdrawalSpeeds,
        status: WithdrawalStatus,
        traceCode: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.createdAt = createdAt
        self.currency = currency
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.estimatedAvailability = estimatedAvailability
        self.feeAmount = feeAmount
        self.feeType = feeType
        self.id = id
        self.ledgerAccount = ledgerAccount
        self.markupFee = markupFee
        self.payoutRequestId = payoutRequestId
        self.payoutToken = payoutToken
        self.speed = speed
        self.status = status
        self.traceCode = traceCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.errorCode = try container.decode(Nullable<PayoutErrorCodes>.self, forKey: .errorCode)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.estimatedAvailability = try container.decode(Nullable<Date>.self, forKey: .estimatedAvailability)
        self.feeAmount = try container.decode(Double.self, forKey: .feeAmount)
        self.feeType = try container.decode(Nullable<WithdrawalFeeTypes>.self, forKey: .feeType)
        self.id = try container.decode(String.self, forKey: .id)
        self.ledgerAccount = try container.decode(WithdrawalLedgerAccount.self, forKey: .ledgerAccount)
        self.markupFee = try container.decode(Double.self, forKey: .markupFee)
        self.payoutRequestId = try container.decode(Nullable<String>.self, forKey: .payoutRequestId)
        self.payoutToken = try container.decode(Nullable<WithdrawalPayoutToken>.self, forKey: .payoutToken)
        self.speed = try container.decode(WithdrawalSpeeds.self, forKey: .speed)
        self.status = try container.decode(WithdrawalStatus.self, forKey: .status)
        self.traceCode = try container.decode(Nullable<String>.self, forKey: .traceCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.errorCode, forKey: .errorCode)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.estimatedAvailability, forKey: .estimatedAvailability)
        try container.encode(self.feeAmount, forKey: .feeAmount)
        try container.encode(self.feeType, forKey: .feeType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.ledgerAccount, forKey: .ledgerAccount)
        try container.encode(self.markupFee, forKey: .markupFee)
        try container.encode(self.payoutRequestId, forKey: .payoutRequestId)
        try container.encode(self.payoutToken, forKey: .payoutToken)
        try container.encode(self.speed, forKey: .speed)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.traceCode, forKey: .traceCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case createdAt = "created_at"
        case currency
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case estimatedAvailability = "estimated_availability"
        case feeAmount = "fee_amount"
        case feeType = "fee_type"
        case id
        case ledgerAccount = "ledger_account"
        case markupFee = "markup_fee"
        case payoutRequestId = "payout_request_id"
        case payoutToken = "payout_token"
        case speed
        case status
        case traceCode = "trace_code"
    }
}