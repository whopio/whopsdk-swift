import Foundation

/// Input for updating a chapter while updating a course
public struct UpdateCoursesRequestChaptersItem: Codable, Hashable, Sendable {
    /// The ID of the chapter to update
    public let id: String
    /// The lessons to update within this chapter
    public let lessons: Nullable<[UpdateCoursesRequestChaptersItemLessonsItem]>?
    /// The order of the chapter within its course
    public let order: Int
    /// The title of the chapter
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        lessons: Nullable<[UpdateCoursesRequestChaptersItemLessonsItem]>? = nil,
        order: Int,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.lessons = lessons
        self.order = order
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.lessons = try container.decodeNullableIfPresent([UpdateCoursesRequestChaptersItemLessonsItem].self, forKey: .lessons)
        self.order = try container.decode(Int.self, forKey: .order)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.lessons, forKey: .lessons)
        try container.encode(self.order, forKey: .order)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case lessons
        case order
        case title
    }
}