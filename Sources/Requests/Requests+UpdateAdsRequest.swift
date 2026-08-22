import Foundation

extension Requests {
    public struct UpdateAdsRequest: Codable, Hashable, Sendable {
        /// The call-to-action button shown on the ad.
        public let callToAction: UpdateAdsRequestCallToAction?
        /// The ad's creative assets. Each entry is an uploaded file id with an optional format; omit format for the original asset. Replaces a live ad's creative on the platform. Two or more entries with no format replace it with a carousel (2-10 attachments), in order, sharing the ad's copy.
        public let creatives: [UpdateAdsRequestCreativesItem]?
        /// The description variants shown on the ad.
        public let descriptions: [String]?
        /// The headline variants shown on the ad.
        public let headlines: [String]?
        /// Instant lead form for the ad. Only allowed when the ad group's conversion_location is an instant-form destination (instant_forms, instant_forms_and_messenger, website_and_instant_forms). Mutually exclusive with lead_form_id.
        public let leadForm: UpdateAdsRequestLeadForm?
        /// Use an existing instant form instead of creating one — the form's platform ID, from a form already on the ad's Facebook page. Only allowed when the ad group's conversion_location is an instant-form destination. Mutually exclusive with lead_form. Replaces a stored lead_form.
        public let leadFormId: String?
        /// Click-to-message welcome copy: the greeting (message) and the ice-breaker prompt (keyword).
        public let messagingConfig: UpdateAdsRequestMessagingConfig?
        /// Whether the ad can appear alongside other advertisers' ads in the same unit. Defaults to true.
        public let multiAdvertiserAds: Bool?
        /// Promote an existing post instead of uploading creatives — a Facebook post or Instagram media id. Mutually exclusive with creatives. Pair with post_source.
        public let postId: String?
        /// Identifies the network that owns `post_id`. The source is inferred from the ID shape when omitted.
        public let postSource: UpdateAdsRequestPostSource?
        /// The primary text variants shown in the ad body.
        public let primaryTexts: [String]?
        /// The social accounts the ad runs under — a connected Facebook page and, optionally, an Instagram profile.
        public let socialAccounts: [UpdateAdsRequestSocialAccountsItem]?
        /// The display name of the ad.
        public let title: String?
        /// The URL the ad links to. Query parameters are merged into url_parameters, so the stored URL is always bare.
        public let url: String?
        /// Query parameters to append to the destination URL, keyed by parameter name. Merged with any query string on `url`. Whop adds its own click-attribution parameters; those are reserved and rejected if you set them (utm_meta_ad_id, utm_meta_adset_id, utm_meta_campaign_id, utm_source, utm_placement, utm_medium, utm_content, utm_adset, utm_whop, wacid, wasid, waid, tw_source, tw_adid).
        public let urlParameters: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            callToAction: UpdateAdsRequestCallToAction? = nil,
            creatives: [UpdateAdsRequestCreativesItem]? = nil,
            descriptions: [String]? = nil,
            headlines: [String]? = nil,
            leadForm: UpdateAdsRequestLeadForm? = nil,
            leadFormId: String? = nil,
            messagingConfig: UpdateAdsRequestMessagingConfig? = nil,
            multiAdvertiserAds: Bool? = nil,
            postId: String? = nil,
            postSource: UpdateAdsRequestPostSource? = nil,
            primaryTexts: [String]? = nil,
            socialAccounts: [UpdateAdsRequestSocialAccountsItem]? = nil,
            title: String? = nil,
            url: String? = nil,
            urlParameters: [String: JSONValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
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
            self.callToAction = try container.decodeIfPresent(UpdateAdsRequestCallToAction.self, forKey: .callToAction)
            self.creatives = try container.decodeIfPresent([UpdateAdsRequestCreativesItem].self, forKey: .creatives)
            self.descriptions = try container.decodeIfPresent([String].self, forKey: .descriptions)
            self.headlines = try container.decodeIfPresent([String].self, forKey: .headlines)
            self.leadForm = try container.decodeIfPresent(UpdateAdsRequestLeadForm.self, forKey: .leadForm)
            self.leadFormId = try container.decodeIfPresent(String.self, forKey: .leadFormId)
            self.messagingConfig = try container.decodeIfPresent(UpdateAdsRequestMessagingConfig.self, forKey: .messagingConfig)
            self.multiAdvertiserAds = try container.decodeIfPresent(Bool.self, forKey: .multiAdvertiserAds)
            self.postId = try container.decodeIfPresent(String.self, forKey: .postId)
            self.postSource = try container.decodeIfPresent(UpdateAdsRequestPostSource.self, forKey: .postSource)
            self.primaryTexts = try container.decodeIfPresent([String].self, forKey: .primaryTexts)
            self.socialAccounts = try container.decodeIfPresent([UpdateAdsRequestSocialAccountsItem].self, forKey: .socialAccounts)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.urlParameters = try container.decodeIfPresent([String: JSONValue].self, forKey: .urlParameters)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
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