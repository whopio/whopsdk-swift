import Foundation

public struct AutomationStepWaitConfig: Codable, Hashable, Sendable {
    /// Seconds the member waits before the next step, from 1 to 31,536,000 (365 days).
    public let delaySeconds: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        delaySeconds: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.delaySeconds = delaySeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.delaySeconds = try container.decode(Int.self, forKey: .delaySeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.delaySeconds, forKey: .delaySeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case delaySeconds = "delay_seconds"
    }
}