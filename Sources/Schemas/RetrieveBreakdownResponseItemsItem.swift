import Foundation

public struct RetrieveBreakdownResponseItemsItem: Codable, Hashable, Sendable {
    public let amount: Money
    /// How to draw the row's icon. `null` when the row has nothing to show (balances, adjustments, ad campaigns), so clients render no icon rather than a placeholder.
    public let avatar: Nullable<RetrieveBreakdownResponseItemsItemAvatar>
    public let imageUrl: Nullable<String>
    /// An opaque identifier for this grouping within the breakdown.
    public let key: String
    public let name: String
    public let object: RetrieveBreakdownResponseItemsItemObject
    /// The prefixed identifier of the represented Whop resource, when one exists.
    public let resourceId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Money,
        avatar: Nullable<RetrieveBreakdownResponseItemsItemAvatar>,
        imageUrl: Nullable<String>,
        key: String,
        name: String,
        object: RetrieveBreakdownResponseItemsItemObject,
        resourceId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.avatar = avatar
        self.imageUrl = imageUrl
        self.key = key
        self.name = name
        self.object = object
        self.resourceId = resourceId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Money.self, forKey: .amount)
        self.avatar = try container.decode(Nullable<RetrieveBreakdownResponseItemsItemAvatar>.self, forKey: .avatar)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.object = try container.decode(RetrieveBreakdownResponseItemsItemObject.self, forKey: .object)
        self.resourceId = try container.decode(Nullable<String>.self, forKey: .resourceId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.avatar, forKey: .avatar)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.resourceId, forKey: .resourceId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case avatar
        case imageUrl = "image_url"
        case key
        case name
        case object
        case resourceId = "resource_id"
    }
}