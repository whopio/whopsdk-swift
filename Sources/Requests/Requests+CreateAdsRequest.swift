import Foundation

extension Requests {
    public struct CreateAdsRequest: Codable, Hashable, Sendable {
        /// An inline ad group to create (same shape as POST /ad_groups, including ad_campaign_id). Creates the ad group and the ad together. Provide this OR ad_group_id.
        public let adGroup: [String: JSONValue]?
        /// The existing ad group to create the ad in. Provide this OR ad_group, not both.
        public let adGroupId: String?
        /// The call-to-action button shown on the ad.
        public let callToAction: CreateAdsRequestCallToAction?
        /// The ad's creative assets. Each entry is an uploaded file id with an optional format; omit format for the original asset. Two or more entries with no format become a carousel (2-10 attachments), in order, sharing the ad's copy.
        public let creatives: [CreateAdsRequestCreativesItem]?
        /// The description variants shown on the ad.
        public let descriptions: [String]?
        /// The headline variants shown on the ad.
        public let headlines: [String]?
        /// Instant lead form for the ad. Only allowed when the ad group's conversion_location is an instant-form destination (instant_forms, instant_forms_and_messenger, website_and_instant_forms). Mutually exclusive with lead_form_id.
        public let leadForm: CreateAdsRequestLeadForm?
        /// Use an existing instant form instead of creating one — the form's platform ID, from a form already on the ad's Facebook page. Only allowed when the ad group's conversion_location is an instant-form destination. Mutually exclusive with lead_form.
        public let leadFormId: String?
        /// Click-to-message welcome copy: the greeting (message) and the ice-breaker prompt (keyword).
        public let messagingConfig: CreateAdsRequestMessagingConfig?
        /// Whether the ad can appear alongside other advertisers' ads in the same unit. Defaults to true.
        public let multiAdvertiserAds: Bool?
        /// Promote an existing post instead of uploading creatives — a Facebook post or Instagram media id. Mutually exclusive with creatives. Pair with post_source.
        public let postId: String?
        /// Identifies the network that owns `post_id`. The source is inferred from the ID shape when omitted.
        public let postSource: CreateAdsRequestPostSource?
        /// The primary text variants shown in the ad body.
        public let primaryTexts: [String]?
        /// The social accounts the ad runs under — a connected Facebook page and, optionally, an Instagram profile.
        public let socialAccounts: [CreateAdsRequestSocialAccountsItem]?
        /// The display name of the ad.
        public let title: String?
        /// The URL the ad links to. Query parameters are merged into url_parameters, so the stored URL is always bare.
        public let url: String?
        /// Query parameters to append to the destination URL, keyed by parameter name. Merged with any query string on `url`. Whop adds its own click-attribution parameters; those are reserved and rejected if you set them (utm_meta_ad_id, utm_meta_adset_id, utm_meta_campaign_id, utm_source, utm_placement, utm_medium, utm_content, utm_adset, utm_whop, wacid, wasid, waid, tw_source, tw_adid).
        public let urlParameters: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adGroup: [String: JSONValue]? = nil,
            adGroupId: String? = nil,
            callToAction: CreateAdsRequestCallToAction? = nil,
            creatives: [CreateAdsRequestCreativesItem]? = nil,
            descriptions: [String]? = nil,
            headlines: [String]? = nil,
            leadForm: CreateAdsRequestLeadForm? = nil,
            leadFormId: String? = nil,
            messagingConfig: CreateAdsRequestMessagingConfig? = nil,
            multiAdvertiserAds: Bool? = nil,
            postId: String? = nil,
            postSource: CreateAdsRequestPostSource? = nil,
            primaryTexts: [String]? = nil,
            socialAccounts: [CreateAdsRequestSocialAccountsItem]? = nil,
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
            self.leadForm = leadForm
            self.leadFormId = leadFormId
            self.messagingConfig = messagingConfig
            self.multiAdvertiserAds = multiAdvertiserAds
            self.postId = postId
            self.postSource = postSource
            self.primaryTexts = primaryTexts
            self.socialAccounts = socialAccounts
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
            self.descriptions = try container.decodeIfPresent([String].self, forKey: .descriptions)
            self.headlines = try container.decodeIfPresent([String].self, forKey: .headlines)
            self.leadForm = try container.decodeIfPresent(CreateAdsRequestLeadForm.self, forKey: .leadForm)
            self.leadFormId = try container.decodeIfPresent(String.self, forKey: .leadFormId)
            self.messagingConfig = try container.decodeIfPresent(CreateAdsRequestMessagingConfig.self, forKey: .messagingConfig)
            self.multiAdvertiserAds = try container.decodeIfPresent(Bool.self, forKey: .multiAdvertiserAds)
            self.postId = try container.decodeIfPresent(String.self, forKey: .postId)
            self.postSource = try container.decodeIfPresent(CreateAdsRequestPostSource.self, forKey: .postSource)
            self.primaryTexts = try container.decodeIfPresent([String].self, forKey: .primaryTexts)
            self.socialAccounts = try container.decodeIfPresent([CreateAdsRequestSocialAccountsItem].self, forKey: .socialAccounts)
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
            try container.encodeIfPresent(self.leadForm, forKey: .leadForm)
            try container.encodeIfPresent(self.leadFormId, forKey: .leadFormId)
            try container.encodeIfPresent(self.messagingConfig, forKey: .messagingConfig)
            try container.encodeIfPresent(self.multiAdvertiserAds, forKey: .multiAdvertiserAds)
            try container.encodeIfPresent(self.postId, forKey: .postId)
            try container.encodeIfPresent(self.postSource, forKey: .postSource)
            try container.encodeIfPresent(self.primaryTexts, forKey: .primaryTexts)
            try container.encodeIfPresent(self.socialAccounts, forKey: .socialAccounts)
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
            case leadForm = "lead_form"
            case leadFormId = "lead_form_id"
            case messagingConfig = "messaging_config"
            case multiAdvertiserAds = "multi_advertiser_ads"
            case postId = "post_id"
            case postSource = "post_source"
            case primaryTexts = "primary_texts"
            case socialAccounts = "social_accounts"
            case title
            case url
            case urlParameters = "url_parameters"
        }
    }
}