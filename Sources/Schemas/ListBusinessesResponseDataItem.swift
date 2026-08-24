import Foundation

public struct ListBusinessesResponseDataItem: Codable, Hashable, Sendable {
    /// Referred account.
    public let account: Nullable<ListBusinessesResponseDataItemAccount>
    /// When the partner business was created.
    public let createdAt: Date
    public let earningsUsd: ListBusinessesResponseDataItemEarningsUsd
    /// The partner who referred the business owner onto Whop (first tier). Null if there is no active first-tier partner.
    public let firstTierPartner: Nullable<ListBusinessesResponseDataItemFirstTierPartner>
    /// Partner business ID.
    public let id: String
    /// Which tier the caller earns on for this business: `first` (they referred the owner) or `second` (they referred the first-tier partner).
    public let myPartnerTier: ListBusinessesResponseDataItemMyPartnerTier
    public let object: ListBusinessesResponseDataItemObject
    /// The owner of the referred business.
    public let owner: Nullable<ListBusinessesResponseDataItemOwner>
    /// The referrer's commission rate for each income source, expressed as a fraction (0.3 = 30%).
    public let payoutPercentages: ListBusinessesResponseDataItemPayoutPercentages
    /// When the referral expires.
    public let referralExpiresAt: Nullable<Date>
    /// When the referral became active.
    public let referralStartedAt: Nullable<Date>
    /// The second-tier partner who earns on this business (referred the first-tier partner). Null if there is no active second-tier partner.
    public let secondTierPartner: Nullable<ListBusinessesResponseDataItemSecondTierPartner>
    /// Current referral status.
    public let status: ListBusinessesResponseDataItemStatus
    public let volumeUsd: ListBusinessesResponseDataItemVolumeUsd
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<ListBusinessesResponseDataItemAccount>,
        createdAt: Date,
        earningsUsd: ListBusinessesResponseDataItemEarningsUsd,
        firstTierPartner: Nullable<ListBusinessesResponseDataItemFirstTierPartner>,
        id: String,
        myPartnerTier: ListBusinessesResponseDataItemMyPartnerTier,
        object: ListBusinessesResponseDataItemObject,
        owner: Nullable<ListBusinessesResponseDataItemOwner>,
        payoutPercentages: ListBusinessesResponseDataItemPayoutPercentages,
        referralExpiresAt: Nullable<Date>,
        referralStartedAt: Nullable<Date>,
        secondTierPartner: Nullable<ListBusinessesResponseDataItemSecondTierPartner>,
        status: ListBusinessesResponseDataItemStatus,
        volumeUsd: ListBusinessesResponseDataItemVolumeUsd,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.createdAt = createdAt
        self.earningsUsd = earningsUsd
        self.firstTierPartner = firstTierPartner
        self.id = id
        self.myPartnerTier = myPartnerTier
        self.object = object
        self.owner = owner
        self.payoutPercentages = payoutPercentages
        self.referralExpiresAt = referralExpiresAt
        self.referralStartedAt = referralStartedAt
        self.secondTierPartner = secondTierPartner
        self.status = status
        self.volumeUsd = volumeUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<ListBusinessesResponseDataItemAccount>.self, forKey: .account)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.earningsUsd = try container.decode(ListBusinessesResponseDataItemEarningsUsd.self, forKey: .earningsUsd)
        self.firstTierPartner = try container.decode(Nullable<ListBusinessesResponseDataItemFirstTierPartner>.self, forKey: .firstTierPartner)
        self.id = try container.decode(String.self, forKey: .id)
        self.myPartnerTier = try container.decode(ListBusinessesResponseDataItemMyPartnerTier.self, forKey: .myPartnerTier)
        self.object = try container.decode(ListBusinessesResponseDataItemObject.self, forKey: .object)
        self.owner = try container.decode(Nullable<ListBusinessesResponseDataItemOwner>.self, forKey: .owner)
        self.payoutPercentages = try container.decode(ListBusinessesResponseDataItemPayoutPercentages.self, forKey: .payoutPercentages)
        self.referralExpiresAt = try container.decode(Nullable<Date>.self, forKey: .referralExpiresAt)
        self.referralStartedAt = try container.decode(Nullable<Date>.self, forKey: .referralStartedAt)
        self.secondTierPartner = try container.decode(Nullable<ListBusinessesResponseDataItemSecondTierPartner>.self, forKey: .secondTierPartner)
        self.status = try container.decode(ListBusinessesResponseDataItemStatus.self, forKey: .status)
        self.volumeUsd = try container.decode(ListBusinessesResponseDataItemVolumeUsd.self, forKey: .volumeUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.earningsUsd, forKey: .earningsUsd)
        try container.encode(self.firstTierPartner, forKey: .firstTierPartner)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.myPartnerTier, forKey: .myPartnerTier)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.owner, forKey: .owner)
        try container.encode(self.payoutPercentages, forKey: .payoutPercentages)
        try container.encode(self.referralExpiresAt, forKey: .referralExpiresAt)
        try container.encode(self.referralStartedAt, forKey: .referralStartedAt)
        try container.encode(self.secondTierPartner, forKey: .secondTierPartner)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.volumeUsd, forKey: .volumeUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case createdAt = "created_at"
        case earningsUsd = "earnings_usd"
        case firstTierPartner = "first_tier_partner"
        case id
        case myPartnerTier = "my_partner_tier"
        case object
        case owner
        case payoutPercentages = "payout_percentages"
        case referralExpiresAt = "referral_expires_at"
        case referralStartedAt = "referral_started_at"
        case secondTierPartner = "second_tier_partner"
        case status
        case volumeUsd = "volume_usd"
    }
}