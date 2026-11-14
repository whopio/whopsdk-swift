import Foundation

/// Hydrated details for the records this event references. Only present keys resolved.
public struct ListEventsResponseDataItemRelated: Codable, Hashable, Sendable {
    public let account: Nullable<ListEventsResponseDataItemRelatedAccount>?
    /// The Whop ad this event's click resolved to.
    public let ad: Nullable<ListEventsResponseDataItemRelatedAd>?
    /// The Whop ad campaign this event's click resolved to, read from the ad entity tree rather than the click's url params.
    public let adCampaign: Nullable<ListEventsResponseDataItemRelatedAdCampaign>?
    /// The Whop ad group this event's click resolved to.
    public let adGroup: Nullable<ListEventsResponseDataItemRelatedAdGroup>?
    public let app: Nullable<ListEventsResponseDataItemRelatedApp>?
    /// The saved audience this event came from. Present on the identify events an audience ingest writes for each of its members.
    public let audience: Nullable<ListEventsResponseDataItemRelatedAudience>?
    public let payment: Nullable<ListEventsResponseDataItemRelatedPayment>?
    public let product: Nullable<ListEventsResponseDataItemRelatedProduct>?
    public let user: Nullable<ListEventsResponseDataItemRelatedUser>?
    public let variant: Nullable<ListEventsResponseDataItemRelatedVariant>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<ListEventsResponseDataItemRelatedAccount>? = nil,
        ad: Nullable<ListEventsResponseDataItemRelatedAd>? = nil,
        adCampaign: Nullable<ListEventsResponseDataItemRelatedAdCampaign>? = nil,
        adGroup: Nullable<ListEventsResponseDataItemRelatedAdGroup>? = nil,
        app: Nullable<ListEventsResponseDataItemRelatedApp>? = nil,
        audience: Nullable<ListEventsResponseDataItemRelatedAudience>? = nil,
        payment: Nullable<ListEventsResponseDataItemRelatedPayment>? = nil,
        product: Nullable<ListEventsResponseDataItemRelatedProduct>? = nil,
        user: Nullable<ListEventsResponseDataItemRelatedUser>? = nil,
        variant: Nullable<ListEventsResponseDataItemRelatedVariant>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.ad = ad
        self.adCampaign = adCampaign
        self.adGroup = adGroup
        self.app = app
        self.audience = audience
        self.payment = payment
        self.product = product
        self.user = user
        self.variant = variant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedAccount.self, forKey: .account)
        self.ad = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedAd.self, forKey: .ad)
        self.adCampaign = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedAdCampaign.self, forKey: .adCampaign)
        self.adGroup = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedAdGroup.self, forKey: .adGroup)
        self.app = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedApp.self, forKey: .app)
        self.audience = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedAudience.self, forKey: .audience)
        self.payment = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedPayment.self, forKey: .payment)
        self.product = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedProduct.self, forKey: .product)
        self.user = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedUser.self, forKey: .user)
        self.variant = try container.decodeNullableIfPresent(ListEventsResponseDataItemRelatedVariant.self, forKey: .variant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.account, forKey: .account)
        try container.encodeNullableIfPresent(self.ad, forKey: .ad)
        try container.encodeNullableIfPresent(self.adCampaign, forKey: .adCampaign)
        try container.encodeNullableIfPresent(self.adGroup, forKey: .adGroup)
        try container.encodeNullableIfPresent(self.app, forKey: .app)
        try container.encodeNullableIfPresent(self.audience, forKey: .audience)
        try container.encodeNullableIfPresent(self.payment, forKey: .payment)
        try container.encodeNullableIfPresent(self.product, forKey: .product)
        try container.encodeNullableIfPresent(self.user, forKey: .user)
        try container.encodeNullableIfPresent(self.variant, forKey: .variant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case ad
        case adCampaign = "ad_campaign"
        case adGroup = "ad_group"
        case app
        case audience
        case payment
        case product
        case user
        case variant
    }
}