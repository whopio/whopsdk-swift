import Foundation

public struct PaymentRequiredErrorBodyError: Codable, Hashable, Sendable {
    /// Hosted page where the account can deposit funds before retrying.
    public let depositUrl: String
    public let message: String
    public let type: PaymentRequiredErrorBodyErrorType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        depositUrl: String,
        message: String,
        type: PaymentRequiredErrorBodyErrorType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.depositUrl = depositUrl
        self.message = message
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.depositUrl = try container.decode(String.self, forKey: .depositUrl)
        self.message = try container.decode(String.self, forKey: .message)
        self.type = try container.decode(PaymentRequiredErrorBodyErrorType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.depositUrl, forKey: .depositUrl)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case depositUrl = "deposit_url"
        case message
        case type
    }
}