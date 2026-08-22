import Foundation

/// A commission configuration for an affiliate, defining payout terms for a specific plan or revenue share
public struct ListOverridesResponseDataItem: Codable, Hashable, Sendable {
    /// Whether the commission applies to the first payment only or all payments (standard overrides only).
    public let appliesToPayments: Nullable<AffiliateAppliesToPayments>
    /// Whether this rev-share override applies to a single product or all products (rev-share only).
    public let appliesToProducts: Nullable<AffiliateAppliesToProducts>
    /// The checkout direct link for referrals (standard overrides only).
    public let checkoutDirectLink: Nullable<String>
    /// The type of commission (percentage or flat_fee).
    public let commissionType: AffiliatePayoutTypes
    /// The commission amount. A percentage (1-100) when commission_type is percentage, or a dollar amount when flat_fee.
    public let commissionValue: Double
    /// The unique identifier for the affiliate override.
    public let id: String
    /// The type of override (standard or rev_share).
    public let overrideType: AffiliateOverrideRoles
    /// The plan ID (for standard overrides).
    public let planId: Nullable<String>
    /// The product page direct link for referrals (standard overrides only).
    public let productDirectLink: Nullable<String>
    /// The product ID (for rev-share overrides).
    public let productId: Nullable<String>
    /// The revenue calculation basis (pre_fees or post_fees).
    public let revenueBasis: Nullable<AffiliateRevenueBases>
    /// The total earnings paid to this affiliate for referrals to this specific plan, in USD.
    public let totalReferralEarningsUsd: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appliesToPayments: Nullable<AffiliateAppliesToPayments>,
        appliesToProducts: Nullable<AffiliateAppliesToProducts>,
        checkoutDirectLink: Nullable<String>,
        commissionType: AffiliatePayoutTypes,
        commissionValue: Double,
        id: String,
        overrideType: AffiliateOverrideRoles,
        planId: Nullable<String>,
        productDirectLink: Nullable<String>,
        productId: Nullable<String>,
        revenueBasis: Nullable<AffiliateRevenueBases>,
        totalReferralEarningsUsd: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appliesToPayments = appliesToPayments
        self.appliesToProducts = appliesToProducts
        self.checkoutDirectLink = checkoutDirectLink
        self.commissionType = commissionType
        self.commissionValue = commissionValue
        self.id = id
        self.overrideType = overrideType
        self.planId = planId
        self.productDirectLink = productDirectLink
        self.productId = productId
        self.revenueBasis = revenueBasis
        self.totalReferralEarningsUsd = totalReferralEarningsUsd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appliesToPayments = try container.decode(Nullable<AffiliateAppliesToPayments>.self, forKey: .appliesToPayments)
        self.appliesToProducts = try container.decode(Nullable<AffiliateAppliesToProducts>.self, forKey: .appliesToProducts)
        self.checkoutDirectLink = try container.decode(Nullable<String>.self, forKey: .checkoutDirectLink)
        self.commissionType = try container.decode(AffiliatePayoutTypes.self, forKey: .commissionType)
        self.commissionValue = try container.decode(Double.self, forKey: .commissionValue)
        self.id = try container.decode(String.self, forKey: .id)
        self.overrideType = try container.decode(AffiliateOverrideRoles.self, forKey: .overrideType)
        self.planId = try container.decode(Nullable<String>.self, forKey: .planId)
        self.productDirectLink = try container.decode(Nullable<String>.self, forKey: .productDirectLink)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.revenueBasis = try container.decode(Nullable<AffiliateRevenueBases>.self, forKey: .revenueBasis)
        self.totalReferralEarningsUsd = try container.decode(Double.self, forKey: .totalReferralEarningsUsd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.appliesToPayments, forKey: .appliesToPayments)
        try container.encode(self.appliesToProducts, forKey: .appliesToProducts)
        try container.encode(self.checkoutDirectLink, forKey: .checkoutDirectLink)
        try container.encode(self.commissionType, forKey: .commissionType)
        try container.encode(self.commissionValue, forKey: .commissionValue)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.overrideType, forKey: .overrideType)
        try container.encode(self.planId, forKey: .planId)
        try container.encode(self.productDirectLink, forKey: .productDirectLink)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.revenueBasis, forKey: .revenueBasis)
        try container.encode(self.totalReferralEarningsUsd, forKey: .totalReferralEarningsUsd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appliesToPayments = "applies_to_payments"
        case appliesToProducts = "applies_to_products"
        case checkoutDirectLink = "checkout_direct_link"
        case commissionType = "commission_type"
        case commissionValue = "commission_value"
        case id
        case overrideType = "override_type"
        case planId = "plan_id"
        case productDirectLink = "product_direct_link"
        case productId = "product_id"
        case revenueBasis = "revenue_basis"
        case totalReferralEarningsUsd = "total_referral_earnings_usd"
    }
}