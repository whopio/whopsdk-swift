import Foundation

public struct DomainStats: Codable, Hashable, Sendable {
    /// People who viewed a page on the domain with the Whop pixel in the last 7 days, refreshed hourly.
    public let uniqueVisitorsLast7Days: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        uniqueVisitorsLast7Days: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.uniqueVisitorsLast7Days = uniqueVisitorsLast7Days
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uniqueVisitorsLast7Days = try container.decode(Int.self, forKey: .uniqueVisitorsLast7Days)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.uniqueVisitorsLast7Days, forKey: .uniqueVisitorsLast7Days)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case uniqueVisitorsLast7Days = "unique_visitors_last_7_days"
    }
}