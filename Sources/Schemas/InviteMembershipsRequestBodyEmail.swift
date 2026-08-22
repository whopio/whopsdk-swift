import Foundation

public struct InviteMembershipsRequestBodyEmail: Codable, Hashable, Sendable {
    /// Recipient email address.
    public let email: String
    /// Free plan whose membership the recipient is invited to, prefixed `plan_`.
    public let planId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: String,
        planId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.planId = planId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.planId = try container.decode(String.self, forKey: .planId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.planId, forKey: .planId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case planId = "plan_id"
    }
}