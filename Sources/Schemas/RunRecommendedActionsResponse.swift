import Foundation

public struct RunRecommendedActionsResponse: Codable, Hashable, Sendable {
    public let chainId: String
    public let execution: RunRecommendedActionsResponseExecution
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        chainId: String,
        execution: RunRecommendedActionsResponseExecution,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.chainId = chainId
        self.execution = execution
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chainId = try container.decode(String.self, forKey: .chainId)
        self.execution = try container.decode(RunRecommendedActionsResponseExecution.self, forKey: .execution)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.chainId, forKey: .chainId)
        try container.encode(self.execution, forKey: .execution)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case chainId = "chain_id"
        case execution
    }
}