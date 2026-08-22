import Foundation

/// Source of this ledger activity.
public struct LedgerActivitySource: Codable, Hashable, Sendable {
    /// Withdrawal amount as a decimal number in the destination currency (withdrawal sources only; requires payout:withdrawal:read).
    public let amountFloat: Nullable<Double>?
    /// Chain the deposit landed on, for example plasma (onchain_transaction sources only).
    public let chain: Nullable<String>?
    /// Public claim URL for the airdrop link (airdrop_link sources only).
    public let claimUrl: Nullable<String>?
    /// Withdrawal creation time as an ISO 8601 timestamp (withdrawal sources only; requires payout:withdrawal:read).
    public let createdAt: Nullable<Date>?
    /// Estimated arrival as an ISO 8601 timestamp (withdrawal sources only; requires payout:withdrawal:read).
    public let estimatedArrival: Nullable<Date>?
    /// Amount converted out of from_currency as a decimal string (swap sources only).
    public let fromAmount: Nullable<String>?
    /// Lowercase currency code converted from (swap sources only).
    public let fromCurrency: Nullable<String>?
    public let id: String
    public let object: String
    /// Name of the entity processing the payout (withdrawal sources only; requires payout:withdrawal:read).
    public let payerName: Nullable<String>?
    /// Payout destination display info (withdrawal sources only).
    public let payoutDestination: Nullable<LedgerActivitySourcePayoutDestination>?
    /// Saved payout destination nickname (withdrawal sources only).
    public let payoutTokenNickname: Nullable<String>?
    /// Why the activity happened. On transfer sources this is the transfer reason, for example pool_top_up or bounty_return. On withdrawal sources it explains why the withdrawal was canceled, denied, or failed (requires payout:withdrawal:read); null while the withdrawal is progressing normally.
    public let reason: Nullable<String>?
    /// Sender wallet address or onramp provider identifier (onchain_transaction sources only).
    public let senderAddress: Nullable<String>?
    /// Lifecycle status. On withdrawal sources this is the withdrawal status (requires payout:withdrawal:read); on airdrop_link sources it is the claim-link status (ungated); on payment and top-up sources it is the friendly payment status such as succeeded/pending/failed (ungated).
    public let status: Nullable<String>?
    /// Amount received in to_currency as a decimal string (swap sources only).
    public let toAmount: Nullable<String>?
    /// Lowercase currency code converted to (swap sources only).
    public let toCurrency: Nullable<String>?
    /// On-chain transaction hash (onchain_transaction and swap sources only).
    public let txHash: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountFloat: Nullable<Double>? = nil,
        chain: Nullable<String>? = nil,
        claimUrl: Nullable<String>? = nil,
        createdAt: Nullable<Date>? = nil,
        estimatedArrival: Nullable<Date>? = nil,
        fromAmount: Nullable<String>? = nil,
        fromCurrency: Nullable<String>? = nil,
        id: String,
        object: String,
        payerName: Nullable<String>? = nil,
        payoutDestination: Nullable<LedgerActivitySourcePayoutDestination>? = nil,
        payoutTokenNickname: Nullable<String>? = nil,
        reason: Nullable<String>? = nil,
        senderAddress: Nullable<String>? = nil,
        status: Nullable<String>? = nil,
        toAmount: Nullable<String>? = nil,
        toCurrency: Nullable<String>? = nil,
        txHash: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amountFloat = amountFloat
        self.chain = chain
        self.claimUrl = claimUrl
        self.createdAt = createdAt
        self.estimatedArrival = estimatedArrival
        self.fromAmount = fromAmount
        self.fromCurrency = fromCurrency
        self.id = id
        self.object = object
        self.payerName = payerName
        self.payoutDestination = payoutDestination
        self.payoutTokenNickname = payoutTokenNickname
        self.reason = reason
        self.senderAddress = senderAddress
        self.status = status
        self.toAmount = toAmount
        self.toCurrency = toCurrency
        self.txHash = txHash
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountFloat = try container.decodeNullableIfPresent(Double.self, forKey: .amountFloat)
        self.chain = try container.decodeNullableIfPresent(String.self, forKey: .chain)
        self.claimUrl = try container.decodeNullableIfPresent(String.self, forKey: .claimUrl)
        self.createdAt = try container.decodeNullableIfPresent(Date.self, forKey: .createdAt)
        self.estimatedArrival = try container.decodeNullableIfPresent(Date.self, forKey: .estimatedArrival)
        self.fromAmount = try container.decodeNullableIfPresent(String.self, forKey: .fromAmount)
        self.fromCurrency = try container.decodeNullableIfPresent(String.self, forKey: .fromCurrency)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(String.self, forKey: .object)
        self.payerName = try container.decodeNullableIfPresent(String.self, forKey: .payerName)
        self.payoutDestination = try container.decodeNullableIfPresent(LedgerActivitySourcePayoutDestination.self, forKey: .payoutDestination)
        self.payoutTokenNickname = try container.decodeNullableIfPresent(String.self, forKey: .payoutTokenNickname)
        self.reason = try container.decodeNullableIfPresent(String.self, forKey: .reason)
        self.senderAddress = try container.decodeNullableIfPresent(String.self, forKey: .senderAddress)
        self.status = try container.decodeNullableIfPresent(String.self, forKey: .status)
        self.toAmount = try container.decodeNullableIfPresent(String.self, forKey: .toAmount)
        self.toCurrency = try container.decodeNullableIfPresent(String.self, forKey: .toCurrency)
        self.txHash = try container.decodeNullableIfPresent(String.self, forKey: .txHash)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.amountFloat, forKey: .amountFloat)
        try container.encodeNullableIfPresent(self.chain, forKey: .chain)
        try container.encodeNullableIfPresent(self.claimUrl, forKey: .claimUrl)
        try container.encodeNullableIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encodeNullableIfPresent(self.fromAmount, forKey: .fromAmount)
        try container.encodeNullableIfPresent(self.fromCurrency, forKey: .fromCurrency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encodeNullableIfPresent(self.payerName, forKey: .payerName)
        try container.encodeNullableIfPresent(self.payoutDestination, forKey: .payoutDestination)
        try container.encodeNullableIfPresent(self.payoutTokenNickname, forKey: .payoutTokenNickname)
        try container.encodeNullableIfPresent(self.reason, forKey: .reason)
        try container.encodeNullableIfPresent(self.senderAddress, forKey: .senderAddress)
        try container.encodeNullableIfPresent(self.status, forKey: .status)
        try container.encodeNullableIfPresent(self.toAmount, forKey: .toAmount)
        try container.encodeNullableIfPresent(self.toCurrency, forKey: .toCurrency)
        try container.encodeNullableIfPresent(self.txHash, forKey: .txHash)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amountFloat = "amount_float"
        case chain
        case claimUrl = "claim_url"
        case createdAt = "created_at"
        case estimatedArrival = "estimated_arrival"
        case fromAmount = "from_amount"
        case fromCurrency = "from_currency"
        case id
        case object
        case payerName = "payer_name"
        case payoutDestination = "payout_destination"
        case payoutTokenNickname = "payout_token_nickname"
        case reason
        case senderAddress = "sender_address"
        case status
        case toAmount = "to_amount"
        case toCurrency = "to_currency"
        case txHash = "tx_hash"
    }
}