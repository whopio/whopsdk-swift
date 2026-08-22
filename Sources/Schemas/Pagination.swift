import Foundation

public struct Pagination: Codable, Hashable, Sendable {
    /// Current page number
    public let currentPage: Double
    /// Next page number
    public let nextPage: Nullable<Double>
    /// Previous page number
    public let prevPage: Nullable<Double>
    /// Total number of records
    public let totalCount: Double
    /// Total number of pages
    public let totalPages: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currentPage: Double,
        nextPage: Nullable<Double>,
        prevPage: Nullable<Double>,
        totalCount: Double,
        totalPages: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currentPage = currentPage
        self.nextPage = nextPage
        self.prevPage = prevPage
        self.totalCount = totalCount
        self.totalPages = totalPages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentPage = try container.decode(Double.self, forKey: .currentPage)
        self.nextPage = try container.decode(Nullable<Double>.self, forKey: .nextPage)
        self.prevPage = try container.decode(Nullable<Double>.self, forKey: .prevPage)
        self.totalCount = try container.decode(Double.self, forKey: .totalCount)
        self.totalPages = try container.decode(Double.self, forKey: .totalPages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currentPage, forKey: .currentPage)
        try container.encode(self.nextPage, forKey: .nextPage)
        try container.encode(self.prevPage, forKey: .prevPage)
        try container.encode(self.totalCount, forKey: .totalCount)
        try container.encode(self.totalPages, forKey: .totalPages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currentPage = "current_page"
        case nextPage = "next_page"
        case prevPage = "prev_page"
        case totalCount = "total_count"
        case totalPages = "total_pages"
    }
}