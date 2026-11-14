import Foundation

public struct RetrieveBreakdownResponse: Codable, Hashable, Sendable {
    public let activityFilters: RetrieveBreakdownResponseActivityFilters
    public let bucket: RetrieveBreakdownResponseBucket
    public let currency: String
    public let direction: RetrieveBreakdownResponseDirection
    public let items: [RetrieveBreakdownResponseItemsItem]
    public let otherAmount: Nullable<Money>
    public let otherName: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        activityFilters: RetrieveBreakdownResponseActivityFilters,
        bucket: RetrieveBreakdownResponseBucket,
        currency: String,
        direction: RetrieveBreakdownResponseDirection,
        items: [RetrieveBreakdownResponseItemsItem],
        otherAmount: Nullable<Money>,
        otherName: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.activityFilters = activityFilters
        self.bucket = bucket
        self.currency = currency
        self.direction = direction
        self.items = items
        self.otherAmount = otherAmount
        self.otherName = otherName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activityFilters = try container.decode(RetrieveBreakdownResponseActivityFilters.self, forKey: .activityFilters)
        self.bucket = try container.decode(RetrieveBreakdownResponseBucket.self, forKey: .bucket)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.direction = try container.decode(RetrieveBreakdownResponseDirection.self, forKey: .direction)
        self.items = try container.decode([RetrieveBreakdownResponseItemsItem].self, forKey: .items)
        self.otherAmount = try container.decode(Nullable<Money>.self, forKey: .otherAmount)
        self.otherName = try container.decode(String.self, forKey: .otherName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.activityFilters, forKey: .activityFilters)
        try container.encode(self.bucket, forKey: .bucket)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.direction, forKey: .direction)
        try container.encode(self.items, forKey: .items)
        try container.encode(self.otherAmount, forKey: .otherAmount)
        try container.encode(self.otherName, forKey: .otherName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case activityFilters = "activity_filters"
        case bucket
        case currency
        case direction
        case items
        case otherAmount = "other_amount"
        case otherName = "other_name"
    }
}