import Foundation

public struct UpdatePreferencesResponseAdsPaymentMethodsPrimary: Codable, Hashable, Sendable {
    /// Card brand, present for `card` entries.
    public let cardBrand: Nullable<String>?
    /// Expiration month, present for `card` entries.
    public let expMonth: Nullable<Int>?
    /// Expiration year, present for `card` entries.
    public let expYear: Nullable<Int>?
    /// Balance owner icon URL, present for `platform_balance` entries.
    public let iconUrl: Nullable<String>?
    /// The funding source ID: a Whop balance (`ldgr_`) for `platform_balance`, or a payment method (`payt_`) for `card`.
    public let id: String
    /// Last four digits, present for `card` entries.
    public let last4: Nullable<String>?
    /// Balance name, present for account `platform_balance` entries (null for a personal balance).
    public let title: Nullable<String>?
    /// The funding source kind: a Whop balance or a saved card.
    public let type: UpdatePreferencesResponseAdsPaymentMethodsPrimaryType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cardBrand: Nullable<String>? = nil,
        expMonth: Nullable<Int>? = nil,
        expYear: Nullable<Int>? = nil,
        iconUrl: Nullable<String>? = nil,
        id: String,
        last4: Nullable<String>? = nil,
        title: Nullable<String>? = nil,
        type: UpdatePreferencesResponseAdsPaymentMethodsPrimaryType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cardBrand = cardBrand
        self.expMonth = expMonth
        self.expYear = expYear
        self.iconUrl = iconUrl
        self.id = id
        self.last4 = last4
        self.title = title
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cardBrand = try container.decodeNullableIfPresent(String.self, forKey: .cardBrand)
        self.expMonth = try container.decodeNullableIfPresent(Int.self, forKey: .expMonth)
        self.expYear = try container.decodeNullableIfPresent(Int.self, forKey: .expYear)
        self.iconUrl = try container.decodeNullableIfPresent(String.self, forKey: .iconUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.last4 = try container.decodeNullableIfPresent(String.self, forKey: .last4)
        self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
        self.type = try container.decode(UpdatePreferencesResponseAdsPaymentMethodsPrimaryType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.cardBrand, forKey: .cardBrand)
        try container.encodeNullableIfPresent(self.expMonth, forKey: .expMonth)
        try container.encodeNullableIfPresent(self.expYear, forKey: .expYear)
        try container.encodeNullableIfPresent(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.last4, forKey: .last4)
        try container.encodeNullableIfPresent(self.title, forKey: .title)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cardBrand = "card_brand"
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case iconUrl = "icon_url"
        case id
        case last4
        case title
        case type
    }
}