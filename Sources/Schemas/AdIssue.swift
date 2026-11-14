import Foundation

public struct AdIssue: Codable, Hashable, Sendable {
    /// When the issue was first reported, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The issue's ID, prefixed `adiss_`.
    public let id: String
    /// What the account running the campaign reads for the issue.
    public let message: String
    /// The policy a `content_rejected` ad broke, or `null` when none was reported.
    public let policy: Nullable<AdIssuePolicy>
    /// Why the ad or ad group can't deliver yet, as reported.
    public let reason: AdIssueReason
    /// The ID of the ad or ad group the issue is on.
    public let resourceId: Nullable<String>
    /// The type of object the issue is on.
    public let resourceType: AdIssueResourceType
    /// When the issue was last reported or changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        id: String,
        message: String,
        policy: Nullable<AdIssuePolicy>,
        reason: AdIssueReason,
        resourceId: Nullable<String>,
        resourceType: AdIssueResourceType,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.message = message
        self.policy = policy
        self.reason = reason
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.message = try container.decode(String.self, forKey: .message)
        self.policy = try container.decode(Nullable<AdIssuePolicy>.self, forKey: .policy)
        self.reason = try container.decode(AdIssueReason.self, forKey: .reason)
        self.resourceId = try container.decode(Nullable<String>.self, forKey: .resourceId)
        self.resourceType = try container.decode(AdIssueResourceType.self, forKey: .resourceType)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.policy, forKey: .policy)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.resourceType, forKey: .resourceType)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case message
        case policy
        case reason
        case resourceId = "resource_id"
        case resourceType = "resource_type"
        case updatedAt = "updated_at"
    }
}