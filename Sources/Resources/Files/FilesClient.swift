import Foundation

public final class FilesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the files with the given IDs, newest first — fetch a batch in one request instead of retrieving each file individually. Only files you created are returned; IDs that do not exist, or that another credential created, are omitted. For a batch larger than one page, follow `page_info` with the same `file_ids` to walk the rest.
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
    ///     _ = try await client.files.list(fileIds: [
    ///         "file_xxxxxxxxxxxxx"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter fileIds: The files to return, each prefixed `file_`. Repeat the parameter to pass several, up to 250 per request. Batches of up to 100 answer in one page by default; larger batches page at up to 100 per response.
    /// - Parameter order: The field to sort by.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(fileIds: [String]? = nil, order: ListFilesRequestOrder? = nil, direction: ListFilesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListFilesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/files",
            queryParams: [
                "file_ids": fileIds.map { .stringArray($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListFilesResponse.self
        )
    }

    /// Creates a file and returns a presigned destination to upload its bytes to. PUT the bytes to `upload_url` (single-part), or to each of `multipart_upload_urls` and then call Complete File Multipart Upload. Once the bytes land the file becomes `ready`, and its ID can be attached wherever a file is accepted — account legal documents, dispute evidence documents. For a step-by-step walkthrough of single-part and multipart uploads, see the [direct file uploads guide](/developer/guides/direct-file-uploads).
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
    ///     _ = try await client.files.create(request: .init(filename: "terms.pdf"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateFilesRequest, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .post,
            path: "/files",
            body: request,
            requestOptions: requestOptions,
            responseType: File.self
        )
    }

    /// Retrieves a file you uploaded — poll it after uploading the bytes to see `upload_status` become `ready`. Only the creator can retrieve a file this way; a file attached to another resource is read through that resource.
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
    ///     _ = try await client.files.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the file, prefixed `file_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .get,
            path: "/files/\(id)",
            requestOptions: requestOptions,
            responseType: File.self
        )
    }

    /// Assembles the parts of a multipart upload after every part has been PUT to its presigned URL. Pass the `multipart_upload_id` from Create File and each part's `ETag` response header. For a step-by-step walkthrough of multipart uploads, see the [direct file uploads guide](/developer/guides/direct-file-uploads).
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
    ///     _ = try await client.files.complete(
    ///         id: "id",
    ///         request: .init(
    ///             multipartParts: [
    ///                 CompleteFilesRequestMultipartPartsItem(
    ///                     etag: "etag-1",
    ///                     partNumber: 1
    ///                 )
    ///             ],
    ///             multipartUploadId: "upload-id"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the file, prefixed `file_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func complete(id: String, request: Requests.CompleteFilesRequest, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .post,
            path: "/files/\(id)/complete",
            body: request,
            requestOptions: requestOptions,
            responseType: File.self
        )
    }
}