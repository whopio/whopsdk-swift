import Foundation

extension Requests {
    public struct CreateAudiencesRequest: Codable, Hashable, Sendable {
        /// Account ID, prefixed `biz_`.
        public let accountId: String
        /// Audience type. Defaults to `custom`.
        public let audienceType: CreateAudiencesRequestAudienceType?
        /// Filter audiences only, and set only at creation. `true` (the default) rebuilds membership from the filters twice a day. `false` keeps whoever matched at creation and never rebuilds.
        public let autoRefresh: Bool?
        /// CSV audiences only. Maps supported identity fields to CSV column headers. Map at least one of `email` or `phone`.
        public let columnMapping: CreateAudiencesRequestColumnMapping?
        /// Lookalikes only. Number of lookalike audiences to create (1–6).
        public let count: Int?
        /// CSV audiences only. The uploaded customer CSV — a file id (`file_...`) returned by `POST /files`.
        public let fileId: String?
        /// Filter audiences only. The People filters that define membership, keyed exactly as `GET /people` accepts them — for example `{"os": "iOS", "country": "US"}`. Activity dates `event_from` and `event_to` are inclusive and remain fixed on refresh. Use `event_within_days`, `first_seen_within_days` or `last_seen_within_days` for a rolling window. Source values are canonical source paths (`whop:<campaign>:<group>:<ad>`, `ext:<platform>:...`, `referrer:<domain>`, `direct`), exact or with a trailing `:*` wildcard.
        public let filters: [String: JSONValue]?
        /// Audience display name. Required for custom audiences; lookalike names are generated from the source audience.
        public let name: String?
        /// Lookalikes only. Total similarity reach as a whole percent (1–20), sliced evenly across `count` — must be divisible by `count`. For example, 3 audiences at 6% creates 0–2%, 2–4%, and 4–6% bands.
        public let percentage: Int?
        /// Lookalikes only. The ready custom audience (`adaud_`) to build from; uploaded and People audiences need at least 100 matched people.
        public let sourceAudienceId: String?
        /// Custom audience source. Inferred from `filters`, otherwise defaults to `csv_upload`. Supply only the fields for the selected source.
        public let sourceType: CreateAudiencesRequestSourceType?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String,
            audienceType: CreateAudiencesRequestAudienceType? = nil,
            autoRefresh: Bool? = nil,
            columnMapping: CreateAudiencesRequestColumnMapping? = nil,
            count: Int? = nil,
            fileId: String? = nil,
            filters: [String: JSONValue]? = nil,
            name: String? = nil,
            percentage: Int? = nil,
            sourceAudienceId: String? = nil,
            sourceType: CreateAudiencesRequestSourceType? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.audienceType = audienceType
            self.autoRefresh = autoRefresh
            self.columnMapping = columnMapping
            self.count = count
            self.fileId = fileId
            self.filters = filters
            self.name = name
            self.percentage = percentage
            self.sourceAudienceId = sourceAudienceId
            self.sourceType = sourceType
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.audienceType = try container.decodeIfPresent(CreateAudiencesRequestAudienceType.self, forKey: .audienceType)
            self.autoRefresh = try container.decodeIfPresent(Bool.self, forKey: .autoRefresh)
            self.columnMapping = try container.decodeIfPresent(CreateAudiencesRequestColumnMapping.self, forKey: .columnMapping)
            self.count = try container.decodeIfPresent(Int.self, forKey: .count)
            self.fileId = try container.decodeIfPresent(String.self, forKey: .fileId)
            self.filters = try container.decodeIfPresent([String: JSONValue].self, forKey: .filters)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.percentage = try container.decodeIfPresent(Int.self, forKey: .percentage)
            self.sourceAudienceId = try container.decodeIfPresent(String.self, forKey: .sourceAudienceId)
            self.sourceType = try container.decodeIfPresent(CreateAudiencesRequestSourceType.self, forKey: .sourceType)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.audienceType, forKey: .audienceType)
            try container.encodeIfPresent(self.autoRefresh, forKey: .autoRefresh)
            try container.encodeIfPresent(self.columnMapping, forKey: .columnMapping)
            try container.encodeIfPresent(self.count, forKey: .count)
            try container.encodeIfPresent(self.fileId, forKey: .fileId)
            try container.encodeIfPresent(self.filters, forKey: .filters)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.percentage, forKey: .percentage)
            try container.encodeIfPresent(self.sourceAudienceId, forKey: .sourceAudienceId)
            try container.encodeIfPresent(self.sourceType, forKey: .sourceType)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case audienceType = "audience_type"
            case autoRefresh = "auto_refresh"
            case columnMapping = "column_mapping"
            case count
            case fileId = "file_id"
            case filters
            case name
            case percentage
            case sourceAudienceId = "source_audience_id"
            case sourceType = "source_type"
        }
    }
}