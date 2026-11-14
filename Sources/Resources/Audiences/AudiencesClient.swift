import Foundation

public final class AudiencesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's custom and lookalike audiences.
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
    ///     _ = try await client.audiences.list(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter audienceId: Audience ID, prefixed `adaud_`, used to filter the response to one audience.
    /// - Parameter audienceType: Filter by custom or lookalike audiences.
    /// - Parameter sourceType: Filter by uploaded customer lists, Whop People filters, or social engagement.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, audienceId: String? = nil, audienceType: ListAudiencesRequestAudienceType? = nil, sourceType: ListAudiencesRequestSourceType? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAudiencesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/audiences",
            queryParams: [
                "account_id": .string(accountId), 
                "audience_id": audienceId.map { .string($0) }, 
                "audience_type": audienceType.map { .string($0.rawValue) }, 
                "source_type": sourceType.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAudiencesResponse.self
        )
    }

    /// Creates a custom audience from a customer list or your account's Whop People data, or a lookalike audience that reaches people similar to an existing one. Processing runs asynchronously. A custom audience returns one audience; a lookalike returns the requested similarity bands in `data`.
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
    ///     _ = try await client.audiences.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAudiencesRequest, requestOptions: RequestOptions? = nil) async throws -> CreateAudiencesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/audiences",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateAudiencesResponse.self
        )
    }

    /// Deletes an audience so it is no longer available for targeting.
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
    ///     _ = try await client.audiences.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Audience ID, prefixed `adaud_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteAudiencesResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/audiences/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteAudiencesResponse.self
        )
    }

    /// Renames an audience. For an audience built from People filters that keeps itself up to date, pass `filters` to replace them, which rebuilds membership immediately. Whether an audience auto refreshes is set when it is created.
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
    ///     _ = try await client.audiences.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Audience ID, prefixed `adaud_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAudiencesRequest, requestOptions: RequestOptions? = nil) async throws -> Audience {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/audiences/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Audience.self
        )
    }

    /// Adds users from a new CSV file to an existing uploaded custom audience. The file uses the audience's saved column mapping, processing happens in the background, and existing audience members remain unchanged.
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
    ///     _ = try await client.audiences.addPeople(
    ///         id: "id",
    ///         request: .init(fileId: "file_xxxxxxxxxxxxxx")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Audience ID, prefixed `adaud_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func addPeople(id: String, request: Requests.AddPeopleAudiencesRequest, requestOptions: RequestOptions? = nil) async throws -> Audience {
        return try await httpClient.performRequest(
            method: .post,
            path: "/audiences/\(id)/add_people",
            body: request,
            requestOptions: requestOptions,
            responseType: Audience.self
        )
    }
}