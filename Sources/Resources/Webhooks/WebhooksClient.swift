import Foundation

public final class WebhooksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of webhook endpoints configured for an account, ordered by most recently created.
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
    ///     _ = try await client.webhooks.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The unique identifier of the account to list webhooks for.
    /// - Parameter appId: Only return webhooks attached to this app. Omit to list the account's own webhooks.
    /// - Parameter includeAppWebhooks: Also return webhooks attached to the account's apps, not just the account's own. Cannot be combined with `app_id`.
    /// - Parameter hasFailures: Only return webhooks whose endpoint is currently failing — every delivery since the current failure streak began has been rejected. Clears as soon as a delivery succeeds.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, appId: String? = nil, includeAppWebhooks: Bool? = nil, hasFailures: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListWebhooksResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/webhooks",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "app_id": appId.map { .string($0) }, 
                "include_app_webhooks": includeAppWebhooks.map { .bool($0) }, 
                "has_failures": hasFailures.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListWebhooksResponse.self
        )
    }

    /// Creates a webhook endpoint that receives event notifications via HTTP POST.
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
    ///     _ = try await client.webhooks.create(request: .init(url: "https://example.com/hooks"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateWebhooksRequest, requestOptions: RequestOptions? = nil) async throws -> Webhook {
        return try await httpClient.performRequest(
            method: .post,
            path: "/webhooks",
            body: request,
            requestOptions: requestOptions,
            responseType: Webhook.self
        )
    }

    /// Retrieves the details of an existing webhook.
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
    ///     _ = try await client.webhooks.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Webhook ID, prefixed `hook_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Webhook {
        return try await httpClient.performRequest(
            method: .get,
            path: "/webhooks/\(id)",
            requestOptions: requestOptions,
            responseType: Webhook.self
        )
    }

    /// Permanently deletes a webhook endpoint. To stop deliveries without deleting it, set `enabled` to `false` with `PATCH /webhooks/:id`.
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
    ///     _ = try await client.webhooks.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Webhook ID, prefixed `hook_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteWebhooksResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/webhooks/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteWebhooksResponse.self
        )
    }

    /// Updates a webhook endpoint's URL, subscribed events, pinned payload version, or enabled state.
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
    ///     _ = try await client.webhooks.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Webhook ID, prefixed `hook_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateWebhooksRequest, requestOptions: RequestOptions? = nil) async throws -> Webhook {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/webhooks/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Webhook.self
        )
    }

    /// Returns a paginated list of delivery attempts for a webhook, ordered by most recent first. Includes the request payload, response body, response code, and timing for each attempt. Filtered queries use a bounded read budget, so a page may be partial or empty. Continue with `page_info.end_cursor` while `page_info.has_next_page` is `true`.
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
    ///     _ = try await client.webhooks.listDeliveries(
    ///         id: "id",
    ///         resourceId: "pay_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Webhook ID, prefixed `hook_`.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter sentAfter: Only deliveries sent at or after this ISO 8601 timestamp. Deliveries are retained for 30 days.
    /// - Parameter sentBefore: Only deliveries sent at or before this ISO 8601 timestamp.
    /// - Parameter events: Only deliveries of these event types. Repeat the parameter to pass several.
    /// - Parameter status: Only deliveries with this outcome: `success` for a 2xx response, `error` otherwise.
    /// - Parameter resourceId: Only deliveries triggered by this resource.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listDeliveries(id: String, first: Int? = nil, after: String? = nil, sentAfter: Date? = nil, sentBefore: Date? = nil, events: [ListDeliveriesWebhooksRequestEventsItem]? = nil, status: ListDeliveriesWebhooksRequestStatus? = nil, resourceId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListDeliveriesWebhooksResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/webhooks/\(id)/deliveries",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "sent_after": sentAfter.map { .date($0) }, 
                "sent_before": sentBefore.map { .date($0) }, 
                "events": events.map { .unknown($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "resource_id": resourceId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListDeliveriesWebhooksResponse.self
        )
    }

    /// Re-sends the exact payload of a past delivery to the webhook's current URL and returns the delivery result. The replay keeps the original `webhook-id` unless you pass `regenerate_id`, so consumers that deduplicate on it can drop events they already processed. Only available for enabled webhooks on API version `v1`; deliveries are retained for 30 days.
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
    ///     _ = try await client.webhooks.replayDelivery(
    ///         id: "id",
    ///         deliveryId: "delivery_id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Webhook ID, prefixed `hook_`.
    /// - Parameter deliveryId: Delivery ID, prefixed `whdel_`, from the List Deliveries endpoint.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func replayDelivery(id: String, deliveryId: String, request: Requests.ReplayDeliveryWebhooksRequest, requestOptions: RequestOptions? = nil) async throws -> ReplayDeliveryWebhooksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/webhooks/\(id)/deliveries/\(deliveryId)/replay",
            body: request,
            requestOptions: requestOptions,
            responseType: ReplayDeliveryWebhooksResponse.self
        )
    }

    /// Re-sends the webhook's past deliveries within a time window, optionally limited to specific events or to failed deliveries. Use it to recover events your endpoint missed. The replay runs asynchronously and nothing about it is stored: each re-send appears as a new entry in the webhook's delivery log. Each matching message is re-sent once, with its original `webhook-id` unless you pass `regenerate_ids`. Only available for enabled webhooks on API version `v1`; deliveries are retained for 30 days.
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
    ///     _ = try await client.webhooks.replay(
    ///         id: "id",
    ///         request: .init(sentAfter: "2026-01-01T12:00:00.000Z")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Webhook ID, prefixed `hook_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func replay(id: String, request: Requests.ReplayWebhooksRequest, requestOptions: RequestOptions? = nil) async throws -> ReplayWebhooksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/webhooks/\(id)/replay",
            body: request,
            requestOptions: requestOptions,
            responseType: ReplayWebhooksResponse.self
        )
    }

    /// Sends a sample payload for the given event to the webhook's URL and returns the delivery result.
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
    ///     _ = try await client.webhooks.test(
    ///         id: "id",
    ///         request: .init(event: "payment.succeeded")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Webhook ID, prefixed `hook_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func test(id: String, request: Requests.TestWebhooksRequest, requestOptions: RequestOptions? = nil) async throws -> TestWebhooksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/webhooks/\(id)/test",
            body: request,
            requestOptions: requestOptions,
            responseType: TestWebhooksResponse.self
        )
    }
}