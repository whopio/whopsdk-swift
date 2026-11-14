import Foundation

public struct PasskeyCreationExtensions: Codable, Hashable, Sendable {
    /// Asks the authenticator to report whether it stored a discoverable passkey.
    public let credProps: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        credProps: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.credProps = credProps
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.credProps = try container.decode(Bool.self, forKey: .credProps)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.credProps, forKey: .credProps)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case credProps = "cred_props"
    }
}