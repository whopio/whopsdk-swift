import Foundation

extension Requests {
    public struct UpdateCoursesRequest: Codable, Hashable, Sendable {
        /// Whether the course awards students a PDF certificate after completing all lessons.
        public let certificateAfterCompletionEnabled: Nullable<Bool>?
        /// A list of chapters with nested lessons to reorder or rename in bulk.
        public let chapters: Nullable<[UpdateCoursesRequestChaptersItem]>?
        /// A short description of the course displayed to students on the course page.
        public let description: Nullable<String>?
        /// The primary language spoken in the video content of the course.
        public let language: Nullable<Languages>?
        /// The decimal order position of the course within its experience. Use fractional values (e.g., "1.5") to place between existing courses.
        public let order: Nullable<String>?
        /// Whether students must complete each lesson sequentially before advancing to the next one.
        public let requireCompletingLessonsInOrder: Nullable<Bool>?
        /// A short tagline displayed beneath the course title (e.g., "Master the fundamentals of design").
        public let tagline: Nullable<String>?
        /// The thumbnail image for the course in PNG, JPEG, or GIF format.
        public let thumbnail: Nullable<UpdateCoursesRequestThumbnail>?
        /// The display title of the course (e.g., "Introduction to Web Development").
        public let title: Nullable<String>?
        /// Controls whether this course is visible to students or hidden as a draft.
        public let visibility: Nullable<CourseVisibilities>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            certificateAfterCompletionEnabled: Nullable<Bool>? = nil,
            chapters: Nullable<[UpdateCoursesRequestChaptersItem]>? = nil,
            description: Nullable<String>? = nil,
            language: Nullable<Languages>? = nil,
            order: Nullable<String>? = nil,
            requireCompletingLessonsInOrder: Nullable<Bool>? = nil,
            tagline: Nullable<String>? = nil,
            thumbnail: Nullable<UpdateCoursesRequestThumbnail>? = nil,
            title: Nullable<String>? = nil,
            visibility: Nullable<CourseVisibilities>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.certificateAfterCompletionEnabled = certificateAfterCompletionEnabled
            self.chapters = chapters
            self.description = description
            self.language = language
            self.order = order
            self.requireCompletingLessonsInOrder = requireCompletingLessonsInOrder
            self.tagline = tagline
            self.thumbnail = thumbnail
            self.title = title
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.certificateAfterCompletionEnabled = try container.decodeNullableIfPresent(Bool.self, forKey: .certificateAfterCompletionEnabled)
            self.chapters = try container.decodeNullableIfPresent([UpdateCoursesRequestChaptersItem].self, forKey: .chapters)
            self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
            self.language = try container.decodeNullableIfPresent(Languages.self, forKey: .language)
            self.order = try container.decodeNullableIfPresent(String.self, forKey: .order)
            self.requireCompletingLessonsInOrder = try container.decodeNullableIfPresent(Bool.self, forKey: .requireCompletingLessonsInOrder)
            self.tagline = try container.decodeNullableIfPresent(String.self, forKey: .tagline)
            self.thumbnail = try container.decodeNullableIfPresent(UpdateCoursesRequestThumbnail.self, forKey: .thumbnail)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.visibility = try container.decodeNullableIfPresent(CourseVisibilities.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.certificateAfterCompletionEnabled, forKey: .certificateAfterCompletionEnabled)
            try container.encodeNullableIfPresent(self.chapters, forKey: .chapters)
            try container.encodeNullableIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.language, forKey: .language)
            try container.encodeNullableIfPresent(self.order, forKey: .order)
            try container.encodeNullableIfPresent(self.requireCompletingLessonsInOrder, forKey: .requireCompletingLessonsInOrder)
            try container.encodeNullableIfPresent(self.tagline, forKey: .tagline)
            try container.encodeNullableIfPresent(self.thumbnail, forKey: .thumbnail)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case certificateAfterCompletionEnabled = "certificate_after_completion_enabled"
            case chapters
            case description
            case language
            case order
            case requireCompletingLessonsInOrder = "require_completing_lessons_in_order"
            case tagline
            case thumbnail
            case title
            case visibility
        }
    }
}