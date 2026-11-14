import Foundation

public struct DomainVerification: Codable, Hashable, Sendable {
    /// How far proving verification has got.
    public let state: DomainVerificationState
    /// When an unproven claim is removed, 48 hours after it was made, as an ISO 8601 timestamp.
    public let verificationExpiresAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        state: DomainVerificationState,
        verificationExpiresAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.state = state
        self.verificationExpiresAt = verificationExpiresAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(DomainVerificationState.self, forKey: .state)
        self.verificationExpiresAt = try container.decode(Nullable<String>.self, forKey: .verificationExpiresAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.state, forKey: .state)
        try container.encode(self.verificationExpiresAt, forKey: .verificationExpiresAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case state
        case verificationExpiresAt = "verification_expires_at"
    }
}