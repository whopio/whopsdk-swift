import Foundation

public struct CardTransaction: Codable, Hashable, Sendable {
    /// The card this transaction was charged to, prefixed `icrd_`.
    public let cardId: String
    /// The user the card is assigned to, prefixed `user_`. Null when the card has no assigned cardholder.
    public let cardholderId: Nullable<String>
    /// Cashback earned on this transaction as a USD amount. Zero for declined or ineligible transactions, and null when cashback has not been computed yet.
    public let cashbackUsdAmount: Nullable<Double>
    /// When the transaction was authorized, as an ISO 8601 timestamp.
    public let createdAt: String
    /// ISO 4217 currency code the merchant charged in.
    public let currency: Nullable<String>
    /// Why the transaction was declined. Null unless `status` is `declined`.
    public let declinedReason: Nullable<String>
    /// Card transaction ID, prefixed `citx_`.
    public let id: String
    /// True when the merchant is outside the card's home country.
    public let international: Bool
    /// Amount the merchant charged in their own currency. Pair with `currency`.
    public let localAmount: Nullable<Double>
    /// Merchant category label, enriched where available and otherwise as the card network reported it.
    public let merchantCategory: Nullable<String>
    /// Four-digit ISO 18245 merchant category code (MCC).
    public let merchantCategoryCode: Nullable<String>
    /// URL of the enriched merchant logo. Null when no logo was matched.
    public let merchantIconUrl: Nullable<String>
    /// Merchant name, enriched where available and otherwise as the card network reported it.
    public let merchantName: Nullable<String>
    /// When the card network settled the transaction, as an ISO 8601 timestamp. Null until it settles.
    public let postedAt: Nullable<String>
    /// Current status of the transaction.
    public let status: CardTransactionStatus
    /// The kind of card transaction. Always `spend` today.
    public let transactionType: CardTransactionTransactionType
    /// Amount charged in USD. Negative when the merchant refunded the card.
    public let usdAmount: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardId: String,
        cardholderId: Nullable<String>,
        cashbackUsdAmount: Nullable<Double>,
        createdAt: String,
        currency: Nullable<String>,
        declinedReason: Nullable<String>,
        id: String,
        international: Bool,
        localAmount: Nullable<Double>,
        merchantCategory: Nullable<String>,
        merchantCategoryCode: Nullable<String>,
        merchantIconUrl: Nullable<String>,
        merchantName: Nullable<String>,
        postedAt: Nullable<String>,
        status: CardTransactionStatus,
        transactionType: CardTransactionTransactionType,
        usdAmount: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardId = cardId
        self.cardholderId = cardholderId
        self.cashbackUsdAmount = cashbackUsdAmount
        self.createdAt = createdAt
        self.currency = currency
        self.declinedReason = declinedReason
        self.id = id
        self.international = international
        self.localAmount = localAmount
        self.merchantCategory = merchantCategory
        self.merchantCategoryCode = merchantCategoryCode
        self.merchantIconUrl = merchantIconUrl
        self.merchantName = merchantName
        self.postedAt = postedAt
        self.status = status
        self.transactionType = transactionType
        self.usdAmount = usdAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardId = try container.decode(String.self, forKey: .cardId)
        self.cardholderId = try container.decode(Nullable<String>.self, forKey: .cardholderId)
        self.cashbackUsdAmount = try container.decode(Nullable<Double>.self, forKey: .cashbackUsdAmount)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<String>.self, forKey: .currency)
        self.declinedReason = try container.decode(Nullable<String>.self, forKey: .declinedReason)
        self.id = try container.decode(String.self, forKey: .id)
        self.international = try container.decode(Bool.self, forKey: .international)
        self.localAmount = try container.decode(Nullable<Double>.self, forKey: .localAmount)
        self.merchantCategory = try container.decode(Nullable<String>.self, forKey: .merchantCategory)
        self.merchantCategoryCode = try container.decode(Nullable<String>.self, forKey: .merchantCategoryCode)
        self.merchantIconUrl = try container.decode(Nullable<String>.self, forKey: .merchantIconUrl)
        self.merchantName = try container.decode(Nullable<String>.self, forKey: .merchantName)
        self.postedAt = try container.decode(Nullable<String>.self, forKey: .postedAt)
        self.status = try container.decode(CardTransactionStatus.self, forKey: .status)
        self.transactionType = try container.decode(CardTransactionTransactionType.self, forKey: .transactionType)
        self.usdAmount = try container.decode(Nullable<Double>.self, forKey: .usdAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encode(self.cardholderId, forKey: .cardholderId)
        try container.encode(self.cashbackUsdAmount, forKey: .cashbackUsdAmount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.declinedReason, forKey: .declinedReason)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.international, forKey: .international)
        try container.encode(self.localAmount, forKey: .localAmount)
        try container.encode(self.merchantCategory, forKey: .merchantCategory)
        try container.encode(self.merchantCategoryCode, forKey: .merchantCategoryCode)
        try container.encode(self.merchantIconUrl, forKey: .merchantIconUrl)
        try container.encode(self.merchantName, forKey: .merchantName)
        try container.encode(self.postedAt, forKey: .postedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.transactionType, forKey: .transactionType)
        try container.encode(self.usdAmount, forKey: .usdAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardId = "card_id"
        case cardholderId = "cardholder_id"
        case cashbackUsdAmount = "cashback_usd_amount"
        case createdAt = "created_at"
        case currency
        case declinedReason = "declined_reason"
        case id
        case international
        case localAmount = "local_amount"
        case merchantCategory = "merchant_category"
        case merchantCategoryCode = "merchant_category_code"
        case merchantIconUrl = "merchant_icon_url"
        case merchantName = "merchant_name"
        case postedAt = "posted_at"
        case status
        case transactionType = "transaction_type"
        case usdAmount = "usd_amount"
    }
}