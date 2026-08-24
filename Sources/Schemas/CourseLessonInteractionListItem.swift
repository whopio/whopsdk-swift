import Foundation

/// A record of a user's progress on a specific lesson, tracking whether they have completed it.
public struct CourseLessonInteractionListItem: Codable, Hashable, Sendable {
    /// Whether the user has finished this lesson.
    public let completed: Bool
    /// The datetime the lesson interaction was created.
    public let createdAt: Date
    /// The unique identifier for the lesson interaction.
    public let id: String
    /// The lesson that this progress record belongs to.
    public let lesson: CourseLessonInteractionListItemLesson
    /// The user whose progress is being tracked.
    public let user: CourseLessonInteractionListItemUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completed: Bool,
        createdAt: Date,
        id: String,
        lesson: CourseLessonInteractionListItemLesson,
        user: CourseLessonInteractionListItemUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completed = completed
        self.createdAt = createdAt
        self.id = id
        self.lesson = lesson
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completed = try container.decode(Bool.self, forKey: .completed)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.lesson = try container.decode(CourseLessonInteractionListItemLesson.self, forKey: .lesson)
        self.user = try container.decode(CourseLessonInteractionListItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.completed, forKey: .completed)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lesson, forKey: .lesson)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completed
        case createdAt = "created_at"
        case id
        case lesson
        case user
    }
}