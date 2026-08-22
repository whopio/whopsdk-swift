import Foundation

public struct LogsAppsResponseDataItem: Codable, Hashable, Sendable {
    public let appBuildId: String
    public let appId: String
    public let cpuTimeMs: Int?
    public let createdAt: Date
    public let level: LogsAppsResponseDataItemLevel
    public let message: String
    public let outcome: Nullable<String>?
    public let requestId: String
    public let requestMethod: Nullable<String>?
    public let requestPath: Nullable<String>?
    public let responseStatus: Nullable<Int>?
    public let source: LogsAppsResponseDataItemSource
    public let stack: Nullable<String>?
    public let truncated: Bool?
    public let wallTimeMs: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appBuildId: String,
        appId: String,
        cpuTimeMs: Int? = nil,
        createdAt: Date,
        level: LogsAppsResponseDataItemLevel,
        message: String,
        outcome: Nullable<String>? = nil,
        requestId: String,
        requestMethod: Nullable<String>? = nil,
        requestPath: Nullable<String>? = nil,
        responseStatus: Nullable<Int>? = nil,
        source: LogsAppsResponseDataItemSource,
        stack: Nullable<String>? = nil,
        truncated: Bool? = nil,
        wallTimeMs: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appBuildId = appBuildId
        self.appId = appId
        self.cpuTimeMs = cpuTimeMs
        self.createdAt = createdAt
        self.level = level
        self.message = message
        self.outcome = outcome
        self.requestId = requestId
        self.requestMethod = requestMethod
        self.requestPath = requestPath
        self.responseStatus = responseStatus
        self.source = source
        self.stack = stack
        self.truncated = truncated
        self.wallTimeMs = wallTimeMs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appBuildId = try container.decode(String.self, forKey: .appBuildId)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.cpuTimeMs = try container.decodeIfPresent(Int.self, forKey: .cpuTimeMs)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.level = try container.decode(LogsAppsResponseDataItemLevel.self, forKey: .level)
        self.message = try container.decode(String.self, forKey: .message)
        self.outcome = try container.decodeNullableIfPresent(String.self, forKey: .outcome)
        self.requestId = try container.decode(String.self, forKey: .requestId)
        self.requestMethod = try container.decodeNullableIfPresent(String.self, forKey: .requestMethod)
        self.requestPath = try container.decodeNullableIfPresent(String.self, forKey: .requestPath)
        self.responseStatus = try container.decodeNullableIfPresent(Int.self, forKey: .responseStatus)
        self.source = try container.decode(LogsAppsResponseDataItemSource.self, forKey: .source)
        self.stack = try container.decodeNullableIfPresent(String.self, forKey: .stack)
        self.truncated = try container.decodeIfPresent(Bool.self, forKey: .truncated)
        self.wallTimeMs = try container.decodeIfPresent(Int.self, forKey: .wallTimeMs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.appBuildId, forKey: .appBuildId)
        try container.encode(self.appId, forKey: .appId)
        try container.encodeIfPresent(self.cpuTimeMs, forKey: .cpuTimeMs)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.message, forKey: .message)
        try container.encodeNullableIfPresent(self.outcome, forKey: .outcome)
        try container.encode(self.requestId, forKey: .requestId)
        try container.encodeNullableIfPresent(self.requestMethod, forKey: .requestMethod)
        try container.encodeNullableIfPresent(self.requestPath, forKey: .requestPath)
        try container.encodeNullableIfPresent(self.responseStatus, forKey: .responseStatus)
        try container.encode(self.source, forKey: .source)
        try container.encodeNullableIfPresent(self.stack, forKey: .stack)
        try container.encodeIfPresent(self.truncated, forKey: .truncated)
        try container.encodeIfPresent(self.wallTimeMs, forKey: .wallTimeMs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appBuildId = "app_build_id"
        case appId = "app_id"
        case cpuTimeMs = "cpu_time_ms"
        case createdAt = "created_at"
        case level
        case message
        case outcome
        case requestId = "request_id"
        case requestMethod = "request_method"
        case requestPath = "request_path"
        case responseStatus = "response_status"
        case source
        case stack
        case truncated
        case wallTimeMs = "wall_time_ms"
    }
}