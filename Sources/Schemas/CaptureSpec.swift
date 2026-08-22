import Foundation

public struct CaptureSpec: Codable, Hashable, Sendable {
    /// The naming convention for uploaded files, built from the required metadata fields.
    public let filenamePattern: String
    /// Inertial measurement unit (IMU) recording requirements.
    public let imu: CaptureSpecImu
    /// Schema version the client must stamp on the capture manifest it uploads.
    public let manifestSchemaVersion: Int
    /// Minimum length of a single clip, in seconds.
    public let minClipDurationSeconds: Int
    /// Total verified footage a submission must accumulate across all its clips before it can be submitted, in seconds. Always a whole number of hours.
    public let minTotalVerifiedDurationSeconds: Int
    public let requiredMetadataFields: [String]
    /// Whether each clip must be one uninterrupted recording rather than stitched segments.
    public let singleContinuousTake: Bool
    /// Video recording requirements.
    public let video: CaptureSpecVideo
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        filenamePattern: String,
        imu: CaptureSpecImu,
        manifestSchemaVersion: Int,
        minClipDurationSeconds: Int,
        minTotalVerifiedDurationSeconds: Int,
        requiredMetadataFields: [String],
        singleContinuousTake: Bool,
        video: CaptureSpecVideo,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.filenamePattern = filenamePattern
        self.imu = imu
        self.manifestSchemaVersion = manifestSchemaVersion
        self.minClipDurationSeconds = minClipDurationSeconds
        self.minTotalVerifiedDurationSeconds = minTotalVerifiedDurationSeconds
        self.requiredMetadataFields = requiredMetadataFields
        self.singleContinuousTake = singleContinuousTake
        self.video = video
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filenamePattern = try container.decode(String.self, forKey: .filenamePattern)
        self.imu = try container.decode(CaptureSpecImu.self, forKey: .imu)
        self.manifestSchemaVersion = try container.decode(Int.self, forKey: .manifestSchemaVersion)
        self.minClipDurationSeconds = try container.decode(Int.self, forKey: .minClipDurationSeconds)
        self.minTotalVerifiedDurationSeconds = try container.decode(Int.self, forKey: .minTotalVerifiedDurationSeconds)
        self.requiredMetadataFields = try container.decode([String].self, forKey: .requiredMetadataFields)
        self.singleContinuousTake = try container.decode(Bool.self, forKey: .singleContinuousTake)
        self.video = try container.decode(CaptureSpecVideo.self, forKey: .video)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.filenamePattern, forKey: .filenamePattern)
        try container.encode(self.imu, forKey: .imu)
        try container.encode(self.manifestSchemaVersion, forKey: .manifestSchemaVersion)
        try container.encode(self.minClipDurationSeconds, forKey: .minClipDurationSeconds)
        try container.encode(self.minTotalVerifiedDurationSeconds, forKey: .minTotalVerifiedDurationSeconds)
        try container.encode(self.requiredMetadataFields, forKey: .requiredMetadataFields)
        try container.encode(self.singleContinuousTake, forKey: .singleContinuousTake)
        try container.encode(self.video, forKey: .video)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case filenamePattern = "filename_pattern"
        case imu
        case manifestSchemaVersion = "manifest_schema_version"
        case minClipDurationSeconds = "min_clip_duration_seconds"
        case minTotalVerifiedDurationSeconds = "min_total_verified_duration_seconds"
        case requiredMetadataFields = "required_metadata_fields"
        case singleContinuousTake = "single_continuous_take"
        case video
    }
}