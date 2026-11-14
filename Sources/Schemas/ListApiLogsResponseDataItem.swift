import Foundation

public struct ListApiLogsResponseDataItem: Codable, Hashable, Sendable {
    public let apiKeyId: Nullable<String>?
    public let createdAt: String
    public let durationMs: Nullable<Int>?
    public let httpMethod: Nullable<ListApiLogsResponseDataItemHttpMethod>?
    public let httpPath: Nullable<String>?
    public let id: String
    public let ipAddress: Nullable<String>?
    public let operationName: Nullable<String>?
    public let resourceId: Nullable<String>?
    public let status: Nullable<ListApiLogsResponseDataItemStatus>?
    public let statusCode: Nullable<Int>?
    public let userAgent: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiKeyId: Nullable<String>? = nil,
        createdAt: String,
        durationMs: Nullable<Int>? = nil,
        httpMethod: Nullable<ListApiLogsResponseDataItemHttpMethod>? = nil,
        httpPath: Nullable<String>? = nil,
        id: String,
        ipAddress: Nullable<String>? = nil,
        operationName: Nullable<String>? = nil,
        resourceId: Nullable<String>? = nil,
        status: Nullable<ListApiLogsResponseDataItemStatus>? = nil,
        statusCode: Nullable<Int>? = nil,
        userAgent: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiKeyId = apiKeyId
        self.createdAt = createdAt
        self.durationMs = durationMs
        self.httpMethod = httpMethod
        self.httpPath = httpPath
        self.id = id
        self.ipAddress = ipAddress
        self.operationName = operationName
        self.resourceId = resourceId
        self.status = status
        self.statusCode = statusCode
        self.userAgent = userAgent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKeyId = try container.decodeNullableIfPresent(String.self, forKey: .apiKeyId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.durationMs = try container.decodeNullableIfPresent(Int.self, forKey: .durationMs)
        self.httpMethod = try container.decodeNullableIfPresent(ListApiLogsResponseDataItemHttpMethod.self, forKey: .httpMethod)
        self.httpPath = try container.decodeNullableIfPresent(String.self, forKey: .httpPath)
        self.id = try container.decode(String.self, forKey: .id)
        self.ipAddress = try container.decodeNullableIfPresent(String.self, forKey: .ipAddress)
        self.operationName = try container.decodeNullableIfPresent(String.self, forKey: .operationName)
        self.resourceId = try container.decodeNullableIfPresent(String.self, forKey: .resourceId)
        self.status = try container.decodeNullableIfPresent(ListApiLogsResponseDataItemStatus.self, forKey: .status)
        self.statusCode = try container.decodeNullableIfPresent(Int.self, forKey: .statusCode)
        self.userAgent = try container.decodeNullableIfPresent(String.self, forKey: .userAgent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.apiKeyId, forKey: .apiKeyId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.durationMs, forKey: .durationMs)
        try container.encodeNullableIfPresent(self.httpMethod, forKey: .httpMethod)
        try container.encodeNullableIfPresent(self.httpPath, forKey: .httpPath)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.ipAddress, forKey: .ipAddress)
        try container.encodeNullableIfPresent(self.operationName, forKey: .operationName)
        try container.encodeNullableIfPresent(self.resourceId, forKey: .resourceId)
        try container.encodeNullableIfPresent(self.status, forKey: .status)
        try container.encodeNullableIfPresent(self.statusCode, forKey: .statusCode)
        try container.encodeNullableIfPresent(self.userAgent, forKey: .userAgent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKeyId = "api_key_id"
        case createdAt = "created_at"
        case durationMs = "duration_ms"
        case httpMethod = "http_method"
        case httpPath = "http_path"
        case id
        case ipAddress = "ip_address"
        case operationName = "operation_name"
        case resourceId = "resource_id"
        case status
        case statusCode = "status_code"
        case userAgent = "user_agent"
    }
}