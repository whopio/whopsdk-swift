import Foundation

public struct ReviewReport: Codable, Hashable, Sendable {
    /// When the report was filed, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The report ID, prefixed `rrpt_`.
    public let id: String
    /// The reason the reporter gave for reporting the review.
    public let reason: String
    /// The ID of the review that was reported, prefixed `rev_`.
    public let reviewId: String
    /// Where the report stands. `pending` reports are waiting for Whop staff, `accepted` reports led to the review being removed, and `rejected` reports left the review up.
    public let status: ReviewReportStatus
    /// When the report last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The ID of the user who filed the report, prefixed `user_`. Null if that user no longer exists.
    public let userId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        id: String,
        reason: String,
        reviewId: String,
        status: ReviewReportStatus,
        updatedAt: String,
        userId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.reason = reason
        self.reviewId = reviewId
        self.status = status
        self.updatedAt = updatedAt
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.reason = try container.decode(String.self, forKey: .reason)
        self.reviewId = try container.decode(String.self, forKey: .reviewId)
        self.status = try container.decode(ReviewReportStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.reviewId, forKey: .reviewId)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case reason
        case reviewId = "review_id"
        case status
        case updatedAt = "updated_at"
        case userId = "user_id"
    }
}