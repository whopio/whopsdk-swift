import Foundation

public struct CreateAdGroupsRequestDeliveryScheduleTuesdayItem: Codable, Hashable, Sendable {
    /// When delivery stops, as a 24-hour `HH:00` time up to `24:00` for midnight. Later than `start`.
    public let end: String
    /// When delivery starts, as a 24-hour `HH:00` time from `00:00` to `23:00`.
    public let start: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        end: String,
        start: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.end = end
        self.start = start
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.end = try container.decode(String.self, forKey: .end)
        self.start = try container.decode(String.self, forKey: .start)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.end, forKey: .end)
        try container.encode(self.start, forKey: .start)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case end
        case start
    }
}