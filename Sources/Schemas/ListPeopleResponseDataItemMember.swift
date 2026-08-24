import Foundation

/// The user's member record at this account, when they are a member of it.
public struct ListPeopleResponseDataItemMember: Codable, Hashable, Sendable {
    public let id: String
    public let joinedAt: Nullable<Date>?
    public let status: Nullable<String>?
    public let usdTotalSpend: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        joinedAt: Nullable<Date>? = nil,
        status: Nullable<String>? = nil,
        usdTotalSpend: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.joinedAt = joinedAt
        self.status = status
        self.usdTotalSpend = usdTotalSpend
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.joinedAt = try container.decodeNullableIfPresent(Date.self, forKey: .joinedAt)
        self.status = try container.decodeNullableIfPresent(String.self, forKey: .status)
        self.usdTotalSpend = try container.decodeIfPresent(Double.self, forKey: .usdTotalSpend)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.joinedAt, forKey: .joinedAt)
        try container.encodeNullableIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.usdTotalSpend, forKey: .usdTotalSpend)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case joinedAt = "joined_at"
        case status
        case usdTotalSpend = "usd_total_spend"
    }
}