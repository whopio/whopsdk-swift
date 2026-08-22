import Foundation

public struct InviteMembershipsResponse: Codable, Hashable, Sendable {
    public let invitationSent: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        invitationSent: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.invitationSent = invitationSent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.invitationSent = try container.decode(Bool.self, forKey: .invitationSent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.invitationSent, forKey: .invitationSent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case invitationSent = "invitation_sent"
    }
}