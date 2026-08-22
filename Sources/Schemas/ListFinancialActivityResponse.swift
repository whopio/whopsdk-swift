import Foundation

public struct ListFinancialActivityResponse: Codable, Hashable, Sendable {
    public let data: [LedgerActivity]
    public let pageInfo: ListFinancialActivityResponsePageInfo
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [LedgerActivity],
        pageInfo: ListFinancialActivityResponsePageInfo,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.pageInfo = pageInfo
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([LedgerActivity].self, forKey: .data)
        self.pageInfo = try container.decode(ListFinancialActivityResponsePageInfo.self, forKey: .pageInfo)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.pageInfo, forKey: .pageInfo)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case pageInfo = "page_info"
    }
}