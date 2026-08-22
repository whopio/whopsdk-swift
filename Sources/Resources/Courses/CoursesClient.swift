import Foundation

public final class CoursesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of courses, filtered by either an experience or a company.
    ///
    /// Required permissions:
    ///  - `courses:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.courses.list(
    ///         first: 42,
    ///         last: 42,
    ///         experienceId: "exp_xxxxxxxxxxxxxx",
    ///         companyId: "biz_xxxxxxxxxxxxxx"
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
    /// - Parameter experienceId: The unique identifier of the experience to list courses for.
    /// - Parameter companyId: The unique identifier of the company to list courses for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, experienceId: String? = nil, companyId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCoursesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/courses",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "experience_id": experienceId.map { .string($0) }, 
                "company_id": companyId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCoursesResponse.self
        )
    }

    /// Create a new course within an experience, with optional chapters, lessons, and a certificate.
    ///
    /// Required permissions:
    ///  - `courses:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.courses.create(request: .init(
    ///         experienceId: "exp_xxxxxxxxxxxxxx",
    ///         title: "title"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCoursesRequest, requestOptions: RequestOptions? = nil) async throws -> Course {
        return try await httpClient.performRequest(
            method: .post,
            path: "/courses",
            body: request,
            requestOptions: requestOptions,
            responseType: Course.self
        )
    }

    /// Retrieves the details of an existing course.
    ///
    /// Required permissions:
    ///  - `courses:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.courses.retrieve(id: "cors_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the course to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Course {
        return try await httpClient.performRequest(
            method: .get,
            path: "/courses/\(id)",
            requestOptions: requestOptions,
            responseType: Course.self
        )
    }

    /// Permanently delete a course and all of its chapters, lessons, and student progress.
    ///
    /// Required permissions:
    ///  - `courses:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.courses.delete(id: "cors_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the course to delete (e.g., "course_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/courses/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Update a course's title, description, visibility, thumbnail, or chapter ordering.
    ///
    /// Required permissions:
    ///  - `courses:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.courses.update(
    ///         id: "cors_xxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the course to update (e.g., "course_XXXXX").
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateCoursesRequest, requestOptions: RequestOptions? = nil) async throws -> Course {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/courses/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Course.self
        )
    }
}