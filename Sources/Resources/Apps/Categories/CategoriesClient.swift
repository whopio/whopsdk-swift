import Foundation

public final class CategoriesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the App Store's categories. Pass `app_type` for one store's categories in the order that store shows them; without it, every category either store shows is listed. Use a business category's ID as an app's `category_id`, or any category's `route` to filter apps. This endpoint is public and does not require authentication.
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
    ///     _ = try await client.apps.categories.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter appType: Only return the categories of this app type's store, in that store's order: `b2b_app` for the business App Store, `b2c_app` for the community App Store.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(appType: ListCategoriesRequestAppType? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCategoriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/apps/categories",
            queryParams: [
                "app_type": appType.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCategoriesResponse.self
        )
    }
}