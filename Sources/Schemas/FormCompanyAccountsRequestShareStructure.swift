import Foundation

/// Authorized share structure. Required when `entity_type` is `c_corp`; ignored for LLCs.
public struct FormCompanyAccountsRequestShareStructure: Codable, Hashable, Sendable {
    /// Number of shares the company authorizes. Must be greater than `0`.
    public let numberOfShares: Int
    /// Par value per share, in USD. Must be greater than `0`; fractional values like `0.01` are allowed.
    public let value: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        numberOfShares: Int,
        value: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.numberOfShares = numberOfShares
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.numberOfShares = try container.decode(Int.self, forKey: .numberOfShares)
        self.value = try container.decode(Double.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.numberOfShares, forKey: .numberOfShares)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case numberOfShares = "number_of_shares"
        case value
    }
}