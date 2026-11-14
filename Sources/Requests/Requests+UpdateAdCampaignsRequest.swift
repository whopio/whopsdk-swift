import Foundation

extension Requests {
    public struct UpdateAdCampaignsRequest: Codable, Hashable, Sendable {
        /// The campaign budget in USD, which is what it is stored and billed in. Interpreted as daily or lifetime per the campaign's budget type, including a budget_type sent in the same request.
        public let budgetAmount: Double?
        /// The campaign budget stated in the account's ads reporting currency (`budget_currency` on the response) instead of USD. Converted to USD at the current exchange rate and stored as budget_amount; an amount equal to the current budget_amount_local keeps the stored USD budget as is. Provide this or budget_amount, not both.
        public let budgetAmountLocal: Double?
        /// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`). Only changeable before the campaign launches; switching to `ad_campaign` requires budget_amount in the same request, and switching to `ad_group` clears the campaign budget.
        public let budgetOptimization: UpdateAdCampaignsRequestBudgetOptimization?
        /// Whether `budget_amount` is spent per day (`daily`) or over the campaign's full run (`lifetime`). Only changeable while the campaign is a draft; send budget_amount in the same request so the amount lands on the new type.
        public let budgetType: UpdateAdCampaignsRequestBudgetType?
        /// Accepted only when it matches the campaign's current type, so a read can be sent back unchanged. The type is fixed at creation.
        public let campaignType: UpdateAdCampaignsRequestCampaignType?
        /// The cost per result, in USD, you want this campaign to achieve. A target only: it is not a bid, cost cap, or bid cap, and doesn't change how the campaign's ads bid. Ad groups set cost and bid caps with their own `desired_cost_per_result`. `null` clears it.
        public let desiredCostPerResult: Nullable<Double>?
        /// When the campaign stops delivering, as an ISO 8601 timestamp. Only for campaigns that own the budget.
        public let endsAt: String?
        /// Regulated categories the campaign falls under. Editable on any campaign, draft or launched; pass an empty array to clear.
        public let specialAdCategories: [UpdateAdCampaignsRequestSpecialAdCategoriesItem]?
        /// When the campaign starts delivering, as an ISO 8601 timestamp. Only for campaigns that own the budget.
        public let startsAt: String?
        /// Set to active to launch a draft campaign (moderates and pushes it live). Live-campaign pause and resume use the pause and unpause actions.
        public let status: UpdateAdCampaignsRequestStatus?
        /// The name of the campaign.
        public let title: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            budgetAmount: Double? = nil,
            budgetAmountLocal: Double? = nil,
            budgetOptimization: UpdateAdCampaignsRequestBudgetOptimization? = nil,
            budgetType: UpdateAdCampaignsRequestBudgetType? = nil,
            campaignType: UpdateAdCampaignsRequestCampaignType? = nil,
            desiredCostPerResult: Nullable<Double>? = nil,
            endsAt: String? = nil,
            specialAdCategories: [UpdateAdCampaignsRequestSpecialAdCategoriesItem]? = nil,
            startsAt: String? = nil,
            status: UpdateAdCampaignsRequestStatus? = nil,
            title: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.budgetAmount = budgetAmount
            self.budgetAmountLocal = budgetAmountLocal
            self.budgetOptimization = budgetOptimization
            self.budgetType = budgetType
            self.campaignType = campaignType
            self.desiredCostPerResult = desiredCostPerResult
            self.endsAt = endsAt
            self.specialAdCategories = specialAdCategories
            self.startsAt = startsAt
            self.status = status
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.budgetAmount = try container.decodeIfPresent(Double.self, forKey: .budgetAmount)
            self.budgetAmountLocal = try container.decodeIfPresent(Double.self, forKey: .budgetAmountLocal)
            self.budgetOptimization = try container.decodeIfPresent(UpdateAdCampaignsRequestBudgetOptimization.self, forKey: .budgetOptimization)
            self.budgetType = try container.decodeIfPresent(UpdateAdCampaignsRequestBudgetType.self, forKey: .budgetType)
            self.campaignType = try container.decodeIfPresent(UpdateAdCampaignsRequestCampaignType.self, forKey: .campaignType)
            self.desiredCostPerResult = try container.decodeNullableIfPresent(Double.self, forKey: .desiredCostPerResult)
            self.endsAt = try container.decodeIfPresent(String.self, forKey: .endsAt)
            self.specialAdCategories = try container.decodeIfPresent([UpdateAdCampaignsRequestSpecialAdCategoriesItem].self, forKey: .specialAdCategories)
            self.startsAt = try container.decodeIfPresent(String.self, forKey: .startsAt)
            self.status = try container.decodeIfPresent(UpdateAdCampaignsRequestStatus.self, forKey: .status)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.budgetAmount, forKey: .budgetAmount)
            try container.encodeIfPresent(self.budgetAmountLocal, forKey: .budgetAmountLocal)
            try container.encodeIfPresent(self.budgetOptimization, forKey: .budgetOptimization)
            try container.encodeIfPresent(self.budgetType, forKey: .budgetType)
            try container.encodeIfPresent(self.campaignType, forKey: .campaignType)
            try container.encodeNullableIfPresent(self.desiredCostPerResult, forKey: .desiredCostPerResult)
            try container.encodeIfPresent(self.endsAt, forKey: .endsAt)
            try container.encodeIfPresent(self.specialAdCategories, forKey: .specialAdCategories)
            try container.encodeIfPresent(self.startsAt, forKey: .startsAt)
            try container.encodeIfPresent(self.status, forKey: .status)
            try container.encodeIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case budgetAmount = "budget_amount"
            case budgetAmountLocal = "budget_amount_local"
            case budgetOptimization = "budget_optimization"
            case budgetType = "budget_type"
            case campaignType = "campaign_type"
            case desiredCostPerResult = "desired_cost_per_result"
            case endsAt = "ends_at"
            case specialAdCategories = "special_ad_categories"
            case startsAt = "starts_at"
            case status
            case title
        }
    }
}