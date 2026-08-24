import Foundation

public struct ListExecutionsRecommendedActionsResponse: Codable, Hashable, Sendable {
    /// The chain these executions belong to.
    public let chainId: String
    /// One entry per run step, in position order.
    public let executions: [RecommendedActionExecution]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        chainId: String,
        executions: [RecommendedActionExecution],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.chainId = chainId
        self.executions = executions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chainId = try container.decode(String.self, forKey: .chainId)
        self.executions = try container.decode([RecommendedActionExecution].self, forKey: .executions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.chainId, forKey: .chainId)
        try container.encode(self.executions, forKey: .executions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case chainId = "chain_id"
        case executions
    }
}