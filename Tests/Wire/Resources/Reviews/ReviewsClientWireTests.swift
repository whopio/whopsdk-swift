import Foundation
import Testing
import WhopSDK

@Suite("ReviewsClient Wire Tests") struct ReviewsClientWireTests {
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
                          "content_type": "image/png",
                          "filename": "coated-hood.png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/mb:180000/plain/https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/review-coated-hood"
                        }
                      ],
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "description": "Two years on and the paint still beads like the day it was coated.",
                      "id": "rev_xxxxxxxxxxxxxx",
                      "joined_at": "2026-01-01T12:00:00.000Z",
                      "paid_for_product": true,
                      "published_at": "2026-01-01T12:00:00.000Z",
                      "stars": 4,
                      "status": "published",
                      "title": "Worth every penny",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "username": "danawhitfield"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd",
                    "total_count": 1,
                    "total_count_capped": true
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
        let expectedResponse = ListReviewsResponse(
            data: [
                ReviewListItem(
                    attachments: [
                        ReviewAttachment(
                            contentType: Nullable<String>.value("image/png"),
                            filename: Nullable<String>.value("coated-hood.png"),
                            id: "file_xxxxxxxxxxxxxx",
                            url: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/mb:180000/plain/https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/review-coated-hood")
                        )
                    ],
                    createdAt: "2026-01-01T12:00:00.000Z",
                    description: Nullable<String>.value("Two years on and the paint still beads like the day it was coated."),
                    id: "rev_xxxxxxxxxxxxxx",
                    joinedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    paidForProduct: Nullable<Bool>.value(true),
                    publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    stars: 4,
                    status: ReviewListItemStatus.published,
                    title: Nullable<String>.value("Worth every penny"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    user: ReviewUser(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        username: "danawhitfield"
                    )
                )
            ],
            pageInfo: ListReviewsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.reviews.list(
            accountId: "biz_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxx",
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
                      "created_at": "created_at",
                      "description": "description",
                      "id": "id",
                      "joined_at": "joined_at",
                      "paid_for_product": true,
                      "published_at": "published_at",
                      "stars": 1,
                      "status": "published",
                      "title": "title",
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      }
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
                      "created_at": "created_at",
                      "description": "description",
                      "id": "id",
                      "joined_at": "joined_at",
                      "paid_for_product": true,
                      "published_at": "published_at",
                      "stars": 1,
                      "status": "published",
                      "title": "title",
                      "updated_at": "updated_at",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "username": "username"
                      }
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor",
                    "total_count": 1,
                    "total_count_capped": true
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
        let expectedResponse = ListReviewsResponse(
            data: [
                ReviewListItem(
                    attachments: [
                        ReviewAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ReviewAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    createdAt: "created_at",
                    description: Nullable<String>.value("description"),
                    id: "id",
                    joinedAt: Nullable<String>.value("joined_at"),
                    paidForProduct: Nullable<Bool>.value(true),
                    publishedAt: Nullable<String>.value("published_at"),
                    stars: 1,
                    status: ReviewListItemStatus.published,
                    title: Nullable<String>.value("title"),
                    updatedAt: "updated_at",
                    user: ReviewUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                ),
                ReviewListItem(
                    attachments: [
                        ReviewAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ReviewAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    createdAt: "created_at",
                    description: Nullable<String>.value("description"),
                    id: "id",
                    joinedAt: Nullable<String>.value("joined_at"),
                    paidForProduct: Nullable<Bool>.value(true),
                    publishedAt: Nullable<String>.value("published_at"),
                    stars: 1,
                    status: ReviewListItemStatus.published,
                    title: Nullable<String>.value("title"),
                    updatedAt: "updated_at",
                    user: ReviewUser(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        username: "username"
                    )
                )
            ],
            pageInfo: ListReviewsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.reviews.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "attachments": [
                    {
                      "content_type": "image/png",
                      "filename": "coated-hood.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/mb:180000/plain/https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/review-coated-hood"
                    }
                  ],
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "description": "Two years on and the paint still beads like the day it was coated.",
                  "id": "rev_xxxxxxxxxxxxxx",
                  "joined_at": "2026-01-01T12:00:00.000Z",
                  "paid_for_product": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxxx",
                    "title": "Ceramic Coating Package"
                  },
                  "published_at": "2026-01-01T12:00:00.000Z",
                  "stars": 4,
                  "status": "published",
                  "title": "Worth every penny",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "username": "danawhitfield"
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
        let expectedResponse = Review(
            account: ReviewAccount(
                id: "biz_xxxxxxxxxxxxxx",
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            attachments: [
                ReviewAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("coated-hood.png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/mb:180000/plain/https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/review-coated-hood")
                )
            ],
            createdAt: "2026-01-01T12:00:00.000Z",
            description: Nullable<String>.value("Two years on and the paint still beads like the day it was coated."),
            id: "rev_xxxxxxxxxxxxxx",
            joinedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            paidForProduct: Nullable<Bool>.value(true),
            product: ReviewProduct(
                id: "prod_xxxxxxxxxxxxxx",
                title: "Ceramic Coating Package"
            ),
            publishedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            stars: 4,
            status: ReviewStatus.published,
            title: Nullable<String>.value("Worth every penny"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            user: ReviewUser(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                username: "danawhitfield"
            )
        )
        let response = try await client.reviews.retrieve(
            id: "rev_xxxxxxxxxxxxxx",
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
                  "account": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
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
                  "created_at": "created_at",
                  "description": "description",
                  "id": "id",
                  "joined_at": "joined_at",
                  "paid_for_product": true,
                  "product": {
                    "id": "id",
                    "title": "title"
                  },
                  "published_at": "published_at",
                  "stars": 1,
                  "status": "pending",
                  "title": "title",
                  "updated_at": "updated_at",
                  "user": {
                    "id": "id",
                    "name": "name",
                    "username": "username"
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
        let expectedResponse = Review(
            account: ReviewAccount(
                id: "id",
                route: "route",
                title: "title"
            ),
            attachments: [
                ReviewAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ReviewAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            createdAt: "created_at",
            description: Nullable<String>.value("description"),
            id: "id",
            joinedAt: Nullable<String>.value("joined_at"),
            paidForProduct: Nullable<Bool>.value(true),
            product: ReviewProduct(
                id: "id",
                title: "title"
            ),
            publishedAt: Nullable<String>.value("published_at"),
            stars: 1,
            status: ReviewStatus.pending,
            title: Nullable<String>.value("title"),
            updatedAt: "updated_at",
            user: ReviewUser(
                id: "id",
                name: Nullable<String>.value("name"),
                username: "username"
            )
        )
        let response = try await client.reviews.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "rev_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteReviewsResponse(
            deleted: true,
            id: "rev_xxxxxxxxxxxxxx"
        )
        let response = try await client.reviews.delete(
            id: "rev_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteReviewsResponse(
            deleted: true,
            id: "id"
        )
        let response = try await client.reviews.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}