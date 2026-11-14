import Foundation

public struct RetryAdsPaymentAccountsResponse: Codable, Hashable, Sendable {
    /// The account whose ads payments will be retried.
    public let accountId: String
    /// Whether the retry was accepted for background processing.
    public let queued: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        queued: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.queued = queued
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.queued = try container.decode(Bool.self, forKey: .queued)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.queued, forKey: .queued)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case queued
    }
}