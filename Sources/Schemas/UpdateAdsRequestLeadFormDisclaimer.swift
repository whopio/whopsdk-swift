import Foundation

/// Optional custom consent disclaimer with checkboxes.
public struct UpdateAdsRequestLeadFormDisclaimer: Codable, Hashable, Sendable {
    public let body: String?
    public let checkboxes: [UpdateAdsRequestLeadFormDisclaimerCheckboxesItem]?
    public let title: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        body: String? = nil,
        checkboxes: [UpdateAdsRequestLeadFormDisclaimerCheckboxesItem]? = nil,
        title: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.body = body
        self.checkboxes = checkboxes
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.body = try container.decodeIfPresent(String.self, forKey: .body)
        self.checkboxes = try container.decodeIfPresent([UpdateAdsRequestLeadFormDisclaimerCheckboxesItem].self, forKey: .checkboxes)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.body, forKey: .body)
        try container.encodeIfPresent(self.checkboxes, forKey: .checkboxes)
        try container.encodeIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case body
        case checkboxes
        case title
    }
}