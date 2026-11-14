import Foundation

public struct WaitlistEntry: Codable, Hashable, Sendable {
    /// The seller account, prefixed `biz_`.
    public let accountId: String
    /// Why the last approval attempt failed, or `null` when none has. `plan_unavailable` — the variant, product, or seller account was deleted. `already_member` — the user already has a membership on a one-per-user product. `checkout_failed` — checkout failed, usually a declined payment, and the signup was denied. `unknown` — another failure; retry. Cleared when approval is requeued.
    public let approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>
    /// The account the signup was submitted on behalf of, or `null` when the user signed up for themselves.
    public let buyerAccount: Nullable<StorefrontAccount>
    /// The account the signup was submitted on behalf of, prefixed `biz_`, or `null` when the user signed up for themselves.
    public let buyerAccountId: Nullable<String>
    /// When this signup was submitted, as an ISO 8601 timestamp.
    public let createdAt: String
    public let customFieldResponses: [WaitlistEntryCustomFieldResponse]
    /// The waitlist signup ID, prefixed `entry_`.
    public let id: String
    /// The membership created for this signup, prefixed `mem_`, or `null` when there is none. Check the membership's status to determine access.
    public let membershipId: Nullable<String>
    /// Custom key-value metadata associated with this signup.
    public let metadata: [String: JSONValue]
    /// The product this signup belongs to, or `null` when the variant has no product.
    public let product: Nullable<WaitlistEntryProduct>
    /// The product this signup belongs to, prefixed `prod_`, or `null` when the variant has no product.
    public let productId: Nullable<String>
    /// The signup's current state. Approval runs asynchronously, so a signup stays `pending` until processing completes. `approved` alone does not prove an active membership; check `membership_id`.
    public let status: WaitlistEntryStatus
    /// When this signup last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The user who submitted this signup. For a signup an account's own credential submitted, the account's owner.
    public let user: UserSummary
    /// The user who submitted this signup, prefixed `user_`. For a signup an account's own credential submitted, the account's owner.
    public let userId: String
    /// The variant this signup belongs to.
    public let variant: WaitlistEntryVariant
    /// The variant this signup belongs to, prefixed `plan_`.
    public let variantId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        approvalFailureReason: Nullable<WaitlistEntryApprovalFailureReason>,
        buyerAccount: Nullable<StorefrontAccount>,
        buyerAccountId: Nullable<String>,
        createdAt: String,
        customFieldResponses: [WaitlistEntryCustomFieldResponse],
        id: String,
        membershipId: Nullable<String>,
        metadata: [String: JSONValue],
        product: Nullable<WaitlistEntryProduct>,
        productId: Nullable<String>,
        status: WaitlistEntryStatus,
        updatedAt: String,
        user: UserSummary,
        userId: String,
        variant: WaitlistEntryVariant,
        variantId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.approvalFailureReason = approvalFailureReason
        self.buyerAccount = buyerAccount
        self.buyerAccountId = buyerAccountId
        self.createdAt = createdAt
        self.customFieldResponses = customFieldResponses
        self.id = id
        self.membershipId = membershipId
        self.metadata = metadata
        self.product = product
        self.productId = productId
        self.status = status
        self.updatedAt = updatedAt
        self.user = user
        self.userId = userId
        self.variant = variant
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.approvalFailureReason = try container.decode(Nullable<WaitlistEntryApprovalFailureReason>.self, forKey: .approvalFailureReason)
        self.buyerAccount = try container.decode(Nullable<StorefrontAccount>.self, forKey: .buyerAccount)
        self.buyerAccountId = try container.decode(Nullable<String>.self, forKey: .buyerAccountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customFieldResponses = try container.decode([WaitlistEntryCustomFieldResponse].self, forKey: .customFieldResponses)
        self.id = try container.decode(String.self, forKey: .id)
        self.membershipId = try container.decode(Nullable<String>.self, forKey: .membershipId)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.product = try container.decode(Nullable<WaitlistEntryProduct>.self, forKey: .product)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.status = try container.decode(WaitlistEntryStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.user = try container.decode(UserSummary.self, forKey: .user)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.variant = try container.decode(WaitlistEntryVariant.self, forKey: .variant)
        self.variantId = try container.decode(String.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.approvalFailureReason, forKey: .approvalFailureReason)
        try container.encode(self.buyerAccount, forKey: .buyerAccount)
        try container.encode(self.buyerAccountId, forKey: .buyerAccountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customFieldResponses, forKey: .customFieldResponses)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.membershipId, forKey: .membershipId)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.variant, forKey: .variant)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case approvalFailureReason = "approval_failure_reason"
        case buyerAccount = "buyer_account"
        case buyerAccountId = "buyer_account_id"
        case createdAt = "created_at"
        case customFieldResponses = "custom_field_responses"
        case id
        case membershipId = "membership_id"
        case metadata
        case product
        case productId = "product_id"
        case status
        case updatedAt = "updated_at"
        case user
        case userId = "user_id"
        case variant
        case variantId = "variant_id"
    }
}