import Foundation

public struct PasskeyCredentialParameter: Codable, Hashable, Sendable {
    /// A COSE algorithm identifier: `-7` is ES256, `-257` is RS256.
    public let alg: Int
    /// Always `public-key`.
    public let type: PasskeyCredentialParameterType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        alg: Int,
        type: PasskeyCredentialParameterType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.alg = alg
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.alg = try container.decode(Int.self, forKey: .alg)
        self.type = try container.decode(PasskeyCredentialParameterType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.alg, forKey: .alg)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case alg
        case type
    }
}