import Foundation

public struct ExposuresExperimentsRequestSubject: Codable, Hashable, Sendable {
    public let accountId: String?
    public let anonymousId: String?
    public let userId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String? = nil,
        anonymousId: String? = nil,
        userId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.anonymousId = anonymousId
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
        self.anonymousId = try container.decodeIfPresent(String.self, forKey: .anonymousId)
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accountId, forKey: .accountId)
        try container.encodeIfPresent(self.anonymousId, forKey: .anonymousId)
        try container.encodeIfPresent(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case anonymousId = "anonymous_id"
        case userId = "user_id"
    }
}