import Foundation

public struct V1ErrorResponseError: Codable, Hashable, Sendable {
    /// Machine-readable reason for this specific refusal, such as `bank_warning_not_acknowledged`. Only present when the error carries one.
    public let code: String?
    /// Human-readable error message.
    public let message: String
    /// Machine-readable error code.
    public let type: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String? = nil,
        message: String,
        type: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.message = message
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.message = try container.decode(String.self, forKey: .message)
        self.type = try container.decode(String.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case message
        case type
    }
}