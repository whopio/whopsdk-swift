import Foundation

public struct AccountPreferences: Codable, Hashable, Sendable {
    /// The account's Whop Ads services and payment authorization agreement. `status` is `not_required`, `pending_signature` (a signature has been requested and campaign launch is blocked until it is provided), or `signed`. While pending, read the fields to answer from `GET /verifications/{id}` and sign by submitting them via `PATCH /verifications/{id}`.
    public let adsAgreement: [String: JSONValue]
    /// How the account pays for Whop Ads spend. `primary` is charged first; `backup` covers the charge when it fails. Each entry has a `type` of `platform_balance` (id `ldgr_`) or `card` (id `payt_`), plus display fields so the configured source renders even for a viewer who doesn't own it. `backup` is `null` when only one method is configured. `null` until ads billing has been configured.
    public let adsPaymentMethods: Nullable<[String: JSONValue]>
    /// Lowercase ISO currency code, such as `usd` or `eur`, used to display ad spend and stats. Defaults to `usd`.
    public let adsReportingCurrency: String
    /// IANA timezone (e.g. `America/New_York`) used to interpret campaign start/end times and to bucket reports. Defaults to `America/New_York` until explicitly overridden.
    public let adsSchedulingTimezone: String
    /// The account's Triple Whale integration, which pushes Whop ad spend to Triple Whale's Data-In API so it reports as a `whop` channel. `status` is `connected`, `not_connected`, or `requires_shopify_store` (Triple Whale keys records by Shopify shop, so spend only flows while a store is connected). `masked_api_key` shows the leading characters of the stored key; the full key is never returned. `shop_domain` is the Shopify store spend is reported for.
    public let adsTripleWhaleIntegration: [String: JSONValue]
    /// Whether incoming funds are automatically moved to the account's cards balance. `false` when the account has no cards balance.
    public let cardsAutoTopUp: Bool
    /// Whether Whop assembles and files the evidence response when this account's payments are disputed. Off by default; enabling it also opts the account into the success fee charged only on disputes it wins.
    public let disputeFighterEnabled: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adsAgreement: [String: JSONValue],
        adsPaymentMethods: Nullable<[String: JSONValue]>,
        adsReportingCurrency: String,
        adsSchedulingTimezone: String,
        adsTripleWhaleIntegration: [String: JSONValue],
        cardsAutoTopUp: Bool,
        disputeFighterEnabled: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adsAgreement = adsAgreement
        self.adsPaymentMethods = adsPaymentMethods
        self.adsReportingCurrency = adsReportingCurrency
        self.adsSchedulingTimezone = adsSchedulingTimezone
        self.adsTripleWhaleIntegration = adsTripleWhaleIntegration
        self.cardsAutoTopUp = cardsAutoTopUp
        self.disputeFighterEnabled = disputeFighterEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adsAgreement = try container.decode([String: JSONValue].self, forKey: .adsAgreement)
        self.adsPaymentMethods = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .adsPaymentMethods)
        self.adsReportingCurrency = try container.decode(String.self, forKey: .adsReportingCurrency)
        self.adsSchedulingTimezone = try container.decode(String.self, forKey: .adsSchedulingTimezone)
        self.adsTripleWhaleIntegration = try container.decode([String: JSONValue].self, forKey: .adsTripleWhaleIntegration)
        self.cardsAutoTopUp = try container.decode(Bool.self, forKey: .cardsAutoTopUp)
        self.disputeFighterEnabled = try container.decode(Bool.self, forKey: .disputeFighterEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adsAgreement, forKey: .adsAgreement)
        try container.encode(self.adsPaymentMethods, forKey: .adsPaymentMethods)
        try container.encode(self.adsReportingCurrency, forKey: .adsReportingCurrency)
        try container.encode(self.adsSchedulingTimezone, forKey: .adsSchedulingTimezone)
        try container.encode(self.adsTripleWhaleIntegration, forKey: .adsTripleWhaleIntegration)
        try container.encode(self.cardsAutoTopUp, forKey: .cardsAutoTopUp)
        try container.encode(self.disputeFighterEnabled, forKey: .disputeFighterEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adsAgreement = "ads_agreement"
        case adsPaymentMethods = "ads_payment_methods"
        case adsReportingCurrency = "ads_reporting_currency"
        case adsSchedulingTimezone = "ads_scheduling_timezone"
        case adsTripleWhaleIntegration = "ads_triple_whale_integration"
        case cardsAutoTopUp = "cards_auto_top_up"
        case disputeFighterEnabled = "dispute_fighter_enabled"
    }
}