import Foundation

public struct MembershipAffiliate: Codable, Hashable, Sendable {
    /// Whether the commission is paid on the membership's first payment only or on all its payments.
    public let appliesToPayments: MembershipAffiliateAppliesToPayments
    /// The flat fee commission in the membership currency, or `null` for a percentage.
    public let commissionAmount: Nullable<Money>
    /// The percentage commission in percentage points, so `20` means 20%, or `null` for a flat fee.
    public let commissionPercentage: Nullable<Double>
    /// How the commission rate was set: `custom` for a rate set for this affiliate, `member` for the member affiliate rate of the plan or product, `global` for the product's global affiliate rate, or `marketplace` for a Whop marketplace referral.
    public let commissionSource: MembershipAffiliateCommissionSource
    /// Whether the commission is a percentage or a flat fee.
    public let commissionType: MembershipAffiliateCommissionType
    /// Whether this membership pays affiliate commissions. `false` means the affiliate is kept on the membership but is no longer paid.
    public let enabled: Bool
    /// Affiliate ID, prefixed `aff_`.
    public let id: String
    /// ID of the affiliate's user, prefixed `user_`.
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appliesToPayments: MembershipAffiliateAppliesToPayments,
        commissionAmount: Nullable<Money>,
        commissionPercentage: Nullable<Double>,
        commissionSource: MembershipAffiliateCommissionSource,
        commissionType: MembershipAffiliateCommissionType,
        enabled: Bool,
        id: String,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appliesToPayments = appliesToPayments
        self.commissionAmount = commissionAmount
        self.commissionPercentage = commissionPercentage
        self.commissionSource = commissionSource
        self.commissionType = commissionType
        self.enabled = enabled
        self.id = id
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appliesToPayments = try container.decode(MembershipAffiliateAppliesToPayments.self, forKey: .appliesToPayments)
        self.commissionAmount = try container.decode(Nullable<Money>.self, forKey: .commissionAmount)
        self.commissionPercentage = try container.decode(Nullable<Double>.self, forKey: .commissionPercentage)
        self.commissionSource = try container.decode(MembershipAffiliateCommissionSource.self, forKey: .commissionSource)
        self.commissionType = try container.decode(MembershipAffiliateCommissionType.self, forKey: .commissionType)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.id = try container.decode(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.appliesToPayments, forKey: .appliesToPayments)
        try container.encode(self.commissionAmount, forKey: .commissionAmount)
        try container.encode(self.commissionPercentage, forKey: .commissionPercentage)
        try container.encode(self.commissionSource, forKey: .commissionSource)
        try container.encode(self.commissionType, forKey: .commissionType)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appliesToPayments = "applies_to_payments"
        case commissionAmount = "commission_amount"
        case commissionPercentage = "commission_percentage"
        case commissionSource = "commission_source"
        case commissionType = "commission_type"
        case enabled
        case id
        case userId = "user_id"
    }
}