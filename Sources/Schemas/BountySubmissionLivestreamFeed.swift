import Foundation

public struct BountySubmissionLivestreamFeed: Codable, Hashable, Sendable {
    /// When the proof livestream ended, as an ISO 8601 timestamp. `null` while it is still live — a feed with a `started_at` and no `ended_at` is streaming right now.
    public let endedAt: Nullable<String>
    /// Livestream feed ID.
    public let id: String
    /// Recording lifecycle state.
    public let recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>
    /// Playback URL for a completed proof recording, when available.
    public let recordingUrl: Nullable<String>
    /// When the proof livestream went live, as an ISO 8601 timestamp. `null` before it starts.
    public let startedAt: Nullable<String>
    /// Current proof thumbnail URL, when available.
    public let thumbnailUrl: Nullable<String>
    /// Display title for the proof livestream.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endedAt: Nullable<String>,
        id: String,
        recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>,
        recordingUrl: Nullable<String>,
        startedAt: Nullable<String>,
        thumbnailUrl: Nullable<String>,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endedAt = endedAt
        self.id = id
        self.recordingStatus = recordingStatus
        self.recordingUrl = recordingUrl
        self.startedAt = startedAt
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endedAt = try container.decode(Nullable<String>.self, forKey: .endedAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.recordingStatus = try container.decode(Nullable<BountySubmissionLivestreamFeedRecordingStatus>.self, forKey: .recordingStatus)
        self.recordingUrl = try container.decode(Nullable<String>.self, forKey: .recordingUrl)
        self.startedAt = try container.decode(Nullable<String>.self, forKey: .startedAt)
        self.thumbnailUrl = try container.decode(Nullable<String>.self, forKey: .thumbnailUrl)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endedAt, forKey: .endedAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.recordingStatus, forKey: .recordingStatus)
        try container.encode(self.recordingUrl, forKey: .recordingUrl)
        try container.encode(self.startedAt, forKey: .startedAt)
        try container.encode(self.thumbnailUrl, forKey: .thumbnailUrl)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endedAt = "ended_at"
        case id
        case recordingStatus = "recording_status"
        case recordingUrl = "recording_url"
        case startedAt = "started_at"
        case thumbnailUrl = "thumbnail_url"
        case title
    }
}