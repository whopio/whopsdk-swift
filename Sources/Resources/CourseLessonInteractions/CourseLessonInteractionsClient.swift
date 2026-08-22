import Foundation

public final class CourseLessonInteractionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of lesson interactions, filtered by lesson, course, user, or completion status.
    ///
    /// Required permissions:
    ///  - `courses:read`
    ///  - `course_analytics:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.courseLessonInteractions.list(
    ///         first: 42,
    ///         last: 42,
    ///         userId: "user_xxxxxxxxxxxxx",
    ///         lessonId: "lesn_xxxxxxxxxxxxx",
    ///         courseId: "cors_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter userId: The unique identifier of the user to filter lesson interactions for.
    /// - Parameter lessonId: The unique identifier of the lesson to filter interactions for.
    /// - Parameter courseId: The unique identifier of the course to filter interactions for.
    /// - Parameter completed: Whether to filter for completed or in-progress lesson interactions.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, userId: String? = nil, lessonId: String? = nil, courseId: String? = nil, completed: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCourseLessonInteractionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_lesson_interactions",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "user_id": userId.map { .string($0) }, 
                "lesson_id": lessonId.map { .string($0) }, 
                "course_id": courseId.map { .string($0) }, 
                "completed": completed.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCourseLessonInteractionsResponse.self
        )
    }

    /// Retrieves the details of an existing course lesson interaction.
    ///
    /// Required permissions:
    ///  - `courses:read`
    ///  - `course_analytics:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.courseLessonInteractions.retrieve(id: "crsli_xxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the lesson interaction to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> CourseLessonInteraction {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_lesson_interactions/\(id)",
            requestOptions: requestOptions,
            responseType: CourseLessonInteraction.self
        )
    }
}