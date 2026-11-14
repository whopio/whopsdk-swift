import Foundation

public final class CourseChaptersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of chapters within a course, ordered by position.
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
    ///     _ = try await client.courseChapters.list(
    ///         first: 42,
    ///         last: 42,
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
    /// - Parameter courseId: The unique identifier of the course to list chapters for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, courseId: String, requestOptions: RequestOptions? = nil) async throws -> ListCourseChaptersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_chapters",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "course_id": .string(courseId)
            ],
            requestOptions: requestOptions,
            responseType: ListCourseChaptersResponse.self
        )
    }

    /// Create a new chapter within a course to organize lessons into sections.
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
    ///     _ = try await client.courseChapters.create(request: .init(courseId: "cors_xxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCourseChaptersRequest, requestOptions: RequestOptions? = nil) async throws -> CourseChapter {
        return try await httpClient.performRequest(
            method: .post,
            path: "/course_chapters",
            body: request,
            requestOptions: requestOptions,
            responseType: CourseChapter.self
        )
    }

    /// Retrieves the details of an existing course chapter.
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
    ///     _ = try await client.courseChapters.retrieve(id: "chap_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the chapter to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> CourseChapter {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_chapters/\(id)",
            requestOptions: requestOptions,
            responseType: CourseChapter.self
        )
    }

    /// Permanently delete a chapter and all of its lessons from a course.
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
    ///     _ = try await client.courseChapters.delete(id: "chap_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the chapter to delete (e.g., "chap_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/course_chapters/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Update a chapter's title within a course.
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
    ///     _ = try await client.courseChapters.update(
    ///         id: "chap_xxxxxxxxxxxxx",
    ///         request: .init(title: "title")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the chapter to update (e.g., "chap_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateCourseChaptersRequest, requestOptions: RequestOptions? = nil) async throws -> CourseChapter {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/course_chapters/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: CourseChapter.self
        )
    }
}