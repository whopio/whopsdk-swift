import Foundation

/// Source of this ledger activity. Platform markup fees use object platform_fee and the ledger activity ID.
public struct LedgerActivitySource: Codable, Hashable, Sendable {
    /// Payout amount as a decimal number in the destination currency (payout sources only; requires payout:withdrawal:read).
    public let amountFloat: Nullable<Double>?
    /// Card brand used by the payment source.
    public let cardBrand: Nullable<String>?
    /// Chain the deposit landed on, for example plasma (onchain_transaction sources only).
    public let chain: Nullable<String>?
    /// The airdrop's claim URL. Null unless the caller can manage claim links on the funding company or withdraw from the funding personal balance.
    public let claimUrl: Nullable<String>?
    /// Payout creation time as an ISO 8601 timestamp (payout sources only; requires payout:withdrawal:read).
    public let createdAt: Nullable<Date>?
    /// User who requested the withdrawal. Null for system-generated withdrawals or without payout:withdrawal:read.
    public let createdByUser: Nullable<UserSummary>?
    /// Estimated arrival as an ISO 8601 timestamp (payout sources only; requires payout:withdrawal:read).
    public let estimatedArrival: Nullable<Date>?
    /// Total withdrawal fees, including markup fees. Requires payout:withdrawal:read.
    public let feeAmount: Nullable<Money>?
    /// Action that generated a platform markup fee: deposit, swap, transfer, card_spend, or payout. Present for platform_markup_fee and platform_markup_fee_payout, including when include_resource is false. Null when the originating action is unavailable; omitted on other source types.
    public let feeKind: Nullable<LedgerActivitySourceFeeKind>?
    /// Whether withdrawal fees are inclusive or exclusive. Requires payout:withdrawal:read.
    public let feeType: Nullable<LedgerActivitySourceFeeType>?
    /// Amount converted out of from_currency as a decimal string (swap sources only).
    public let fromAmount: Nullable<String>?
    /// Lowercase currency code converted from (swap sources only).
    public let fromCurrency: Nullable<String>?
    public let id: String
    /// Memo attached to the transfer, payout, or bank_deposit source, or null when none was provided (on payout sources requires payout:withdrawal:read).
    public let notes: Nullable<String>?
    public let object: String
    /// On payout sources, the name of the entity processing the payout (requires payout:withdrawal:read). On bank_deposit sources, the name of the account that sent the deposit.
    public let payerName: Nullable<String>?
    /// Total charged by the payment source.
    public let paymentAmount: Nullable<Money>?
    /// Payment method used by the payment source. On bank_deposit sources, the transfer rail: `wire`, `ach`, or `rtp`.
    public let paymentMethodType: Nullable<String>?
    /// Processor used by the payment source.
    public let paymentProcessor: Nullable<String>?
    /// Withdrawal principal sent to the destination, excluding fees, in the withdrawal currency. Requires payout:withdrawal:read.
    public let payoutAmount: Nullable<Money>?
    /// Payout destination display info (payout sources only).
    public let payoutDestination: Nullable<LedgerActivitySourcePayoutDestination>?
    /// Saved payout destination nickname (payout sources only).
    public let payoutTokenNickname: Nullable<String>?
    /// Why the activity happened. On transfer sources this is the transfer reason, for example pool_top_up or bounty_return. On payout sources it explains why the payout was canceled, denied, or failed (requires payout:withdrawal:read); null while the payout is progressing normally.
    public let reason: Nullable<String>?
    /// Whether this payout is currently held for manual risk review (payout sources only; requires payout:withdrawal:read).
    public let riskReviewHold: Nullable<Bool>?
    /// On onchain_transaction sources, the sender wallet address or onramp provider identifier. On bank_deposit sources, the last four digits of the sending bank account, such as `••••1547`.
    public let senderAddress: Nullable<String>?
    /// Lifecycle status. On payout sources this is the payout status (requires payout:withdrawal:read); on airdrop_link sources it is the claim-link status (ungated); on payment and top-up sources it is the friendly payment status such as succeeded/pending/failed (ungated); on bank_deposit sources it is succeeded, reversal_in_progress or reversed (ungated).
    public let status: Nullable<String>?
    /// Amount received in to_currency as a decimal string (swap sources only).
    public let toAmount: Nullable<String>?
    /// Lowercase currency code converted to (swap sources only).
    public let toCurrency: Nullable<String>?
    /// Bank trace reference for the withdrawal. Requires payout:withdrawal:read.
    public let traceCode: Nullable<String>?
    /// On-chain transaction hash (onchain_transaction and swap sources only).
    public let txHash: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountFloat: Nullable<Double>? = nil,
        cardBrand: Nullable<String>? = nil,
        chain: Nullable<String>? = nil,
        claimUrl: Nullable<String>? = nil,
        createdAt: Nullable<Date>? = nil,
        createdByUser: Nullable<UserSummary>? = nil,
        estimatedArrival: Nullable<Date>? = nil,
        feeAmount: Nullable<Money>? = nil,
        feeKind: Nullable<LedgerActivitySourceFeeKind>? = nil,
        feeType: Nullable<LedgerActivitySourceFeeType>? = nil,
        fromAmount: Nullable<String>? = nil,
        fromCurrency: Nullable<String>? = nil,
        id: String,
        notes: Nullable<String>? = nil,
        object: String,
        payerName: Nullable<String>? = nil,
        paymentAmount: Nullable<Money>? = nil,
        paymentMethodType: Nullable<String>? = nil,
        paymentProcessor: Nullable<String>? = nil,
        payoutAmount: Nullable<Money>? = nil,
        payoutDestination: Nullable<LedgerActivitySourcePayoutDestination>? = nil,
        payoutTokenNickname: Nullable<String>? = nil,
        reason: Nullable<String>? = nil,
        riskReviewHold: Nullable<Bool>? = nil,
        senderAddress: Nullable<String>? = nil,
        status: Nullable<String>? = nil,
        toAmount: Nullable<String>? = nil,
        toCurrency: Nullable<String>? = nil,
        traceCode: Nullable<String>? = nil,
        txHash: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amountFloat = amountFloat
        self.cardBrand = cardBrand
        self.chain = chain
        self.claimUrl = claimUrl
        self.createdAt = createdAt
        self.createdByUser = createdByUser
        self.estimatedArrival = estimatedArrival
        self.feeAmount = feeAmount
        self.feeKind = feeKind
        self.feeType = feeType
        self.fromAmount = fromAmount
        self.fromCurrency = fromCurrency
        self.id = id
        self.notes = notes
        self.object = object
        self.payerName = payerName
        self.paymentAmount = paymentAmount
        self.paymentMethodType = paymentMethodType
        self.paymentProcessor = paymentProcessor
        self.payoutAmount = payoutAmount
        self.payoutDestination = payoutDestination
        self.payoutTokenNickname = payoutTokenNickname
        self.reason = reason
        self.riskReviewHold = riskReviewHold
        self.senderAddress = senderAddress
        self.status = status
        self.toAmount = toAmount
        self.toCurrency = toCurrency
        self.traceCode = traceCode
        self.txHash = txHash
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountFloat = try container.decodeNullableIfPresent(Double.self, forKey: .amountFloat)
        self.cardBrand = try container.decodeNullableIfPresent(String.self, forKey: .cardBrand)
        self.chain = try container.decodeNullableIfPresent(String.self, forKey: .chain)
        self.claimUrl = try container.decodeNullableIfPresent(String.self, forKey: .claimUrl)
        self.createdAt = try container.decodeNullableIfPresent(Date.self, forKey: .createdAt)
        self.createdByUser = try container.decodeNullableIfPresent(UserSummary.self, forKey: .createdByUser)
        self.estimatedArrival = try container.decodeNullableIfPresent(Date.self, forKey: .estimatedArrival)
        self.feeAmount = try container.decodeNullableIfPresent(Money.self, forKey: .feeAmount)
        self.feeKind = try container.decodeNullableIfPresent(LedgerActivitySourceFeeKind.self, forKey: .feeKind)
        self.feeType = try container.decodeNullableIfPresent(LedgerActivitySourceFeeType.self, forKey: .feeType)
        self.fromAmount = try container.decodeNullableIfPresent(String.self, forKey: .fromAmount)
        self.fromCurrency = try container.decodeNullableIfPresent(String.self, forKey: .fromCurrency)
        self.id = try container.decode(String.self, forKey: .id)
        self.notes = try container.decodeNullableIfPresent(String.self, forKey: .notes)
        self.object = try container.decode(String.self, forKey: .object)
        self.payerName = try container.decodeNullableIfPresent(String.self, forKey: .payerName)
        self.paymentAmount = try container.decodeNullableIfPresent(Money.self, forKey: .paymentAmount)
        self.paymentMethodType = try container.decodeNullableIfPresent(String.self, forKey: .paymentMethodType)
        self.paymentProcessor = try container.decodeNullableIfPresent(String.self, forKey: .paymentProcessor)
        self.payoutAmount = try container.decodeNullableIfPresent(Money.self, forKey: .payoutAmount)
        self.payoutDestination = try container.decodeNullableIfPresent(LedgerActivitySourcePayoutDestination.self, forKey: .payoutDestination)
        self.payoutTokenNickname = try container.decodeNullableIfPresent(String.self, forKey: .payoutTokenNickname)
        self.reason = try container.decodeNullableIfPresent(String.self, forKey: .reason)
        self.riskReviewHold = try container.decodeNullableIfPresent(Bool.self, forKey: .riskReviewHold)
        self.senderAddress = try container.decodeNullableIfPresent(String.self, forKey: .senderAddress)
        self.status = try container.decodeNullableIfPresent(String.self, forKey: .status)
        self.toAmount = try container.decodeNullableIfPresent(String.self, forKey: .toAmount)
        self.toCurrency = try container.decodeNullableIfPresent(String.self, forKey: .toCurrency)
        self.traceCode = try container.decodeNullableIfPresent(String.self, forKey: .traceCode)
        self.txHash = try container.decodeNullableIfPresent(String.self, forKey: .txHash)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.amountFloat, forKey: .amountFloat)
        try container.encodeNullableIfPresent(self.cardBrand, forKey: .cardBrand)
        try container.encodeNullableIfPresent(self.chain, forKey: .chain)
        try container.encodeNullableIfPresent(self.claimUrl, forKey: .claimUrl)
        try container.encodeNullableIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.createdByUser, forKey: .createdByUser)
        try container.encodeNullableIfPresent(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encodeNullableIfPresent(self.feeAmount, forKey: .feeAmount)
        try container.encodeNullableIfPresent(self.feeKind, forKey: .feeKind)
        try container.encodeNullableIfPresent(self.feeType, forKey: .feeType)
        try container.encodeNullableIfPresent(self.fromAmount, forKey: .fromAmount)
        try container.encodeNullableIfPresent(self.fromCurrency, forKey: .fromCurrency)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.notes, forKey: .notes)
        try container.encode(self.object, forKey: .object)
        try container.encodeNullableIfPresent(self.payerName, forKey: .payerName)
        try container.encodeNullableIfPresent(self.paymentAmount, forKey: .paymentAmount)
        try container.encodeNullableIfPresent(self.paymentMethodType, forKey: .paymentMethodType)
        try container.encodeNullableIfPresent(self.paymentProcessor, forKey: .paymentProcessor)
        try container.encodeNullableIfPresent(self.payoutAmount, forKey: .payoutAmount)
        try container.encodeNullableIfPresent(self.payoutDestination, forKey: .payoutDestination)
        try container.encodeNullableIfPresent(self.payoutTokenNickname, forKey: .payoutTokenNickname)
        try container.encodeNullableIfPresent(self.reason, forKey: .reason)
        try container.encodeNullableIfPresent(self.riskReviewHold, forKey: .riskReviewHold)
        try container.encodeNullableIfPresent(self.senderAddress, forKey: .senderAddress)
        try container.encodeNullableIfPresent(self.status, forKey: .status)
        try container.encodeNullableIfPresent(self.toAmount, forKey: .toAmount)
        try container.encodeNullableIfPresent(self.toCurrency, forKey: .toCurrency)
        try container.encodeNullableIfPresent(self.traceCode, forKey: .traceCode)
        try container.encodeNullableIfPresent(self.txHash, forKey: .txHash)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amountFloat = "amount_float"
        case cardBrand = "card_brand"
        case chain
        case claimUrl = "claim_url"
        case createdAt = "created_at"
        case createdByUser = "created_by_user"
        case estimatedArrival = "estimated_arrival"
        case feeAmount = "fee_amount"
        case feeKind = "fee_kind"
        case feeType = "fee_type"
        case fromAmount = "from_amount"
        case fromCurrency = "from_currency"
        case id
        case notes
        case object
        case payerName = "payer_name"
        case paymentAmount = "payment_amount"
        case paymentMethodType = "payment_method_type"
        case paymentProcessor = "payment_processor"
        case payoutAmount = "payout_amount"
        case payoutDestination = "payout_destination"
        case payoutTokenNickname = "payout_token_nickname"
        case reason
        case riskReviewHold = "risk_review_hold"
        case senderAddress = "sender_address"
        case status
        case toAmount = "to_amount"
        case toCurrency = "to_currency"
        case traceCode = "trace_code"
        case txHash = "tx_hash"
    }
}