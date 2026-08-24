import Foundation

extension Requests {
    public struct UpdatePreferencesRequest: Codable, Hashable, Sendable {
        /// How the account pays for Whop Ads spend. `primary` is charged first; `backup` covers the charge when the primary fails.
        public let adsPaymentMethods: UpdatePreferencesRequestAdsPaymentMethods?
        /// Lowercase ISO currency code, such as `usd` or `eur`, used to display ad spend and stats. Defaults to `usd`.
        public let adsReportingCurrency: String?
        /// IANA timezone (e.g. `America/New_York`) used to interpret campaign start/end times and to bucket reports. Cannot be cleared once set — pass a new value to change it.
        public let adsSchedulingTimezone: String?
        /// Connects or disconnects the Triple Whale integration. Requires a connected Shopify store, since Triple Whale keys spend records by Shopify shop.
        public let adsTripleWhaleIntegration: UpdatePreferencesRequestAdsTripleWhaleIntegration?
        /// Whether incoming funds are automatically moved to the account's cards balance. Requires a cards balance on the account.
        public let cardsAutoTopUp: Bool?
        /// Whether Whop assembles and files the evidence response when this account's payments are disputed. Off by default; enabling it also opts the account into the success fee charged only on disputes it wins.
        public let disputeFighterEnabled: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adsPaymentMethods: UpdatePreferencesRequestAdsPaymentMethods? = nil,
            adsReportingCurrency: String? = nil,
            adsSchedulingTimezone: String? = nil,
            adsTripleWhaleIntegration: UpdatePreferencesRequestAdsTripleWhaleIntegration? = nil,
            cardsAutoTopUp: Bool? = nil,
            disputeFighterEnabled: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
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
            self.adsPaymentMethods = try container.decodeIfPresent(UpdatePreferencesRequestAdsPaymentMethods.self, forKey: .adsPaymentMethods)
            self.adsReportingCurrency = try container.decodeIfPresent(String.self, forKey: .adsReportingCurrency)
            self.adsSchedulingTimezone = try container.decodeIfPresent(String.self, forKey: .adsSchedulingTimezone)
            self.adsTripleWhaleIntegration = try container.decodeIfPresent(UpdatePreferencesRequestAdsTripleWhaleIntegration.self, forKey: .adsTripleWhaleIntegration)
            self.cardsAutoTopUp = try container.decodeIfPresent(Bool.self, forKey: .cardsAutoTopUp)
            self.disputeFighterEnabled = try container.decodeIfPresent(Bool.self, forKey: .disputeFighterEnabled)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.adsPaymentMethods, forKey: .adsPaymentMethods)
            try container.encodeIfPresent(self.adsReportingCurrency, forKey: .adsReportingCurrency)
            try container.encodeIfPresent(self.adsSchedulingTimezone, forKey: .adsSchedulingTimezone)
            try container.encodeIfPresent(self.adsTripleWhaleIntegration, forKey: .adsTripleWhaleIntegration)
            try container.encodeIfPresent(self.cardsAutoTopUp, forKey: .cardsAutoTopUp)
            try container.encodeIfPresent(self.disputeFighterEnabled, forKey: .disputeFighterEnabled)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case adsPaymentMethods = "ads_payment_methods"
            case adsReportingCurrency = "ads_reporting_currency"
            case adsSchedulingTimezone = "ads_scheduling_timezone"
            case adsTripleWhaleIntegration = "ads_triple_whale_integration"
            case cardsAutoTopUp = "cards_auto_top_up"
            case disputeFighterEnabled = "dispute_fighter_enabled"
        }
    }
}