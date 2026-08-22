import Foundation

public struct InviteMembershipsRequestBodyUserId: Codable, Hashable, Sendable {
    /// Free plan whose membership the recipient is invited to, prefixed `plan_`.
    public let planId: String
    /// Recipient user ID, prefixed `user_`.
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        planId: String,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.planId = planId
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.planId = try container.decode(String.self, forKey: .planId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.planId, forKey: .planId)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case planId = "plan_id"
        case userId = "user_id"
    }
}