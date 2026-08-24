import Foundation

public struct DetailedTargetingOption: Codable, Hashable, Sendable {
    /// Low end of the ad platform's estimate of how many people this option can reach. Null when the platform doesn't publish one.
    public let audienceSizeLowerBound: Nullable<Double>
    /// High end of the ad platform's estimate of how many people this option can reach. Null when the platform doesn't publish one.
    public let audienceSizeUpperBound: Nullable<Double>
    /// What a behavior category is measured on, on ad platforms that scope them. Send it back on the `detailed_targeting.behaviors` entry alongside the id. Null for options that aren't scoped.
    public let behaviorType: Nullable<DetailedTargetingOptionBehaviorType>
    /// The ad platform's description of who the option covers, when it publishes one.
    public let description: Nullable<String>
    /// The ad platform's ID for the option in its targeting taxonomy. Use it as the `id` of a `detailed_targeting` entry.
    public let id: String
    /// Display name, such as `Movies`.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        audienceSizeLowerBound: Nullable<Double>,
        audienceSizeUpperBound: Nullable<Double>,
        behaviorType: Nullable<DetailedTargetingOptionBehaviorType>,
        description: Nullable<String>,
        id: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.audienceSizeLowerBound = audienceSizeLowerBound
        self.audienceSizeUpperBound = audienceSizeUpperBound
        self.behaviorType = behaviorType
        self.description = description
        self.id = id
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.audienceSizeLowerBound = try container.decode(Nullable<Double>.self, forKey: .audienceSizeLowerBound)
        self.audienceSizeUpperBound = try container.decode(Nullable<Double>.self, forKey: .audienceSizeUpperBound)
        self.behaviorType = try container.decode(Nullable<DetailedTargetingOptionBehaviorType>.self, forKey: .behaviorType)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.audienceSizeLowerBound, forKey: .audienceSizeLowerBound)
        try container.encode(self.audienceSizeUpperBound, forKey: .audienceSizeUpperBound)
        try container.encode(self.behaviorType, forKey: .behaviorType)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case audienceSizeLowerBound = "audience_size_lower_bound"
        case audienceSizeUpperBound = "audience_size_upper_bound"
        case behaviorType = "behavior_type"
        case description
        case id
        case name
    }
}