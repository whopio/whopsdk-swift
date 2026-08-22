import Foundation

public struct UserEarningsAmount: Codable, Hashable, Sendable {
    /// Gross income in USD over the last 24 hours.
    public let last24Hours: String
    /// Gross income in USD over the last 30 days.
    public let last30Days: String
    /// Gross income in USD over the last 7 days.
    public let last7Days: String
    /// All-time gross income in USD.
    public let lifetime: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        last24Hours: String,
        last30Days: String,
        last7Days: String,
        lifetime: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.last24Hours = last24Hours
        self.last30Days = last30Days
        self.last7Days = last7Days
        self.lifetime = lifetime
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.last24Hours = try container.decode(String.self, forKey: .last24Hours)
        self.last30Days = try container.decode(String.self, forKey: .last30Days)
        self.last7Days = try container.decode(String.self, forKey: .last7Days)
        self.lifetime = try container.decode(String.self, forKey: .lifetime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.last24Hours, forKey: .last24Hours)
        try container.encode(self.last30Days, forKey: .last30Days)
        try container.encode(self.last7Days, forKey: .last7Days)
        try container.encode(self.lifetime, forKey: .lifetime)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case last24Hours = "last_24_hours"
        case last30Days = "last_30_days"
        case last7Days = "last_7_days"
        case lifetime
    }
}