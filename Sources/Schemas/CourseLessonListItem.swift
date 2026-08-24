import Foundation

/// An individual learning unit within a chapter, which can contain text, video, PDF, or assessment content.
public struct CourseLessonListItem: Codable, Hashable, Sendable {
    /// The Markdown content body of the lesson. Null if the lesson has no text content.
    public let content: Nullable<String>
    /// The datetime the lesson was created.
    public let createdAt: Date
    /// The number of days after a student starts the course before this lesson becomes accessible. Null if the lesson is available immediately.
    public let daysFromCourseStartUntilUnlock: Nullable<Int>
    /// The external video identifier for embedded video lessons, such as a YouTube video ID or Loom share ID. Null if the lesson has no embed.
    public let embedId: Nullable<String>
    /// The platform type for the embedded video. One of: youtube, loom. Null if the lesson has no embed.
    public let embedType: Nullable<EmbedTypes>
    /// The unique identifier for the lesson.
    public let id: String
    /// The content format of this lesson. One of: text, video, pdf, multi, quiz, knowledge_check.
    public let lessonType: LessonTypes
    /// The sort position of this lesson within its parent chapter, starting from zero.
    public let order: Int
    /// The thumbnail image displayed on lesson cards and previews. Null if no thumbnail has been uploaded.
    public let thumbnail: Nullable<CourseLessonListItemThumbnail>
    /// The display name of the lesson shown to students. Maximum 120 characters.
    public let title: String
    /// The visibility setting that controls whether this lesson appears to students. One of: visible, hidden.
    public let visibility: LessonVisibilities
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: Nullable<String>,
        createdAt: Date,
        daysFromCourseStartUntilUnlock: Nullable<Int>,
        embedId: Nullable<String>,
        embedType: Nullable<EmbedTypes>,
        id: String,
        lessonType: LessonTypes,
        order: Int,
        thumbnail: Nullable<CourseLessonListItemThumbnail>,
        title: String,
        visibility: LessonVisibilities,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.createdAt = createdAt
        self.daysFromCourseStartUntilUnlock = daysFromCourseStartUntilUnlock
        self.embedId = embedId
        self.embedType = embedType
        self.id = id
        self.lessonType = lessonType
        self.order = order
        self.thumbnail = thumbnail
        self.title = title
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(Nullable<String>.self, forKey: .content)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.daysFromCourseStartUntilUnlock = try container.decode(Nullable<Int>.self, forKey: .daysFromCourseStartUntilUnlock)
        self.embedId = try container.decode(Nullable<String>.self, forKey: .embedId)
        self.embedType = try container.decode(Nullable<EmbedTypes>.self, forKey: .embedType)
        self.id = try container.decode(String.self, forKey: .id)
        self.lessonType = try container.decode(LessonTypes.self, forKey: .lessonType)
        self.order = try container.decode(Int.self, forKey: .order)
        self.thumbnail = try container.decode(Nullable<CourseLessonListItemThumbnail>.self, forKey: .thumbnail)
        self.title = try container.decode(String.self, forKey: .title)
        self.visibility = try container.decode(LessonVisibilities.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.daysFromCourseStartUntilUnlock, forKey: .daysFromCourseStartUntilUnlock)
        try container.encode(self.embedId, forKey: .embedId)
        try container.encode(self.embedType, forKey: .embedType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lessonType, forKey: .lessonType)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.thumbnail, forKey: .thumbnail)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case createdAt = "created_at"
        case daysFromCourseStartUntilUnlock = "days_from_course_start_until_unlock"
        case embedId = "embed_id"
        case embedType = "embed_type"
        case id
        case lessonType = "lesson_type"
        case order
        case thumbnail
        case title
        case visibility
    }
}