import Foundation

public struct PostAdUpdatedPayloadData: Codable, Hashable, Sendable {
    /// The ad campaign this ad belongs to.
    public let adCampaign: AdEntityReference
    /// The ad group this ad belongs to.
    public let adGroup: AdEntityReference
    /// The call-to-action button shown on the ad.
    public let callToAction: Nullable<PostAdUpdatedPayloadDataCallToAction>
    /// Whop's content review of this ad: whether it has finished, which ad networks it is recommended for, and the content rules it breaks.
    public let contentReview: AdContentReview
    /// When the ad was created, as an ISO 8601 timestamp.
    public let createdAt: String
    public let creatives: [AdCreative]
    /// Whether the ad is delivering right now, and if not, why. When several states apply at once, the highest-precedence one is returned.
    public let deliveryStatus: PostAdUpdatedPayloadDataDeliveryStatus
    public let descriptions: [AdText]
    public let headlines: [AdText]
    /// Unique identifier for the ad, prefixed `ad_`.
    public let id: String
    public let issues: [AdPlatformIssue]
    public let primaryTexts: [AdText]
    /// Whether the ad is enabled. `active` and `paused` are set by you; `in_review` and `rejected` come from ad review.
    public let status: PostAdUpdatedPayloadDataStatus
    /// Display title of the ad.
    public let title: Nullable<String>
    /// When the ad was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The URL the ad links to, without its query string. Parameters belong in `url_parameters`; any you send on `url` are moved there.
    public let url: Nullable<String>
    /// Query parameters appended to `url`, keyed by name. Whop's click-attribution parameters are reserved.
    public let urlParameters: [String: JSONValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adCampaign: AdEntityReference,
        adGroup: AdEntityReference,
        callToAction: Nullable<PostAdUpdatedPayloadDataCallToAction>,
        contentReview: AdContentReview,
        createdAt: String,
        creatives: [AdCreative],
        deliveryStatus: PostAdUpdatedPayloadDataDeliveryStatus,
        descriptions: [AdText],
        headlines: [AdText],
        id: String,
        issues: [AdPlatformIssue],
        primaryTexts: [AdText],
        status: PostAdUpdatedPayloadDataStatus,
        title: Nullable<String>,
        updatedAt: String,
        url: Nullable<String>,
        urlParameters: [String: JSONValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adCampaign = adCampaign
        self.adGroup = adGroup
        self.callToAction = callToAction
        self.contentReview = contentReview
        self.createdAt = createdAt
        self.creatives = creatives
        self.deliveryStatus = deliveryStatus
        self.descriptions = descriptions
        self.headlines = headlines
        self.id = id
        self.issues = issues
        self.primaryTexts = primaryTexts
        self.status = status
        self.title = title
        self.updatedAt = updatedAt
        self.url = url
        self.urlParameters = urlParameters
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adCampaign = try container.decode(AdEntityReference.self, forKey: .adCampaign)
        self.adGroup = try container.decode(AdEntityReference.self, forKey: .adGroup)
        self.callToAction = try container.decode(Nullable<PostAdUpdatedPayloadDataCallToAction>.self, forKey: .callToAction)
        self.contentReview = try container.decode(AdContentReview.self, forKey: .contentReview)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.creatives = try container.decode([AdCreative].self, forKey: .creatives)
        self.deliveryStatus = try container.decode(PostAdUpdatedPayloadDataDeliveryStatus.self, forKey: .deliveryStatus)
        self.descriptions = try container.decode([AdText].self, forKey: .descriptions)
        self.headlines = try container.decode([AdText].self, forKey: .headlines)
        self.id = try container.decode(String.self, forKey: .id)
        self.issues = try container.decode([AdPlatformIssue].self, forKey: .issues)
        self.primaryTexts = try container.decode([AdText].self, forKey: .primaryTexts)
        self.status = try container.decode(PostAdUpdatedPayloadDataStatus.self, forKey: .status)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.urlParameters = try container.decode([String: JSONValue].self, forKey: .urlParameters)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adCampaign, forKey: .adCampaign)
        try container.encode(self.adGroup, forKey: .adGroup)
        try container.encode(self.callToAction, forKey: .callToAction)
        try container.encode(self.contentReview, forKey: .contentReview)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.creatives, forKey: .creatives)
        try container.encode(self.deliveryStatus, forKey: .deliveryStatus)
        try container.encode(self.descriptions, forKey: .descriptions)
        try container.encode(self.headlines, forKey: .headlines)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.issues, forKey: .issues)
        try container.encode(self.primaryTexts, forKey: .primaryTexts)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.urlParameters, forKey: .urlParameters)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adCampaign = "ad_campaign"
        case adGroup = "ad_group"
        case callToAction = "call_to_action"
        case contentReview = "content_review"
        case createdAt = "created_at"
        case creatives
        case deliveryStatus = "delivery_status"
        case descriptions
        case headlines
        case id
        case issues
        case primaryTexts = "primary_texts"
        case status
        case title
        case updatedAt = "updated_at"
        case url
        case urlParameters = "url_parameters"
    }
}