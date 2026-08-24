import Foundation

/// Input for updating a lesson while updating a course
public struct UpdateCoursesRequestChaptersItemLessonsItem: Codable, Hashable, Sendable {
    /// The ID of the chapter this lesson belongs to (for moving between chapters)
    public let chapterId: String
    /// The ID of the lesson to update
    public let id: String
    /// The order of the lesson within its chapter
    public let order: Int
    /// The title of the lesson
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        chapterId: String,
        id: String,
        order: Int,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.chapterId = chapterId
        self.id = id
        self.order = order
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chapterId = try container.decode(String.self, forKey: .chapterId)
        self.id = try container.decode(String.self, forKey: .id)
        self.order = try container.decode(Int.self, forKey: .order)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.chapterId, forKey: .chapterId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case chapterId = "chapter_id"
        case id
        case order
        case title
    }
}