import Foundation

/// The course this student is enrolled in.
public struct CourseStudentCourse: Codable, Hashable, Sendable {
    /// The parent experience that this course belongs to.
    public let experience: CourseStudentCourseExperience
    /// The unique identifier for the course.
    public let id: String
    /// The display name of the course shown to students. Null if no title has been set.
    public let title: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        experience: CourseStudentCourseExperience,
        id: String,
        title: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.experience = experience
        self.id = id
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.experience = try container.decode(CourseStudentCourseExperience.self, forKey: .experience)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.experience, forKey: .experience)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case experience
        case id
        case title
    }
}