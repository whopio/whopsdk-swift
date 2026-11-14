import Foundation

public struct ListReportsResponseDataItem: Codable, Hashable, Sendable {
    /// The values `breakdown_by` accepts.
    public let breakdowns: [String]
    /// Every property and metric the report can return.
    public let columns: [ListReportsResponseDataItemColumnsItem]
    /// What the report measures.
    public let description: String
    /// The report's key, which is also the last segment of its path.
    public let key: String
    /// The path that retrieves the report.
    public let path: String
    /// The timestamp a range window filters on, such as `paid_at`.
    public let windowField: Nullable<String>
    /// `range` reports measure activity in a period; `as_of` reports measure state at a moment.
    public let windowKind: ListReportsResponseDataItemWindowKind
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        breakdowns: [String],
        columns: [ListReportsResponseDataItemColumnsItem],
        description: String,
        key: String,
        path: String,
        windowField: Nullable<String>,
        windowKind: ListReportsResponseDataItemWindowKind,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.breakdowns = breakdowns
        self.columns = columns
        self.description = description
        self.key = key
        self.path = path
        self.windowField = windowField
        self.windowKind = windowKind
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.breakdowns = try container.decode([String].self, forKey: .breakdowns)
        self.columns = try container.decode([ListReportsResponseDataItemColumnsItem].self, forKey: .columns)
        self.description = try container.decode(String.self, forKey: .description)
        self.key = try container.decode(String.self, forKey: .key)
        self.path = try container.decode(String.self, forKey: .path)
        self.windowField = try container.decode(Nullable<String>.self, forKey: .windowField)
        self.windowKind = try container.decode(ListReportsResponseDataItemWindowKind.self, forKey: .windowKind)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.breakdowns, forKey: .breakdowns)
        try container.encode(self.columns, forKey: .columns)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.path, forKey: .path)
        try container.encode(self.windowField, forKey: .windowField)
        try container.encode(self.windowKind, forKey: .windowKind)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case breakdowns
        case columns
        case description
        case key
        case path
        case windowField = "window_field"
        case windowKind = "window_kind"
    }
}