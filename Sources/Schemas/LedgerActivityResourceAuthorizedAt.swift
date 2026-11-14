import Foundation

public struct LedgerActivityResourceAuthorizedAt: Codable, Hashable, Sendable {
    /// ISO 8601 timestamp the transaction was authorized.
    public let authorizedAt: Nullable<Date>
    /// Identifier of the card that the transaction was charged to.
    public let cardId: Nullable<String>
    /// Cashback earned on this transaction as a USD decimal string. Zero for declined or ineligible transactions; null when cashback has not been computed yet.
    public let cashbackUsd: Nullable<String>
    /// Reason the transaction was declined (when status is declined).
    public let declinedReason: Nullable<String>
    /// Card transaction ID.
    public let id: String
    /// Whop Levels points this transaction earned for the business, as a decimal string. Negative for a refund that takes them back. Null when it earns none: a transaction that hasn't settled, was declined, or was made on a personal card.
    public let levelsPoints: Nullable<String>
    /// Amount the merchant charged in their local currency, as a decimal string. Pair with local_currency.
    public let localAmount: Nullable<String>
    /// ISO 4217 currency code of the merchant-charged amount in local_amount.
    public let localCurrency: Nullable<String>
    /// Merchant category.
    public let merchantCategory: Nullable<String>
    /// Merchant icon URL.
    public let merchantIconUrl: Nullable<String>
    /// Merchant display name.
    public let merchantName: Nullable<String>
    public let object: LedgerActivityResourceAuthorizedAtObject
    /// ISO 8601 timestamp the transaction was settled by the card network.
    public let postedAt: Nullable<Date>
    /// Current card transaction status.
    public let status: Nullable<String>
    /// The processor-settled USD amount as a decimal string.
    public let usdAmount: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorizedAt: Nullable<Date>,
        cardId: Nullable<String>,
        cashbackUsd: Nullable<String>,
        declinedReason: Nullable<String>,
        id: String,
        levelsPoints: Nullable<String>,
        localAmount: Nullable<String>,
        localCurrency: Nullable<String>,
        merchantCategory: Nullable<String>,
        merchantIconUrl: Nullable<String>,
        merchantName: Nullable<String>,
        object: LedgerActivityResourceAuthorizedAtObject,
        postedAt: Nullable<Date>,
        status: Nullable<String>,
        usdAmount: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorizedAt = authorizedAt
        self.cardId = cardId
        self.cashbackUsd = cashbackUsd
        self.declinedReason = declinedReason
        self.id = id
        self.levelsPoints = levelsPoints
        self.localAmount = localAmount
        self.localCurrency = localCurrency
        self.merchantCategory = merchantCategory
        self.merchantIconUrl = merchantIconUrl
        self.merchantName = merchantName
        self.object = object
        self.postedAt = postedAt
        self.status = status
        self.usdAmount = usdAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorizedAt = try container.decode(Nullable<Date>.self, forKey: .authorizedAt)
        self.cardId = try container.decode(Nullable<String>.self, forKey: .cardId)
        self.cashbackUsd = try container.decode(Nullable<String>.self, forKey: .cashbackUsd)
        self.declinedReason = try container.decode(Nullable<String>.self, forKey: .declinedReason)
        self.id = try container.decode(String.self, forKey: .id)
        self.levelsPoints = try container.decode(Nullable<String>.self, forKey: .levelsPoints)
        self.localAmount = try container.decode(Nullable<String>.self, forKey: .localAmount)
        self.localCurrency = try container.decode(Nullable<String>.self, forKey: .localCurrency)
        self.merchantCategory = try container.decode(Nullable<String>.self, forKey: .merchantCategory)
        self.merchantIconUrl = try container.decode(Nullable<String>.self, forKey: .merchantIconUrl)
        self.merchantName = try container.decode(Nullable<String>.self, forKey: .merchantName)
        self.object = try container.decode(LedgerActivityResourceAuthorizedAtObject.self, forKey: .object)
        self.postedAt = try container.decode(Nullable<Date>.self, forKey: .postedAt)
        self.status = try container.decode(Nullable<String>.self, forKey: .status)
        self.usdAmount = try container.decode(Nullable<String>.self, forKey: .usdAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.authorizedAt, forKey: .authorizedAt)
        try container.encode(self.cardId, forKey: .cardId)
        try container.encode(self.cashbackUsd, forKey: .cashbackUsd)
        try container.encode(self.declinedReason, forKey: .declinedReason)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.levelsPoints, forKey: .levelsPoints)
        try container.encode(self.localAmount, forKey: .localAmount)
        try container.encode(self.localCurrency, forKey: .localCurrency)
        try container.encode(self.merchantCategory, forKey: .merchantCategory)
        try container.encode(self.merchantIconUrl, forKey: .merchantIconUrl)
        try container.encode(self.merchantName, forKey: .merchantName)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.postedAt, forKey: .postedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.usdAmount, forKey: .usdAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authorizedAt = "authorized_at"
        case cardId = "card_id"
        case cashbackUsd = "cashback_usd"
        case declinedReason = "declined_reason"
        case id
        case levelsPoints = "levels_points"
        case localAmount = "local_amount"
        case localCurrency = "local_currency"
        case merchantCategory = "merchant_category"
        case merchantIconUrl = "merchant_icon_url"
        case merchantName = "merchant_name"
        case object
        case postedAt = "posted_at"
        case status
        case usdAmount = "usd_amount"
    }
}