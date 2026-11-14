import Foundation

public struct PasskeyCredentialDescriptor: Codable, Hashable, Sendable {
    /// The WebAuthn credential ID, base64url-encoded.
    public let id: String
    public let transports: [PasskeyCredentialDescriptorTransportsItem]
    /// Always `public-key`.
    public let type: PasskeyCredentialDescriptorType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        transports: [PasskeyCredentialDescriptorTransportsItem],
        type: PasskeyCredentialDescriptorType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.transports = transports
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.transports = try container.decode([PasskeyCredentialDescriptorTransportsItem].self, forKey: .transports)
        self.type = try container.decode(PasskeyCredentialDescriptorType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.transports, forKey: .transports)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case transports
        case type
    }
}