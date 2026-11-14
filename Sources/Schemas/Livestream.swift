import Foundation

public struct Livestream: Codable, Hashable, Sendable {
    /// When the livestream was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the livestream ended, as an ISO 8601 timestamp. `null` while it is live or before it starts.
    public let endedAt: Nullable<String>
    /// Livestream ID, prefixed `lfeed_`.
    public let id: String
    /// When a moderator pinned this livestream's recording, as an ISO 8601 timestamp. `null` when it is not pinned.
    public let pinnedAt: Nullable<String>
    /// When the recording's first frame was captured, as an ISO 8601 timestamp. Offsets into the recording count from here, not from `started_at`. `null` until recording starts.
    public let recordingStartedAt: Nullable<String>
    /// State of the recording. `null` when the livestream was not recorded.
    public let recordingStatus: Nullable<LivestreamRecordingStatus>
    /// A temporary link to the recording's video file. Retrieve the livestream again for a fresh link. `null` until the recording is ready, or when it was deleted.
    public let recordingUrl: Nullable<String>
    /// When the livestream went live, as an ISO 8601 timestamp. `null` before it starts.
    public let startedAt: Nullable<String>
    /// A temporary link to a still frame from the livestream. `null` when none was captured.
    public let thumbnailUrl: Nullable<String>
    /// Display title of the livestream. `Untitled Livestream` when the host did not set one.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        endedAt: Nullable<String>,
        id: String,
        pinnedAt: Nullable<String>,
        recordingStartedAt: Nullable<String>,
        recordingStatus: Nullable<LivestreamRecordingStatus>,
        recordingUrl: Nullable<String>,
        startedAt: Nullable<String>,
        thumbnailUrl: Nullable<String>,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.endedAt = endedAt
        self.id = id
        self.pinnedAt = pinnedAt
        self.recordingStartedAt = recordingStartedAt
        self.recordingStatus = recordingStatus
        self.recordingUrl = recordingUrl
        self.startedAt = startedAt
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.endedAt = try container.decode(Nullable<String>.self, forKey: .endedAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.pinnedAt = try container.decode(Nullable<String>.self, forKey: .pinnedAt)
        self.recordingStartedAt = try container.decode(Nullable<String>.self, forKey: .recordingStartedAt)
        self.recordingStatus = try container.decode(Nullable<LivestreamRecordingStatus>.self, forKey: .recordingStatus)
        self.recordingUrl = try container.decode(Nullable<String>.self, forKey: .recordingUrl)
        self.startedAt = try container.decode(Nullable<String>.self, forKey: .startedAt)
        self.thumbnailUrl = try container.decode(Nullable<String>.self, forKey: .thumbnailUrl)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.endedAt, forKey: .endedAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.pinnedAt, forKey: .pinnedAt)
        try container.encode(self.recordingStartedAt, forKey: .recordingStartedAt)
        try container.encode(self.recordingStatus, forKey: .recordingStatus)
        try container.encode(self.recordingUrl, forKey: .recordingUrl)
        try container.encode(self.startedAt, forKey: .startedAt)
        try container.encode(self.thumbnailUrl, forKey: .thumbnailUrl)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case endedAt = "ended_at"
        case id
        case pinnedAt = "pinned_at"
        case recordingStartedAt = "recording_started_at"
        case recordingStatus = "recording_status"
        case recordingUrl = "recording_url"
        case startedAt = "started_at"
        case thumbnailUrl = "thumbnail_url"
        case title
    }
}