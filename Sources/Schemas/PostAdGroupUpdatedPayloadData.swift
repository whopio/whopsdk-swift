import Foundation

public struct PostAdGroupUpdatedPayloadData: Codable, Hashable, Sendable {
    /// The ad campaign this ad group belongs to.
    public let adCampaign: AdEntityReference
    /// Saved audiences this ad group delivers to or excludes.
    public let audiences: AdGroupAudiences
    /// How delivery bids are set in the ad auction. Target-based strategies use `desired_cost_per_result`.
    public let bidType: Nullable<PostAdGroupUpdatedPayloadDataBidType>
    /// This ad group's budget in USD, which is what it is stored and billed in. `null` when the budget is set on the campaign instead.
    public let budgetAmount: Nullable<Double>
    /// The same budget stated in `budget_currency` at today's exchange rate, for display in the account's ads reporting currency. `null` when `budget_amount` is.
    public let budgetAmountLocal: Nullable<Double>
    /// The ISO 4217 code `budget_amount_local` is in: the account's `ads_reporting_currency` preference. `usd` unless the account changed it.
    public let budgetCurrency: String
    /// Whether `budget_amount` is spent per day (`daily`) or over the ad group's full run (`lifetime`). A `lifetime` ad group also needs `ends_at`, at least 24 hours after it starts.
    public let budgetType: Nullable<PostAdGroupUpdatedPayloadDataBudgetType>
    public let conversionEvent: Nullable<ConversionEvent>
    /// When the ad group was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Hours the ad group delivers in each week, keyed by day. Days it doesn't deliver are omitted. `null` when it delivers at every hour. Some platforms need a lifetime `budget_type` for a schedule, on the ad group or on its campaign when the campaign holds the budget.
    public let deliverySchedule: Nullable<AdGroupDeliverySchedule>
    /// Whether ads in this ad group are delivering right now, and if not, why. When several states apply at once, the highest-precedence one is returned.
    public let deliveryStatus: PostAdGroupUpdatedPayloadDataDeliveryStatus
    /// Age, gender, and automatic-audience targeting.
    public let demographics: AdGroupDemographics
    /// Cost per result to aim for (`average_target`) or never exceed (`maximum_target`). `null` for `minimum_cost` bidding.
    public let desiredCostPerResult: Nullable<Double>
    /// Device platforms and operating systems targeted.
    public let devices: AdGroupDevices
    /// When the ad group stops delivering, as an ISO 8601 timestamp. `null` when it runs until paused.
    public let endsAt: Nullable<String>
    /// Unique identifier for the ad group, prefixed `adgrp_`.
    public let id: String
    public let issues: [AdPlatformIssue]
    public let keywords: [AdGroupKeyword]?
    public let languages: [String]
    /// Progress toward the conversions this ad group's learning phase needs. Null unless it is learning or learning limited and valid counts are available. Reaching the threshold does not determine delivery status.
    public let learningProgress: Nullable<AdGroupLearningProgress>
    /// Locations targeted and excluded.
    public let regions: AdGroupRegions
    /// When the ad group starts delivering, as an ISO 8601 timestamp. `null` when it starts as soon as it's active.
    public let startsAt: Nullable<String>
    /// Whether the ad group is enabled. `active` and `paused` are set by you; `rejected` means it failed ad review; `duplicating` is a copy still being filled in.
    public let status: PostAdGroupUpdatedPayloadDataStatus
    /// Display name of the ad group.
    public let title: Nullable<String>
    /// When the ad group was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adCampaign: AdEntityReference,
        audiences: AdGroupAudiences,
        bidType: Nullable<PostAdGroupUpdatedPayloadDataBidType>,
        budgetAmount: Nullable<Double>,
        budgetAmountLocal: Nullable<Double>,
        budgetCurrency: String,
        budgetType: Nullable<PostAdGroupUpdatedPayloadDataBudgetType>,
        conversionEvent: Nullable<ConversionEvent>,
        createdAt: String,
        deliverySchedule: Nullable<AdGroupDeliverySchedule>,
        deliveryStatus: PostAdGroupUpdatedPayloadDataDeliveryStatus,
        demographics: AdGroupDemographics,
        desiredCostPerResult: Nullable<Double>,
        devices: AdGroupDevices,
        endsAt: Nullable<String>,
        id: String,
        issues: [AdPlatformIssue],
        keywords: [AdGroupKeyword]? = nil,
        languages: [String],
        learningProgress: Nullable<AdGroupLearningProgress>,
        regions: AdGroupRegions,
        startsAt: Nullable<String>,
        status: PostAdGroupUpdatedPayloadDataStatus,
        title: Nullable<String>,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adCampaign = adCampaign
        self.audiences = audiences
        self.bidType = bidType
        self.budgetAmount = budgetAmount
        self.budgetAmountLocal = budgetAmountLocal
        self.budgetCurrency = budgetCurrency
        self.budgetType = budgetType
        self.conversionEvent = conversionEvent
        self.createdAt = createdAt
        self.deliverySchedule = deliverySchedule
        self.deliveryStatus = deliveryStatus
        self.demographics = demographics
        self.desiredCostPerResult = desiredCostPerResult
        self.devices = devices
        self.endsAt = endsAt
        self.id = id
        self.issues = issues
        self.keywords = keywords
        self.languages = languages
        self.learningProgress = learningProgress
        self.regions = regions
        self.startsAt = startsAt
        self.status = status
        self.title = title
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adCampaign = try container.decode(AdEntityReference.self, forKey: .adCampaign)
        self.audiences = try container.decode(AdGroupAudiences.self, forKey: .audiences)
        self.bidType = try container.decode(Nullable<PostAdGroupUpdatedPayloadDataBidType>.self, forKey: .bidType)
        self.budgetAmount = try container.decode(Nullable<Double>.self, forKey: .budgetAmount)
        self.budgetAmountLocal = try container.decode(Nullable<Double>.self, forKey: .budgetAmountLocal)
        self.budgetCurrency = try container.decode(String.self, forKey: .budgetCurrency)
        self.budgetType = try container.decode(Nullable<PostAdGroupUpdatedPayloadDataBudgetType>.self, forKey: .budgetType)
        self.conversionEvent = try container.decode(Nullable<ConversionEvent>.self, forKey: .conversionEvent)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.deliverySchedule = try container.decode(Nullable<AdGroupDeliverySchedule>.self, forKey: .deliverySchedule)
        self.deliveryStatus = try container.decode(PostAdGroupUpdatedPayloadDataDeliveryStatus.self, forKey: .deliveryStatus)
        self.demographics = try container.decode(AdGroupDemographics.self, forKey: .demographics)
        self.desiredCostPerResult = try container.decode(Nullable<Double>.self, forKey: .desiredCostPerResult)
        self.devices = try container.decode(AdGroupDevices.self, forKey: .devices)
        self.endsAt = try container.decode(Nullable<String>.self, forKey: .endsAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.issues = try container.decode([AdPlatformIssue].self, forKey: .issues)
        self.keywords = try container.decodeIfPresent([AdGroupKeyword].self, forKey: .keywords)
        self.languages = try container.decode([String].self, forKey: .languages)
        self.learningProgress = try container.decode(Nullable<AdGroupLearningProgress>.self, forKey: .learningProgress)
        self.regions = try container.decode(AdGroupRegions.self, forKey: .regions)
        self.startsAt = try container.decode(Nullable<String>.self, forKey: .startsAt)
        self.status = try container.decode(PostAdGroupUpdatedPayloadDataStatus.self, forKey: .status)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adCampaign, forKey: .adCampaign)
        try container.encode(self.audiences, forKey: .audiences)
        try container.encode(self.bidType, forKey: .bidType)
        try container.encode(self.budgetAmount, forKey: .budgetAmount)
        try container.encode(self.budgetAmountLocal, forKey: .budgetAmountLocal)
        try container.encode(self.budgetCurrency, forKey: .budgetCurrency)
        try container.encode(self.budgetType, forKey: .budgetType)
        try container.encode(self.conversionEvent, forKey: .conversionEvent)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.deliverySchedule, forKey: .deliverySchedule)
        try container.encode(self.deliveryStatus, forKey: .deliveryStatus)
        try container.encode(self.demographics, forKey: .demographics)
        try container.encode(self.desiredCostPerResult, forKey: .desiredCostPerResult)
        try container.encode(self.devices, forKey: .devices)
        try container.encode(self.endsAt, forKey: .endsAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issues, forKey: .issues)
        try container.encodeIfPresent(self.keywords, forKey: .keywords)
        try container.encode(self.languages, forKey: .languages)
        try container.encode(self.learningProgress, forKey: .learningProgress)
        try container.encode(self.regions, forKey: .regions)
        try container.encode(self.startsAt, forKey: .startsAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adCampaign = "ad_campaign"
        case audiences
        case bidType = "bid_type"
        case budgetAmount = "budget_amount"
        case budgetAmountLocal = "budget_amount_local"
        case budgetCurrency = "budget_currency"
        case budgetType = "budget_type"
        case conversionEvent = "conversion_event"
        case createdAt = "created_at"
        case deliverySchedule = "delivery_schedule"
        case deliveryStatus = "delivery_status"
        case demographics
        case desiredCostPerResult = "desired_cost_per_result"
        case devices
        case endsAt = "ends_at"
        case id
        case issues
        case keywords
        case languages
        case learningProgress = "learning_progress"
        case regions
        case startsAt = "starts_at"
        case status
        case title
        case updatedAt = "updated_at"
    }
}