import Foundation

/// The account's own cancel reason the member picked, as they saw it. `null` when the member picked a default category or gave no reason.
public struct MembershipLegacyFeedbackOption: Codable, Hashable, Sendable {
    /// The option's label when the member picked it. Renaming the option later does not change it.
    public let label: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        label: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.label = label
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decode(String.self, forKey: .label)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.label, forKey: .label)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case label
    }
}