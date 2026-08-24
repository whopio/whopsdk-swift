import Foundation

public struct PaymentProcessingDetails: Codable, Hashable, Sendable {
    /// When the payment is expected to settle, as an ISO 8601 timestamp.
    public let expectedBy: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        expectedBy: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.expectedBy = expectedBy
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.expectedBy = try container.decode(Nullable<String>.self, forKey: .expectedBy)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.expectedBy, forKey: .expectedBy)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case expectedBy = "expected_by"
    }
}