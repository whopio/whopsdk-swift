import Foundation

public final class MediaClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Starts an AI media generation job billed from the account's balance. Generation is asynchronous — poll `GET /media/{id}` until the asset is `ready`, then use `file.id` anywhere attachments are accepted.
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
    ///     _ = try await client.media.generate(request: .init(
    ///         prompt: "A 9:16 product showcase of a cordless power scrubber",
    ///         type: .video
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func generate(request: Requests.GenerateMediaRequest, requestOptions: RequestOptions? = nil) async throws -> MediaAsset {
        return try await httpClient.performRequest(
            method: .post,
            path: "/media/generate",
            body: request,
            requestOptions: requestOptions,
            responseType: MediaAsset.self
        )
    }

    /// Retrieves a media asset by ID. Poll this while the asset is `processing`.
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
    ///     _ = try await client.media.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Media asset ID, prefixed `media_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> MediaAsset {
        return try await httpClient.performRequest(
            method: .get,
            path: "/media/\(id)",
            requestOptions: requestOptions,
            responseType: MediaAsset.self
        )
    }
}