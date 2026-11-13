import Foundation

extension Requests {
    public struct CreateAdCampaignsRequest: Codable, Hashable, Sendable {
        /// The account to create the campaign under. Defaults to the account-scoped key's own account.
        public let accountId: String?
        /// The campaign's budget in USD, which is what it is stored and billed in. Required when budget_optimization is `ad_campaign` (or send budget_amount_local instead); omit when each ad group sets its own budget.
        public let budgetAmount: Double?
        /// The campaign's budget stated in the account's ads reporting currency (`budget_currency` on the response) instead of USD. Converted to USD at the current exchange rate and stored as budget_amount. Provide this or budget_amount, not both.
        public let budgetAmountLocal: Double?
        /// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`). Defaults to `ad_group`.
        public let budgetOptimization: CreateAdCampaignsRequestBudgetOptimization?
        /// Whether the budget is spent per day (`daily`) or over the campaign's full run (`lifetime`). Defaults to `daily`.
        public let budgetType: CreateAdCampaignsRequestBudgetType?
        /// The kind of campaign to create. `standard` runs image and video ads; `search` shows text ads on search results for the ad groups' keywords. Defaults to `standard`. Can't be changed after creation.
        public let campaignType: CreateAdCampaignsRequestCampaignType?
        /// The cost per result, in USD, you want this campaign to achieve. A target only: it is not a bid, cost cap, or bid cap, and doesn't change how the campaign's ads bid. Ad groups set cost and bid caps with their own `desired_cost_per_result`. Omit or send `null` for no target.
        public let desiredCostPerResult: Nullable<Double>?
        /// When the campaign stops delivering, as an ISO 8601 timestamp. Only for campaigns that own the budget.
        public let endsAt: String?
        /// The goal the campaign optimizes toward.
        public let objective: CreateAdCampaignsRequestObjective
        /// Regulated categories the campaign falls under. Ads in these categories are subject to extra targeting restrictions.
        public let specialAdCategories: [CreateAdCampaignsRequestSpecialAdCategoriesItem]?
        /// When the campaign starts delivering, as an ISO 8601 timestamp. Only for campaigns that own the budget.
        public let startsAt: String?
        /// The title of the campaign.
        public let title: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            budgetAmount: Double? = nil,
            budgetAmountLocal: Double? = nil,
            budgetOptimization: CreateAdCampaignsRequestBudgetOptimization? = nil,
            budgetType: CreateAdCampaignsRequestBudgetType? = nil,
            campaignType: CreateAdCampaignsRequestCampaignType? = nil,
            desiredCostPerResult: Nullable<Double>? = nil,
            endsAt: String? = nil,
            objective: CreateAdCampaignsRequestObjective,
            specialAdCategories: [CreateAdCampaignsRequestSpecialAdCategoriesItem]? = nil,
            startsAt: String? = nil,
            title: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.budgetAmount = budgetAmount
            self.budgetAmountLocal = budgetAmountLocal
            self.budgetOptimization = budgetOptimization
            self.budgetType = budgetType
            self.campaignType = campaignType
            self.desiredCostPerResult = desiredCostPerResult
            self.endsAt = endsAt
            self.objective = objective
            self.specialAdCategories = specialAdCategories
            self.startsAt = startsAt
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.budgetAmount = try container.decodeIfPresent(Double.self, forKey: .budgetAmount)
            self.budgetAmountLocal = try container.decodeIfPresent(Double.self, forKey: .budgetAmountLocal)
            self.budgetOptimization = try container.decodeIfPresent(CreateAdCampaignsRequestBudgetOptimization.self, forKey: .budgetOptimization)
            self.budgetType = try container.decodeIfPresent(CreateAdCampaignsRequestBudgetType.self, forKey: .budgetType)
            self.campaignType = try container.decodeIfPresent(CreateAdCampaignsRequestCampaignType.self, forKey: .campaignType)
            self.desiredCostPerResult = try container.decodeNullableIfPresent(Double.self, forKey: .desiredCostPerResult)
            self.endsAt = try container.decodeIfPresent(String.self, forKey: .endsAt)
            self.objective = try container.decode(CreateAdCampaignsRequestObjective.self, forKey: .objective)
            self.specialAdCategories = try container.decodeIfPresent([CreateAdCampaignsRequestSpecialAdCategoriesItem].self, forKey: .specialAdCategories)
            self.startsAt = try container.decodeIfPresent(String.self, forKey: .startsAt)
            self.title = try container.decode(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.budgetAmount, forKey: .budgetAmount)
            try container.encodeIfPresent(self.budgetAmountLocal, forKey: .budgetAmountLocal)
            try container.encodeIfPresent(self.budgetOptimization, forKey: .budgetOptimization)
            try container.encodeIfPresent(self.budgetType, forKey: .budgetType)
            try container.encodeIfPresent(self.campaignType, forKey: .campaignType)
            try container.encodeNullableIfPresent(self.desiredCostPerResult, forKey: .desiredCostPerResult)
            try container.encodeIfPresent(self.endsAt, forKey: .endsAt)
            try container.encode(self.objective, forKey: .objective)
            try container.encodeIfPresent(self.specialAdCategories, forKey: .specialAdCategories)
            try container.encodeIfPresent(self.startsAt, forKey: .startsAt)
            try container.encode(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case budgetAmount = "budget_amount"
            case budgetAmountLocal = "budget_amount_local"
            case budgetOptimization = "budget_optimization"
            case budgetType = "budget_type"
            case campaignType = "campaign_type"
            case desiredCostPerResult = "desired_cost_per_result"
            case endsAt = "ends_at"
            case objective
            case specialAdCategories = "special_ad_categories"
            case startsAt = "starts_at"
            case title
        }
    }
}