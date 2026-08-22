import Foundation

/// The Mux video asset for video-type lessons, used for streaming playback. Null if this lesson has no hosted video.
public struct CourseChaptersItemLessonsItemVideoAsset: Codable, Hashable, Sendable {
    /// The duration of the video in seconds
    public let durationSeconds: Nullable<Int>
    /// The signed playback ID of the Mux asset
    public let signedPlaybackId: Nullable<String>
    /// The signed thumbnail playback token of the Mux asset
    public let signedThumbnailPlaybackToken: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        durationSeconds: Nullable<Int>,
        signedPlaybackId: Nullable<String>,
        signedThumbnailPlaybackToken: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.durationSeconds = durationSeconds
        self.signedPlaybackId = signedPlaybackId
        self.signedThumbnailPlaybackToken = signedThumbnailPlaybackToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.durationSeconds = try container.decode(Nullable<Int>.self, forKey: .durationSeconds)
        self.signedPlaybackId = try container.decode(Nullable<String>.self, forKey: .signedPlaybackId)
        self.signedThumbnailPlaybackToken = try container.decode(Nullable<String>.self, forKey: .signedThumbnailPlaybackToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.durationSeconds, forKey: .durationSeconds)
        try container.encode(self.signedPlaybackId, forKey: .signedPlaybackId)
        try container.encode(self.signedThumbnailPlaybackToken, forKey: .signedThumbnailPlaybackToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case durationSeconds = "duration_seconds"
        case signedPlaybackId = "signed_playback_id"
        case signedThumbnailPlaybackToken = "signed_thumbnail_playback_token"
    }
}