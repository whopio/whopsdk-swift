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
                          "content_type": "image/jpeg",
                          "filename": "document.pdf",
                          "id": "id",
                          "url": "https://media.whop.com/abc123/optimized.jpg"
                        }
                      ],
                      "created_at": "2023-12-01T05:00:00Z",
                      "description": "Great product, really helped me grow my audience.",
                      "id": "rev_xxxxxxxxxxxxxx",
                      "joined_at": "2023-12-01T05:00:00Z",
                      "paid_for_product": true,
                      "published_at": "2023-12-01T05:00:00Z",
                      "stars": 42,
                      "status": "pending",
                      "title": "Amazing community and tools",
                      "updated_at": "2023-12-01T05:00:00Z",
                      "user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      }
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
        let expectedResponse = ListReviewsResponse(
            data: [
                ReviewListItem(
                    attachments: [
                        ReviewListItemAttachmentsItem(
                            contentType: Nullable<String>.value("image/jpeg"),
                            filename: Nullable<String>.value("document.pdf"),
                            id: "id",
                            url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                        )
                    ],
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("Great product, really helped me grow my audience."),
                    id: "rev_xxxxxxxxxxxxxx",
                    joinedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    paidForProduct: Nullable<Bool>.value(true),
                    publishedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    stars: 42,
                    status: ReviewStatus.pending,
                    title: Nullable<String>.value("Amazing community and tools"),
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    user: ReviewListItemUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.reviews.list(
            first: 42,
            last: 42,
            productId: "prod_xxxxxxxxxxxxx",
            minStars: 42,
            maxStars: 42,
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
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
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "pickaxe",
                    "title": "Pickaxe"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Great product, really helped me grow my audience.",
                  "id": "rev_xxxxxxxxxxxxxx",
                  "joined_at": "2023-12-01T05:00:00Z",
                  "paid_for_product": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "published_at": "2023-12-01T05:00:00Z",
                  "stars": 42,
                  "status": "pending",
                  "title": "Amazing community and tools",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
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
            attachments: [
                ReviewAttachmentsItem(
                    contentType: Nullable<String>.value("image/jpeg"),
                    filename: Nullable<String>.value("document.pdf"),
                    id: "id",
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )
            ],
            company: ReviewCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "pickaxe",
                title: "Pickaxe"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Great product, really helped me grow my audience."),
            id: "rev_xxxxxxxxxxxxxx",
            joinedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            paidForProduct: Nullable<Bool>.value(true),
            product: ReviewProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            ),
            publishedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            stars: 42,
            status: ReviewStatus.pending,
            title: Nullable<String>.value("Amazing community and tools"),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: ReviewUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.reviews.retrieve(
            id: "rev_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}