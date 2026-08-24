import Foundation

public struct CaptureSpecImu: Codable, Hashable, Sendable {
    /// Units for the device-motion channels, as a compact key=unit string.
    public let deviceMotionUnits: String
    /// Units for the magnetometer channel.
    public let magnetometerUnits: String
    /// Minimum sustained IMU sample rate in hertz for a clip to pass validation.
    public let minRateHz: Double
    /// Target IMU sample rate in hertz.
    public let targetRateHz: Int
    /// Minimum IMU sample rate in hertz tolerated during the warmup window.
    public let warmupMinRateHz: Double
    /// Startup window, in nanoseconds, during which the relaxed warmup rate applies.
    public let warmupNs: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        deviceMotionUnits: String,
        magnetometerUnits: String,
        minRateHz: Double,
        targetRateHz: Int,
        warmupMinRateHz: Double,
        warmupNs: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.deviceMotionUnits = deviceMotionUnits
        self.magnetometerUnits = magnetometerUnits
        self.minRateHz = minRateHz
        self.targetRateHz = targetRateHz
        self.warmupMinRateHz = warmupMinRateHz
        self.warmupNs = warmupNs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deviceMotionUnits = try container.decode(String.self, forKey: .deviceMotionUnits)
        self.magnetometerUnits = try container.decode(String.self, forKey: .magnetometerUnits)
        self.minRateHz = try container.decode(Double.self, forKey: .minRateHz)
        self.targetRateHz = try container.decode(Int.self, forKey: .targetRateHz)
        self.warmupMinRateHz = try container.decode(Double.self, forKey: .warmupMinRateHz)
        self.warmupNs = try container.decode(Int.self, forKey: .warmupNs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.deviceMotionUnits, forKey: .deviceMotionUnits)
        try container.encode(self.magnetometerUnits, forKey: .magnetometerUnits)
        try container.encode(self.minRateHz, forKey: .minRateHz)
        try container.encode(self.targetRateHz, forKey: .targetRateHz)
        try container.encode(self.warmupMinRateHz, forKey: .warmupMinRateHz)
        try container.encode(self.warmupNs, forKey: .warmupNs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case deviceMotionUnits = "device_motion_units"
        case magnetometerUnits = "magnetometer_units"
        case minRateHz = "min_rate_hz"
        case targetRateHz = "target_rate_hz"
        case warmupMinRateHz = "warmup_min_rate_hz"
        case warmupNs = "warmup_ns"
    }
}