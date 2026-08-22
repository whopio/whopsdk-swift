import Foundation

extension Requests {
    public struct UpdateAdGroupsRequest: Codable, Hashable, Sendable {
        /// Saved audiences to deliver to or exclude. Can't be combined with demographics.automatic.
        public let audiences: AdGroupAudiencesBody?
        /// How delivery bids are set in the ad auction. Target-based strategies use `desired_cost_per_result`.
        public let bidType: UpdateAdGroupsRequestBidType?
        /// This ad group's budget, in the ad account's currency. Omit when the budget is set on the campaign instead.
        public let budgetAmount: Double?
        /// Whether budget_amount is spent per day (`daily`) or over the ad group's full run (`lifetime`).
        public let budgetType: UpdateAdGroupsRequestBudgetType?
        public let conversionEvent: Nullable<ConversionEvent>?
        /// Where the outcome being optimized for occurs, such as a website visit, social-profile visit, messaging conversation, ad interaction, or lead-form submission. The lead form itself is set on the ad.
        public let conversionLocation: UpdateAdGroupsRequestConversionLocation?
        /// Age, gender, and automatic-audience targeting.
        public let demographics: AdGroupDemographicsBody?
        /// Cost per result to aim for (`average_target`) or never exceed (`maximum_target`).
        public let desiredCostPerResult: Double?
        /// Interest, behavior, and demographic targeting, using categories from the ad platform's targeting taxonomy. Entries across interests, behaviors, and demographics are OR'd together (anyone matching any entry is reached), matching Ads Manager's detailed-targeting box. At most 100 entries per section. Can't be combined with demographics.automatic, and unavailable to campaigns with special_ad_categories. Send the complete intended state — a section you omit is cleared.
        public let detailedTargeting: AdGroupDetailedTargetingBody?
        /// Device platforms and operating systems to target.
        public let devices: AdGroupDevicesBody?
        /// When the ad group stops delivering, as an ISO 8601 timestamp. Omit to run until paused.
        public let endsAt: String?
        /// Cap on how often one person sees ads from this ad group. Only available on campaigns with the `awareness` objective.
        public let frequencyCap: UpdateAdGroupsRequestFrequencyCap?
        /// Languages to target, as ISO 639 codes such as `en` or `es`. Empty or omitted targets all languages.
        public let languages: [String]?
        /// Apps the conversation opens in. Required when setting `conversion_location` to `messaging`, and rejected unless the ad group's conversion location is `messaging`.
        public let messageApps: [UpdateAdGroupsRequestMessageAppsItem]?
        /// Minimum the ad group tries to spend each day.
        public let minimumDailySpend: Double?
        /// The result the ad group's delivery is optimized to get the most of.
        public let optimizationGoal: UpdateAdGroupsRequestOptimizationGoal?
        /// `automatic` to let the ad platform choose placements, or the list of platforms and positions to target. Omit a platform's positions to target all of them.
        ///
        /// Valid positions per platform:
        ///
        /// - `facebook`: `feed`, `right_hand_column`, `marketplace`, `search`, `profile_feed`, `notification`, `story`, `instream_video`, `facebook_reels`, `facebook_reels_overlay`, `biz_disco_feed`
        /// - `instagram`: `stream`, `story`, `explore`, `explore_home`, `reels`, `profile_feed`, `profile_reels`, `ig_search`
        /// - `messenger`: `story`
        /// - `audience_network`: `classic`, `rewarded_video`
        /// - `threads`: `threads_stream`
        /// - `whatsapp`: `status`
        public let placements: UpdateAdGroupsRequestPlacements?
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
            budgetType: UpdateAdGroupsRequestBudgetType? = nil,
            conversionEvent: Nullable<ConversionEvent>? = nil,
            conversionLocation: UpdateAdGroupsRequestConversionLocation? = nil,
            demographics: AdGroupDemographicsBody? = nil,
            desiredCostPerResult: Double? = nil,
            detailedTargeting: AdGroupDetailedTargetingBody? = nil,
            devices: AdGroupDevicesBody? = nil,
            endsAt: String? = nil,
            frequencyCap: UpdateAdGroupsRequestFrequencyCap? = nil,
            languages: [String]? = nil,
            messageApps: [UpdateAdGroupsRequestMessageAppsItem]? = nil,
            minimumDailySpend: Double? = nil,
            optimizationGoal: UpdateAdGroupsRequestOptimizationGoal? = nil,
            placements: UpdateAdGroupsRequestPlacements? = nil,
            regions: AdGroupRegionsBody? = nil,
            startsAt: String? = nil,
            status: UpdateAdGroupsRequestStatus? = nil,
            title: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.audiences = audiences
            self.bidType = bidType
            self.budgetAmount = budgetAmount
            self.budgetType = budgetType
            self.conversionEvent = conversionEvent
            self.conversionLocation = conversionLocation
            self.demographics = demographics
            self.desiredCostPerResult = desiredCostPerResult
            self.detailedTargeting = detailedTargeting
            self.devices = devices
            self.endsAt = endsAt
            self.frequencyCap = frequencyCap
            self.languages = languages
            self.messageApps = messageApps
            self.minimumDailySpend = minimumDailySpend
            self.optimizationGoal = optimizationGoal
            self.placements = placements
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
            self.budgetType = try container.decodeIfPresent(UpdateAdGroupsRequestBudgetType.self, forKey: .budgetType)
            self.conversionEvent = try container.decodeNullableIfPresent(ConversionEvent.self, forKey: .conversionEvent)
            self.conversionLocation = try container.decodeIfPresent(UpdateAdGroupsRequestConversionLocation.self, forKey: .conversionLocation)
            self.demographics = try container.decodeIfPresent(AdGroupDemographicsBody.self, forKey: .demographics)
            self.desiredCostPerResult = try container.decodeIfPresent(Double.self, forKey: .desiredCostPerResult)
            self.detailedTargeting = try container.decodeIfPresent(AdGroupDetailedTargetingBody.self, forKey: .detailedTargeting)
            self.devices = try container.decodeIfPresent(AdGroupDevicesBody.self, forKey: .devices)
            self.endsAt = try container.decodeIfPresent(String.self, forKey: .endsAt)
            self.frequencyCap = try container.decodeIfPresent(UpdateAdGroupsRequestFrequencyCap.self, forKey: .frequencyCap)
            self.languages = try container.decodeIfPresent([String].self, forKey: .languages)
            self.messageApps = try container.decodeIfPresent([UpdateAdGroupsRequestMessageAppsItem].self, forKey: .messageApps)
            self.minimumDailySpend = try container.decodeIfPresent(Double.self, forKey: .minimumDailySpend)
            self.optimizationGoal = try container.decodeIfPresent(UpdateAdGroupsRequestOptimizationGoal.self, forKey: .optimizationGoal)
            self.placements = try container.decodeIfPresent(UpdateAdGroupsRequestPlacements.self, forKey: .placements)
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
            try container.encodeIfPresent(self.budgetType, forKey: .budgetType)
            try container.encodeNullableIfPresent(self.conversionEvent, forKey: .conversionEvent)
            try container.encodeIfPresent(self.conversionLocation, forKey: .conversionLocation)
            try container.encodeIfPresent(self.demographics, forKey: .demographics)
            try container.encodeIfPresent(self.desiredCostPerResult, forKey: .desiredCostPerResult)
            try container.encodeIfPresent(self.detailedTargeting, forKey: .detailedTargeting)
            try container.encodeIfPresent(self.devices, forKey: .devices)
            try container.encodeIfPresent(self.endsAt, forKey: .endsAt)
            try container.encodeIfPresent(self.frequencyCap, forKey: .frequencyCap)
            try container.encodeIfPresent(self.languages, forKey: .languages)
            try container.encodeIfPresent(self.messageApps, forKey: .messageApps)
            try container.encodeIfPresent(self.minimumDailySpend, forKey: .minimumDailySpend)
            try container.encodeIfPresent(self.optimizationGoal, forKey: .optimizationGoal)
            try container.encodeIfPresent(self.placements, forKey: .placements)
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
            case budgetType = "budget_type"
            case conversionEvent = "conversion_event"
            case conversionLocation = "conversion_location"
            case demographics
            case desiredCostPerResult = "desired_cost_per_result"
            case detailedTargeting = "detailed_targeting"
            case devices
            case endsAt = "ends_at"
            case frequencyCap = "frequency_cap"
            case languages
            case messageApps = "message_apps"
            case minimumDailySpend = "minimum_daily_spend"
            case optimizationGoal = "optimization_goal"
            case placements
            case regions
            case startsAt = "starts_at"
            case status
            case title
        }
    }
}