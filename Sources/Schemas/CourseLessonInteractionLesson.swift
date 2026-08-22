import Foundation

/// The lesson that this progress record belongs to.
public struct CourseLessonInteractionLesson: Codable, Hashable, Sendable {
    /// The parent chapter that contains this lesson.
    public let chapter: CourseLessonInteractionLessonChapter
    /// The unique identifier for the lesson.
    public let id: String
    /// The display name of the lesson shown to students. Maximum 120 characters.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        chapter: CourseLessonInteractionLessonChapter,
        id: String,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.chapter = chapter
        self.id = id
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.chapter = try container.decode(CourseLessonInteractionLessonChapter.self, forKey: .chapter)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.chapter, forKey: .chapter)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case chapter
        case id
        case title
    }
}