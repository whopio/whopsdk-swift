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
}