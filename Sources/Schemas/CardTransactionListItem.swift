import Foundation

/// A card transaction record.
public struct CardTransactionListItem: Codable, Hashable, Sendable {
    /// How the card was presented or authenticated for the purchase.
    public let authorizationMethod: Nullable<String>
    /// Represents a unique identifier that is Base64 obfuscated. It is often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `"VXNlci0xMA=="`) or integer (such as `4`) input value will be accepted as an ID.
    public let cardId: String
    /// The cashback reward amount earned on this transaction, in USD.
    public let cashbackUsdAmount: Nullable<Double>
    /// The datetime the card transaction was created.
    public let createdAt: Date
    /// The ISO 4217 currency code for the transaction amount.
    public let currency: Nullable<String>
    /// The issuer-provided reason the transaction was declined.
    public let declinedReason: Nullable<String>
    /// The unique identifier for the card transaction.
    public let id: String
    /// Whether the transaction was made with a merchant outside the card's home country.
    public let international: Bool
    /// The transaction amount in the merchant's local currency before conversion.
    public let localAmount: Nullable<Double>
    /// A user-provided note attached to the transaction.
    public let memo: Nullable<String>
    /// The enriched or raw category label for the merchant.
    public let merchantCategory: Nullable<String>
    /// The four-digit ISO 18245 merchant category code (MCC).
    public let merchantCategoryCode: Nullable<String>
    /// A URL to the enriched merchant logo image.
    public let merchantIconUrl: Nullable<String>
    /// The enriched or raw name of the merchant where the purchase was made.
    public let merchantName: Nullable<String>
    /// When the transaction was settled by the card network.
    public let postedAt: Nullable<Date>
    /// The current lifecycle status of the transaction.
    public let status: CardIssuingTransactionStatus
    /// The type of transaction.
    public let transactionType: String
    /// The transaction amount in USD.
    public let usdAmount: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorizationMethod: Nullable<String>,
        cardId: String,
        cashbackUsdAmount: Nullable<Double>,
        createdAt: Date,
        currency: Nullable<String>,
        declinedReason: Nullable<String>,
        id: String,
        international: Bool,
        localAmount: Nullable<Double>,
        memo: Nullable<String>,
        merchantCategory: Nullable<String>,
        merchantCategoryCode: Nullable<String>,
        merchantIconUrl: Nullable<String>,
        merchantName: Nullable<String>,
        postedAt: Nullable<Date>,
        status: CardIssuingTransactionStatus,
        transactionType: String,
        usdAmount: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorizationMethod = authorizationMethod
        self.cardId = cardId
        self.cashbackUsdAmount = cashbackUsdAmount
        self.createdAt = createdAt
        self.currency = currency
        self.declinedReason = declinedReason
        self.id = id
        self.international = international
        self.localAmount = localAmount
        self.memo = memo
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
        self.authorizationMethod = try container.decode(Nullable<String>.self, forKey: .authorizationMethod)
        self.cardId = try container.decode(String.self, forKey: .cardId)
        self.cashbackUsdAmount = try container.decode(Nullable<Double>.self, forKey: .cashbackUsdAmount)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.currency = try container.decode(Nullable<String>.self, forKey: .currency)
        self.declinedReason = try container.decode(Nullable<String>.self, forKey: .declinedReason)
        self.id = try container.decode(String.self, forKey: .id)
        self.international = try container.decode(Bool.self, forKey: .international)
        self.localAmount = try container.decode(Nullable<Double>.self, forKey: .localAmount)
        self.memo = try container.decode(Nullable<String>.self, forKey: .memo)
        self.merchantCategory = try container.decode(Nullable<String>.self, forKey: .merchantCategory)
        self.merchantCategoryCode = try container.decode(Nullable<String>.self, forKey: .merchantCategoryCode)
        self.merchantIconUrl = try container.decode(Nullable<String>.self, forKey: .merchantIconUrl)
        self.merchantName = try container.decode(Nullable<String>.self, forKey: .merchantName)
        self.postedAt = try container.decode(Nullable<Date>.self, forKey: .postedAt)
        self.status = try container.decode(CardIssuingTransactionStatus.self, forKey: .status)
        self.transactionType = try container.decode(String.self, forKey: .transactionType)
        self.usdAmount = try container.decode(Nullable<Double>.self, forKey: .usdAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.authorizationMethod, forKey: .authorizationMethod)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encode(self.cashbackUsdAmount, forKey: .cashbackUsdAmount)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.declinedReason, forKey: .declinedReason)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.international, forKey: .international)
        try container.encode(self.localAmount, forKey: .localAmount)
        try container.encode(self.memo, forKey: .memo)
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
        case authorizationMethod = "authorization_method"
        case cardId = "card_id"
        case cashbackUsdAmount = "cashback_usd_amount"
        case createdAt = "created_at"
        case currency
        case declinedReason = "declined_reason"
        case id
        case international
        case localAmount = "local_amount"
        case memo
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