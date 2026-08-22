import Foundation

public struct BountyCaptureClip: Codable, Hashable, Sendable {
    /// The bounty submission (attempt) this clip belongs to, prefixed `btys_`.
    public let bountySubmissionId: String
    /// When the clip was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Server-validated clip duration in whole seconds. `null` until validation completes.
    public let durationSeconds: Nullable<Int>
    /// Stable validation failure code. `null` unless `status` is `failed`.
    public let failureCode: Nullable<String>
    /// Human-readable validation failure reason. `null` unless `status` is `failed`.
    public let failureMessage: Nullable<String>
    /// Temporary signed URL for the video frame timestamp log. Returned only on single-clip reads for an authorized viewer; `null` on list responses or until the artifact is attached.
    public let framesUrl: Nullable<String>
    /// Capture clip ID, prefixed `bclip_`.
    public let id: String
    /// Temporary signed URL for the IMU (accelerometer + gyroscope) log. Returned only on single-clip reads for an authorized viewer; `null` on list responses or until the artifact is attached.
    public let imuUrl: Nullable<String>
    /// Temporary signed URL for the capture manifest. Returned only on single-clip reads for an authorized viewer; `null` on list responses or until the artifact is attached.
    public let manifestUrl: Nullable<String>
    /// When server-side validation completed successfully, as an ISO 8601 timestamp. `null` until then.
    public let readyAt: Nullable<String>
    /// The clip's stable order within the attempt, starting at 1.
    public let sequence: Int
    /// Recording and validation state. `recording` is still capturing; `verifying` is running server-side validation; `ready` passed validation and counts toward the verified-duration payout gate; `failed` did not validate.
    public let status: BountyCaptureClipStatus
    /// When the clip was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Temporary signed URL for the synchronized MP4 video. Returned only on single-clip reads for an authorized viewer; `null` on list responses or until the artifact is attached.
    public let videoUrl: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bountySubmissionId: String,
        createdAt: String,
        durationSeconds: Nullable<Int>,
        failureCode: Nullable<String>,
        failureMessage: Nullable<String>,
        framesUrl: Nullable<String>,
        id: String,
        imuUrl: Nullable<String>,
        manifestUrl: Nullable<String>,
        readyAt: Nullable<String>,
        sequence: Int,
        status: BountyCaptureClipStatus,
        updatedAt: String,
        videoUrl: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bountySubmissionId = bountySubmissionId
        self.createdAt = createdAt
        self.durationSeconds = durationSeconds
        self.failureCode = failureCode
        self.failureMessage = failureMessage
        self.framesUrl = framesUrl
        self.id = id
        self.imuUrl = imuUrl
        self.manifestUrl = manifestUrl
        self.readyAt = readyAt
        self.sequence = sequence
        self.status = status
        self.updatedAt = updatedAt
        self.videoUrl = videoUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bountySubmissionId = try container.decode(String.self, forKey: .bountySubmissionId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.durationSeconds = try container.decode(Nullable<Int>.self, forKey: .durationSeconds)
        self.failureCode = try container.decode(Nullable<String>.self, forKey: .failureCode)
        self.failureMessage = try container.decode(Nullable<String>.self, forKey: .failureMessage)
        self.framesUrl = try container.decode(Nullable<String>.self, forKey: .framesUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.imuUrl = try container.decode(Nullable<String>.self, forKey: .imuUrl)
        self.manifestUrl = try container.decode(Nullable<String>.self, forKey: .manifestUrl)
        self.readyAt = try container.decode(Nullable<String>.self, forKey: .readyAt)
        self.sequence = try container.decode(Int.self, forKey: .sequence)
        self.status = try container.decode(BountyCaptureClipStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.videoUrl = try container.decode(Nullable<String>.self, forKey: .videoUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bountySubmissionId, forKey: .bountySubmissionId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.durationSeconds, forKey: .durationSeconds)
        try container.encode(self.failureCode, forKey: .failureCode)
        try container.encode(self.failureMessage, forKey: .failureMessage)
        try container.encode(self.framesUrl, forKey: .framesUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imuUrl, forKey: .imuUrl)
        try container.encode(self.manifestUrl, forKey: .manifestUrl)
        try container.encode(self.readyAt, forKey: .readyAt)
        try container.encode(self.sequence, forKey: .sequence)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.videoUrl, forKey: .videoUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bountySubmissionId = "bounty_submission_id"
        case createdAt = "created_at"
        case durationSeconds = "duration_seconds"
        case failureCode = "failure_code"
        case failureMessage = "failure_message"
        case framesUrl = "frames_url"
        case id
        case imuUrl = "imu_url"
        case manifestUrl = "manifest_url"
        case readyAt = "ready_at"
        case sequence
        case status
        case updatedAt = "updated_at"
        case videoUrl = "video_url"
    }
}