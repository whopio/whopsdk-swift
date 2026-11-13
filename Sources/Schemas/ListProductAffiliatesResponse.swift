import Foundation

public struct ListProductAffiliatesResponse: Codable, Hashable, Sendable {
    public let data: [ProductAffiliate]
    public let pageInfo: ListProductAffiliatesResponsePageInfo
    /// Matching product affiliates, or `null` past 10,000.
    public let totalCount: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [ProductAffiliate],
        pageInfo: ListProductAffiliatesResponsePageInfo,
        totalCount: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.pageInfo = pageInfo
        self.totalCount = totalCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([ProductAffiliate].self, forKey: .data)
        self.pageInfo = try container.decode(ListProductAffiliatesResponsePageInfo.self, forKey: .pageInfo)
        self.totalCount = try container.decode(Nullable<Int>.self, forKey: .totalCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.pageInfo, forKey: .pageInfo)
        try container.encode(self.totalCount, forKey: .totalCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case pageInfo = "page_info"
        case totalCount = "total_count"
    }
}