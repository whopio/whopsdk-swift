import Foundation

/// An individual learning unit within a chapter, which can contain text, video, PDF, or assessment content.
public struct CourseChaptersItemLessonsItem: Codable, Hashable, Sendable {
    /// The unique identifier for the lesson.
    public let id: String
    /// The content format of this lesson. One of: text, video, pdf, multi, quiz, knowledge_check.
    public let lessonType: LessonTypes
    /// The sort position of this lesson within its parent chapter, starting from zero.
    public let order: Int
    /// The thumbnail image displayed on lesson cards and previews. Null if no thumbnail has been uploaded.
    public let thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>
    /// The display name of the lesson shown to students. Maximum 120 characters.
    public let title: String
    /// The Mux video asset for video-type lessons, used for streaming playback. Null if this lesson has no hosted video.
    public let videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        lessonType: LessonTypes,
        order: Int,
        thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>,
        title: String,
        videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.lessonType = lessonType
        self.order = order
        self.thumbnail = thumbnail
        self.title = title
        self.videoAsset = videoAsset
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.lessonType = try container.decode(LessonTypes.self, forKey: .lessonType)
        self.order = try container.decode(Int.self, forKey: .order)
        self.thumbnail = try container.decode(Nullable<CourseChaptersItemLessonsItemThumbnail>.self, forKey: .thumbnail)
        self.title = try container.decode(String.self, forKey: .title)
        self.videoAsset = try container.decode(Nullable<CourseChaptersItemLessonsItemVideoAsset>.self, forKey: .videoAsset)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lessonType, forKey: .lessonType)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.thumbnail, forKey: .thumbnail)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.videoAsset, forKey: .videoAsset)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case lessonType = "lesson_type"
        case order
        case thumbnail
        case title
        case videoAsset = "video_asset"
    }
}