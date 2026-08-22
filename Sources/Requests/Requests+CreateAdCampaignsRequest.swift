import Foundation

extension Requests {
    public struct CreateAdCampaignsRequest: Codable, Hashable, Sendable {
        /// The account to create the campaign under. Defaults to the account-scoped key's own account.
        public let accountId: String?
        /// How delivery bids in the ad auction: `minimum_cost` gets the most results for the budget, `average_target` holds an average cost per result, `maximum_target` never bids above a cap. Only for campaigns that own the budget.
        public let bidType: CreateAdCampaignsRequestBidType?
        /// The campaign's budget, in the ad account's currency. Required when budget_optimization is `ad_campaign`; omit when each ad group sets its own budget.
        public let budgetAmount: Double?
        /// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`). Defaults to `ad_group`.
        public let budgetOptimization: CreateAdCampaignsRequestBudgetOptimization?
        /// Whether the budget is spent per day (`daily`) or over the campaign's full run (`lifetime`). Defaults to `daily`.
        public let budgetType: CreateAdCampaignsRequestBudgetType?
        /// Cost per result to aim for (`average_target`) or never exceed (`maximum_target`). Only for campaigns that own the budget.
        public let desiredCostPerResult: Double?
        /// When the campaign stops delivering, as an ISO 8601 timestamp. Only for campaigns that own the budget.
        public let endsAt: String?
        /// The goal the campaign optimizes toward.
        public let objective: CreateAdCampaignsRequestObjective
        /// The ad network the campaign runs on.
        public let platform: CreateAdCampaignsRequestPlatform
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
            bidType: CreateAdCampaignsRequestBidType? = nil,
            budgetAmount: Double? = nil,
            budgetOptimization: CreateAdCampaignsRequestBudgetOptimization? = nil,
            budgetType: CreateAdCampaignsRequestBudgetType? = nil,
            desiredCostPerResult: Double? = nil,
            endsAt: String? = nil,
            objective: CreateAdCampaignsRequestObjective,
            platform: CreateAdCampaignsRequestPlatform,
            specialAdCategories: [CreateAdCampaignsRequestSpecialAdCategoriesItem]? = nil,
            startsAt: String? = nil,
            title: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.bidType = bidType
            self.budgetAmount = budgetAmount
            self.budgetOptimization = budgetOptimization
            self.budgetType = budgetType
            self.desiredCostPerResult = desiredCostPerResult
            self.endsAt = endsAt
            self.objective = objective
            self.platform = platform
            self.specialAdCategories = specialAdCategories
            self.startsAt = startsAt
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.bidType = try container.decodeIfPresent(CreateAdCampaignsRequestBidType.self, forKey: .bidType)
            self.budgetAmount = try container.decodeIfPresent(Double.self, forKey: .budgetAmount)
            self.budgetOptimization = try container.decodeIfPresent(CreateAdCampaignsRequestBudgetOptimization.self, forKey: .budgetOptimization)
            self.budgetType = try container.decodeIfPresent(CreateAdCampaignsRequestBudgetType.self, forKey: .budgetType)
            self.desiredCostPerResult = try container.decodeIfPresent(Double.self, forKey: .desiredCostPerResult)
            self.endsAt = try container.decodeIfPresent(String.self, forKey: .endsAt)
            self.objective = try container.decode(CreateAdCampaignsRequestObjective.self, forKey: .objective)
            self.platform = try container.decode(CreateAdCampaignsRequestPlatform.self, forKey: .platform)
            self.specialAdCategories = try container.decodeIfPresent([CreateAdCampaignsRequestSpecialAdCategoriesItem].self, forKey: .specialAdCategories)
            self.startsAt = try container.decodeIfPresent(String.self, forKey: .startsAt)
            self.title = try container.decode(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.bidType, forKey: .bidType)
            try container.encodeIfPresent(self.budgetAmount, forKey: .budgetAmount)
            try container.encodeIfPresent(self.budgetOptimization, forKey: .budgetOptimization)
            try container.encodeIfPresent(self.budgetType, forKey: .budgetType)
            try container.encodeIfPresent(self.desiredCostPerResult, forKey: .desiredCostPerResult)
            try container.encodeIfPresent(self.endsAt, forKey: .endsAt)
            try container.encode(self.objective, forKey: .objective)
            try container.encode(self.platform, forKey: .platform)
            try container.encodeIfPresent(self.specialAdCategories, forKey: .specialAdCategories)
            try container.encodeIfPresent(self.startsAt, forKey: .startsAt)
            try container.encode(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case bidType = "bid_type"
            case budgetAmount = "budget_amount"
            case budgetOptimization = "budget_optimization"
            case budgetType = "budget_type"
            case desiredCostPerResult = "desired_cost_per_result"
            case endsAt = "ends_at"
            case objective
            case platform
            case specialAdCategories = "special_ad_categories"
            case startsAt = "starts_at"
            case title
        }
    }
}