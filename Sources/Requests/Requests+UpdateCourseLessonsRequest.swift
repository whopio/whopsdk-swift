import Foundation

extension Requests {
    public struct UpdateCourseLessonsRequest: Codable, Hashable, Sendable {
        /// The passing criteria for quiz or knowledge check lessons, such as minimum grade or correct answers.
        public let assessmentCompletionRequirement: Nullable<UpdateCourseLessonsRequestAssessmentCompletionRequirement>?
        /// The full list of assessment questions for quiz or knowledge check lessons. Replaces all existing questions.
        public let assessmentQuestions: Nullable<[UpdateCourseLessonsRequestAssessmentQuestionsItem]>?
        /// File attachments for the lesson such as PDFs or documents. Replaces all existing attachments.
        public let attachments: Nullable<[UpdateCourseLessonsRequestAttachmentsItem]>?
        /// The Markdown content body of the lesson.
        public let content: Nullable<String>?
        /// The number of days after a student starts the course before this lesson becomes accessible.
        public let daysFromCourseStartUntilUnlock: Nullable<Int>?
        /// The external video identifier for embedded content (e.g., a YouTube video ID or Loom share ID).
        public let embedId: Nullable<String>?
        /// The type of video embed for this lesson, such as YouTube or Loom.
        public let embedType: Nullable<EmbedTypes>?
        /// The content type of the lesson, such as video, text, quiz, or knowledge check.
        public let lessonType: Nullable<LessonTypes>?
        /// The primary PDF document attached to this lesson for student reference.
        public let mainPdf: Nullable<UpdateCourseLessonsRequestMainPdf>?
        /// The maximum number of attempts a student is allowed for assessment lessons.
        public let maxAttempts: Nullable<Int>?
        /// The identifier of a Mux video asset to attach to this lesson (e.g., "mux_XXXXX").
        public let muxAssetId: Nullable<String>?
        /// The thumbnail image for the lesson in PNG, JPEG, or GIF format.
        public let thumbnail: Nullable<UpdateCourseLessonsRequestThumbnail>?
        /// The display title of the lesson (e.g., "Getting Started with APIs").
        public let title: Nullable<String>?
        /// Controls whether this lesson is visible to students or hidden as a draft.
        public let visibility: Nullable<LessonVisibilities>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            assessmentCompletionRequirement: Nullable<UpdateCourseLessonsRequestAssessmentCompletionRequirement>? = nil,
            assessmentQuestions: Nullable<[UpdateCourseLessonsRequestAssessmentQuestionsItem]>? = nil,
            attachments: Nullable<[UpdateCourseLessonsRequestAttachmentsItem]>? = nil,
            content: Nullable<String>? = nil,
            daysFromCourseStartUntilUnlock: Nullable<Int>? = nil,
            embedId: Nullable<String>? = nil,
            embedType: Nullable<EmbedTypes>? = nil,
            lessonType: Nullable<LessonTypes>? = nil,
            mainPdf: Nullable<UpdateCourseLessonsRequestMainPdf>? = nil,
            maxAttempts: Nullable<Int>? = nil,
            muxAssetId: Nullable<String>? = nil,
            thumbnail: Nullable<UpdateCourseLessonsRequestThumbnail>? = nil,
            title: Nullable<String>? = nil,
            visibility: Nullable<LessonVisibilities>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.assessmentCompletionRequirement = assessmentCompletionRequirement
            self.assessmentQuestions = assessmentQuestions
            self.attachments = attachments
            self.content = content
            self.daysFromCourseStartUntilUnlock = daysFromCourseStartUntilUnlock
            self.embedId = embedId
            self.embedType = embedType
            self.lessonType = lessonType
            self.mainPdf = mainPdf
            self.maxAttempts = maxAttempts
            self.muxAssetId = muxAssetId
            self.thumbnail = thumbnail
            self.title = title
            self.visibility = visibility
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.assessmentCompletionRequirement = try container.decodeNullableIfPresent(UpdateCourseLessonsRequestAssessmentCompletionRequirement.self, forKey: .assessmentCompletionRequirement)
            self.assessmentQuestions = try container.decodeNullableIfPresent([UpdateCourseLessonsRequestAssessmentQuestionsItem].self, forKey: .assessmentQuestions)
            self.attachments = try container.decodeNullableIfPresent([UpdateCourseLessonsRequestAttachmentsItem].self, forKey: .attachments)
            self.content = try container.decodeNullableIfPresent(String.self, forKey: .content)
            self.daysFromCourseStartUntilUnlock = try container.decodeNullableIfPresent(Int.self, forKey: .daysFromCourseStartUntilUnlock)
            self.embedId = try container.decodeNullableIfPresent(String.self, forKey: .embedId)
            self.embedType = try container.decodeNullableIfPresent(EmbedTypes.self, forKey: .embedType)
            self.lessonType = try container.decodeNullableIfPresent(LessonTypes.self, forKey: .lessonType)
            self.mainPdf = try container.decodeNullableIfPresent(UpdateCourseLessonsRequestMainPdf.self, forKey: .mainPdf)
            self.maxAttempts = try container.decodeNullableIfPresent(Int.self, forKey: .maxAttempts)
            self.muxAssetId = try container.decodeNullableIfPresent(String.self, forKey: .muxAssetId)
            self.thumbnail = try container.decodeNullableIfPresent(UpdateCourseLessonsRequestThumbnail.self, forKey: .thumbnail)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.visibility = try container.decodeNullableIfPresent(LessonVisibilities.self, forKey: .visibility)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.assessmentCompletionRequirement, forKey: .assessmentCompletionRequirement)
            try container.encodeNullableIfPresent(self.assessmentQuestions, forKey: .assessmentQuestions)
            try container.encodeNullableIfPresent(self.attachments, forKey: .attachments)
            try container.encodeNullableIfPresent(self.content, forKey: .content)
            try container.encodeNullableIfPresent(self.daysFromCourseStartUntilUnlock, forKey: .daysFromCourseStartUntilUnlock)
            try container.encodeNullableIfPresent(self.embedId, forKey: .embedId)
            try container.encodeNullableIfPresent(self.embedType, forKey: .embedType)
            try container.encodeNullableIfPresent(self.lessonType, forKey: .lessonType)
            try container.encodeNullableIfPresent(self.mainPdf, forKey: .mainPdf)
            try container.encodeNullableIfPresent(self.maxAttempts, forKey: .maxAttempts)
            try container.encodeNullableIfPresent(self.muxAssetId, forKey: .muxAssetId)
            try container.encodeNullableIfPresent(self.thumbnail, forKey: .thumbnail)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
            try container.encodeNullableIfPresent(self.visibility, forKey: .visibility)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case assessmentCompletionRequirement = "assessment_completion_requirement"
            case assessmentQuestions = "assessment_questions"
            case attachments
            case content
            case daysFromCourseStartUntilUnlock = "days_from_course_start_until_unlock"
            case embedId = "embed_id"
            case embedType = "embed_type"
            case lessonType = "lesson_type"
            case mainPdf = "main_pdf"
            case maxAttempts = "max_attempts"
            case muxAssetId = "mux_asset_id"
            case thumbnail
            case title
            case visibility
        }
    }
}