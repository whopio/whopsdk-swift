import Foundation

public struct ListPaymentsResponsePageInfo: Codable, Hashable, Sendable {
    public let endCursor: Nullable<String>
    public let hasNextPage: Bool
    public let hasPreviousPage: Bool
    public let startCursor: Nullable<String>
    /// Number of results matching the filters, across every page. Counting stops at 10,000. `null` when `include_total_count` isn't `true`, or when the count ran out of time.
    public let totalCount: Nullable<Int>
    /// Whether counting stopped at the limit. `true` means `total_count` is 10,000 or more.
    public let totalCountCapped: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        endCursor: Nullable<String>,
        hasNextPage: Bool,
        hasPreviousPage: Bool,
        startCursor: Nullable<String>,
        totalCount: Nullable<Int>,
        totalCountCapped: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.endCursor = endCursor
        self.hasNextPage = hasNextPage
        self.hasPreviousPage = hasPreviousPage
        self.startCursor = startCursor
        self.totalCount = totalCount
        self.totalCountCapped = totalCountCapped
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.endCursor = try container.decode(Nullable<String>.self, forKey: .endCursor)
        self.hasNextPage = try container.decode(Bool.self, forKey: .hasNextPage)
        self.hasPreviousPage = try container.decode(Bool.self, forKey: .hasPreviousPage)
        self.startCursor = try container.decode(Nullable<String>.self, forKey: .startCursor)
        self.totalCount = try container.decode(Nullable<Int>.self, forKey: .totalCount)
        self.totalCountCapped = try container.decode(Bool.self, forKey: .totalCountCapped)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.endCursor, forKey: .endCursor)
        try container.encode(self.hasNextPage, forKey: .hasNextPage)
        try container.encode(self.hasPreviousPage, forKey: .hasPreviousPage)
        try container.encode(self.startCursor, forKey: .startCursor)
        try container.encode(self.totalCount, forKey: .totalCount)
        try container.encode(self.totalCountCapped, forKey: .totalCountCapped)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case endCursor = "end_cursor"
        case hasNextPage = "has_next_page"
        case hasPreviousPage = "has_previous_page"
        case startCursor = "start_cursor"
        case totalCount = "total_count"
        case totalCountCapped = "total_count_capped"
    }
}