import Foundation

public struct PublicBountySubmission: Codable, Hashable, Sendable {
    /// The bounty the work was submitted to, prefixed `bnty_`.
    public let bountyId: String
    /// When the worker claimed the submission, as an ISO 8601 timestamp.
    public let claimedAt: Nullable<String>
    /// When the submission was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Why the submission was denied, when a presentable reason exists. Always `null` unless `status` is `denied`.
    public let denialReason: Nullable<String>
    /// Submission ID, prefixed `btys_`.
    public let id: String
    /// Latest public proof livestream attached to the submission.
    public let latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>
    /// When the submission was approved or denied, as an ISO 8601 timestamp. `null` until then.
    public let resolvedAt: Nullable<String>
    /// Lifecycle state. `submitted` submissions await review; `approved` submissions were accepted and paid; `denied` submissions were rejected. In-progress attempts never appear on the public list.
    public let status: PublicBountySubmissionStatus
    /// When proof was submitted for review, as an ISO 8601 timestamp.
    public let submittedAt: Nullable<String>
    /// When the submission was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// User who submitted the work.
    public let worker: UserSummary
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bountyId: String,
        claimedAt: Nullable<String>,
        createdAt: String,
        denialReason: Nullable<String>,
        id: String,
        latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>,
        resolvedAt: Nullable<String>,
        status: PublicBountySubmissionStatus,
        submittedAt: Nullable<String>,
        updatedAt: String,
        worker: UserSummary,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bountyId = bountyId
        self.claimedAt = claimedAt
        self.createdAt = createdAt
        self.denialReason = denialReason
        self.id = id
        self.latestProofLivestreamFeed = latestProofLivestreamFeed
        self.resolvedAt = resolvedAt
        self.status = status
        self.submittedAt = submittedAt
        self.updatedAt = updatedAt
        self.worker = worker
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bountyId = try container.decode(String.self, forKey: .bountyId)
        self.claimedAt = try container.decode(Nullable<String>.self, forKey: .claimedAt)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.denialReason = try container.decode(Nullable<String>.self, forKey: .denialReason)
        self.id = try container.decode(String.self, forKey: .id)
        self.latestProofLivestreamFeed = try container.decode(Nullable<BountySubmissionLivestreamFeed>.self, forKey: .latestProofLivestreamFeed)
        self.resolvedAt = try container.decode(Nullable<String>.self, forKey: .resolvedAt)
        self.status = try container.decode(PublicBountySubmissionStatus.self, forKey: .status)
        self.submittedAt = try container.decode(Nullable<String>.self, forKey: .submittedAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.worker = try container.decode(UserSummary.self, forKey: .worker)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bountyId, forKey: .bountyId)
        try container.encode(self.claimedAt, forKey: .claimedAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.denialReason, forKey: .denialReason)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.latestProofLivestreamFeed, forKey: .latestProofLivestreamFeed)
        try container.encode(self.resolvedAt, forKey: .resolvedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.submittedAt, forKey: .submittedAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.worker, forKey: .worker)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bountyId = "bounty_id"
        case claimedAt = "claimed_at"
        case createdAt = "created_at"
        case denialReason = "denial_reason"
        case id
        case latestProofLivestreamFeed = "latest_proof_livestream_feed"
        case resolvedAt = "resolved_at"
        case status
        case submittedAt = "submitted_at"
        case updatedAt = "updated_at"
        case worker
    }
}