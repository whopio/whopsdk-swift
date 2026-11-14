import Foundation

public final class FeedbackSubmissionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Submits an issue or an unanswered question to Whop for review, recorded under the authenticated user, account, or app. Returns a receipt once the submission is accepted; processing is asynchronous and no reply is sent.
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
    ///     _ = try await client.feedbackSubmissions.create(request: .init(
    ///         content: "The docs omit the required permission",
    ///         source: .mcpReportFeedback
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateFeedbackSubmissionsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateFeedbackSubmissionsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/feedback_submissions",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateFeedbackSubmissionsResponse.self
        )
    }
}