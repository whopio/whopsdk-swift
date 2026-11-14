import Foundation

public struct AdPixel: Codable, Hashable, Sendable {
    /// The business whose claimed campaigns send conversions to this pixel, prefixed `biz_`.
    public let accountId: String
    /// When the pixel was added, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Why the ad platform rejected the last delivery. Null unless `status` is `errored`.
    public let errorMessage: Nullable<String>
    /// The pixel's ID on the ad platform: a Meta pixel or dataset ID, TikTok pixel code, Google Ads customer ID, or Thrad tag ID.
    public let externalId: String
    /// Ad pixel ID, prefixed `adpx_`.
    public let id: String
    /// The pixel's name on the ad platform. Null when the ad platform returned none.
    public let name: Nullable<String>
    /// The ad platform the pixel belongs to.
    public let platform: AdPixelPlatform
    /// `active` receives conversions. `errored` stopped because the ad platform rejected the access token; update the token to resume. `disabled` was turned off by Whop.
    public let status: AdPixelStatus
    /// When the pixel was last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        createdAt: String,
        errorMessage: Nullable<String>,
        externalId: String,
        id: String,
        name: Nullable<String>,
        platform: AdPixelPlatform,
        status: AdPixelStatus,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.createdAt = createdAt
        self.errorMessage = errorMessage
        self.externalId = externalId
        self.id = id
        self.name = name
        self.platform = platform
        self.status = status
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.errorMessage = try container.decode(Nullable<String>.self, forKey: .errorMessage)
        self.externalId = try container.decode(String.self, forKey: .externalId)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.platform = try container.decode(AdPixelPlatform.self, forKey: .platform)
        self.status = try container.decode(AdPixelStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.externalId, forKey: .externalId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case createdAt = "created_at"
        case errorMessage = "error_message"
        case externalId = "external_id"
        case id
        case name
        case platform
        case status
        case updatedAt = "updated_at"
    }
}