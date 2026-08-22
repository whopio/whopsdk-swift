import Foundation

/// An enrollment record for a student in a course, including progress and completion metrics.
public struct CourseStudent: Codable, Hashable, Sendable {
    /// The total number of lessons this student has marked as completed in the course.
    public let completedLessonsCount: Int
    /// The percentage of available lessons the student has completed, as a value from 0 to 100 rounded to two decimal places.
    public let completionRate: Double
    /// The course this student is enrolled in.
    public let course: CourseStudentCourse
    /// The timestamp when the student first interacted with this course, as a Unix timestamp.
    public let firstInteractionAt: Date
    /// The unique identifier for the course student type.
    public let id: String
    /// The timestamp when the student most recently interacted with this course, as a Unix timestamp.
    public let lastInteractionAt: Date
    /// The total number of visible lessons available to this student in the course.
    public let totalLessonsCount: Int
    /// The user profile of the enrolled student.
    public let user: CourseStudentUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completedLessonsCount: Int,
        completionRate: Double,
        course: CourseStudentCourse,
        firstInteractionAt: Date,
        id: String,
        lastInteractionAt: Date,
        totalLessonsCount: Int,
        user: CourseStudentUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completedLessonsCount = completedLessonsCount
        self.completionRate = completionRate
        self.course = course
        self.firstInteractionAt = firstInteractionAt
        self.id = id
        self.lastInteractionAt = lastInteractionAt
        self.totalLessonsCount = totalLessonsCount
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completedLessonsCount = try container.decode(Int.self, forKey: .completedLessonsCount)
        self.completionRate = try container.decode(Double.self, forKey: .completionRate)
        self.course = try container.decode(CourseStudentCourse.self, forKey: .course)
        self.firstInteractionAt = try container.decode(Date.self, forKey: .firstInteractionAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.lastInteractionAt = try container.decode(Date.self, forKey: .lastInteractionAt)
        self.totalLessonsCount = try container.decode(Int.self, forKey: .totalLessonsCount)
        self.user = try container.decode(CourseStudentUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.completedLessonsCount, forKey: .completedLessonsCount)
        try container.encode(self.completionRate, forKey: .completionRate)
        try container.encode(self.course, forKey: .course)
        try container.encode(self.firstInteractionAt, forKey: .firstInteractionAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lastInteractionAt, forKey: .lastInteractionAt)
        try container.encode(self.totalLessonsCount, forKey: .totalLessonsCount)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completedLessonsCount = "completed_lessons_count"
        case completionRate = "completion_rate"
        case course
        case firstInteractionAt = "first_interaction_at"
        case id
        case lastInteractionAt = "last_interaction_at"
        case totalLessonsCount = "total_lessons_count"
        case user
    }
}