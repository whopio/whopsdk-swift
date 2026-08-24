import Foundation

public struct ReplayWebhooksResponse: Codable, Hashable, Sendable {
    /// Whether the replay was accepted. Watch the webhook's delivery log for the re-sends.
    public let queued: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        queued: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.queued = queued
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.queued = try container.decode(Bool.self, forKey: .queued)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.queued, forKey: .queued)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case queued
    }
}