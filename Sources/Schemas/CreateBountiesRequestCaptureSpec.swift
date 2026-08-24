import Foundation

/// Per-bounty overrides of the served capture contract. Only accepted when `business_goal_type` is `data_capture`; omitted fields keep the platform defaults, and the resulting contract is echoed back as `capture_spec` on the bounty.
public struct CreateBountiesRequestCaptureSpec: Codable, Hashable, Sendable {
    /// Average bitrate the recorder encodes at, in megabits per second. Must sit within the served floor and ceiling.
    public let bitrateTargetMbps: Int?
    /// Whether the recorder also writes camera make and model into the video container's metadata.
    public let embedCameraMetadata: Bool?
    /// Longest stall between consecutive frames a clip may contain before the client rejects it, in milliseconds. Unlike the recording fields this one can also be tuned after the bounty is created, since it bounds what is accepted rather than how footage is captured.
    public let frameGapToleranceMs: Int?
    /// Minimum length of a single clip, in seconds.
    public let minClipDurationSeconds: Int?
    /// Total verified footage a submission must accumulate across all its clips before it can be submitted, in seconds. Must be a whole number of hours between 1 and 12. Editable after create, until someone starts an attempt.
    public let minTotalVerifiedDurationSeconds: Int?
    /// How the recorder configures video stabilization. `off` preserves raw motion for pose extraction.
    public let stabilizationMode: CreateBountiesRequestCaptureSpecStabilizationMode?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bitrateTargetMbps: Int? = nil,
        embedCameraMetadata: Bool? = nil,
        frameGapToleranceMs: Int? = nil,
        minClipDurationSeconds: Int? = nil,
        minTotalVerifiedDurationSeconds: Int? = nil,
        stabilizationMode: CreateBountiesRequestCaptureSpecStabilizationMode? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bitrateTargetMbps = bitrateTargetMbps
        self.embedCameraMetadata = embedCameraMetadata
        self.frameGapToleranceMs = frameGapToleranceMs
        self.minClipDurationSeconds = minClipDurationSeconds
        self.minTotalVerifiedDurationSeconds = minTotalVerifiedDurationSeconds
        self.stabilizationMode = stabilizationMode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bitrateTargetMbps = try container.decodeIfPresent(Int.self, forKey: .bitrateTargetMbps)
        self.embedCameraMetadata = try container.decodeIfPresent(Bool.self, forKey: .embedCameraMetadata)
        self.frameGapToleranceMs = try container.decodeIfPresent(Int.self, forKey: .frameGapToleranceMs)
        self.minClipDurationSeconds = try container.decodeIfPresent(Int.self, forKey: .minClipDurationSeconds)
        self.minTotalVerifiedDurationSeconds = try container.decodeIfPresent(Int.self, forKey: .minTotalVerifiedDurationSeconds)
        self.stabilizationMode = try container.decodeIfPresent(CreateBountiesRequestCaptureSpecStabilizationMode.self, forKey: .stabilizationMode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.bitrateTargetMbps, forKey: .bitrateTargetMbps)
        try container.encodeIfPresent(self.embedCameraMetadata, forKey: .embedCameraMetadata)
        try container.encodeIfPresent(self.frameGapToleranceMs, forKey: .frameGapToleranceMs)
        try container.encodeIfPresent(self.minClipDurationSeconds, forKey: .minClipDurationSeconds)
        try container.encodeIfPresent(self.minTotalVerifiedDurationSeconds, forKey: .minTotalVerifiedDurationSeconds)
        try container.encodeIfPresent(self.stabilizationMode, forKey: .stabilizationMode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bitrateTargetMbps = "bitrate_target_mbps"
        case embedCameraMetadata = "embed_camera_metadata"
        case frameGapToleranceMs = "frame_gap_tolerance_ms"
        case minClipDurationSeconds = "min_clip_duration_seconds"
        case minTotalVerifiedDurationSeconds = "min_total_verified_duration_seconds"
        case stabilizationMode = "stabilization_mode"
    }
}