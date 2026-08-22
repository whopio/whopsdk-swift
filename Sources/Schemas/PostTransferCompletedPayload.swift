import Foundation

public struct PostTransferCompletedPayload: Codable, Hashable, Sendable {
    /// The account ID that this webhook event is associated with
    public let accountId: Nullable<String>?
    /// The API version for this webhook
    public let apiVersion: PostTransferCompletedPayloadApiVersion
    /// The dated API version (Api-Version-Date) the payload is serialized to
    public let apiVersionDate: Nullable<String>
    /// A transfer of credit between two ledger accounts.
    public let data: PostTransferCompletedPayloadData
    /// A unique ID for every single webhook request
    public let id: String
    /// For some `.updated` events, the old values of the payload fields that changed, keyed by field name. Omitted when no capture is available for the event
    public let previousAttributes: [String: JSONValue]?
    /// The timestamp in ISO 8601 format that the webhook was sent at on the server
    public let timestamp: Date
    /// The webhook event type
    public let type: PostTransferCompletedPayloadType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>? = nil,
        apiVersion: PostTransferCompletedPayloadApiVersion,
        apiVersionDate: Nullable<String>,
        data: PostTransferCompletedPayloadData,
        id: String,
        previousAttributes: [String: JSONValue]? = nil,
        timestamp: Date,
        type: PostTransferCompletedPayloadType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.apiVersion = apiVersion
        self.apiVersionDate = apiVersionDate
        self.data = data
        self.id = id
        self.previousAttributes = previousAttributes
        self.timestamp = timestamp
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decodeNullableIfPresent(String.self, forKey: .accountId)
        self.apiVersion = try container.decode(PostTransferCompletedPayloadApiVersion.self, forKey: .apiVersion)
        self.apiVersionDate = try container.decode(Nullable<String>.self, forKey: .apiVersionDate)
        self.data = try container.decode(PostTransferCompletedPayloadData.self, forKey: .data)
        self.id = try container.decode(String.self, forKey: .id)
        self.previousAttributes = try container.decodeIfPresent([String: JSONValue].self, forKey: .previousAttributes)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.type = try container.decode(PostTransferCompletedPayloadType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accountId, forKey: .accountId)
        try container.encode(self.apiVersion, forKey: .apiVersion)
        try container.encode(self.apiVersionDate, forKey: .apiVersionDate)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.previousAttributes, forKey: .previousAttributes)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case apiVersion = "api_version"
        case apiVersionDate = "api_version_date"
        case data
        case id
        case previousAttributes = "previous_attributes"
        case timestamp
        case type
    }
}