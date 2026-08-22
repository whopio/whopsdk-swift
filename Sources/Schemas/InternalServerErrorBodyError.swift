import Foundation

public struct InternalServerErrorBodyError: Codable, Hashable, Sendable {
    /// A short string indicating the specific error code, e.g. 'parameter_missing', 'parameter_invalid', 'invalid_json'
    public let code: Nullable<String>?
    public let message: String
    /// The parameter that caused the error, if applicable
    public let param: Nullable<String>?
    public let type: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: Nullable<String>? = nil,
        message: String,
        param: Nullable<String>? = nil,
        type: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.message = message
        self.param = param
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeNullableIfPresent(String.self, forKey: .code)
        self.message = try container.decode(String.self, forKey: .message)
        self.param = try container.decodeNullableIfPresent(String.self, forKey: .param)
        self.type = try container.decode(String.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.code, forKey: .code)
        try container.encode(self.message, forKey: .message)
        try container.encodeNullableIfPresent(self.param, forKey: .param)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case message
        case param
        case type
    }
}