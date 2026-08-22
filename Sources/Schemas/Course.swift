import Foundation

/// A structured learning module containing chapters and lessons, belonging to an experience.
public struct Course: Codable, Hashable, Sendable {
    /// Whether students receive a PDF certificate after completing all lessons in this course. Null if the setting has not been configured.
    public let certificateAfterCompletionEnabled: Nullable<Bool>
    /// An ordered list of all chapters in this course, sorted by their display position.
    public let chapters: [CourseChaptersItem]
    /// The total number of chapters in this course, including chapters whose lessons are all hidden from the current user.
    public let chaptersCount: Int
    /// The number of lessons in this course that the current user has marked as completed. Zero when the request is not made on behalf of a user.
    public let completedLessonsCount: Int
    /// The URL of the course cover image shown on preview cards. Null if no cover image has been uploaded.
    public let coverImage: Nullable<String>
    /// The datetime the course was created.
    public let createdAt: Date
    /// A brief summary of the course content and objectives. Null if no description has been set.
    public let description: Nullable<String>
    /// The unique identifier for the course.
    public let id: String
    /// The spoken language of the video content, used to generate accurate closed captions. One of: en, es, it, pt, de, fr, pl, ru, nl, ca, tr, sv, uk, no, fi, sk, el, cs, hr, da, ro, bg.
    public let language: Languages
    /// The creation timestamp of the most recently added lesson visible to the current user. Null if the course has no lessons.
    public let latestLessonCreatedAt: Nullable<Date>
    /// The distinct drip schedules, in days after the course start, of lessons visible to the current user. Combine with startedAt to work out which have unlocked. Empty when the user has not started the course or no lesson is on a schedule.
    public let lessonUnlockDays: [Int]
    /// The sort position of this course within its parent experience, as a decimal for flexible ordering.
    public let order: String
    /// Whether students must complete each lesson sequentially before advancing to the next one.
    public let requireCompletingLessonsInOrder: Bool
    /// The lesson the current user should continue from: their first incomplete lesson, or the first lesson when they have finished the course, have not started it, or can edit it. Null if the course has no lessons.
    public let resumeLesson: Nullable<CourseResumeLesson>
    /// The earliest time the current user is known to have started this course. Null if they have not started it. Drip unlock schedules are measured from this point.
    public let startedAt: Nullable<Date>
    /// A short marketing tagline displayed beneath the course title. Null if no tagline has been set.
    public let tagline: Nullable<String>
    /// The thumbnail image displayed on course cards and previews. Null if no thumbnail has been uploaded.
    public let thumbnail: Nullable<CourseThumbnail>
    /// The display name of the course shown to students. Null if no title has been set.
    public let title: Nullable<String>
    /// The combined duration in seconds of every hosted video across the lessons visible to the current user.
    public let totalDurationSeconds: Int
    /// The number of lessons in this course visible to the current user.
    public let totalLessonsCount: Int
    /// The datetime the course was last updated.
    public let updatedAt: Date
    /// The visibility setting that controls whether this course appears to students. One of: visible, hidden.
    public let visibility: CourseVisibilities
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        certificateAfterCompletionEnabled: Nullable<Bool>,
        chapters: [CourseChaptersItem],
        chaptersCount: Int,
        completedLessonsCount: Int,
        coverImage: Nullable<String>,
        createdAt: Date,
        description: Nullable<String>,
        id: String,
        language: Languages,
        latestLessonCreatedAt: Nullable<Date>,
        lessonUnlockDays: [Int],
        order: String,
        requireCompletingLessonsInOrder: Bool,
        resumeLesson: Nullable<CourseResumeLesson>,
        startedAt: Nullable<Date>,
        tagline: Nullable<String>,
        thumbnail: Nullable<CourseThumbnail>,
        title: Nullable<String>,
        totalDurationSeconds: Int,
        totalLessonsCount: Int,
        updatedAt: Date,
        visibility: CourseVisibilities,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.certificateAfterCompletionEnabled = certificateAfterCompletionEnabled
        self.chapters = chapters
        self.chaptersCount = chaptersCount
        self.completedLessonsCount = completedLessonsCount
        self.coverImage = coverImage
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.language = language
        self.latestLessonCreatedAt = latestLessonCreatedAt
        self.lessonUnlockDays = lessonUnlockDays
        self.order = order
        self.requireCompletingLessonsInOrder = requireCompletingLessonsInOrder
        self.resumeLesson = resumeLesson
        self.startedAt = startedAt
        self.tagline = tagline
        self.thumbnail = thumbnail
        self.title = title
        self.totalDurationSeconds = totalDurationSeconds
        self.totalLessonsCount = totalLessonsCount
        self.updatedAt = updatedAt
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.certificateAfterCompletionEnabled = try container.decode(Nullable<Bool>.self, forKey: .certificateAfterCompletionEnabled)
        self.chapters = try container.decode([CourseChaptersItem].self, forKey: .chapters)
        self.chaptersCount = try container.decode(Int.self, forKey: .chaptersCount)
        self.completedLessonsCount = try container.decode(Int.self, forKey: .completedLessonsCount)
        self.coverImage = try container.decode(Nullable<String>.self, forKey: .coverImage)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.language = try container.decode(Languages.self, forKey: .language)
        self.latestLessonCreatedAt = try container.decode(Nullable<Date>.self, forKey: .latestLessonCreatedAt)
        self.lessonUnlockDays = try container.decode([Int].self, forKey: .lessonUnlockDays)
        self.order = try container.decode(String.self, forKey: .order)
        self.requireCompletingLessonsInOrder = try container.decode(Bool.self, forKey: .requireCompletingLessonsInOrder)
        self.resumeLesson = try container.decode(Nullable<CourseResumeLesson>.self, forKey: .resumeLesson)
        self.startedAt = try container.decode(Nullable<Date>.self, forKey: .startedAt)
        self.tagline = try container.decode(Nullable<String>.self, forKey: .tagline)
        self.thumbnail = try container.decode(Nullable<CourseThumbnail>.self, forKey: .thumbnail)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.totalDurationSeconds = try container.decode(Int.self, forKey: .totalDurationSeconds)
        self.totalLessonsCount = try container.decode(Int.self, forKey: .totalLessonsCount)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.visibility = try container.decode(CourseVisibilities.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.certificateAfterCompletionEnabled, forKey: .certificateAfterCompletionEnabled)
        try container.encode(self.chapters, forKey: .chapters)
        try container.encode(self.chaptersCount, forKey: .chaptersCount)
        try container.encode(self.completedLessonsCount, forKey: .completedLessonsCount)
        try container.encode(self.coverImage, forKey: .coverImage)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.language, forKey: .language)
        try container.encode(self.latestLessonCreatedAt, forKey: .latestLessonCreatedAt)
        try container.encode(self.lessonUnlockDays, forKey: .lessonUnlockDays)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.requireCompletingLessonsInOrder, forKey: .requireCompletingLessonsInOrder)
        try container.encode(self.resumeLesson, forKey: .resumeLesson)
        try container.encode(self.startedAt, forKey: .startedAt)
        try container.encode(self.tagline, forKey: .tagline)
        try container.encode(self.thumbnail, forKey: .thumbnail)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.totalDurationSeconds, forKey: .totalDurationSeconds)
        try container.encode(self.totalLessonsCount, forKey: .totalLessonsCount)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case certificateAfterCompletionEnabled = "certificate_after_completion_enabled"
        case chapters
        case chaptersCount = "chapters_count"
        case completedLessonsCount = "completed_lessons_count"
        case coverImage = "cover_image"
        case createdAt = "created_at"
        case description
        case id
        case language
        case latestLessonCreatedAt = "latest_lesson_created_at"
        case lessonUnlockDays = "lesson_unlock_days"
        case order
        case requireCompletingLessonsInOrder = "require_completing_lessons_in_order"
        case resumeLesson = "resume_lesson"
        case startedAt = "started_at"
        case tagline
        case thumbnail
        case title
        case totalDurationSeconds = "total_duration_seconds"
        case totalLessonsCount = "total_lessons_count"
        case updatedAt = "updated_at"
        case visibility
    }
}