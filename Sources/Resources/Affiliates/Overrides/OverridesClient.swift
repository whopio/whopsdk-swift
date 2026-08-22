import Foundation

public final class OverridesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of overrides for an affiliate.
    ///
    /// Required permissions:
    ///  - `affiliate:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.affiliates.overrides.list(
    ///         id: "aff_xxxxxxxxxxxxxx",
    ///         first: 42,
    ///         last: 42
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The affiliate ID.
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(id: String, after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, overrideType: AffiliateOverrideRoles? = nil, requestOptions: RequestOptions? = nil) async throws -> ListOverridesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/affiliates/\(id)/overrides",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "override_type": overrideType.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListOverridesResponse.self
        )
    }

    /// Creates a commission override for an affiliate.
    ///
    /// Required permissions:
    ///  - `affiliate:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.affiliates.overrides.create(
    ///         id: "aff_xxxxxxxxxxxxxx",
    ///         request: CreateOverridesRequestBody.standard(
    ///             CreateOverridesRequestBodyStandard(
    ///                 commissionValue: 6.9,
    ///                 id: "id",
    ///                 planId: "plan_xxxxxxxxxxxxx"
    ///             )
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The affiliate ID.
    /// - Parameter request: Parameters for CreateAffiliateOverride
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(id: String, request: CreateOverridesRequestBody, requestOptions: RequestOptions? = nil) async throws -> CreateOverridesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/affiliates/\(id)/overrides",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateOverridesResponse.self
        )
    }

    /// Retrieves the details of a specific affiliate override.
    ///
    /// Required permissions:
    ///  - `affiliate:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.affiliates.overrides.retrieve(
    ///         id: "aff_xxxxxxxxxxxxxx",
    ///         overrideId: "override_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The affiliate ID.
    /// - Parameter overrideId: The override ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, overrideId: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveOverridesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/affiliates/\(id)/overrides/\(overrideId)",
            requestOptions: requestOptions,
            responseType: RetrieveOverridesResponse.self
        )
    }

    /// Deletes an affiliate override.
    ///
    /// Required permissions:
    ///  - `affiliate:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.affiliates.overrides.delete(
    ///         id: "aff_xxxxxxxxxxxxxx",
    ///         overrideId: "override_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The affiliate ID.
    /// - Parameter overrideId: The override ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, overrideId: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/affiliates/\(id)/overrides/\(overrideId)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Updates an existing affiliate override.
    ///
    /// Required permissions:
    ///  - `affiliate:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.affiliates.overrides.update(
    ///         id: "aff_xxxxxxxxxxxxxx",
    ///         overrideId: "override_id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The affiliate ID.
    /// - Parameter overrideId: The override ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, overrideId: String, request: Requests.UpdateOverridesRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateOverridesResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/affiliates/\(id)/overrides/\(overrideId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateOverridesResponse.self
        )
    }
}