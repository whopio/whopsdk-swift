import Foundation
import Testing
import WhopSDK

@Suite("ForumPostsClient Wire Tests") struct ForumPostsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "attachments": [
                        {
                          "content_type": "image/jpeg",
                          "filename": "document.pdf",
                          "id": "id",
                          "url": "https://media.whop.com/abc123/optimized.jpg"
                        }
                      ],
                      "comment_count": 42,
                      "content": "## My Strategy\n\nHere are the key steps...",
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "id",
                      "is_edited": true,
                      "is_pinned": true,
                      "is_poster_admin": true,
                      "like_count": 42,
                      "parent_id": "parent_id",
                      "title": "Weekly Market Analysis - February 2025",
                      "updated_at": "2023-12-01T05:00:00Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      },
                      "view_count": 42
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
        let expectedResponse = ListForumPostsResponse(
            data: [
                ForumPostListItem(
                    attachments: [
                        ForumPostListItemAttachmentsItem(
                            contentType: Nullable<String>.value("image/jpeg"),
                            filename: Nullable<String>.value("document.pdf"),
                            id: "id",
                            url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                        )
                    ],
                    commentCount: 42,
                    content: Nullable<String>.value("## My Strategy\n\nHere are the key steps..."),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "id",
                    isEdited: true,
                    isPinned: true,
                    isPosterAdmin: true,
                    likeCount: Nullable<Int>.value(42),
                    parentId: Nullable<String>.value("parent_id"),
                    title: Nullable<String>.value("Weekly Market Analysis - February 2025"),
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    user: ForumPostListItemUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    ),
                    viewCount: Nullable<Int>.value(42)
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.forumPosts.list(
            first: 42,
            last: 42,
            experienceId: "exp_xxxxxxxxxxxxxx",
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
                      "attachments": [
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "comment_count": 1,
                      "content": "content",
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "is_edited": true,
                      "is_pinned": true,
                      "is_poster_admin": true,
                      "like_count": 1,
                      "parent_id": "parent_id",
                      "title": "title",
                      "updated_at": "2024-01-15T09:30:00Z",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "view_count": 1
                    },
                    {
                      "attachments": [
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "comment_count": 1,
                      "content": "content",
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "is_edited": true,
                      "is_pinned": true,
                      "is_poster_admin": true,
                      "like_count": 1,
                      "parent_id": "parent_id",
                      "title": "title",
                      "updated_at": "2024-01-15T09:30:00Z",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      },
                      "view_count": 1
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
        let expectedResponse = ListForumPostsResponse(
            data: [
                ForumPostListItem(
                    attachments: [
                        ForumPostListItemAttachmentsItem(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ForumPostListItemAttachmentsItem(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    commentCount: 1,
                    content: Nullable<String>.value("content"),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    isEdited: true,
                    isPinned: true,
                    isPosterAdmin: true,
                    likeCount: Nullable<Int>.value(1),
                    parentId: Nullable<String>.value("parent_id"),
                    title: Nullable<String>.value("title"),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    user: ForumPostListItemUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    ),
                    viewCount: Nullable<Int>.value(1)
                ),
                ForumPostListItem(
                    attachments: [
                        ForumPostListItemAttachmentsItem(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ForumPostListItemAttachmentsItem(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    commentCount: 1,
                    content: Nullable<String>.value("content"),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    isEdited: true,
                    isPinned: true,
                    isPosterAdmin: true,
                    likeCount: Nullable<Int>.value(1),
                    parentId: Nullable<String>.value("parent_id"),
                    title: Nullable<String>.value("title"),
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    user: ForumPostListItemUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    ),
                    viewCount: Nullable<Int>.value(1)
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.forumPosts.list(
            experienceId: "experience_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "content_type": "image/jpeg",
                      "filename": "document.pdf",
                      "id": "id",
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    }
                  ],
                  "comment_count": 42,
                  "content": "## My Strategy\n\nHere are the key steps...",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "is_poster_admin": true,
                  "like_count": 42,
                  "parent_id": "parent_id",
                  "title": "Weekly Market Analysis - February 2025",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "view_count": 42
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForumPost(
            attachments: [
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("image/jpeg"),
                    filename: Nullable<String>.value("document.pdf"),
                    id: "id",
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )
            ],
            commentCount: 42,
            content: Nullable<String>.value("## My Strategy\n\nHere are the key steps..."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            isPosterAdmin: true,
            likeCount: Nullable<Int>.value(42),
            parentId: Nullable<String>.value("parent_id"),
            title: Nullable<String>.value("Weekly Market Analysis - February 2025"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: ForumPostUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            viewCount: Nullable<Int>.value(42)
        )
        let response = try await client.forumPosts.create(
            request: .init(experienceId: "exp_xxxxxxxxxxxxxx"),
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
                  "attachments": [
                    {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "comment_count": 1,
                  "content": "content",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "is_poster_admin": true,
                  "like_count": 1,
                  "parent_id": "parent_id",
                  "title": "title",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "username": "username"
                  },
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForumPost(
            attachments: [
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            commentCount: 1,
            content: Nullable<String>.value("content"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            isPosterAdmin: true,
            likeCount: Nullable<Int>.value(1),
            parentId: Nullable<String>.value("parent_id"),
            title: Nullable<String>.value("title"),
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            user: ForumPostUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            ),
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.forumPosts.create(
            request: .init(experienceId: "experience_id"),
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
                  "attachments": [
                    {
                      "content_type": "image/jpeg",
                      "filename": "document.pdf",
                      "id": "id",
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    }
                  ],
                  "comment_count": 42,
                  "content": "## My Strategy\n\nHere are the key steps...",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "is_poster_admin": true,
                  "like_count": 42,
                  "parent_id": "parent_id",
                  "title": "Weekly Market Analysis - February 2025",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "view_count": 42
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForumPost(
            attachments: [
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("image/jpeg"),
                    filename: Nullable<String>.value("document.pdf"),
                    id: "id",
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )
            ],
            commentCount: 42,
            content: Nullable<String>.value("## My Strategy\n\nHere are the key steps..."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            isPosterAdmin: true,
            likeCount: Nullable<Int>.value(42),
            parentId: Nullable<String>.value("parent_id"),
            title: Nullable<String>.value("Weekly Market Analysis - February 2025"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: ForumPostUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            viewCount: Nullable<Int>.value(42)
        )
        let response = try await client.forumPosts.retrieve(
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
                  "attachments": [
                    {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "comment_count": 1,
                  "content": "content",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "is_poster_admin": true,
                  "like_count": 1,
                  "parent_id": "parent_id",
                  "title": "title",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "username": "username"
                  },
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForumPost(
            attachments: [
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            commentCount: 1,
            content: Nullable<String>.value("content"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            isPosterAdmin: true,
            likeCount: Nullable<Int>.value(1),
            parentId: Nullable<String>.value("parent_id"),
            title: Nullable<String>.value("title"),
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            user: ForumPostUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            ),
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.forumPosts.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "content_type": "image/jpeg",
                      "filename": "document.pdf",
                      "id": "id",
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    }
                  ],
                  "comment_count": 42,
                  "content": "## My Strategy\n\nHere are the key steps...",
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "is_poster_admin": true,
                  "like_count": 42,
                  "parent_id": "parent_id",
                  "title": "Weekly Market Analysis - February 2025",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "view_count": 42
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForumPost(
            attachments: [
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("image/jpeg"),
                    filename: Nullable<String>.value("document.pdf"),
                    id: "id",
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )
            ],
            commentCount: 42,
            content: Nullable<String>.value("## My Strategy\n\nHere are the key steps..."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            isPosterAdmin: true,
            likeCount: Nullable<Int>.value(42),
            parentId: Nullable<String>.value("parent_id"),
            title: Nullable<String>.value("Weekly Market Analysis - February 2025"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: ForumPostUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            viewCount: Nullable<Int>.value(42)
        )
        let response = try await client.forumPosts.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "comment_count": 1,
                  "content": "content",
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "is_edited": true,
                  "is_pinned": true,
                  "is_poster_admin": true,
                  "like_count": 1,
                  "parent_id": "parent_id",
                  "title": "title",
                  "updated_at": "2024-01-15T09:30:00Z",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "username": "username"
                  },
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ForumPost(
            attachments: [
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ForumPostAttachmentsItem(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            commentCount: 1,
            content: Nullable<String>.value("content"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            isEdited: true,
            isPinned: true,
            isPosterAdmin: true,
            likeCount: Nullable<Int>.value(1),
            parentId: Nullable<String>.value("parent_id"),
            title: Nullable<String>.value("title"),
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            user: ForumPostUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            ),
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.forumPosts.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}