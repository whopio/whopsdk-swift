import Foundation

public struct RecommendedActionExecution: Codable, Hashable, Sendable {
    /// The action definition key the step ran
    public let action: String
    /// When the step reached a terminal status, ISO 8601
    public let completedAt: Nullable<String>
    /// Why the step failed, or `null`
    public let error: Nullable<String>
    /// Execution ID, prefixed `raex_`
    public let id: String
    /// The API response the step produced, or `null` until it succeeds
    public let output: Nullable<[String: JSONValue]>
    /// Zero-based order of the step within the chain
    public let position: Int
    /// Where the step currently stands
    public let status: RecommendedActionExecutionStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: String,
        completedAt: Nullable<String>,
        error: Nullable<String>,
        id: String,
        output: Nullable<[String: JSONValue]>,
        position: Int,
        status: RecommendedActionExecutionStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.completedAt = completedAt
        self.error = error
        self.id = id
        self.output = output
        self.position = position
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(String.self, forKey: .action)
        self.completedAt = try container.decode(Nullable<String>.self, forKey: .completedAt)
        self.error = try container.decode(Nullable<String>.self, forKey: .error)
        self.id = try container.decode(String.self, forKey: .id)
        self.output = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .output)
        self.position = try container.decode(Int.self, forKey: .position)
        self.status = try container.decode(RecommendedActionExecutionStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.completedAt, forKey: .completedAt)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.output, forKey: .output)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case completedAt = "completed_at"
        case error
        case id
        case output
        case position
        case status
    }
}