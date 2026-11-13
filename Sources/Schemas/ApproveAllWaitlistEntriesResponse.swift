import Foundation

public struct ApproveAllWaitlistEntriesResponse: Codable, Hashable, Sendable {
    /// The seller account whose signups were queued, prefixed `biz_`.
    public let accountId: String
    /// Whether any pending signups were queued for approval. `false` when there were none.
    public let queued: Bool
    /// The variant the request was narrowed to, prefixed `plan_`, or `null` when every waitlist variant on the account was included.
    public let variantId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        queued: Bool,
        variantId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.queued = queued
        self.variantId = variantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.queued = try container.decode(Bool.self, forKey: .queued)
        self.variantId = try container.decode(Nullable<String>.self, forKey: .variantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.queued, forKey: .queued)
        try container.encode(self.variantId, forKey: .variantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case queued
        case variantId = "variant_id"
    }
}