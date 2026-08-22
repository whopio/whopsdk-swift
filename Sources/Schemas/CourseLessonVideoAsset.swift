import Foundation

/// The Mux video asset for video-type lessons, used for streaming playback. Null if this lesson has no hosted video.
public struct CourseLessonVideoAsset: Codable, Hashable, Sendable {
    /// The Mux-provided ID of the asset
    public let assetId: Nullable<String>
    /// Whether this asset contains only audio
    public let audioOnly: Bool
    /// The datetime the mux asset was created.
    public let createdAt: Date
    /// The duration of the video in seconds
    public let durationSeconds: Nullable<Int>
    /// The time at which the video finished uploading
    public let finishedUploadingAt: Nullable<Date>
    /// The unique identifier for the mux asset.
    public let id: String
    /// The public playback ID of the Mux asset
    public let playbackId: Nullable<String>
    /// The signed playback ID of the Mux asset
    public let signedPlaybackId: Nullable<String>
    /// The signed storyboard playback token of the Mux asset
    public let signedStoryboardPlaybackToken: Nullable<String>
    /// The signed thumbnail playback token of the Mux asset
    public let signedThumbnailPlaybackToken: Nullable<String>
    /// The signed video playback token of the Mux asset
    public let signedVideoPlaybackToken: Nullable<String>
    /// The status of the Mux asset
    public let status: MuxAssetStatuses
    /// The datetime the mux asset was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assetId: Nullable<String>,
        audioOnly: Bool,
        createdAt: Date,
        durationSeconds: Nullable<Int>,
        finishedUploadingAt: Nullable<Date>,
        id: String,
        playbackId: Nullable<String>,
        signedPlaybackId: Nullable<String>,
        signedStoryboardPlaybackToken: Nullable<String>,
        signedThumbnailPlaybackToken: Nullable<String>,
        signedVideoPlaybackToken: Nullable<String>,
        status: MuxAssetStatuses,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assetId = assetId
        self.audioOnly = audioOnly
        self.createdAt = createdAt
        self.durationSeconds = durationSeconds
        self.finishedUploadingAt = finishedUploadingAt
        self.id = id
        self.playbackId = playbackId
        self.signedPlaybackId = signedPlaybackId
        self.signedStoryboardPlaybackToken = signedStoryboardPlaybackToken
        self.signedThumbnailPlaybackToken = signedThumbnailPlaybackToken
        self.signedVideoPlaybackToken = signedVideoPlaybackToken
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assetId = try container.decode(Nullable<String>.self, forKey: .assetId)
        self.audioOnly = try container.decode(Bool.self, forKey: .audioOnly)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.durationSeconds = try container.decode(Nullable<Int>.self, forKey: .durationSeconds)
        self.finishedUploadingAt = try container.decode(Nullable<Date>.self, forKey: .finishedUploadingAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.playbackId = try container.decode(Nullable<String>.self, forKey: .playbackId)
        self.signedPlaybackId = try container.decode(Nullable<String>.self, forKey: .signedPlaybackId)
        self.signedStoryboardPlaybackToken = try container.decode(Nullable<String>.self, forKey: .signedStoryboardPlaybackToken)
        self.signedThumbnailPlaybackToken = try container.decode(Nullable<String>.self, forKey: .signedThumbnailPlaybackToken)
        self.signedVideoPlaybackToken = try container.decode(Nullable<String>.self, forKey: .signedVideoPlaybackToken)
        self.status = try container.decode(MuxAssetStatuses.self, forKey: .status)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assetId, forKey: .assetId)
        try container.encode(self.audioOnly, forKey: .audioOnly)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.durationSeconds, forKey: .durationSeconds)
        try container.encode(self.finishedUploadingAt, forKey: .finishedUploadingAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.playbackId, forKey: .playbackId)
        try container.encode(self.signedPlaybackId, forKey: .signedPlaybackId)
        try container.encode(self.signedStoryboardPlaybackToken, forKey: .signedStoryboardPlaybackToken)
        try container.encode(self.signedThumbnailPlaybackToken, forKey: .signedThumbnailPlaybackToken)
        try container.encode(self.signedVideoPlaybackToken, forKey: .signedVideoPlaybackToken)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assetId = "asset_id"
        case audioOnly = "audio_only"
        case createdAt = "created_at"
        case durationSeconds = "duration_seconds"
        case finishedUploadingAt = "finished_uploading_at"
        case id
        case playbackId = "playback_id"
        case signedPlaybackId = "signed_playback_id"
        case signedStoryboardPlaybackToken = "signed_storyboard_playback_token"
        case signedThumbnailPlaybackToken = "signed_thumbnail_playback_token"
        case signedVideoPlaybackToken = "signed_video_playback_token"
        case status
        case updatedAt = "updated_at"
    }
}