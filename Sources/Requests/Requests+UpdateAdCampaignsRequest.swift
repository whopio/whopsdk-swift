import Foundation

extension Requests {
    public struct UpdateAdCampaignsRequest: Codable, Hashable, Sendable {
        /// How delivery bids in the ad auction: `minimum_cost` gets the most results for the budget, `average_target` holds an average cost per result, `maximum_target` never bids above a cap. Switching to `minimum_cost` clears the cap amounts stored on the campaign's ad groups. Only for campaigns that own the budget.
        public let bidType: UpdateAdCampaignsRequestBidType?
        /// The campaign budget, in the account's currency. Interpreted as daily or lifetime per the campaign's existing budget type.
        public let budgetAmount: Double?
        /// Which level owns the budget: the whole campaign (`ad_campaign`) or each ad group individually (`ad_group`). Only changeable before the campaign is live on the ad network; switching to `ad_campaign` requires budget_amount in the same request, and switching to `ad_group` clears the campaign budget.
        public let budgetOptimization: UpdateAdCampaignsRequestBudgetOptimization?
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
            bidType: UpdateAdCampaignsRequestBidType? = nil,
            budgetAmount: Double? = nil,
            budgetOptimization: UpdateAdCampaignsRequestBudgetOptimization? = nil,
            endsAt: String? = nil,
            specialAdCategories: [UpdateAdCampaignsRequestSpecialAdCategoriesItem]? = nil,
            startsAt: String? = nil,
            status: UpdateAdCampaignsRequestStatus? = nil,
            title: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.bidType = bidType
            self.budgetAmount = budgetAmount
            self.budgetOptimization = budgetOptimization
            self.endsAt = endsAt
            self.specialAdCategories = specialAdCategories
            self.startsAt = startsAt
            self.status = status
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.bidType = try container.decodeIfPresent(UpdateAdCampaignsRequestBidType.self, forKey: .bidType)
            self.budgetAmount = try container.decodeIfPresent(Double.self, forKey: .budgetAmount)
            self.budgetOptimization = try container.decodeIfPresent(UpdateAdCampaignsRequestBudgetOptimization.self, forKey: .budgetOptimization)
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
            try container.encodeIfPresent(self.bidType, forKey: .bidType)
            try container.encodeIfPresent(self.budgetAmount, forKey: .budgetAmount)
            try container.encodeIfPresent(self.budgetOptimization, forKey: .budgetOptimization)
            try container.encodeIfPresent(self.endsAt, forKey: .endsAt)
            try container.encodeIfPresent(self.specialAdCategories, forKey: .specialAdCategories)
            try container.encodeIfPresent(self.startsAt, forKey: .startsAt)
            try container.encodeIfPresent(self.status, forKey: .status)
            try container.encodeIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case bidType = "bid_type"
            case budgetAmount = "budget_amount"
            case budgetOptimization = "budget_optimization"
            case endsAt = "ends_at"
            case specialAdCategories = "special_ad_categories"
            case startsAt = "starts_at"
            case status
            case title
        }
    }
}