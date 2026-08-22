import Foundation

public final class AudiencesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists uploaded customer-list audiences for an account. Pass `audience_id` to return a specific audience.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.audiences.list(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter audienceId: Audience ID, prefixed `adaud_`, used to filter the response to one audience.
    /// - Parameter audienceType: Filter by audience type: `custom` (uploaded lists) or `lookalike`.
    /// - Parameter sourceType: Filter by member source: `csv_upload` (uploaded lists) or `people_filter` (automatic audiences built from saved People filters).
    /// - Parameter first: Number of audiences to return. Defaults to 20; maximum 100.
    /// - Parameter after: Cursor for the next page of audiences.
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

    /// Creates an audience. Default (`audience_type` omitted or `custom`): creates one audience from an uploaded customer identity CSV file (`name`, `column_mapping`, and `file_id` required) and starts processing it; responds with the audience object. With `filters`: creates an audience from saved People filters (`name` required) — membership is built from the account's People data, and `auto_refresh` decides whether it keeps tracking the filters or keeps whoever matched at creation. With `audience_type: lookalike`: creates a ladder of Meta lookalike audiences from an existing ready custom audience (`source_audience_id`, `count`, and `percentage` required) — `count` equal similarity bands slicing the top `percentage`% (3 audiences at 6% = 0–2%, 2–4%, 4–6%), each returned as its own audience in a `{ data: [...] }` envelope.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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