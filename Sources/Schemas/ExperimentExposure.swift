import Foundation

public struct ExperimentExposure: Codable, Hashable, Sendable {
    public let configurationRevision: Int?
    /// Whether the subject receives a treatment or enabled feature flag.
    public let enabled: Bool
    /// Unique experiment ID, included for account experiments.
    public let experimentId: String?
    /// Present when evaluating a single experiment.
    public let flagKey: String?
    public let relatedResource: ExperimentResourceReference?
    /// Treatment name, control, or null for an inactive flag or excluded subject.
    public let variant: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        configurationRevision: Int? = nil,
        enabled: Bool,
        experimentId: String? = nil,
        flagKey: String? = nil,
        relatedResource: ExperimentResourceReference? = nil,
        variant: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.configurationRevision = configurationRevision
        self.enabled = enabled
        self.experimentId = experimentId
        self.flagKey = flagKey
        self.relatedResource = relatedResource
        self.variant = variant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.configurationRevision = try container.decodeIfPresent(Int.self, forKey: .configurationRevision)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.experimentId = try container.decodeIfPresent(String.self, forKey: .experimentId)
        self.flagKey = try container.decodeIfPresent(String.self, forKey: .flagKey)
        self.relatedResource = try container.decodeIfPresent(ExperimentResourceReference.self, forKey: .relatedResource)
        self.variant = try container.decode(Nullable<String>.self, forKey: .variant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.configurationRevision, forKey: .configurationRevision)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.experimentId, forKey: .experimentId)
        try container.encodeIfPresent(self.flagKey, forKey: .flagKey)
        try container.encodeIfPresent(self.relatedResource, forKey: .relatedResource)
        try container.encode(self.variant, forKey: .variant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case configurationRevision = "configuration_revision"
        case enabled
        case experimentId = "experiment_id"
        case flagKey = "flag_key"
        case relatedResource = "related_resource"
        case variant
    }
}