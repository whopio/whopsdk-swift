import Foundation

public struct PlatformTrendsReportsResponseDataReportsItem: Codable, Hashable, Sendable {
    /// The page of rows. Only the requested columns are present.
    public let rows: [PlatformTrendsReportsResponseDataReportsItemRowsItem]
    public let window: PlatformTrendsReportsResponseDataReportsItemWindow
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        rows: [PlatformTrendsReportsResponseDataReportsItemRowsItem],
        window: PlatformTrendsReportsResponseDataReportsItemWindow,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.rows = rows
        self.window = window
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rows = try container.decode([PlatformTrendsReportsResponseDataReportsItemRowsItem].self, forKey: .rows)
        self.window = try container.decode(PlatformTrendsReportsResponseDataReportsItemWindow.self, forKey: .window)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.rows, forKey: .rows)
        try container.encode(self.window, forKey: .window)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case rows
        case window
    }
}