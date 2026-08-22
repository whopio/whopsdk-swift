import Foundation

/// Debug information including engine and SQL.
public struct RawStatsResponseDebug: Codable, Hashable, Sendable {
    /// The query engine used.
    public let engine: Nullable<String>
    /// Unique request identifier for debugging.
    public let requestId: Nullable<String>
    /// The generated SQL query (with IDs sanitized).
    public let sql: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        engine: Nullable<String>,
        requestId: Nullable<String>,
        sql: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.engine = engine
        self.requestId = requestId
        self.sql = sql
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.engine = try container.decode(Nullable<String>.self, forKey: .engine)
        self.requestId = try container.decode(Nullable<String>.self, forKey: .requestId)
        self.sql = try container.decode(Nullable<String>.self, forKey: .sql)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.engine, forKey: .engine)
        try container.encode(self.requestId, forKey: .requestId)
        try container.encode(self.sql, forKey: .sql)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case engine
        case requestId = "request_id"
        case sql
    }
}