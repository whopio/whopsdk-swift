import Foundation

public struct UpdatePreferencesRequestFeedbackOptionsItem: Codable, Hashable, Sendable {
    /// The category saved as the membership's `cancel_option` when a member picks this option, so reports keep grouping cancellations.
    public let category: UpdatePreferencesRequestFeedbackOptionsItemCategory
    /// The ID of an option to keep. Omit it to add a new option.
    public let id: String?
    /// The cancel reason as members see it.
    public let label: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        category: UpdatePreferencesRequestFeedbackOptionsItemCategory,
        id: String? = nil,
        label: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.category = category
        self.id = id
        self.label = label
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(UpdatePreferencesRequestFeedbackOptionsItemCategory.self, forKey: .category)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.label = try container.decode(String.self, forKey: .label)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.category, forKey: .category)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encode(self.label, forKey: .label)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case category
        case id
        case label
    }
}