import Foundation

extension Requests {
    public struct CreateCourseLessonsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the chapter to create the lesson in (e.g., "chap_XXXXX").
        public let chapterId: String
        /// The Markdown content body of the lesson.
        public let content: Nullable<String>?
        /// The number of days after a student starts the course before this lesson becomes accessible.
        public let daysFromCourseStartUntilUnlock: Nullable<Int>?
        /// The external video identifier for embedded content (e.g., a YouTube video ID or Loom share ID).
        public let embedId: Nullable<String>?
        /// The type of video embed for this lesson, such as YouTube or Loom.
        public let embedType: Nullable<EmbedTypes>?
        /// The content type of the lesson, such as video, text, quiz, or knowledge check.
        public let lessonType: LessonTypes
        /// The thumbnail image for the lesson in PNG, JPEG, or GIF format.
        public let thumbnail: Nullable<CreateCourseLessonsRequestThumbnail>?
        /// The display title of the lesson (e.g., "Getting Started with APIs").
        public let title: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            chapterId: String,
            content: Nullable<String>? = nil,
            daysFromCourseStartUntilUnlock: Nullable<Int>? = nil,
            embedId: Nullable<String>? = nil,
            embedType: Nullable<EmbedTypes>? = nil,
            lessonType: LessonTypes,
            thumbnail: Nullable<CreateCourseLessonsRequestThumbnail>? = nil,
            title: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.chapterId = chapterId
            self.content = content
            self.daysFromCourseStartUntilUnlock = daysFromCourseStartUntilUnlock
            self.embedId = embedId
            self.embedType = embedType
            self.lessonType = lessonType
            self.thumbnail = thumbnail
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.chapterId = try container.decode(String.self, forKey: .chapterId)
            self.content = try container.decodeNullableIfPresent(String.self, forKey: .content)
            self.daysFromCourseStartUntilUnlock = try container.decodeNullableIfPresent(Int.self, forKey: .daysFromCourseStartUntilUnlock)
            self.embedId = try container.decodeNullableIfPresent(String.self, forKey: .embedId)
            self.embedType = try container.decodeNullableIfPresent(EmbedTypes.self, forKey: .embedType)
            self.lessonType = try container.decode(LessonTypes.self, forKey: .lessonType)
            self.thumbnail = try container.decodeNullableIfPresent(CreateCourseLessonsRequestThumbnail.self, forKey: .thumbnail)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.chapterId, forKey: .chapterId)
            try container.encodeNullableIfPresent(self.content, forKey: .content)
            try container.encodeNullableIfPresent(self.daysFromCourseStartUntilUnlock, forKey: .daysFromCourseStartUntilUnlock)
            try container.encodeNullableIfPresent(self.embedId, forKey: .embedId)
            try container.encodeNullableIfPresent(self.embedType, forKey: .embedType)
            try container.encode(self.lessonType, forKey: .lessonType)
            try container.encodeNullableIfPresent(self.thumbnail, forKey: .thumbnail)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case chapterId = "chapter_id"
            case content
            case daysFromCourseStartUntilUnlock = "days_from_course_start_until_unlock"
            case embedId = "embed_id"
            case embedType = "embed_type"
            case lessonType = "lesson_type"
            case thumbnail
            case title
        }
    }
}