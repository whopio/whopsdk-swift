import Foundation

extension Requests {
    public struct CreateExportsRequest: Codable, Hashable, Sendable {
        /// The account to export from, prefixed `biz_`. Defaults to the credential's account.
        public let accountId: String?
        /// Column keys to include. Empty means all columns for the resource.
        public let columns: [String]?
        /// Resource-specific filters. For native REST resources (`payouts`, `transfers`, `products`) these are the resource's own list query params; for dashboard tables they mirror the dashboard table filters.
        public let filters: [String: JSONValue]?
        /// The resource to export, e.g. `payouts`, `receipts`, or `members`.
        public let resource: CreateExportsRequestResource
        /// IANA timezone for date columns, e.g. `America/New_York`. Defaults to `UTC`.
        public let timezone: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            columns: [String]? = nil,
            filters: [String: JSONValue]? = nil,
            resource: CreateExportsRequestResource,
            timezone: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.columns = columns
            self.filters = filters
            self.resource = resource
            self.timezone = timezone
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.columns = try container.decodeIfPresent([String].self, forKey: .columns)
            self.filters = try container.decodeIfPresent([String: JSONValue].self, forKey: .filters)
            self.resource = try container.decode(CreateExportsRequestResource.self, forKey: .resource)
            self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.columns, forKey: .columns)
            try container.encodeIfPresent(self.filters, forKey: .filters)
            try container.encode(self.resource, forKey: .resource)
            try container.encodeIfPresent(self.timezone, forKey: .timezone)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case columns
            case filters
            case resource
            case timezone
        }
    }
}