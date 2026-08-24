import Foundation

public struct AdLeadFormDisclaimer: Codable, Hashable, Sendable {
    /// Disclaimer text.
    public let body: Nullable<String>
    public let checkboxes: [AdLeadFormDisclaimerCheckbox]
    /// Disclaimer title.
    public let title: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        body: Nullable<String>,
        checkboxes: [AdLeadFormDisclaimerCheckbox],
        title: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.body = body
        self.checkboxes = checkboxes
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.body = try container.decode(Nullable<String>.self, forKey: .body)
        self.checkboxes = try container.decode([AdLeadFormDisclaimerCheckbox].self, forKey: .checkboxes)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.body, forKey: .body)
        try container.encode(self.checkboxes, forKey: .checkboxes)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case body
        case checkboxes
        case title
    }
}