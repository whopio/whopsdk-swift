import Foundation

public struct SearchRecordPromoCode: Codable, Hashable, Sendable {
    /// Account the record belongs to, prefixed `biz_`.
    public let accountId: String
    /// Discount amount. Percentage discounts are represented as a decimal fraction.
    public let amountOff: Double
    /// Currency used for a fixed-amount discount.
    public let currency: SearchRecordPromoCodeCurrency
    /// Short text about the record, such as an account's headline or a case's reason. Display text in your locale that can change without a version change. `null` when there's none.
    public let description: Nullable<String>
    /// Promo code ID, prefixed `promo_`.
    public let id: String
    /// Logo or avatar. `null` when there's none.
    public let imageUrl: Nullable<String>
    /// Billing intervals the discount applies to. Never `null`.
    public let promoDurationMonths: Int
    /// Whether the discount is percentage-based or a fixed amount.
    public let promoType: SearchRecordPromoCodePromoType
    /// Line shown under the title, such as the account or product the record belongs to. Display text in your locale that can change without a version change. `null` when there's none.
    public let subtitle: Nullable<String>
    /// Record name, such as a customer's name or a promo code. Display text in your locale that can change without a version change, so show it rather than parse it. `null` when the record has no name.
    public let title: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        amountOff: Double,
        currency: SearchRecordPromoCodeCurrency,
        description: Nullable<String>,
        id: String,
        imageUrl: Nullable<String>,
        promoDurationMonths: Int,
        promoType: SearchRecordPromoCodePromoType,
        subtitle: Nullable<String>,
        title: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.amountOff = amountOff
        self.currency = currency
        self.description = description
        self.id = id
        self.imageUrl = imageUrl
        self.promoDurationMonths = promoDurationMonths
        self.promoType = promoType
        self.subtitle = subtitle
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.amountOff = try container.decode(Double.self, forKey: .amountOff)
        self.currency = try container.decode(SearchRecordPromoCodeCurrency.self, forKey: .currency)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.promoDurationMonths = try container.decode(Int.self, forKey: .promoDurationMonths)
        self.promoType = try container.decode(SearchRecordPromoCodePromoType.self, forKey: .promoType)
        self.subtitle = try container.decode(Nullable<String>.self, forKey: .subtitle)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.amountOff, forKey: .amountOff)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.promoDurationMonths, forKey: .promoDurationMonths)
        try container.encode(self.promoType, forKey: .promoType)
        try container.encode(self.subtitle, forKey: .subtitle)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case amountOff = "amount_off"
        case currency
        case description
        case id
        case imageUrl = "image_url"
        case promoDurationMonths = "promo_duration_months"
        case promoType = "promo_type"
        case subtitle
        case title
    }
}