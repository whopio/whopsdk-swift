import Foundation

public struct CaptureSpecVideo: Codable, Hashable, Sendable {
    /// Maximum acceptable average bitrate, in megabits per second.
    public let bitrateCeilingMbps: Int
    /// Minimum acceptable average bitrate, in megabits per second.
    public let bitrateFloorMbps: Int
    /// Recommended average bitrate to encode at, in megabits per second.
    public let bitrateTargetMbps: Int
    /// Which physical lens to record with.
    public let cameraLens: String
    public let codecs: [String]
    /// Whether the client must also write the camera make and model into the video container's metadata. When `false`, the capture manifest and export CSV are the metadata carrier.
    public let embedCameraMetadata: Bool
    /// Target capture frame rate.
    public let fps: Int
    /// Longest stall between consecutive frames a clip may contain before the client rejects it, in milliseconds. Every frame is timestamped in the frame log, so a stall stays alignable downstream — this bounds how broken a capture may be, not how evenly it must be paced.
    public let frameGapToleranceMs: Int
    /// Required frame height in pixels — recorded footage must match exactly.
    public let height: Int
    /// Minimum acceptable horizontal field of view, in degrees.
    public let minFovDegrees: Int
    /// Device orientation to record in.
    public let orientation: String
    /// Preferred horizontal field of view, in degrees.
    public let preferredFovDegrees: Int
    /// How the client must configure video stabilization: `off` disables EIS so raw motion is preserved for pose extraction, `on` requires it, `any` leaves the device default.
    public let stabilizationMode: CaptureSpecVideoStabilizationMode
    /// Whether hardware/software stabilization must be enabled. True exactly when stabilization_mode is `on`.
    public let stabilizationRequired: Bool
    /// Required frame width in pixels — recorded footage must match exactly.
    public let width: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bitrateCeilingMbps: Int,
        bitrateFloorMbps: Int,
        bitrateTargetMbps: Int,
        cameraLens: String,
        codecs: [String],
        embedCameraMetadata: Bool,
        fps: Int,
        frameGapToleranceMs: Int,
        height: Int,
        minFovDegrees: Int,
        orientation: String,
        preferredFovDegrees: Int,
        stabilizationMode: CaptureSpecVideoStabilizationMode,
        stabilizationRequired: Bool,
        width: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bitrateCeilingMbps = bitrateCeilingMbps
        self.bitrateFloorMbps = bitrateFloorMbps
        self.bitrateTargetMbps = bitrateTargetMbps
        self.cameraLens = cameraLens
        self.codecs = codecs
        self.embedCameraMetadata = embedCameraMetadata
        self.fps = fps
        self.frameGapToleranceMs = frameGapToleranceMs
        self.height = height
        self.minFovDegrees = minFovDegrees
        self.orientation = orientation
        self.preferredFovDegrees = preferredFovDegrees
        self.stabilizationMode = stabilizationMode
        self.stabilizationRequired = stabilizationRequired
        self.width = width
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bitrateCeilingMbps = try container.decode(Int.self, forKey: .bitrateCeilingMbps)
        self.bitrateFloorMbps = try container.decode(Int.self, forKey: .bitrateFloorMbps)
        self.bitrateTargetMbps = try container.decode(Int.self, forKey: .bitrateTargetMbps)
        self.cameraLens = try container.decode(String.self, forKey: .cameraLens)
        self.codecs = try container.decode([String].self, forKey: .codecs)
        self.embedCameraMetadata = try container.decode(Bool.self, forKey: .embedCameraMetadata)
        self.fps = try container.decode(Int.self, forKey: .fps)
        self.frameGapToleranceMs = try container.decode(Int.self, forKey: .frameGapToleranceMs)
        self.height = try container.decode(Int.self, forKey: .height)
        self.minFovDegrees = try container.decode(Int.self, forKey: .minFovDegrees)
        self.orientation = try container.decode(String.self, forKey: .orientation)
        self.preferredFovDegrees = try container.decode(Int.self, forKey: .preferredFovDegrees)
        self.stabilizationMode = try container.decode(CaptureSpecVideoStabilizationMode.self, forKey: .stabilizationMode)
        self.stabilizationRequired = try container.decode(Bool.self, forKey: .stabilizationRequired)
        self.width = try container.decode(Int.self, forKey: .width)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bitrateCeilingMbps, forKey: .bitrateCeilingMbps)
        try container.encode(self.bitrateFloorMbps, forKey: .bitrateFloorMbps)
        try container.encode(self.bitrateTargetMbps, forKey: .bitrateTargetMbps)
        try container.encode(self.cameraLens, forKey: .cameraLens)
        try container.encode(self.codecs, forKey: .codecs)
        try container.encode(self.embedCameraMetadata, forKey: .embedCameraMetadata)
        try container.encode(self.fps, forKey: .fps)
        try container.encode(self.frameGapToleranceMs, forKey: .frameGapToleranceMs)
        try container.encode(self.height, forKey: .height)
        try container.encode(self.minFovDegrees, forKey: .minFovDegrees)
        try container.encode(self.orientation, forKey: .orientation)
        try container.encode(self.preferredFovDegrees, forKey: .preferredFovDegrees)
        try container.encode(self.stabilizationMode, forKey: .stabilizationMode)
        try container.encode(self.stabilizationRequired, forKey: .stabilizationRequired)
        try container.encode(self.width, forKey: .width)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bitrateCeilingMbps = "bitrate_ceiling_mbps"
        case bitrateFloorMbps = "bitrate_floor_mbps"
        case bitrateTargetMbps = "bitrate_target_mbps"
        case cameraLens = "camera_lens"
        case codecs
        case embedCameraMetadata = "embed_camera_metadata"
        case fps
        case frameGapToleranceMs = "frame_gap_tolerance_ms"
        case height
        case minFovDegrees = "min_fov_degrees"
        case orientation
        case preferredFovDegrees = "preferred_fov_degrees"
        case stabilizationMode = "stabilization_mode"
        case stabilizationRequired = "stabilization_required"
        case width
    }
}