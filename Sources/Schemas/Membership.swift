import Foundation

public struct Membership: Codable, Hashable, Sendable {
    /// The account (seller) this membership belongs to.
    public let account: MembershipAccount
    /// Whether the membership is set to cancel when the current billing period ends. Only meaningful for recurring plans.
    public let cancelAtPeriodEnd: Bool
    /// When the membership was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the current billing period renews, or when a non-renewing membership expires, as an ISO 8601 timestamp. `null` for one-time purchases with no expiration.
    public let currentPeriodEnd: Nullable<String>
    /// Membership ID, prefixed `mem_`.
    public let id: String
    /// The software license key for this membership. Only present when the product includes a software licensing experience.
    public let licenseKey: Nullable<String>
    /// The caller's member row on the account. Present only when the membership belongs to the caller; `null` on seller-side reads.
    public let member: Nullable<MembershipMember>
    /// Custom key-value pairs stored on the membership, commonly used for software licensing.
    public let metadata: [String: JSONValue]
    /// The plan the buyer purchased, prefixed `plan_`.
    public let planId: String
    /// The product this membership grants access to, prefixed `prod_`.
    public let productId: String
    /// Billing state of the membership. `active`/`trialing` memberships grant access; `past_due` is the grace period after a failed payment; `completed` one-time purchases keep access; `canceled`/`expired` do not.
    public let status: MembershipStatus
    /// The buyer, prefixed `user_`. `null` when the buyer is another business or the membership is unclaimed.
    public let userId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: MembershipAccount,
        cancelAtPeriodEnd: Bool,
        createdAt: String,
        currentPeriodEnd: Nullable<String>,
        id: String,
        licenseKey: Nullable<String>,
        member: Nullable<MembershipMember>,
        metadata: [String: JSONValue],
        planId: String,
        productId: String,
        status: MembershipStatus,
        userId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.cancelAtPeriodEnd = cancelAtPeriodEnd
        self.createdAt = createdAt
        self.currentPeriodEnd = currentPeriodEnd
        self.id = id
        self.licenseKey = licenseKey
        self.member = member
        self.metadata = metadata
        self.planId = planId
        self.productId = productId
        self.status = status
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(MembershipAccount.self, forKey: .account)
        self.cancelAtPeriodEnd = try container.decode(Bool.self, forKey: .cancelAtPeriodEnd)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.currentPeriodEnd = try container.decode(Nullable<String>.self, forKey: .currentPeriodEnd)
        self.id = try container.decode(String.self, forKey: .id)
        self.licenseKey = try container.decode(Nullable<String>.self, forKey: .licenseKey)
        self.member = try container.decode(Nullable<MembershipMember>.self, forKey: .member)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.planId = try container.decode(String.self, forKey: .planId)
        self.productId = try container.decode(String.self, forKey: .productId)
        self.status = try container.decode(MembershipStatus.self, forKey: .status)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.cancelAtPeriodEnd, forKey: .cancelAtPeriodEnd)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.currentPeriodEnd, forKey: .currentPeriodEnd)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.licenseKey, forKey: .licenseKey)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.planId, forKey: .planId)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case cancelAtPeriodEnd = "cancel_at_period_end"
        case createdAt = "created_at"
        case currentPeriodEnd = "current_period_end"
        case id
        case licenseKey = "license_key"
        case member
        case metadata
        case planId = "plan_id"
        case productId = "product_id"
        case status
        case userId = "user_id"
    }
}