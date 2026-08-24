import Foundation
import Testing
import WhopSDK

@Suite("FilesClient Wire Tests") struct FilesClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "content_type": "image/jpeg",
                  "filename": "document.pdf",
                  "id": "file_xxxxxxxxxxxxx",
                  "size": "123.45",
                  "upload_headers": {
                    "key": "value"
                  },
                  "upload_status": "pending",
                  "upload_url": "https://media.whop.com/uploads/presigned",
                  "url": "url",
                  "visibility": "public"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateFilesResponse(
            contentType: Nullable<String>.value("image/jpeg"),
            filename: Nullable<String>.value("document.pdf"),
            id: "file_xxxxxxxxxxxxx",
            size: Nullable<String>.value("123.45"),
            uploadHeaders: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            uploadStatus: UploadStatuses.pending,
            uploadUrl: Nullable<String>.value("https://media.whop.com/uploads/presigned"),
            url: Nullable<String>.value("url"),
            visibility: FileVisibility.public
        )
        let response = try await client.files.create(
            request: .init(filename: "filename"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "content_type": "image/jpeg",
                  "filename": "document.pdf",
                  "id": "file_xxxxxxxxxxxxx",
                  "size": "123.45",
                  "upload_status": "pending",
                  "url": "url",
                  "visibility": "public"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = File(
            contentType: Nullable<String>.value("image/jpeg"),
            filename: Nullable<String>.value("document.pdf"),
            id: "file_xxxxxxxxxxxxx",
            size: Nullable<String>.value("123.45"),
            uploadStatus: UploadStatuses.pending,
            url: Nullable<String>.value("url"),
            visibility: FileVisibility.public
        )
        let response = try await client.files.retrieve(
            id: "file_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}