import Foundation

/// The conditions a payment is matched against. Up to 10 conditions, and 8 KiB once serialized.
public struct ReplacePaymentRulesRequestConditions: Codable, Hashable, Sendable {
    public let all: [ReplacePaymentRulesRequestConditionsAllItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        all: [ReplacePaymentRulesRequestConditionsAllItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.all = all
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.all = try container.decode([ReplacePaymentRulesRequestConditionsAllItem].self, forKey: .all)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.all, forKey: .all)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case all
    }
}