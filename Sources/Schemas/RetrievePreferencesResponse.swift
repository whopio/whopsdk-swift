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
    /// The account's Triple Whale integration, which pushes Whop ad spend to Triple Whale's Data-In API so it reports as a `whop` channel. Available to any Triple Whale customer — Shopify, WooCommerce, or a custom checkout — by setting `shop_domain`. Requires the `ad_campaign:create` scope. Once connected, ad click-through URLs Whop serves carry `tw_source=whop` and `tw_adid=<ad id>` query parameters so Triple Whale's pixel attributes conversions back to the originating ad — no destination URL changes are needed.
    public let adsTripleWhaleIntegration: RetrievePreferencesResponseAdsTripleWhaleIntegration
    /// Whether Whop emails members when their membership is canceled or terminated. `true` by default. Set it to `false` to stop these emails while keeping the account's other customer emails. They also stop while the account's `send_customer_emails` is `false`.
    public let cancellationEmails: Bool
    /// Whether incoming funds are automatically moved to the account's cards balance. `false` when the account has no cards balance.
    public let cardsAutoTopUp: Bool
    /// Whether Whop Card notifications reach this account's team. `true` by default, including when the account has no cards balance. Set it to `false` to stop every card email and push notification for the account — application status, verification and action-required alerts, card-ready alerts, declines, large charges, and cashback summaries. Cardholder onboarding invitations still send, because they carry the only link an invited cardholder can onboard with. Requesting a card is rejected while notifications are off, since the request reaches nobody. Cards on personal accounts are unaffected.
    public let cardsNotifications: Bool
    /// Whether this account covers its subaccounts' negative balances. When a subaccount's balance drops below zero (from refunds, disputes, or fees), this account's available balance in the same currency pays it back, up to what is available. Refunds on its subaccounts may also take them negative by up to this account's available balance. `null` when the account has no subaccounts.
    public let coversSubaccountNegativeBalances: Nullable<Bool>
    /// The saved customer tracking settings for the hosted tracking page and Element, with defaults applied. `null` until set; tracking is off unless `enabled` is `true`.
    public let customerTracking: Nullable<CustomerTrackingPreferences>
    /// Whether Whop assembles and files the evidence response when this account's payments are disputed. Off by default; enabling it also opts the account into the success fee charged only on disputes it wins.
    public let disputeFighterEnabled: Bool
    /// Whether Economic Intelligence is on for the account. It turns off automatically at `economic_intelligence_ends_at`.
    public let economicIntelligence: Bool
    /// Whether Economic Intelligence renews itself every period, with no end date. Turn it on by setting this to `true`, or by passing the `3_days` offer's key as `economic_intelligence_duration_key`. Set it to `false` to stop renewing: Economic Intelligence stays on until the end of the current period, shown in `economic_intelligence_ends_at`, and the fee is charged until then. Set it back to `true` before then to keep renewing.
    public let economicIntelligenceAutoRenew: Bool
    /// When Economic Intelligence turns off, as an ISO 8601 timestamp: the end of the current period once auto-renew is turned off. `null` when Economic Intelligence is off or renews automatically.
    public let economicIntelligenceEndsAt: Nullable<String>
    /// Percentage of payment volume charged while Economic Intelligence is on, such as `3` for 3%. `null` when Economic Intelligence is off.
    public let economicIntelligenceFeePercentage: Nullable<Double>
    /// When auto-renew first renews, as an ISO 8601 timestamp: one period after it was turned on. `null` when auto-renew is off.
    public let economicIntelligenceFirstRenewalAt: Nullable<String>
    /// What the account can choose now to turn on Economic Intelligence. Auto-renew is the only plan: one offer, with its fee and the length of each period, while auto-renew is off, and empty while Economic Intelligence renews automatically.
    public let economicIntelligenceOffers: [RetrievePreferencesResponseEconomicIntelligenceOffersItem]
    /// The account's last Economic Intelligence period, once it has ended. `null` while Economic Intelligence is on, or when it has never been on.
    public let economicIntelligencePreviousPeriod: Nullable<RetrievePreferencesResponseEconomicIntelligencePreviousPeriod>
    /// Whether Whop emails members when a renewal payment fails or needs them to verify it. `true` by default. Set it to `false` to stop these emails while keeping the account's other customer emails. Subscriptions billed by invoice still get the invoice and its past-due reminders, since that is how the member pays. These emails also stop while the account's `send_customer_emails` is `false`.
    public let failedPaymentEmails: Bool
    /// The account's own cancel reasons, in the order members see them when they cancel. Each is filed under a standard category, saved as the membership's `cancel_option`, so reports keep grouping cancellations. Empty when the account uses Whop's default reasons.
    public let feedbackOptions: [RetrievePreferencesResponseFeedbackOptionsItem]
    /// Lowercase ISO currency code every new sale settles into, regardless of the plan's currency or what the buyer paid in. Sales converted this way carry an additional 0.5% FX fee. `null` when the account settles each sale in its plan's currency.
    public let preferredSettlementCurrency: Nullable<RetrievePreferencesResponsePreferredSettlementCurrency>
    /// When `preferred_settlement_currency` may next be changed or turned off, as an ISO 8601 timestamp. It can change at most once a day. `null` when it may change now.
    public let preferredSettlementCurrencyChangeableAt: Nullable<String>
    /// Whether Whop emails members the day before their membership renews or their free trial converts. `true` by default. Set it to `false` to stop that reminder. Members still get the reminders card networks require. They go out 7 days before a trial over 7 days converts, and 30 days before a 6-month or longer plan renews. All stop while `send_customer_emails` is `false`.
    public let renewalReminderEmails: Bool
    /// Whether Whop emails customers after a purchase asking them to leave a review. `true` by default. Set it to `false` to stop these emails, including ones already scheduled. They also stop while the account's `send_customer_emails` is `false`.
    public let reviewRequestEmails: Bool
    /// Whether Whop emails and notifies the teams of this account's subaccounts. `true` by default. Set it to `false` to stop Whop's emails, push, and in-app notifications to them. These include payout, verification, dispute, and card alerts about their accounts. `null` when the account has no subaccounts.
    public let subaccountNotifications: Nullable<Bool>
    /// Whether this account's subaccounts are view-only for their own team members. When `true`, a subaccount's team can still see everything their role allows but every change is refused with a view-only error. `false` by default. `null` when the account has no subaccounts.
    public let subaccountTeamViewOnly: Nullable<Bool>
    /// What happens to a subscription once every retry of a renewal payment has failed. `cancel` (the default) cancels it. `none` leaves it past due and keeps billing it each period; access follows the account's past-due access setting.
    public let subscriptionFailureBehavior: RetrievePreferencesResponseSubscriptionFailureBehavior
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adsAgreement: RetrievePreferencesResponseAdsAgreement,
        adsPaymentMethods: Nullable<RetrievePreferencesResponseAdsPaymentMethods>,
        adsReportingCurrency: String,
        adsSchedulingTimezone: String,
        adsTripleWhaleIntegration: RetrievePreferencesResponseAdsTripleWhaleIntegration,
        cancellationEmails: Bool,
        cardsAutoTopUp: Bool,
        cardsNotifications: Bool,
        coversSubaccountNegativeBalances: Nullable<Bool>,
        customerTracking: Nullable<CustomerTrackingPreferences>,
        disputeFighterEnabled: Bool,
        economicIntelligence: Bool,
        economicIntelligenceAutoRenew: Bool,
        economicIntelligenceEndsAt: Nullable<String>,
        economicIntelligenceFeePercentage: Nullable<Double>,
        economicIntelligenceFirstRenewalAt: Nullable<String>,
        economicIntelligenceOffers: [RetrievePreferencesResponseEconomicIntelligenceOffersItem],
        economicIntelligencePreviousPeriod: Nullable<RetrievePreferencesResponseEconomicIntelligencePreviousPeriod>,
        failedPaymentEmails: Bool,
        feedbackOptions: [RetrievePreferencesResponseFeedbackOptionsItem],
        preferredSettlementCurrency: Nullable<RetrievePreferencesResponsePreferredSettlementCurrency>,
        preferredSettlementCurrencyChangeableAt: Nullable<String>,
        renewalReminderEmails: Bool,
        reviewRequestEmails: Bool,
        subaccountNotifications: Nullable<Bool>,
        subaccountTeamViewOnly: Nullable<Bool>,
        subscriptionFailureBehavior: RetrievePreferencesResponseSubscriptionFailureBehavior,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adsAgreement = adsAgreement
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
        self.economicIntelligence = economicIntelligence
        self.economicIntelligenceAutoRenew = economicIntelligenceAutoRenew
        self.economicIntelligenceEndsAt = economicIntelligenceEndsAt
        self.economicIntelligenceFeePercentage = economicIntelligenceFeePercentage
        self.economicIntelligenceFirstRenewalAt = economicIntelligenceFirstRenewalAt
        self.economicIntelligenceOffers = economicIntelligenceOffers
        self.economicIntelligencePreviousPeriod = economicIntelligencePreviousPeriod
        self.failedPaymentEmails = failedPaymentEmails
        self.feedbackOptions = feedbackOptions
        self.preferredSettlementCurrency = preferredSettlementCurrency
        self.preferredSettlementCurrencyChangeableAt = preferredSettlementCurrencyChangeableAt
        self.renewalReminderEmails = renewalReminderEmails
        self.reviewRequestEmails = reviewRequestEmails
        self.subaccountNotifications = subaccountNotifications
        self.subaccountTeamViewOnly = subaccountTeamViewOnly
        self.subscriptionFailureBehavior = subscriptionFailureBehavior
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adsAgreement = try container.decode(RetrievePreferencesResponseAdsAgreement.self, forKey: .adsAgreement)
        self.adsPaymentMethods = try container.decode(Nullable<RetrievePreferencesResponseAdsPaymentMethods>.self, forKey: .adsPaymentMethods)
        self.adsReportingCurrency = try container.decode(String.self, forKey: .adsReportingCurrency)
        self.adsSchedulingTimezone = try container.decode(String.self, forKey: .adsSchedulingTimezone)
        self.adsTripleWhaleIntegration = try container.decode(RetrievePreferencesResponseAdsTripleWhaleIntegration.self, forKey: .adsTripleWhaleIntegration)
        self.cancellationEmails = try container.decode(Bool.self, forKey: .cancellationEmails)
        self.cardsAutoTopUp = try container.decode(Bool.self, forKey: .cardsAutoTopUp)
        self.cardsNotifications = try container.decode(Bool.self, forKey: .cardsNotifications)
        self.coversSubaccountNegativeBalances = try container.decode(Nullable<Bool>.self, forKey: .coversSubaccountNegativeBalances)
        self.customerTracking = try container.decode(Nullable<CustomerTrackingPreferences>.self, forKey: .customerTracking)
        self.disputeFighterEnabled = try container.decode(Bool.self, forKey: .disputeFighterEnabled)
        self.economicIntelligence = try container.decode(Bool.self, forKey: .economicIntelligence)
        self.economicIntelligenceAutoRenew = try container.decode(Bool.self, forKey: .economicIntelligenceAutoRenew)
        self.economicIntelligenceEndsAt = try container.decode(Nullable<String>.self, forKey: .economicIntelligenceEndsAt)
        self.economicIntelligenceFeePercentage = try container.decode(Nullable<Double>.self, forKey: .economicIntelligenceFeePercentage)
        self.economicIntelligenceFirstRenewalAt = try container.decode(Nullable<String>.self, forKey: .economicIntelligenceFirstRenewalAt)
        self.economicIntelligenceOffers = try container.decode([RetrievePreferencesResponseEconomicIntelligenceOffersItem].self, forKey: .economicIntelligenceOffers)
        self.economicIntelligencePreviousPeriod = try container.decode(Nullable<RetrievePreferencesResponseEconomicIntelligencePreviousPeriod>.self, forKey: .economicIntelligencePreviousPeriod)
        self.failedPaymentEmails = try container.decode(Bool.self, forKey: .failedPaymentEmails)
        self.feedbackOptions = try container.decode([RetrievePreferencesResponseFeedbackOptionsItem].self, forKey: .feedbackOptions)
        self.preferredSettlementCurrency = try container.decode(Nullable<RetrievePreferencesResponsePreferredSettlementCurrency>.self, forKey: .preferredSettlementCurrency)
        self.preferredSettlementCurrencyChangeableAt = try container.decode(Nullable<String>.self, forKey: .preferredSettlementCurrencyChangeableAt)
        self.renewalReminderEmails = try container.decode(Bool.self, forKey: .renewalReminderEmails)
        self.reviewRequestEmails = try container.decode(Bool.self, forKey: .reviewRequestEmails)
        self.subaccountNotifications = try container.decode(Nullable<Bool>.self, forKey: .subaccountNotifications)
        self.subaccountTeamViewOnly = try container.decode(Nullable<Bool>.self, forKey: .subaccountTeamViewOnly)
        self.subscriptionFailureBehavior = try container.decode(RetrievePreferencesResponseSubscriptionFailureBehavior.self, forKey: .subscriptionFailureBehavior)
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
        try container.encode(self.cancellationEmails, forKey: .cancellationEmails)
        try container.encode(self.cardsAutoTopUp, forKey: .cardsAutoTopUp)
        try container.encode(self.cardsNotifications, forKey: .cardsNotifications)
        try container.encode(self.coversSubaccountNegativeBalances, forKey: .coversSubaccountNegativeBalances)
        try container.encode(self.customerTracking, forKey: .customerTracking)
        try container.encode(self.disputeFighterEnabled, forKey: .disputeFighterEnabled)
        try container.encode(self.economicIntelligence, forKey: .economicIntelligence)
        try container.encode(self.economicIntelligenceAutoRenew, forKey: .economicIntelligenceAutoRenew)
        try container.encode(self.economicIntelligenceEndsAt, forKey: .economicIntelligenceEndsAt)
        try container.encode(self.economicIntelligenceFeePercentage, forKey: .economicIntelligenceFeePercentage)
        try container.encode(self.economicIntelligenceFirstRenewalAt, forKey: .economicIntelligenceFirstRenewalAt)
        try container.encode(self.economicIntelligenceOffers, forKey: .economicIntelligenceOffers)
        try container.encode(self.economicIntelligencePreviousPeriod, forKey: .economicIntelligencePreviousPeriod)
        try container.encode(self.failedPaymentEmails, forKey: .failedPaymentEmails)
        try container.encode(self.feedbackOptions, forKey: .feedbackOptions)
        try container.encode(self.preferredSettlementCurrency, forKey: .preferredSettlementCurrency)
        try container.encode(self.preferredSettlementCurrencyChangeableAt, forKey: .preferredSettlementCurrencyChangeableAt)
        try container.encode(self.renewalReminderEmails, forKey: .renewalReminderEmails)
        try container.encode(self.reviewRequestEmails, forKey: .reviewRequestEmails)
        try container.encode(self.subaccountNotifications, forKey: .subaccountNotifications)
        try container.encode(self.subaccountTeamViewOnly, forKey: .subaccountTeamViewOnly)
        try container.encode(self.subscriptionFailureBehavior, forKey: .subscriptionFailureBehavior)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adsAgreement = "ads_agreement"
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
        case economicIntelligence = "economic_intelligence"
        case economicIntelligenceAutoRenew = "economic_intelligence_auto_renew"
        case economicIntelligenceEndsAt = "economic_intelligence_ends_at"
        case economicIntelligenceFeePercentage = "economic_intelligence_fee_percentage"
        case economicIntelligenceFirstRenewalAt = "economic_intelligence_first_renewal_at"
        case economicIntelligenceOffers = "economic_intelligence_offers"
        case economicIntelligencePreviousPeriod = "economic_intelligence_previous_period"
        case failedPaymentEmails = "failed_payment_emails"
        case feedbackOptions = "feedback_options"
        case preferredSettlementCurrency = "preferred_settlement_currency"
        case preferredSettlementCurrencyChangeableAt = "preferred_settlement_currency_changeable_at"
        case renewalReminderEmails = "renewal_reminder_emails"
        case reviewRequestEmails = "review_request_emails"
        case subaccountNotifications = "subaccount_notifications"
        case subaccountTeamViewOnly = "subaccount_team_view_only"
        case subscriptionFailureBehavior = "subscription_failure_behavior"
    }
}