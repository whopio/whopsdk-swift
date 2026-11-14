import Foundation
import Testing
import WhopSDK

@Suite("FilesClient Wire Tests") struct FilesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "application/pdf",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "duration_seconds": 1.1,
                      "filename": "evidence.pdf",
                      "height": 1,
                      "id": "file_xxxxxxxxxxxxxx",
                      "multipart_chunk_size": 5242880,
                      "multipart_upload_id": "upload-id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                        }
                      ],
                      "object": "file",
                      "removed_by_moderation": false,
                      "size": 9670,
                      "upload_headers": {
                        "key": "value"
                      },
                      "upload_status": "pending",
                      "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": true,
                    "start_cursor": "WyJjdXJzb3IiLDFd"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListFilesResponse(
            data: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("application/pdf"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("evidence.pdf"),
                    height: Nullable<Int>.value(1),
                    id: "file_xxxxxxxxxxxxxx",
                    multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                    multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                        )
                    ])),
                    object: "file",
                    removedByModeration: false,
                    size: Nullable<Int>.value(9670),
                    uploadHeaders: Optional([
                        "key": JSONValue.string("value")
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            pageInfo: ListFilesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.files.list(
            fileIds: [
                "file_xxxxxxxxxxxxx"
            ],
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListFilesResponse(
            data: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            pageInfo: ListFilesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.files.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "blurhash": "blurhash",
                  "content_type": "application/pdf",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "duration_seconds": 1.1,
                  "filename": "evidence.pdf",
                  "height": 1,
                  "id": "file_xxxxxxxxxxxxxx",
                  "multipart_chunk_size": 5242880,
                  "multipart_upload_id": "upload-id",
                  "multipart_upload_urls": [
                    {
                      "part_number": 1,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    }
                  ],
                  "object": "file",
                  "removed_by_moderation": false,
                  "size": 9670,
                  "upload_headers": {
                    "key": "value"
                  },
                  "upload_status": "pending",
                  "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                  "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "visibility": "public",
                  "waveform_url": "waveform_url",
                  "width": 1
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
            blurhash: Nullable<String>.value("blurhash"),
            contentType: Nullable<String>.value("application/pdf"),
            createdAt: "2026-01-01T12:00:00.000Z",
            durationSeconds: Nullable<Double>.value(1.1),
            filename: Nullable<String>.value("evidence.pdf"),
            height: Nullable<Int>.value(1),
            id: "file_xxxxxxxxxxxxxx",
            multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
            multipartUploadId: Optional(Nullable<String>.value("upload-id")),
            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                FileMultipartUrl(
                    partNumber: 1,
                    url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                )
            ])),
            object: "file",
            removedByModeration: false,
            size: Nullable<Int>.value(9670),
            uploadHeaders: Optional([
                "key": JSONValue.string("value")
            ]),
            uploadStatus: FileUploadStatus.pending,
            uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            visibility: FileVisibility.public,
            waveformUrl: Nullable<String>.value("waveform_url"),
            width: Nullable<Int>.value(1)
        )
        let response = try await client.files.create(
            request: .init(filename: "terms.pdf"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "blurhash": "blurhash",
                  "content_type": "content_type",
                  "created_at": "created_at",
                  "duration_seconds": 1.1,
                  "filename": "filename",
                  "height": 1,
                  "id": "id",
                  "multipart_chunk_size": 1,
                  "multipart_upload_id": "multipart_upload_id",
                  "multipart_upload_urls": [
                    {
                      "part_number": 1,
                      "url": "url"
                    },
                    {
                      "part_number": 1,
                      "url": "url"
                    }
                  ],
                  "object": "object",
                  "removed_by_moderation": true,
                  "size": 1,
                  "upload_headers": {
                    "upload_headers": {
                      "key": "value"
                    }
                  },
                  "upload_status": "pending",
                  "upload_url": "upload_url",
                  "url": "url",
                  "visibility": "public",
                  "waveform_url": "waveform_url",
                  "width": 1
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
            blurhash: Nullable<String>.value("blurhash"),
            contentType: Nullable<String>.value("content_type"),
            createdAt: "created_at",
            durationSeconds: Nullable<Double>.value(1.1),
            filename: Nullable<String>.value("filename"),
            height: Nullable<Int>.value(1),
            id: "id",
            multipartChunkSize: Optional(Nullable<Int>.value(1)),
            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                FileMultipartUrl(
                    partNumber: 1,
                    url: "url"
                ),
                FileMultipartUrl(
                    partNumber: 1,
                    url: "url"
                )
            ])),
            object: "object",
            removedByModeration: true,
            size: Nullable<Int>.value(1),
            uploadHeaders: Optional([
                "upload_headers": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            uploadStatus: FileUploadStatus.pending,
            uploadUrl: Optional(Nullable<String>.value("upload_url")),
            url: Nullable<String>.value("url"),
            visibility: FileVisibility.public,
            waveformUrl: Nullable<String>.value("waveform_url"),
            width: Nullable<Int>.value(1)
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
                  "blurhash": "blurhash",
                  "content_type": "application/pdf",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "duration_seconds": 1.1,
                  "filename": "evidence.pdf",
                  "height": 1,
                  "id": "file_xxxxxxxxxxxxxx",
                  "multipart_chunk_size": 5242880,
                  "multipart_upload_id": "upload-id",
                  "multipart_upload_urls": [
                    {
                      "part_number": 1,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    }
                  ],
                  "object": "file",
                  "removed_by_moderation": false,
                  "size": 9670,
                  "upload_headers": {
                    "key": "value"
                  },
                  "upload_status": "pending",
                  "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                  "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "visibility": "public",
                  "waveform_url": "waveform_url",
                  "width": 1
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
            blurhash: Nullable<String>.value("blurhash"),
            contentType: Nullable<String>.value("application/pdf"),
            createdAt: "2026-01-01T12:00:00.000Z",
            durationSeconds: Nullable<Double>.value(1.1),
            filename: Nullable<String>.value("evidence.pdf"),
            height: Nullable<Int>.value(1),
            id: "file_xxxxxxxxxxxxxx",
            multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
            multipartUploadId: Optional(Nullable<String>.value("upload-id")),
            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                FileMultipartUrl(
                    partNumber: 1,
                    url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                )
            ])),
            object: "file",
            removedByModeration: false,
            size: Nullable<Int>.value(9670),
            uploadHeaders: Optional([
                "key": JSONValue.string("value")
            ]),
            uploadStatus: FileUploadStatus.pending,
            uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            visibility: FileVisibility.public,
            waveformUrl: Nullable<String>.value("waveform_url"),
            width: Nullable<Int>.value(1)
        )
        let response = try await client.files.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "blurhash": "blurhash",
                  "content_type": "content_type",
                  "created_at": "created_at",
                  "duration_seconds": 1.1,
                  "filename": "filename",
                  "height": 1,
                  "id": "id",
                  "multipart_chunk_size": 1,
                  "multipart_upload_id": "multipart_upload_id",
                  "multipart_upload_urls": [
                    {
                      "part_number": 1,
                      "url": "url"
                    },
                    {
                      "part_number": 1,
                      "url": "url"
                    }
                  ],
                  "object": "object",
                  "removed_by_moderation": true,
                  "size": 1,
                  "upload_headers": {
                    "upload_headers": {
                      "key": "value"
                    }
                  },
                  "upload_status": "pending",
                  "upload_url": "upload_url",
                  "url": "url",
                  "visibility": "public",
                  "waveform_url": "waveform_url",
                  "width": 1
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
            blurhash: Nullable<String>.value("blurhash"),
            contentType: Nullable<String>.value("content_type"),
            createdAt: "created_at",
            durationSeconds: Nullable<Double>.value(1.1),
            filename: Nullable<String>.value("filename"),
            height: Nullable<Int>.value(1),
            id: "id",
            multipartChunkSize: Optional(Nullable<Int>.value(1)),
            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                FileMultipartUrl(
                    partNumber: 1,
                    url: "url"
                ),
                FileMultipartUrl(
                    partNumber: 1,
                    url: "url"
                )
            ])),
            object: "object",
            removedByModeration: true,
            size: Nullable<Int>.value(1),
            uploadHeaders: Optional([
                "upload_headers": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            uploadStatus: FileUploadStatus.pending,
            uploadUrl: Optional(Nullable<String>.value("upload_url")),
            url: Nullable<String>.value("url"),
            visibility: FileVisibility.public,
            waveformUrl: Nullable<String>.value("waveform_url"),
            width: Nullable<Int>.value(1)
        )
        let response = try await client.files.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func complete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "blurhash": "blurhash",
                  "content_type": "application/pdf",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "duration_seconds": 1.1,
                  "filename": "evidence.pdf",
                  "height": 1,
                  "id": "file_xxxxxxxxxxxxxx",
                  "multipart_chunk_size": 5242880,
                  "multipart_upload_id": "upload-id",
                  "multipart_upload_urls": [
                    {
                      "part_number": 1,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    }
                  ],
                  "object": "file",
                  "removed_by_moderation": false,
                  "size": 9670,
                  "upload_headers": {
                    "key": "value"
                  },
                  "upload_status": "pending",
                  "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                  "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "visibility": "public",
                  "waveform_url": "waveform_url",
                  "width": 1
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
            blurhash: Nullable<String>.value("blurhash"),
            contentType: Nullable<String>.value("application/pdf"),
            createdAt: "2026-01-01T12:00:00.000Z",
            durationSeconds: Nullable<Double>.value(1.1),
            filename: Nullable<String>.value("evidence.pdf"),
            height: Nullable<Int>.value(1),
            id: "file_xxxxxxxxxxxxxx",
            multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
            multipartUploadId: Optional(Nullable<String>.value("upload-id")),
            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                FileMultipartUrl(
                    partNumber: 1,
                    url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                )
            ])),
            object: "file",
            removedByModeration: false,
            size: Nullable<Int>.value(9670),
            uploadHeaders: Optional([
                "key": JSONValue.string("value")
            ]),
            uploadStatus: FileUploadStatus.pending,
            uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            visibility: FileVisibility.public,
            waveformUrl: Nullable<String>.value("waveform_url"),
            width: Nullable<Int>.value(1)
        )
        let response = try await client.files.complete(
            id: "id",
            request: .init(
                multipartParts: [
                    CompleteFilesRequestMultipartPartsItem(
                        etag: "etag-1",
                        partNumber: 1
                    )
                ],
                multipartUploadId: "upload-id"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func complete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "blurhash": "blurhash",
                  "content_type": "content_type",
                  "created_at": "created_at",
                  "duration_seconds": 1.1,
                  "filename": "filename",
                  "height": 1,
                  "id": "id",
                  "multipart_chunk_size": 1,
                  "multipart_upload_id": "multipart_upload_id",
                  "multipart_upload_urls": [
                    {
                      "part_number": 1,
                      "url": "url"
                    },
                    {
                      "part_number": 1,
                      "url": "url"
                    }
                  ],
                  "object": "object",
                  "removed_by_moderation": true,
                  "size": 1,
                  "upload_headers": {
                    "upload_headers": {
                      "key": "value"
                    }
                  },
                  "upload_status": "pending",
                  "upload_url": "upload_url",
                  "url": "url",
                  "visibility": "public",
                  "waveform_url": "waveform_url",
                  "width": 1
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
            blurhash: Nullable<String>.value("blurhash"),
            contentType: Nullable<String>.value("content_type"),
            createdAt: "created_at",
            durationSeconds: Nullable<Double>.value(1.1),
            filename: Nullable<String>.value("filename"),
            height: Nullable<Int>.value(1),
            id: "id",
            multipartChunkSize: Optional(Nullable<Int>.value(1)),
            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                FileMultipartUrl(
                    partNumber: 1,
                    url: "url"
                ),
                FileMultipartUrl(
                    partNumber: 1,
                    url: "url"
                )
            ])),
            object: "object",
            removedByModeration: true,
            size: Nullable<Int>.value(1),
            uploadHeaders: Optional([
                "upload_headers": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            uploadStatus: FileUploadStatus.pending,
            uploadUrl: Optional(Nullable<String>.value("upload_url")),
            url: Nullable<String>.value("url"),
            visibility: FileVisibility.public,
            waveformUrl: Nullable<String>.value("waveform_url"),
            width: Nullable<Int>.value(1)
        )
        let response = try await client.files.complete(
            id: "id",
            request: .init(
                multipartParts: [
                    CompleteFilesRequestMultipartPartsItem(
                        etag: "etag",
                        partNumber: 1
                    ),
                    CompleteFilesRequestMultipartPartsItem(
                        etag: "etag",
                        partNumber: 1
                    )
                ],
                multipartUploadId: "multipart_upload_id"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}