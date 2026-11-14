import Foundation

public struct RetrievePreferencesResponseFeedbackOptionsItem: Codable, Hashable, Sendable {
    /// The category saved as the membership's `cancel_option` when a member picks this option.
    public let category: RetrievePreferencesResponseFeedbackOptionsItemCategory
    /// Feedback option ID, prefixed `fo_`. Pass it as `feedback_option_id` when canceling a membership, or back in `feedback_options` to keep the option when changing the list.
    public let id: String
    /// The cancel reason as members see it. Up to 100 characters.
    public let label: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        category: RetrievePreferencesResponseFeedbackOptionsItemCategory,
        id: String,
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
        self.category = try container.decode(RetrievePreferencesResponseFeedbackOptionsItemCategory.self, forKey: .category)
        self.id = try container.decode(String.self, forKey: .id)
        self.label = try container.decode(String.self, forKey: .label)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.label, forKey: .label)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case category
        case id
        case label
    }
}