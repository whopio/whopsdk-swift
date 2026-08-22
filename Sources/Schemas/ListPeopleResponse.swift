import Foundation

public struct ListPeopleResponse: Codable, Hashable, Sendable {
    public let data: [ListPeopleResponseDataItem]
    public let pageInfo: ListPeopleResponsePageInfo
    public let totalCount: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [ListPeopleResponseDataItem],
        pageInfo: ListPeopleResponsePageInfo,
        totalCount: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.pageInfo = pageInfo
        self.totalCount = totalCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([ListPeopleResponseDataItem].self, forKey: .data)
        self.pageInfo = try container.decode(ListPeopleResponsePageInfo.self, forKey: .pageInfo)
        self.totalCount = try container.decodeIfPresent(Int.self, forKey: .totalCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.pageInfo, forKey: .pageInfo)
        try container.encodeIfPresent(self.totalCount, forKey: .totalCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case pageInfo = "page_info"
        case totalCount = "total_count"
    }
}