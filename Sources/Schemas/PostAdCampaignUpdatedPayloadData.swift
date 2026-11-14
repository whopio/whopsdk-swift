import Foundation

public struct PostAdCampaignUpdatedPayloadData: Codable, Hashable, Sendable {
    /// The business running this campaign, with the name and logo its ads show.
    public let account: Nullable<StorefrontAccount>
    /// The campaign's budget in USD, which is what it is stored and billed in. `null` when each ad group sets its own budget instead.
    public let budgetAmount: Nullable<Double>
    /// The same budget stated in `budget_currency` at today's exchange rate, for display in the account's ads reporting currency. `null` when `budget_amount` is.
    public let budgetAmountLocal: Nullable<Double>
    /// The ISO 4217 code `budget_amount_local` is in: the account's `ads_reporting_currency` preference. `usd` unless the account changed it.
    public let budgetCurrency: String
    /// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`).
    public let budgetOptimization: Nullable<PostAdCampaignUpdatedPayloadDataBudgetOptimization>
    /// Whether `budget_amount` is spent per day (`daily`) or over the campaign's full run (`lifetime`).
    public let budgetType: Nullable<PostAdCampaignUpdatedPayloadDataBudgetType>
    /// The kind of campaign, fixed at creation. `standard` runs image and video ads; `search` shows text ads on search results for the ad groups' keywords.
    public let campaignType: PostAdCampaignUpdatedPayloadDataCampaignType
    /// When the campaign was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Whether the campaign's ads are delivering right now, and if not, why. Content review is in_review; a campaign waiting to start is processing. Account billing failures set payment_failed without changing the configured status. Successful payment retry clears that block and recalculates delivery. When several states apply at once, the highest-precedence one is returned.
    public let deliveryStatus: PostAdCampaignUpdatedPayloadDataDeliveryStatus
    /// The cost per result, in USD, the advertiser wants this campaign to achieve. A target only: it is not a bid, cost cap, or bid cap, and doesn't change how the campaign's ads bid. `null` when no target is set.
    public let desiredCostPerResult: Nullable<Double>?
    /// When the campaign stops delivering, as an ISO 8601 timestamp. `null` when it runs until paused, or when its ad groups set their own schedule.
    public let endsAt: Nullable<String>
    /// Unique identifier for the ad campaign, prefixed `adcamp_`.
    public let id: String
    public let issues: [AdPlatformIssue]
    /// The goal the campaign optimizes toward. `awareness` appears only on campaigns created before it was retired; those campaigns can't launch.
    public let objective: Nullable<PostAdCampaignUpdatedPayloadDataObjective>
    public let specialAdCategories: [PostAdCampaignUpdatedPayloadDataSpecialAdCategoriesItem]
    /// When the campaign starts delivering, as an ISO 8601 timestamp. `null` when it starts as soon as it launches, or when its ad groups set their own schedule.
    public let startsAt: Nullable<String>
    /// The configured lifecycle status of the ad campaign. Billing failures preserve active or paused here and set delivery_status to payment_failed.
    public let status: PostAdCampaignUpdatedPayloadDataStatus
    /// The desired cost per result for `target_result_event`, in USD. `null` when none is set.
    public let targetCostPerResult: Nullable<Double>
    /// The event `target_cost_per_result` is priced per, such as `purchase` or `lead`. `null` when the campaign has no single goal.
    public let targetResultEvent: Nullable<String>
    /// Display name of the ad campaign.
    public let title: String
    /// When the campaign was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<StorefrontAccount>,
        budgetAmount: Nullable<Double>,
        budgetAmountLocal: Nullable<Double>,
        budgetCurrency: String,
        budgetOptimization: Nullable<PostAdCampaignUpdatedPayloadDataBudgetOptimization>,
        budgetType: Nullable<PostAdCampaignUpdatedPayloadDataBudgetType>,
        campaignType: PostAdCampaignUpdatedPayloadDataCampaignType,
        createdAt: String,
        deliveryStatus: PostAdCampaignUpdatedPayloadDataDeliveryStatus,
        desiredCostPerResult: Nullable<Double>? = nil,
        endsAt: Nullable<String>,
        id: String,
        issues: [AdPlatformIssue],
        objective: Nullable<PostAdCampaignUpdatedPayloadDataObjective>,
        specialAdCategories: [PostAdCampaignUpdatedPayloadDataSpecialAdCategoriesItem],
        startsAt: Nullable<String>,
        status: PostAdCampaignUpdatedPayloadDataStatus,
        targetCostPerResult: Nullable<Double>,
        targetResultEvent: Nullable<String>,
        title: String,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.budgetAmount = budgetAmount
        self.budgetAmountLocal = budgetAmountLocal
        self.budgetCurrency = budgetCurrency
        self.budgetOptimization = budgetOptimization
        self.budgetType = budgetType
        self.campaignType = campaignType
        self.createdAt = createdAt
        self.deliveryStatus = deliveryStatus
        self.desiredCostPerResult = desiredCostPerResult
        self.endsAt = endsAt
        self.id = id
        self.issues = issues
        self.objective = objective
        self.specialAdCategories = specialAdCategories
        self.startsAt = startsAt
        self.status = status
        self.targetCostPerResult = targetCostPerResult
        self.targetResultEvent = targetResultEvent
        self.title = title
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<StorefrontAccount>.self, forKey: .account)
        self.budgetAmount = try container.decode(Nullable<Double>.self, forKey: .budgetAmount)
        self.budgetAmountLocal = try container.decode(Nullable<Double>.self, forKey: .budgetAmountLocal)
        self.budgetCurrency = try container.decode(String.self, forKey: .budgetCurrency)
        self.budgetOptimization = try container.decode(Nullable<PostAdCampaignUpdatedPayloadDataBudgetOptimization>.self, forKey: .budgetOptimization)
        self.budgetType = try container.decode(Nullable<PostAdCampaignUpdatedPayloadDataBudgetType>.self, forKey: .budgetType)
        self.campaignType = try container.decode(PostAdCampaignUpdatedPayloadDataCampaignType.self, forKey: .campaignType)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.deliveryStatus = try container.decode(PostAdCampaignUpdatedPayloadDataDeliveryStatus.self, forKey: .deliveryStatus)
        self.desiredCostPerResult = try container.decodeNullableIfPresent(Double.self, forKey: .desiredCostPerResult)
        self.endsAt = try container.decode(Nullable<String>.self, forKey: .endsAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.issues = try container.decode([AdPlatformIssue].self, forKey: .issues)
        self.objective = try container.decode(Nullable<PostAdCampaignUpdatedPayloadDataObjective>.self, forKey: .objective)
        self.specialAdCategories = try container.decode([PostAdCampaignUpdatedPayloadDataSpecialAdCategoriesItem].self, forKey: .specialAdCategories)
        self.startsAt = try container.decode(Nullable<String>.self, forKey: .startsAt)
        self.status = try container.decode(PostAdCampaignUpdatedPayloadDataStatus.self, forKey: .status)
        self.targetCostPerResult = try container.decode(Nullable<Double>.self, forKey: .targetCostPerResult)
        self.targetResultEvent = try container.decode(Nullable<String>.self, forKey: .targetResultEvent)
        self.title = try container.decode(String.self, forKey: .title)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.budgetAmount, forKey: .budgetAmount)
        try container.encode(self.budgetAmountLocal, forKey: .budgetAmountLocal)
        try container.encode(self.budgetCurrency, forKey: .budgetCurrency)
        try container.encode(self.budgetOptimization, forKey: .budgetOptimization)
        try container.encode(self.budgetType, forKey: .budgetType)
        try container.encode(self.campaignType, forKey: .campaignType)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.deliveryStatus, forKey: .deliveryStatus)
        try container.encodeNullableIfPresent(self.desiredCostPerResult, forKey: .desiredCostPerResult)
        try container.encode(self.endsAt, forKey: .endsAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issues, forKey: .issues)
        try container.encode(self.objective, forKey: .objective)
        try container.encode(self.specialAdCategories, forKey: .specialAdCategories)
        try container.encode(self.startsAt, forKey: .startsAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.targetCostPerResult, forKey: .targetCostPerResult)
        try container.encode(self.targetResultEvent, forKey: .targetResultEvent)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case budgetAmount = "budget_amount"
        case budgetAmountLocal = "budget_amount_local"
        case budgetCurrency = "budget_currency"
        case budgetOptimization = "budget_optimization"
        case budgetType = "budget_type"
        case campaignType = "campaign_type"
        case createdAt = "created_at"
        case deliveryStatus = "delivery_status"
        case desiredCostPerResult = "desired_cost_per_result"
        case endsAt = "ends_at"
        case id
        case issues
        case objective
        case specialAdCategories = "special_ad_categories"
        case startsAt = "starts_at"
        case status
        case targetCostPerResult = "target_cost_per_result"
        case targetResultEvent = "target_result_event"
        case title
        case updatedAt = "updated_at"
    }
}