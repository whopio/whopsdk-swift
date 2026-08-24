import Foundation

public struct AccountRecommendedActionChainStep: Codable, Hashable, Sendable {
    /// The action definition key this step runs; new values may be added, so handle unknown actions gracefully
    public let action: String
    /// The URL where this step is done by hand
    public let cta: String
    /// Button label
    public let ctaLabel: String
    /// Supporting copy, or empty
    public let description: String
    /// Why the step failed, or `null`
    public let error: Nullable<String>
    /// The filled-in request body for the step's endpoint, or `null` when it was not recorded
    public let input: Nullable<[String: JSONValue]>
    /// The API response the step produced, or `null` until it succeeds
    public let output: Nullable<[String: JSONValue]>
    /// Zero-based order of this step within the chain
    public let position: Int
    /// Why the generator filled the step this way, or `null` for seeded chains
    public let reasoning: Nullable<[String: JSONValue]>
    /// Where the run step currently stands, or `null` when the chain has not been run
    public let status: Nullable<AccountRecommendedActionChainStepStatus>
    /// Headline for the step
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: String,
        cta: String,
        ctaLabel: String,
        description: String,
        error: Nullable<String>,
        input: Nullable<[String: JSONValue]>,
        output: Nullable<[String: JSONValue]>,
        position: Int,
        reasoning: Nullable<[String: JSONValue]>,
        status: Nullable<AccountRecommendedActionChainStepStatus>,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.cta = cta
        self.ctaLabel = ctaLabel
        self.description = description
        self.error = error
        self.input = input
        self.output = output
        self.position = position
        self.reasoning = reasoning
        self.status = status
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(String.self, forKey: .action)
        self.cta = try container.decode(String.self, forKey: .cta)
        self.ctaLabel = try container.decode(String.self, forKey: .ctaLabel)
        self.description = try container.decode(String.self, forKey: .description)
        self.error = try container.decode(Nullable<String>.self, forKey: .error)
        self.input = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .input)
        self.output = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .output)
        self.position = try container.decode(Int.self, forKey: .position)
        self.reasoning = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .reasoning)
        self.status = try container.decode(Nullable<AccountRecommendedActionChainStepStatus>.self, forKey: .status)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.cta, forKey: .cta)
        try container.encode(self.ctaLabel, forKey: .ctaLabel)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.input, forKey: .input)
        try container.encode(self.output, forKey: .output)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.reasoning, forKey: .reasoning)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case cta
        case ctaLabel = "cta_label"
        case description
        case error
        case input
        case output
        case position
        case reasoning
        case status
        case title
    }
}