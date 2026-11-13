import Foundation

extension Requests {
    public struct CreateAdsRequest: Codable, Hashable, Sendable {
        /// An inline ad group to create (same shape as POST /ad_groups, including ad_campaign_id). Creates the ad group and the ad together. Provide this OR ad_group_id.
        public let adGroup: [String: JSONValue]?
        /// The existing ad group to create the ad in. Provide this OR ad_group, not both.
        public let adGroupId: String?
        /// The call-to-action button shown on the ad.
        public let callToAction: CreateAdsRequestCallToAction?
        /// The ad's creative assets. Each entry is an uploaded file id with an optional format; omit format for the original asset. Entries with no format become a carousel's ordered cards, sharing the ad's copy.
        public let creatives: [CreateAdsRequestCreativesItem]?
        /// The description shown on the ad.
        public let descriptions: [CreateAdsRequestDescriptionsItem]?
        /// The headline shown on the ad.
        public let headlines: [CreateAdsRequestHeadlinesItem]?
        /// The primary text shown in the ad body. Several entries make text variations.
        public let primaryTexts: [CreateAdsRequestPrimaryTextsItem]?
        /// The display name of the ad.
        public let title: String?
        /// The URL the ad links to. Query parameters are merged into url_parameters, so the stored URL is always bare.
        public let url: String?
        /// Query parameters to append to the destination URL, keyed by parameter name. Merged with any query string on `url`. Whop adds its own click-attribution parameters; those are reserved, and setting one returns an error that names it.
        public let urlParameters: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adGroup: [String: JSONValue]? = nil,
            adGroupId: String? = nil,
            callToAction: CreateAdsRequestCallToAction? = nil,
            creatives: [CreateAdsRequestCreativesItem]? = nil,
            descriptions: [CreateAdsRequestDescriptionsItem]? = nil,
            headlines: [CreateAdsRequestHeadlinesItem]? = nil,
            primaryTexts: [CreateAdsRequestPrimaryTextsItem]? = nil,
            title: String? = nil,
            url: String? = nil,
            urlParameters: [String: JSONValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.adGroup = adGroup
            self.adGroupId = adGroupId
            self.callToAction = callToAction
            self.creatives = creatives
            self.descriptions = descriptions
            self.headlines = headlines
            self.primaryTexts = primaryTexts
            self.title = title
            self.url = url
            self.urlParameters = urlParameters
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.adGroup = try container.decodeIfPresent([String: JSONValue].self, forKey: .adGroup)
            self.adGroupId = try container.decodeIfPresent(String.self, forKey: .adGroupId)
            self.callToAction = try container.decodeIfPresent(CreateAdsRequestCallToAction.self, forKey: .callToAction)
            self.creatives = try container.decodeIfPresent([CreateAdsRequestCreativesItem].self, forKey: .creatives)
            self.descriptions = try container.decodeIfPresent([CreateAdsRequestDescriptionsItem].self, forKey: .descriptions)
            self.headlines = try container.decodeIfPresent([CreateAdsRequestHeadlinesItem].self, forKey: .headlines)
            self.primaryTexts = try container.decodeIfPresent([CreateAdsRequestPrimaryTextsItem].self, forKey: .primaryTexts)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.urlParameters = try container.decodeIfPresent([String: JSONValue].self, forKey: .urlParameters)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.adGroup, forKey: .adGroup)
            try container.encodeIfPresent(self.adGroupId, forKey: .adGroupId)
            try container.encodeIfPresent(self.callToAction, forKey: .callToAction)
            try container.encodeIfPresent(self.creatives, forKey: .creatives)
            try container.encodeIfPresent(self.descriptions, forKey: .descriptions)
            try container.encodeIfPresent(self.headlines, forKey: .headlines)
            try container.encodeIfPresent(self.primaryTexts, forKey: .primaryTexts)
            try container.encodeIfPresent(self.title, forKey: .title)
            try container.encodeIfPresent(self.url, forKey: .url)
            try container.encodeIfPresent(self.urlParameters, forKey: .urlParameters)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case adGroup = "ad_group"
            case adGroupId = "ad_group_id"
            case callToAction = "call_to_action"
            case creatives
            case descriptions
            case headlines
            case primaryTexts = "primary_texts"
            case title
            case url
            case urlParameters = "url_parameters"
        }
    }
}