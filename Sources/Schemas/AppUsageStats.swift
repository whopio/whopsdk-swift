import Foundation

public struct AppUsageStats: Codable, Hashable, Sendable {
    /// Daily active users.
    public let dau: Nullable<Int>
    /// Monthly active users.
    public let mau: Nullable<Int>
    /// Total time users spent in the app over the last 24 hours, in seconds.
    public let timeSpentLast24Hours: Nullable<Int>
    /// Weekly active users.
    public let wau: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dau: Nullable<Int>,
        mau: Nullable<Int>,
        timeSpentLast24Hours: Nullable<Int>,
        wau: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dau = dau
        self.mau = mau
        self.timeSpentLast24Hours = timeSpentLast24Hours
        self.wau = wau
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dau = try container.decode(Nullable<Int>.self, forKey: .dau)
        self.mau = try container.decode(Nullable<Int>.self, forKey: .mau)
        self.timeSpentLast24Hours = try container.decode(Nullable<Int>.self, forKey: .timeSpentLast24Hours)
        self.wau = try container.decode(Nullable<Int>.self, forKey: .wau)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.dau, forKey: .dau)
        try container.encode(self.mau, forKey: .mau)
        try container.encode(self.timeSpentLast24Hours, forKey: .timeSpentLast24Hours)
        try container.encode(self.wau, forKey: .wau)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dau
        case mau
        case timeSpentLast24Hours = "time_spent_last24_hours"
        case wau
    }
}