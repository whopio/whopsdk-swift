import Foundation

public struct Export: Codable, Hashable, Sendable {
    /// When the export was requested, as an ISO 8601 timestamp.
    public let createdAt: String
    /// A short-lived link to download the finished CSV. `null` until `status` is `completed`, and again once the export has expired.
    public let downloadUrl: Nullable<String>
    /// When the CSV is deleted and the export moves to `expired`, as an ISO 8601 timestamp. Exports are retained for 30 days.
    public let expiresAt: String
    /// Export ID, prefixed `exprt_`.
    public let id: String
    /// Estimated completion percentage from 0 to 100.
    public let progressPercent: Nullable<Int>
    /// The resource that was exported, e.g. `receipts`, `members`, or `payouts`.
    public let resource: ExportResource
    /// `pending` or `processing` while the CSV is generated, `completed` when the download is ready, `failed` if it errored, `expired` once the CSV has been deleted.
    public let status: ExportStatus
    /// When the export last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: String,
        downloadUrl: Nullable<String>,
        expiresAt: String,
        id: String,
        progressPercent: Nullable<Int>,
        resource: ExportResource,
        status: ExportStatus,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.downloadUrl = downloadUrl
        self.expiresAt = expiresAt
        self.id = id
        self.progressPercent = progressPercent
        self.resource = resource
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.downloadUrl = try container.decode(Nullable<String>.self, forKey: .downloadUrl)
        self.expiresAt = try container.decode(String.self, forKey: .expiresAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.progressPercent = try container.decode(Nullable<Int>.self, forKey: .progressPercent)
        self.resource = try container.decode(ExportResource.self, forKey: .resource)
        self.status = try container.decode(ExportStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.downloadUrl, forKey: .downloadUrl)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.progressPercent, forKey: .progressPercent)
        try container.encode(self.resource, forKey: .resource)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case downloadUrl = "download_url"
        case expiresAt = "expires_at"
        case id
        case progressPercent = "progress_percent"
        case resource
        case status
        case updatedAt = "updated_at"
    }
}