import Foundation

public struct SetupLastSetupError: Codable, Hashable, Sendable {
    /// A machine-readable classification of the failure, e.g. `enrollment_declined`. Absent when the buyer simply abandoned the setup.
    public let code: Nullable<String>
    /// A human-readable explanation of the failure.
    public let message: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: Nullable<String>,
        message: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.message = try container.decode(Nullable<String>.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case message
    }
}