import Foundation

public struct ListBusinessesResponseDataItem: Codable, Hashable, Sendable {
    /// Referred account.
    public let account: Nullable<ListBusinessesResponseDataItemAccount>
    /// The partner whose blueprint the business deployed. Null unless this is a blueprint referral.
    public let blueprintPartner: Nullable<ListBusinessesResponseDataItemBlueprintPartner>
    /// CPA terms for the referring partner. Read with referring_account_id, the business's owner sees every rep's terms and a manager sees those of the reps below them, read-only. Omitted for other callers. An offer token is only for the referring partner and requires partner:commission_advance:accept permission.
    public let commissionAdvance: Nullable<PartnerAdvance>?
    /// Whether this referral meets the partner and ownership requirements for saving commission advance projections. Returned only to the referring partner; existing advance terms and update permissions still apply.
    public let commissionAdvanceProjectionsAllowed: Bool?
    /// When the partner business was created.
    public let createdAt: Date
    /// How the partner closed this business, in their own words. Null until the partner saves one.
    public let dealClosedReason: Nullable<String>
    public let earningsUsd: ListBusinessesResponseDataItemEarningsUsd
    /// The partner who referred the business owner onto Whop (first tier). Null if there is no active first-tier partner.
    public let firstTierPartner: Nullable<ListBusinessesResponseDataItemFirstTierPartner>
    /// Partner business ID.
    public let id: String
    /// Which tier the caller earns on for this business: `first` (they referred the owner), `second` (they referred the first-tier partner), or `blueprint` (the business deployed a site from their blueprint).
    public let myPartnerTier: ListBusinessesResponseDataItemMyPartnerTier
    public let object: ListBusinessesResponseDataItemObject
    /// The owner of the referred business.
    public let owner: Nullable<ListBusinessesResponseDataItemOwner>
    /// The commission rate this referral pays for each income source, as a fraction (0.3 = 30%). A solo partner earns it directly; the team of a referring partner business splits it by their shares.
    public let payoutPercentages: ListBusinessesResponseDataItemPayoutPercentages
    /// When the referral expires.
    public let referralExpiresAt: Nullable<Date>
    /// When the referral became active.
    public let referralStartedAt: Nullable<Date>
    /// The partner business whose team member made this referral, the one its commission is paid to. Null for a solo partner's referral.
    public let referringBusiness: Nullable<ListBusinessesResponseDataItemReferringBusiness>?
    /// The second-tier partner who earns on this business (referred the first-tier partner). Null if there is no active second-tier partner.
    public let secondTierPartner: Nullable<ListBusinessesResponseDataItemSecondTierPartner>
    /// Current referral status.
    public let status: ListBusinessesResponseDataItemStatus
    public let volumeUsd: ListBusinessesResponseDataItemVolumeUsd
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<ListBusinessesResponseDataItemAccount>,
        blueprintPartner: Nullable<ListBusinessesResponseDataItemBlueprintPartner>,
        commissionAdvance: Nullable<PartnerAdvance>? = nil,
        commissionAdvanceProjectionsAllowed: Bool? = nil,
        createdAt: Date,
        dealClosedReason: Nullable<String>,
        earningsUsd: ListBusinessesResponseDataItemEarningsUsd,
        firstTierPartner: Nullable<ListBusinessesResponseDataItemFirstTierPartner>,
        id: String,
        myPartnerTier: ListBusinessesResponseDataItemMyPartnerTier,
        object: ListBusinessesResponseDataItemObject,
        owner: Nullable<ListBusinessesResponseDataItemOwner>,
        payoutPercentages: ListBusinessesResponseDataItemPayoutPercentages,
        referralExpiresAt: Nullable<Date>,
        referralStartedAt: Nullable<Date>,
        referringBusiness: Nullable<ListBusinessesResponseDataItemReferringBusiness>? = nil,
        secondTierPartner: Nullable<ListBusinessesResponseDataItemSecondTierPartner>,
        status: ListBusinessesResponseDataItemStatus,
        volumeUsd: ListBusinessesResponseDataItemVolumeUsd,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.blueprintPartner = blueprintPartner
        self.commissionAdvance = commissionAdvance
        self.commissionAdvanceProjectionsAllowed = commissionAdvanceProjectionsAllowed
        self.createdAt = createdAt
        self.dealClosedReason = dealClosedReason
        self.earningsUsd = earningsUsd
        self.firstTierPartner = firstTierPartner
        self.id = id
        self.myPartnerTier = myPartnerTier
        self.object = object
        self.owner = owner
        self.payoutPercentages = payoutPercentages
        self.referralExpiresAt = referralExpiresAt
        self.referralStartedAt = referralStartedAt
        self.referringBusiness = referringBusiness
        self.secondTierPartner = secondTierPartner
        self.status = status
        self.volumeUsd = volumeUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<ListBusinessesResponseDataItemAccount>.self, forKey: .account)
        self.blueprintPartner = try container.decode(Nullable<ListBusinessesResponseDataItemBlueprintPartner>.self, forKey: .blueprintPartner)
        self.commissionAdvance = try container.decodeNullableIfPresent(PartnerAdvance.self, forKey: .commissionAdvance)
        self.commissionAdvanceProjectionsAllowed = try container.decodeIfPresent(Bool.self, forKey: .commissionAdvanceProjectionsAllowed)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.dealClosedReason = try container.decode(Nullable<String>.self, forKey: .dealClosedReason)
        self.earningsUsd = try container.decode(ListBusinessesResponseDataItemEarningsUsd.self, forKey: .earningsUsd)
        self.firstTierPartner = try container.decode(Nullable<ListBusinessesResponseDataItemFirstTierPartner>.self, forKey: .firstTierPartner)
        self.id = try container.decode(String.self, forKey: .id)
        self.myPartnerTier = try container.decode(ListBusinessesResponseDataItemMyPartnerTier.self, forKey: .myPartnerTier)
        self.object = try container.decode(ListBusinessesResponseDataItemObject.self, forKey: .object)
        self.owner = try container.decode(Nullable<ListBusinessesResponseDataItemOwner>.self, forKey: .owner)
        self.payoutPercentages = try container.decode(ListBusinessesResponseDataItemPayoutPercentages.self, forKey: .payoutPercentages)
        self.referralExpiresAt = try container.decode(Nullable<Date>.self, forKey: .referralExpiresAt)
        self.referralStartedAt = try container.decode(Nullable<Date>.self, forKey: .referralStartedAt)
        self.referringBusiness = try container.decodeNullableIfPresent(ListBusinessesResponseDataItemReferringBusiness.self, forKey: .referringBusiness)
        self.secondTierPartner = try container.decode(Nullable<ListBusinessesResponseDataItemSecondTierPartner>.self, forKey: .secondTierPartner)
        self.status = try container.decode(ListBusinessesResponseDataItemStatus.self, forKey: .status)
        self.volumeUsd = try container.decode(ListBusinessesResponseDataItemVolumeUsd.self, forKey: .volumeUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.blueprintPartner, forKey: .blueprintPartner)
        try container.encodeNullableIfPresent(self.commissionAdvance, forKey: .commissionAdvance)
        try container.encodeIfPresent(self.commissionAdvanceProjectionsAllowed, forKey: .commissionAdvanceProjectionsAllowed)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.dealClosedReason, forKey: .dealClosedReason)
        try container.encode(self.earningsUsd, forKey: .earningsUsd)
        try container.encode(self.firstTierPartner, forKey: .firstTierPartner)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.myPartnerTier, forKey: .myPartnerTier)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.owner, forKey: .owner)
        try container.encode(self.payoutPercentages, forKey: .payoutPercentages)
        try container.encode(self.referralExpiresAt, forKey: .referralExpiresAt)
        try container.encode(self.referralStartedAt, forKey: .referralStartedAt)
        try container.encodeNullableIfPresent(self.referringBusiness, forKey: .referringBusiness)
        try container.encode(self.secondTierPartner, forKey: .secondTierPartner)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.volumeUsd, forKey: .volumeUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case blueprintPartner = "blueprint_partner"
        case commissionAdvance = "commission_advance"
        case commissionAdvanceProjectionsAllowed = "commission_advance_projections_allowed"
        case createdAt = "created_at"
        case dealClosedReason = "deal_closed_reason"
        case earningsUsd = "earnings_usd"
        case firstTierPartner = "first_tier_partner"
        case id
        case myPartnerTier = "my_partner_tier"
        case object
        case owner
        case payoutPercentages = "payout_percentages"
        case referralExpiresAt = "referral_expires_at"
        case referralStartedAt = "referral_started_at"
        case referringBusiness = "referring_business"
        case secondTierPartner = "second_tier_partner"
        case status
        case volumeUsd = "volume_usd"
    }
}