import Foundation

public final class CourseLessonsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of lessons within a course or chapter, ordered by position.
    ///
    /// Required permissions:
    ///  - `courses:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.list(
    ///         first: 42,
    ///         last: 42,
    ///         courseId: "cors_xxxxxxxxxxxxx",
    ///         chapterId: "chap_xxxxxxxxxxxxx"
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
    /// - Parameter courseId: The unique identifier of the course to return all lessons across all chapters.
    /// - Parameter chapterId: The unique identifier of a chapter to return only its lessons.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, courseId: String? = nil, chapterId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCourseLessonsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_lessons",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "course_id": courseId.map { .string($0) }, 
                "chapter_id": chapterId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCourseLessonsResponse.self
        )
    }

    /// Create a new lesson within a course chapter. Lessons can contain video, text, or assessment content.
    ///
    /// Required permissions:
    ///  - `courses:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.create(request: .init(
    ///         chapterId: "chap_xxxxxxxxxxxxx",
    ///         lessonType: .text
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCourseLessonsRequest, requestOptions: RequestOptions? = nil) async throws -> CourseLesson {
        return try await httpClient.performRequest(
            method: .post,
            path: "/course_lessons",
            body: request,
            requestOptions: requestOptions,
            responseType: CourseLesson.self
        )
    }

    /// Retrieves the details of an existing course lesson.
    ///
    /// Required permissions:
    ///  - `courses:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.retrieve(id: "lesn_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the lesson to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> CourseLesson {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_lessons/\(id)",
            requestOptions: requestOptions,
            responseType: CourseLesson.self
        )
    }

    /// Permanently delete a lesson and remove it from its chapter.
    ///
    /// Required permissions:
    ///  - `courses:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.delete(id: "lesn_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the lesson to delete (e.g., "les_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/course_lessons/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Update a lesson's content, type, visibility, assessment questions, or media attachments.
    ///
    /// Required permissions:
    ///  - `courses:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.update(
    ///         id: "lesn_xxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the lesson to update (e.g., "les_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateCourseLessonsRequest, requestOptions: RequestOptions? = nil) async throws -> CourseLesson {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/course_lessons/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: CourseLesson.self
        )
    }

    /// Mark a lesson as completed for the current user after they finish the content.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.markAsCompleted(lessonId: "lesson_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter lessonId: The unique identifier of the lesson to mark as completed (e.g., "les_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func markAsCompleted(lessonId: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/course_lessons/\(lessonId)/mark_as_completed",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Record that the current user has started viewing a lesson, creating progress tracking records.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.start(lessonId: "lesson_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter lessonId: The unique identifier of the lesson the user is starting (e.g., "les_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func start(lessonId: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/course_lessons/\(lessonId)/start",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Submit answers for a quiz or knowledge check lesson and receive a graded result.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.courseLessons.submitAssessment(
    ///         lessonId: "lesson_id",
    ///         request: .init(answers: [
    ///             SubmitAssessmentCourseLessonsRequestAnswersItem(
    ///                 questionId: "question_id"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter lessonId: The unique identifier of the quiz or knowledge check lesson to submit answers for (e.g., "les_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func submitAssessment(lessonId: String, request: Requests.SubmitAssessmentCourseLessonsRequest, requestOptions: RequestOptions? = nil) async throws -> SubmitAssessmentCourseLessonsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/course_lessons/\(lessonId)/submit_assessment",
            body: request,
            requestOptions: requestOptions,
            responseType: SubmitAssessmentCourseLessonsResponse.self
        )
    }
}