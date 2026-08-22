import Foundation

extension Requests {
    public struct CreateCourseChaptersRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the course to create the chapter in (e.g., "course_XXXXX").
        public let courseId: String
        /// The display title of the chapter (e.g., "Module 1: Introduction").
        public let title: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            courseId: String,
            title: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.courseId = courseId
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.courseId = try container.decode(String.self, forKey: .courseId)
            self.title = try container.decodeNullableIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.courseId, forKey: .courseId)
            try container.encodeNullableIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case courseId = "course_id"
            case title
        }
    }
}