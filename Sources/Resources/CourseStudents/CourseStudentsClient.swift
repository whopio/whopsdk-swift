import Foundation

public final class CourseStudentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of students enrolled in a course, with optional name filtering.
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
    ///     _ = try await client.courseStudents.list(
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
    /// - Parameter courseId: The unique identifier of the course to list enrolled students for.
    /// - Parameter keyword: A search term to filter students by name or username.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, courseId: String, keyword: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCourseStudentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_students",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "course_id": .string(courseId), 
                "keyword": keyword.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCourseStudentsResponse.self
        )
    }

    /// Retrieves the details of an existing course student.
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
    ///     _ = try await client.courseStudents.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the course student record to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> CourseStudent {
        return try await httpClient.performRequest(
            method: .get,
            path: "/course_students/\(id)",
            requestOptions: requestOptions,
            responseType: CourseStudent.self
        )
    }
}