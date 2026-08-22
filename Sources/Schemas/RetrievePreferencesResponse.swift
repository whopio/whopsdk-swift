import Foundation

public struct RetrievePreferencesResponse: Codable, Hashable, Sendable {
    /// The account's Whop Ads services and payment authorization agreement. While `pending_signature`, campaign launch is blocked; sign by answering `requested_information` via `PATCH /verifications/{id}`.
    public let adsAgreement: RetrievePreferencesResponseAdsAgreement
    /// How the account pays for Whop Ads spend. `primary` is charged first; `backup` covers the charge when the primary fails. `null` until ads billing has been configured.
    public let adsPaymentMethods: Nullable<RetrievePreferencesResponseAdsPaymentMethods>
    /// Lowercase ISO currency code, such as `usd` or `eur`, used to display ad spend and stats. Defaults to `usd`.
    public let adsReportingCurrency: String
    /// IANA timezone (e.g. `America/New_York`) used to interpret campaign start/end times and to bucket reports. Defaults to `America/New_York` until explicitly overridden.
    public let adsSchedulingTimezone: String
    /// The account's Triple Whale integration, which pushes Whop ad spend to Triple Whale's Data-In API so it reports as a `whop` channel.
    public let adsTripleWhaleIntegration: RetrievePreferencesResponseAdsTripleWhaleIntegration
    /// Whether incoming funds are automatically moved to the account's cards balance. `false` when the account has no cards balance.
    public let cardsAutoTopUp: Bool
    /// Whether Whop assembles and files the evidence response when this account's payments are disputed. Off by default; enabling it also opts the account into the success fee charged only on disputes it wins.
    public let disputeFighterEnabled: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adsAgreement: RetrievePreferencesResponseAdsAgreement,
        adsPaymentMethods: Nullable<RetrievePreferencesResponseAdsPaymentMethods>,
        adsReportingCurrency: String,
        adsSchedulingTimezone: String,
        adsTripleWhaleIntegration: RetrievePreferencesResponseAdsTripleWhaleIntegration,
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
        self.adsAgreement = try container.decode(RetrievePreferencesResponseAdsAgreement.self, forKey: .adsAgreement)
        self.adsPaymentMethods = try container.decode(Nullable<RetrievePreferencesResponseAdsPaymentMethods>.self, forKey: .adsPaymentMethods)
        self.adsReportingCurrency = try container.decode(String.self, forKey: .adsReportingCurrency)
        self.adsSchedulingTimezone = try container.decode(String.self, forKey: .adsSchedulingTimezone)
        self.adsTripleWhaleIntegration = try container.decode(RetrievePreferencesResponseAdsTripleWhaleIntegration.self, forKey: .adsTripleWhaleIntegration)
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