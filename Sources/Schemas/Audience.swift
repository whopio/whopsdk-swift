import Foundation

public struct Audience: Codable, Hashable, Sendable {
    /// Whether the audience targets a defined group of people or people similar to an existing audience.
    public let audienceType: AudienceAudienceType
    /// Whether Whop rebuilds membership from saved People filters twice a day. When `false`, People audiences keep the members matched at creation. Always `false` for uploaded lists, lookalikes, and engagement audiences.
    public let autoRefresh: Bool
    /// When the audience was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Why a `pending` audience hasn't started, or why a `partial` or `failed` one isn't fully built. `null` when there is nothing to report.
    public let errorMessage: Nullable<String>
    /// Saved Whop People filters that define membership, using the same keys as `GET /people`. `null` for uploaded lists, engagement audiences, and lookalikes.
    public let filters: Nullable<[String: JSONValue]>
    /// Audience ID, prefixed `adaud_`.
    public let id: String
    /// When the audience membership was last rebuilt, as an ISO 8601 timestamp. `null` until the first build completes.
    public let lastRefreshedAt: Nullable<String>
    /// For lookalikes: the upper bound of the similarity band as a fraction (0.02 = top 2%). `null` for custom audiences.
    public let lookalikeRatio: Nullable<Double>
    /// For lookalikes: the lower bound of the similarity band as a fraction. `null` for custom audiences and first-tier lookalikes.
    public let lookalikeStartingRatio: Nullable<Double>
    public let matchRates: [AudienceMatchRate]
    /// Members successfully uploaded to connected ad accounts. Always 0 for lookalikes and engagement audiences.
    public let matchedRows: Double
    /// Audience display name.
    public let name: String
    public let platformAudienceIds: [String]
    /// Members processed from the source so far. Always 0 for lookalikes and engagement audiences.
    public let processedRows: Double
    /// Processing progress from 0 to 100.
    public let progressPercent: Double
    /// For lookalikes: the audience this lookalike was built from. `null` for custom audiences.
    public let sourceAudienceId: Nullable<String>
    /// Membership source: an uploaded CSV, Whop People filters, or social engagement. Engagement audiences can no longer be created.
    public let sourceType: AudienceSourceType
    /// Current state of audience creation. When a `pending` audience is waiting on something, such as an ad account to upload to, `error_message` says what. When status is `partial` or `failed`, `error_message` explains what went wrong.
    public let status: AudienceStatus
    /// Total members detected in the source — CSV rows for uploaded lists, matching people for automatic audiences. Always 0 for lookalikes and engagement audiences.
    public let totalRows: Double
    /// When the audience was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        audienceType: AudienceAudienceType,
        autoRefresh: Bool,
        createdAt: String,
        errorMessage: Nullable<String>,
        filters: Nullable<[String: JSONValue]>,
        id: String,
        lastRefreshedAt: Nullable<String>,
        lookalikeRatio: Nullable<Double>,
        lookalikeStartingRatio: Nullable<Double>,
        matchRates: [AudienceMatchRate],
        matchedRows: Double,
        name: String,
        platformAudienceIds: [String],
        processedRows: Double,
        progressPercent: Double,
        sourceAudienceId: Nullable<String>,
        sourceType: AudienceSourceType,
        status: AudienceStatus,
        totalRows: Double,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.audienceType = audienceType
        self.autoRefresh = autoRefresh
        self.createdAt = createdAt
        self.errorMessage = errorMessage
        self.filters = filters
        self.id = id
        self.lastRefreshedAt = lastRefreshedAt
        self.lookalikeRatio = lookalikeRatio
        self.lookalikeStartingRatio = lookalikeStartingRatio
        self.matchRates = matchRates
        self.matchedRows = matchedRows
        self.name = name
        self.platformAudienceIds = platformAudienceIds
        self.processedRows = processedRows
        self.progressPercent = progressPercent
        self.sourceAudienceId = sourceAudienceId
        self.sourceType = sourceType
        self.status = status
        self.totalRows = totalRows
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.audienceType = try container.decode(AudienceAudienceType.self, forKey: .audienceType)
        self.autoRefresh = try container.decode(Bool.self, forKey: .autoRefresh)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.filters = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .filters)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastRefreshedAt = try container.decode(Nullable<String>.self, forKey: .lastRefreshedAt)
        self.lookalikeRatio = try container.decode(Nullable<Double>.self, forKey: .lookalikeRatio)
        self.lookalikeStartingRatio = try container.decode(Nullable<Double>.self, forKey: .lookalikeStartingRatio)
        self.matchRates = try container.decode([AudienceMatchRate].self, forKey: .matchRates)
        self.matchedRows = try container.decode(Double.self, forKey: .matchedRows)
        self.name = try container.decode(String.self, forKey: .name)
        self.platformAudienceIds = try container.decode([String].self, forKey: .platformAudienceIds)
        self.processedRows = try container.decode(Double.self, forKey: .processedRows)
        self.progressPercent = try container.decode(Double.self, forKey: .progressPercent)
        self.sourceAudienceId = try container.decode(Nullable<String>.self, forKey: .sourceAudienceId)
        self.sourceType = try container.decode(AudienceSourceType.self, forKey: .sourceType)
        self.status = try container.decode(AudienceStatus.self, forKey: .status)
        self.totalRows = try container.decode(Double.self, forKey: .totalRows)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.audienceType, forKey: .audienceType)
        try container.encode(self.autoRefresh, forKey: .autoRefresh)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.filters, forKey: .filters)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastRefreshedAt, forKey: .lastRefreshedAt)
        try container.encode(self.lookalikeRatio, forKey: .lookalikeRatio)
        try container.encode(self.lookalikeStartingRatio, forKey: .lookalikeStartingRatio)
        try container.encode(self.matchRates, forKey: .matchRates)
        try container.encode(self.matchedRows, forKey: .matchedRows)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.platformAudienceIds, forKey: .platformAudienceIds)
        try container.encode(self.processedRows, forKey: .processedRows)
        try container.encode(self.progressPercent, forKey: .progressPercent)
        try container.encode(self.sourceAudienceId, forKey: .sourceAudienceId)
        try container.encode(self.sourceType, forKey: .sourceType)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.totalRows, forKey: .totalRows)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case audienceType = "audience_type"
        case autoRefresh = "auto_refresh"
        case createdAt = "created_at"
        case errorMessage = "error_message"
        case filters
        case id
        case lastRefreshedAt = "last_refreshed_at"
        case lookalikeRatio = "lookalike_ratio"
        case lookalikeStartingRatio = "lookalike_starting_ratio"
        case matchRates = "match_rates"
        case matchedRows = "matched_rows"
        case name
        case platformAudienceIds = "platform_audience_ids"
        case processedRows = "processed_rows"
        case progressPercent = "progress_percent"
        case sourceAudienceId = "source_audience_id"
        case sourceType = "source_type"
        case status
        case totalRows = "total_rows"
        case updatedAt = "updated_at"
    }
}