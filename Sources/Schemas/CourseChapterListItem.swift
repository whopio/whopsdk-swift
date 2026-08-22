import Foundation

/// A grouping of related lessons within a course, used to organize content into sections.
public struct CourseChapterListItem: Codable, Hashable, Sendable {
    /// The unique identifier for the chapter.
    public let id: String
    /// The sort position of this chapter within its parent course, starting from zero.
    public let order: Int
    /// The display name of the chapter shown to students. Maximum 150 characters.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        order: Int,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.order = order
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.order = try container.decode(Int.self, forKey: .order)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case order
        case title
    }
}