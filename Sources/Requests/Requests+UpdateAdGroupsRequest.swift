import Foundation

extension Requests {
    public struct UpdateAdGroupsRequest: Codable, Hashable, Sendable {
        /// Saved audiences to deliver to or exclude. Can't be combined with demographics.automatic.
        public let audiences: AdGroupAudiencesBody?
        /// How delivery bids are set in the ad auction. Target-based strategies use `desired_cost_per_result`.
        public let bidType: UpdateAdGroupsRequestBidType?
        /// This ad group's budget in USD, which is what it is stored and billed in. Omit when the budget is set on the campaign instead.
        public let budgetAmount: Double?
        /// This ad group's budget stated in the account's ads reporting currency (`budget_currency` on the response) instead of USD. Converted to USD at the current exchange rate and stored as budget_amount; on an update, an amount equal to the current budget_amount_local keeps the stored USD budget as is. Provide this or budget_amount, not both.
        public let budgetAmountLocal: Double?
        /// Whether budget_amount is spent per day (`daily`) or over the ad group's full run (`lifetime`).
        public let budgetType: UpdateAdGroupsRequestBudgetType?
        public let conversionEvent: Nullable<ConversionEvent>?
        /// Hours the ad group delivers in each week, keyed by day. Each window runs from `start` to `end` on the hour, with `24:00` for midnight, and a day's windows can't overlap or touch. A day that's empty or left out doesn't deliver. Replaces the whole schedule; `null` delivers at every hour. Some platforms need a lifetime `budget_type` for a schedule, on the ad group or on its campaign when the campaign holds the budget.
        public let deliverySchedule: Nullable<UpdateAdGroupsRequestDeliverySchedule>?
        /// Age, gender, and automatic-audience targeting.
        public let demographics: AdGroupDemographicsBody?
        /// Cost per result to aim for (`average_target`) or never exceed (`maximum_target`).
        public let desiredCostPerResult: Double?
        /// Device platforms and operating systems to target.
        public let devices: AdGroupDevicesBody?
        /// When the ad group stops delivering, as an ISO 8601 timestamp. Omit to run until paused.
        public let endsAt: String?
        /// Search terms the ad group's ads can show for, and terms they never show for. Only search campaigns take keywords, and each of their ad groups needs at least one before launch. Replaces the stored list; omit to keep it.
        public let keywords: [UpdateAdGroupsRequestKeywordsItem]?
        /// Languages to target, as ISO 639 codes such as `en` or `es`. Empty or omitted targets all languages.
        public let languages: [String]?
        /// Locations to target and exclude.
        public let regions: AdGroupRegionsBody?
        /// When the ad group starts delivering, as an ISO 8601 timestamp. Omit to start as soon as it's active.
        public let startsAt: String?
        /// Initial status (default: `active`).
        public let status: UpdateAdGroupsRequestStatus?
        /// The display name of the ad group.
        public let title: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            audiences: AdGroupAudiencesBody? = nil,
            bidType: UpdateAdGroupsRequestBidType? = nil,
            budgetAmount: Double? = nil,
            budgetAmountLocal: Double? = nil,
            budgetType: UpdateAdGroupsRequestBudgetType? = nil,
            conversionEvent: Nullable<ConversionEvent>? = nil,
            deliverySchedule: Nullable<UpdateAdGroupsRequestDeliverySchedule>? = nil,
            demographics: AdGroupDemographicsBody? = nil,
            desiredCostPerResult: Double? = nil,
            devices: AdGroupDevicesBody? = nil,
            endsAt: String? = nil,
            keywords: [UpdateAdGroupsRequestKeywordsItem]? = nil,
            languages: [String]? = nil,
            regions: AdGroupRegionsBody? = nil,
            startsAt: String? = nil,
            status: UpdateAdGroupsRequestStatus? = nil,
            title: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.audiences = audiences
            self.bidType = bidType
            self.budgetAmount = budgetAmount
            self.budgetAmountLocal = budgetAmountLocal
            self.budgetType = budgetType
            self.conversionEvent = conversionEvent
            self.deliverySchedule = deliverySchedule
            self.demographics = demographics
            self.desiredCostPerResult = desiredCostPerResult
            self.devices = devices
            self.endsAt = endsAt
            self.keywords = keywords
            self.languages = languages
            self.regions = regions
            self.startsAt = startsAt
            self.status = status
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.audiences = try container.decodeIfPresent(AdGroupAudiencesBody.self, forKey: .audiences)
            self.bidType = try container.decodeIfPresent(UpdateAdGroupsRequestBidType.self, forKey: .bidType)
            self.budgetAmount = try container.decodeIfPresent(Double.self, forKey: .budgetAmount)
            self.budgetAmountLocal = try container.decodeIfPresent(Double.self, forKey: .budgetAmountLocal)
            self.budgetType = try container.decodeIfPresent(UpdateAdGroupsRequestBudgetType.self, forKey: .budgetType)
            self.conversionEvent = try container.decodeNullableIfPresent(ConversionEvent.self, forKey: .conversionEvent)
            self.deliverySchedule = try container.decodeNullableIfPresent(UpdateAdGroupsRequestDeliverySchedule.self, forKey: .deliverySchedule)
            self.demographics = try container.decodeIfPresent(AdGroupDemographicsBody.self, forKey: .demographics)
            self.desiredCostPerResult = try container.decodeIfPresent(Double.self, forKey: .desiredCostPerResult)
            self.devices = try container.decodeIfPresent(AdGroupDevicesBody.self, forKey: .devices)
            self.endsAt = try container.decodeIfPresent(String.self, forKey: .endsAt)
            self.keywords = try container.decodeIfPresent([UpdateAdGroupsRequestKeywordsItem].self, forKey: .keywords)
            self.languages = try container.decodeIfPresent([String].self, forKey: .languages)
            self.regions = try container.decodeIfPresent(AdGroupRegionsBody.self, forKey: .regions)
            self.startsAt = try container.decodeIfPresent(String.self, forKey: .startsAt)
            self.status = try container.decodeIfPresent(UpdateAdGroupsRequestStatus.self, forKey: .status)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.audiences, forKey: .audiences)
            try container.encodeIfPresent(self.bidType, forKey: .bidType)
            try container.encodeIfPresent(self.budgetAmount, forKey: .budgetAmount)
            try container.encodeIfPresent(self.budgetAmountLocal, forKey: .budgetAmountLocal)
            try container.encodeIfPresent(self.budgetType, forKey: .budgetType)
            try container.encodeNullableIfPresent(self.conversionEvent, forKey: .conversionEvent)
            try container.encodeNullableIfPresent(self.deliverySchedule, forKey: .deliverySchedule)
            try container.encodeIfPresent(self.demographics, forKey: .demographics)
            try container.encodeIfPresent(self.desiredCostPerResult, forKey: .desiredCostPerResult)
            try container.encodeIfPresent(self.devices, forKey: .devices)
            try container.encodeIfPresent(self.endsAt, forKey: .endsAt)
            try container.encodeIfPresent(self.keywords, forKey: .keywords)
            try container.encodeIfPresent(self.languages, forKey: .languages)
            try container.encodeIfPresent(self.regions, forKey: .regions)
            try container.encodeIfPresent(self.startsAt, forKey: .startsAt)
            try container.encodeIfPresent(self.status, forKey: .status)
            try container.encodeIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case audiences
            case bidType = "bid_type"
            case budgetAmount = "budget_amount"
            case budgetAmountLocal = "budget_amount_local"
            case budgetType = "budget_type"
            case conversionEvent = "conversion_event"
            case deliverySchedule = "delivery_schedule"
            case demographics
            case desiredCostPerResult = "desired_cost_per_result"
            case devices
            case endsAt = "ends_at"
            case keywords
            case languages
            case regions
            case startsAt = "starts_at"
            case status
            case title
        }
    }
}