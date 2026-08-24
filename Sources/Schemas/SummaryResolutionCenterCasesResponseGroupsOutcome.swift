import Foundation

/// How many of the matching cases ended each way. Every outcome is present, including those with a count of zero; open cases are counted in none of them.
public struct SummaryResolutionCenterCasesResponseGroupsOutcome: Codable, Hashable, Sendable {
    public let customerWon: Int
    public let merchantWon: Int
    public let withdrawn: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        customerWon: Int,
        merchantWon: Int,
        withdrawn: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.customerWon = customerWon
        self.merchantWon = merchantWon
        self.withdrawn = withdrawn
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customerWon = try container.decode(Int.self, forKey: .customerWon)
        self.merchantWon = try container.decode(Int.self, forKey: .merchantWon)
        self.withdrawn = try container.decode(Int.self, forKey: .withdrawn)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.customerWon, forKey: .customerWon)
        try container.encode(self.merchantWon, forKey: .merchantWon)
        try container.encode(self.withdrawn, forKey: .withdrawn)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case customerWon = "customer_won"
        case merchantWon = "merchant_won"
        case withdrawn
    }
}