import Foundation

public struct PaymentRule: Codable, Hashable, Sendable {
    /// Account ID, prefixed `biz_`.
    public let accountId: String
    /// What this account's rule requests when every condition matches. One applicable account-rule action wins, in this order: `allow`, `block`, `review`, `enforce_3ds`. An `allow` overrides this account's other rules, never Whop's own fraud controls. A `review` requests authorization without capture for an eligible on-session card payment through Whop Payments. Automatic capture is scheduled for 48 hours after authorization; capture or void the payment before then to decide sooner. Capture may complete later or fail. Review is skipped for unsupported methods, off-session payments, and payments already configured for manual capture. An `enforce_3ds` is skipped when the account rule cannot apply a challenge. Other 3DS requirements still apply.
    public let action: PaymentRuleAction
    /// The conditions a payment is matched against. Up to 10 conditions, and 8 KiB once serialized.
    public let conditions: PaymentRuleConditions
    /// When the rule was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the rule was deleted, as an ISO 8601 timestamp. `null` unless `status` is `deleted`.
    public let deletedAt: Nullable<String>
    /// Payment rule ID, prefixed `prule_`.
    public let id: String
    /// Custom string-to-string values for your integration. Maximum 50 keys, 40 characters per key, 500 characters per value.
    public let metadata: [String: JSONValue]
    /// A name for this rule. Up to 255 characters.
    public let name: String
    /// Whether the rule is applied to payments. A `deleted` rule is kept so the payments it already decided still name it.
    public let status: PaymentRuleStatus
    /// When the rule was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        action: PaymentRuleAction,
        conditions: PaymentRuleConditions,
        createdAt: String,
        deletedAt: Nullable<String>,
        id: String,
        metadata: [String: JSONValue],
        name: String,
        status: PaymentRuleStatus,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.action = action
        self.conditions = conditions
        self.createdAt = createdAt
        self.deletedAt = deletedAt
        self.id = id
        self.metadata = metadata
        self.name = name
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.action = try container.decode(PaymentRuleAction.self, forKey: .action)
        self.conditions = try container.decode(PaymentRuleConditions.self, forKey: .conditions)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.deletedAt = try container.decode(Nullable<String>.self, forKey: .deletedAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.metadata = try container.decode([String: JSONValue].self, forKey: .metadata)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(PaymentRuleStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.conditions, forKey: .conditions)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.deletedAt, forKey: .deletedAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case action
        case conditions
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
        case id
        case metadata
        case name
        case status
        case updatedAt = "updated_at"
    }
}