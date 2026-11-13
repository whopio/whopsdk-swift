import Foundation

extension Requests {
    public struct UpdatePreferencesRequest: Codable, Hashable, Sendable {
        /// How the account pays for Whop Ads spend. Requires `primary`; `backup` is optional and covers the charge when the primary fails. Requires the `ad_campaign:create` scope on your API key. Configuring a `card` requires a user token; account API keys can configure only `platform_balance` sources.
        public let adsPaymentMethods: UpdatePreferencesRequestAdsPaymentMethods?
        /// Lowercase ISO currency code, such as `usd` or `eur`, used to display ad spend and stats. Defaults to `usd`. Requires the `ad_campaign:create` scope on your API key.
        public let adsReportingCurrency: String?
        /// IANA timezone (e.g. `America/New_York`) used to interpret campaign start/end times and to bucket reports. Cannot be cleared once set — pass a new value to change it. Requires the `ad_campaign:create` scope on your API key.
        public let adsSchedulingTimezone: String?
        /// Connects or disconnects the Triple Whale integration, or changes the shop it reports to. Requires the `ad_campaign:create` scope on your API key. Connecting requires a `shop_domain` to report spend against.
        public let adsTripleWhaleIntegration: UpdatePreferencesRequestAdsTripleWhaleIntegration?
        /// Whether Whop emails members when their membership is canceled or terminated. Set it to `false` to stop these emails while keeping the account's other customer emails. Requires the `company:update` scope on your API key.
        public let cancellationEmails: Bool?
        /// Whether incoming funds are automatically moved to the account's cards balance. Requires a cards balance on the account and the `payout:account:update` scope on your API key.
        public let cardsAutoTopUp: Bool?
        /// Whether Whop Card notifications reach this account's team. Set it to `false` to stop every card email and push notification for the account — application status, verification and action-required alerts, card-ready alerts, declines, large charges, and cashback summaries. Cardholder onboarding invitations still send, because they carry the only link an invited cardholder can onboard with. Requesting a card is rejected while notifications are off, since the request reaches nobody. Cards on personal accounts are unaffected. Requires a cards balance on the account and the `payout:account:update` scope on your API key.
        public let cardsNotifications: Bool?
        /// Whether this account covers its subaccounts' negative balances. When a subaccount's balance drops below zero (from refunds, disputes, or fees), this account's available balance in the same currency pays it back, up to what is available. Only accounts with subaccounts can set it. Requires the `payout:account:update` scope on your API key.
        public let coversSubaccountNegativeBalances: Bool?
        /// Customer tracking settings for the hosted tracking page and Element, replaced as a whole: fields left out are reset to their defaults. Pass null to clear them, which turns tracking off. Requires the `company:manage_checkout` scope on your API key.
        public let customerTracking: Nullable<UpdatePreferencesRequestCustomerTracking>?
        /// Whether Whop assembles and files the evidence response when this account's payments are disputed. Off by default; enabling it also opts the account into the success fee charged only on disputes it wins. Requires the `payment:dispute` scope on your API key.
        public let disputeFighterEnabled: Bool?
        /// `false` stops renewing: Economic Intelligence stays on until the end of the current period, and the fee is charged until then. `true` keeps it renewing again before then, or turns it on like the `3_days` offer. Can't be combined with `economic_intelligence_duration_key`. Requires the `company:update` scope on your API key.
        public let economicIntelligenceAutoRenew: Bool?
        /// Turns on Economic Intelligence with the offer that has this `key` in `economic_intelligence_offers`, at that offer's fee. Only `3_days`, the auto-renew offer, is accepted. Any other key is rejected. Returns `403` for an account Economic Intelligence is not offered to. Requires the `company:update` scope on your API key.
        public let economicIntelligenceDurationKey: UpdatePreferencesRequestEconomicIntelligenceDurationKey?
        /// Whether Whop emails members when a renewal payment fails or needs them to verify it. Set it to `false` to stop these emails while keeping the account's other customer emails. Subscriptions billed by invoice still get their invoice emails. Requires the `company:update` scope on your API key.
        public let failedPaymentEmails: Bool?
        /// Replaces the account's own cancel reasons, shown to members in this order when they cancel. Pass an option's `id` to keep it, for example when renaming it; options without an `id` are added, and options left out are removed. Pass an empty array to go back to Whop's default reasons. Members who already picked an option keep the label they saw. Requires the `company:manage_checkout` scope on your API key.
        public let feedbackOptions: [UpdatePreferencesRequestFeedbackOptionsItem]?
        /// Settle every new sale into this currency, regardless of the plan's currency or what the buyer paid in; sales converted this way carry an additional 0.5% FX fee. Pass `null` to go back to settling each sale in its plan's currency. Changing it never converts money already in your balances, and it can change at most once a day (see `preferred_settlement_currency_changeable_at`). Requires the `payout:account:update` scope on your API key.
        public let preferredSettlementCurrency: Nullable<UpdatePreferencesRequestPreferredSettlementCurrency>?
        /// Whether Whop emails members the day before their membership renews or their free trial converts. Set it to `false` to stop that reminder. Members still get the reminders card networks require. Requires the `company:update` scope on your API key.
        public let renewalReminderEmails: Bool?
        /// Whether Whop emails customers after a purchase asking them to leave a review. Set it to `false` to stop these emails, including ones already scheduled. Requires the `company:update` scope on your API key.
        public let reviewRequestEmails: Bool?
        /// Whether Whop emails and notifies the teams of this account's subaccounts. Set it to `false` to stop Whop's emails, push, and in-app notifications to them. These include payout, verification, dispute, and card alerts about their accounts. Only accounts with subaccounts can set it. Requires the `company:update` scope on your API key.
        public let subaccountNotifications: Bool?
        /// Whether this account's subaccounts are view-only for their own team members. Set it to `true` to refuse every change a subaccount's team tries to make while still letting them see what their role allows. Only accounts with subaccounts can set it. Requires the `company:update` scope on your API key.
        public let subaccountTeamViewOnly: Bool?
        /// What happens to a subscription once every retry of a renewal payment has failed. `cancel` (the default) cancels it. `none` leaves it past due and keeps billing it each period; access follows the account's past-due access setting. Requires company:manage_checkout permission.
        public let subscriptionFailureBehavior: UpdatePreferencesRequestSubscriptionFailureBehavior?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adsPaymentMethods: UpdatePreferencesRequestAdsPaymentMethods? = nil,
            adsReportingCurrency: String? = nil,
            adsSchedulingTimezone: String? = nil,
            adsTripleWhaleIntegration: UpdatePreferencesRequestAdsTripleWhaleIntegration? = nil,
            cancellationEmails: Bool? = nil,
            cardsAutoTopUp: Bool? = nil,
            cardsNotifications: Bool? = nil,
            coversSubaccountNegativeBalances: Bool? = nil,
            customerTracking: Nullable<UpdatePreferencesRequestCustomerTracking>? = nil,
            disputeFighterEnabled: Bool? = nil,
            economicIntelligenceAutoRenew: Bool? = nil,
            economicIntelligenceDurationKey: UpdatePreferencesRequestEconomicIntelligenceDurationKey? = nil,
            failedPaymentEmails: Bool? = nil,
            feedbackOptions: [UpdatePreferencesRequestFeedbackOptionsItem]? = nil,
            preferredSettlementCurrency: Nullable<UpdatePreferencesRequestPreferredSettlementCurrency>? = nil,
            renewalReminderEmails: Bool? = nil,
            reviewRequestEmails: Bool? = nil,
            subaccountNotifications: Bool? = nil,
            subaccountTeamViewOnly: Bool? = nil,
            subscriptionFailureBehavior: UpdatePreferencesRequestSubscriptionFailureBehavior? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.adsPaymentMethods = adsPaymentMethods
            self.adsReportingCurrency = adsReportingCurrency
            self.adsSchedulingTimezone = adsSchedulingTimezone
            self.adsTripleWhaleIntegration = adsTripleWhaleIntegration
            self.cancellationEmails = cancellationEmails
            self.cardsAutoTopUp = cardsAutoTopUp
            self.cardsNotifications = cardsNotifications
            self.coversSubaccountNegativeBalances = coversSubaccountNegativeBalances
            self.customerTracking = customerTracking
            self.disputeFighterEnabled = disputeFighterEnabled
            self.economicIntelligenceAutoRenew = economicIntelligenceAutoRenew
            self.economicIntelligenceDurationKey = economicIntelligenceDurationKey
            self.failedPaymentEmails = failedPaymentEmails
            self.feedbackOptions = feedbackOptions
            self.preferredSettlementCurrency = preferredSettlementCurrency
            self.renewalReminderEmails = renewalReminderEmails
            self.reviewRequestEmails = reviewRequestEmails
            self.subaccountNotifications = subaccountNotifications
            self.subaccountTeamViewOnly = subaccountTeamViewOnly
            self.subscriptionFailureBehavior = subscriptionFailureBehavior
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.adsPaymentMethods = try container.decodeIfPresent(UpdatePreferencesRequestAdsPaymentMethods.self, forKey: .adsPaymentMethods)
            self.adsReportingCurrency = try container.decodeIfPresent(String.self, forKey: .adsReportingCurrency)
            self.adsSchedulingTimezone = try container.decodeIfPresent(String.self, forKey: .adsSchedulingTimezone)
            self.adsTripleWhaleIntegration = try container.decodeIfPresent(UpdatePreferencesRequestAdsTripleWhaleIntegration.self, forKey: .adsTripleWhaleIntegration)
            self.cancellationEmails = try container.decodeIfPresent(Bool.self, forKey: .cancellationEmails)
            self.cardsAutoTopUp = try container.decodeIfPresent(Bool.self, forKey: .cardsAutoTopUp)
            self.cardsNotifications = try container.decodeIfPresent(Bool.self, forKey: .cardsNotifications)
            self.coversSubaccountNegativeBalances = try container.decodeIfPresent(Bool.self, forKey: .coversSubaccountNegativeBalances)
            self.customerTracking = try container.decodeNullableIfPresent(UpdatePreferencesRequestCustomerTracking.self, forKey: .customerTracking)
            self.disputeFighterEnabled = try container.decodeIfPresent(Bool.self, forKey: .disputeFighterEnabled)
            self.economicIntelligenceAutoRenew = try container.decodeIfPresent(Bool.self, forKey: .economicIntelligenceAutoRenew)
            self.economicIntelligenceDurationKey = try container.decodeIfPresent(UpdatePreferencesRequestEconomicIntelligenceDurationKey.self, forKey: .economicIntelligenceDurationKey)
            self.failedPaymentEmails = try container.decodeIfPresent(Bool.self, forKey: .failedPaymentEmails)
            self.feedbackOptions = try container.decodeIfPresent([UpdatePreferencesRequestFeedbackOptionsItem].self, forKey: .feedbackOptions)
            self.preferredSettlementCurrency = try container.decodeNullableIfPresent(UpdatePreferencesRequestPreferredSettlementCurrency.self, forKey: .preferredSettlementCurrency)
            self.renewalReminderEmails = try container.decodeIfPresent(Bool.self, forKey: .renewalReminderEmails)
            self.reviewRequestEmails = try container.decodeIfPresent(Bool.self, forKey: .reviewRequestEmails)
            self.subaccountNotifications = try container.decodeIfPresent(Bool.self, forKey: .subaccountNotifications)
            self.subaccountTeamViewOnly = try container.decodeIfPresent(Bool.self, forKey: .subaccountTeamViewOnly)
            self.subscriptionFailureBehavior = try container.decodeIfPresent(UpdatePreferencesRequestSubscriptionFailureBehavior.self, forKey: .subscriptionFailureBehavior)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.adsPaymentMethods, forKey: .adsPaymentMethods)
            try container.encodeIfPresent(self.adsReportingCurrency, forKey: .adsReportingCurrency)
            try container.encodeIfPresent(self.adsSchedulingTimezone, forKey: .adsSchedulingTimezone)
            try container.encodeIfPresent(self.adsTripleWhaleIntegration, forKey: .adsTripleWhaleIntegration)
            try container.encodeIfPresent(self.cancellationEmails, forKey: .cancellationEmails)
            try container.encodeIfPresent(self.cardsAutoTopUp, forKey: .cardsAutoTopUp)
            try container.encodeIfPresent(self.cardsNotifications, forKey: .cardsNotifications)
            try container.encodeIfPresent(self.coversSubaccountNegativeBalances, forKey: .coversSubaccountNegativeBalances)
            try container.encodeNullableIfPresent(self.customerTracking, forKey: .customerTracking)
            try container.encodeIfPresent(self.disputeFighterEnabled, forKey: .disputeFighterEnabled)
            try container.encodeIfPresent(self.economicIntelligenceAutoRenew, forKey: .economicIntelligenceAutoRenew)
            try container.encodeIfPresent(self.economicIntelligenceDurationKey, forKey: .economicIntelligenceDurationKey)
            try container.encodeIfPresent(self.failedPaymentEmails, forKey: .failedPaymentEmails)
            try container.encodeIfPresent(self.feedbackOptions, forKey: .feedbackOptions)
            try container.encodeNullableIfPresent(self.preferredSettlementCurrency, forKey: .preferredSettlementCurrency)
            try container.encodeIfPresent(self.renewalReminderEmails, forKey: .renewalReminderEmails)
            try container.encodeIfPresent(self.reviewRequestEmails, forKey: .reviewRequestEmails)
            try container.encodeIfPresent(self.subaccountNotifications, forKey: .subaccountNotifications)
            try container.encodeIfPresent(self.subaccountTeamViewOnly, forKey: .subaccountTeamViewOnly)
            try container.encodeIfPresent(self.subscriptionFailureBehavior, forKey: .subscriptionFailureBehavior)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case adsPaymentMethods = "ads_payment_methods"
            case adsReportingCurrency = "ads_reporting_currency"
            case adsSchedulingTimezone = "ads_scheduling_timezone"
            case adsTripleWhaleIntegration = "ads_triple_whale_integration"
            case cancellationEmails = "cancellation_emails"
            case cardsAutoTopUp = "cards_auto_top_up"
            case cardsNotifications = "cards_notifications"
            case coversSubaccountNegativeBalances = "covers_subaccount_negative_balances"
            case customerTracking = "customer_tracking"
            case disputeFighterEnabled = "dispute_fighter_enabled"
            case economicIntelligenceAutoRenew = "economic_intelligence_auto_renew"
            case economicIntelligenceDurationKey = "economic_intelligence_duration_key"
            case failedPaymentEmails = "failed_payment_emails"
            case feedbackOptions = "feedback_options"
            case preferredSettlementCurrency = "preferred_settlement_currency"
            case renewalReminderEmails = "renewal_reminder_emails"
            case reviewRequestEmails = "review_request_emails"
            case subaccountNotifications = "subaccount_notifications"
            case subaccountTeamViewOnly = "subaccount_team_view_only"
            case subscriptionFailureBehavior = "subscription_failure_behavior"
        }
    }
}