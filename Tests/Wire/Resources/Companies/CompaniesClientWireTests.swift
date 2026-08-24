import Foundation
import Testing
import WhopSDK

@Suite("CompaniesClient Wire Tests") struct CompaniesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "description": "Learn the fundamentals of data analytics with hands-on projects.",
                      "id": "biz_xxxxxxxxxxxxxx",
                      "logo": {
                        "url": "https://media.whop.com/abc123/optimized.jpg"
                      },
                      "member_count": 42,
                      "metadata": {
                        "key": "value"
                      },
                      "owner_user": {
                        "id": "user_xxxxxxxxxxxxx",
                        "name": "John Doe",
                        "username": "johndoe42"
                      },
                      "published_reviews_count": 42,
                      "route": "pickaxe",
                      "send_customer_emails": true,
                      "target_audience": "target_audience",
                      "title": "Pickaxe",
                      "updated_at": "2023-12-01T05:00:00Z",
                      "verified": true
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
        let expectedResponse = ListCompaniesResponse(
            data: [
                CompanyListItem(
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("Learn the fundamentals of data analytics with hands-on projects."),
                    id: "biz_xxxxxxxxxxxxxx",
                    logo: Nullable<CompanyListItemLogo>.value(CompanyListItemLogo(
                        url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                    )),
                    memberCount: 42,
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    ownerUser: CompanyListItemOwnerUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    ),
                    publishedReviewsCount: 42,
                    route: "pickaxe",
                    sendCustomerEmails: true,
                    targetAudience: Nullable<String>.value("target_audience"),
                    title: "Pickaxe",
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    verified: true
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.companies.list(
            first: 42,
            last: 42,
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
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
                  "affiliate_instructions": "Share your unique link on social media to earn 20% commission.",
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Learn the fundamentals of data analytics with hands-on projects.",
                  "featured_affiliate_product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "name": "name"
                  },
                  "id": "biz_xxxxxxxxxxxxxx",
                  "logo": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "member_count": 42,
                  "metadata": {
                    "key": "value"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "published_reviews_count": 42,
                  "route": "pickaxe",
                  "send_customer_emails": true,
                  "social_links": [
                    {
                      "id": "soci_xxxxxxxxxxxxx",
                      "url": "https://x.com/whop",
                      "website": "x"
                    }
                  ],
                  "target_audience": "target_audience",
                  "title": "Pickaxe",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Company(
            affiliateInstructions: Nullable<String>.value("Share your unique link on social media to earn 20% commission."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Learn the fundamentals of data analytics with hands-on projects."),
            featuredAffiliateProduct: Nullable<CompanyFeaturedAffiliateProduct>.value(CompanyFeaturedAffiliateProduct(
                id: "prod_xxxxxxxxxxxxx",
                name: "name"
            )),
            id: "biz_xxxxxxxxxxxxxx",
            logo: Nullable<CompanyLogo>.value(CompanyLogo(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            memberCount: 42,
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            ownerUser: CompanyOwnerUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            publishedReviewsCount: 42,
            route: "pickaxe",
            sendCustomerEmails: true,
            socialLinks: [
                CompanySocialLinksItem(
                    id: "soci_xxxxxxxxxxxxx",
                    url: "https://x.com/whop",
                    website: SocialLinkWebsites.x
                )
            ],
            targetAudience: Nullable<String>.value("target_audience"),
            title: "Pickaxe",
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            verified: true
        )
        let response = try await client.companies.create(
            request: .init(title: "title"),
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
                  "affiliate_instructions": "Share your unique link on social media to earn 20% commission.",
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Learn the fundamentals of data analytics with hands-on projects.",
                  "featured_affiliate_product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "name": "name"
                  },
                  "id": "biz_xxxxxxxxxxxxxx",
                  "logo": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "member_count": 42,
                  "metadata": {
                    "key": "value"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "published_reviews_count": 42,
                  "route": "pickaxe",
                  "send_customer_emails": true,
                  "social_links": [
                    {
                      "id": "soci_xxxxxxxxxxxxx",
                      "url": "https://x.com/whop",
                      "website": "x"
                    }
                  ],
                  "target_audience": "target_audience",
                  "title": "Pickaxe",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Company(
            affiliateInstructions: Nullable<String>.value("Share your unique link on social media to earn 20% commission."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Learn the fundamentals of data analytics with hands-on projects."),
            featuredAffiliateProduct: Nullable<CompanyFeaturedAffiliateProduct>.value(CompanyFeaturedAffiliateProduct(
                id: "prod_xxxxxxxxxxxxx",
                name: "name"
            )),
            id: "biz_xxxxxxxxxxxxxx",
            logo: Nullable<CompanyLogo>.value(CompanyLogo(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            memberCount: 42,
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            ownerUser: CompanyOwnerUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            publishedReviewsCount: 42,
            route: "pickaxe",
            sendCustomerEmails: true,
            socialLinks: [
                CompanySocialLinksItem(
                    id: "soci_xxxxxxxxxxxxx",
                    url: "https://x.com/whop",
                    website: SocialLinkWebsites.x
                )
            ],
            targetAudience: Nullable<String>.value("target_audience"),
            title: "Pickaxe",
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            verified: true
        )
        let response = try await client.companies.retrieve(
            id: "biz_xxxxxxxxxxxxxx",
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
                  "affiliate_instructions": "Share your unique link on social media to earn 20% commission.",
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Learn the fundamentals of data analytics with hands-on projects.",
                  "featured_affiliate_product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "name": "name"
                  },
                  "id": "biz_xxxxxxxxxxxxxx",
                  "logo": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "member_count": 42,
                  "metadata": {
                    "key": "value"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
                  },
                  "published_reviews_count": 42,
                  "route": "pickaxe",
                  "send_customer_emails": true,
                  "social_links": [
                    {
                      "id": "soci_xxxxxxxxxxxxx",
                      "url": "https://x.com/whop",
                      "website": "x"
                    }
                  ],
                  "target_audience": "target_audience",
                  "title": "Pickaxe",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Company(
            affiliateInstructions: Nullable<String>.value("Share your unique link on social media to earn 20% commission."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Learn the fundamentals of data analytics with hands-on projects."),
            featuredAffiliateProduct: Nullable<CompanyFeaturedAffiliateProduct>.value(CompanyFeaturedAffiliateProduct(
                id: "prod_xxxxxxxxxxxxx",
                name: "name"
            )),
            id: "biz_xxxxxxxxxxxxxx",
            logo: Nullable<CompanyLogo>.value(CompanyLogo(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            memberCount: 42,
            metadata: Nullable<[String: JSONValue]>.value([
                "key": JSONValue.string("value")
            ]),
            ownerUser: CompanyOwnerUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ),
            publishedReviewsCount: 42,
            route: "pickaxe",
            sendCustomerEmails: true,
            socialLinks: [
                CompanySocialLinksItem(
                    id: "soci_xxxxxxxxxxxxx",
                    url: "https://x.com/whop",
                    website: SocialLinkWebsites.x
                )
            ],
            targetAudience: Nullable<String>.value("target_audience"),
            title: "Pickaxe",
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            verified: true
        )
        let response = try await client.companies.update(
            id: "biz_xxxxxxxxxxxxxx",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createApiKey1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "id": "id",
                  "name": "name",
                  "secret_key": "secret_key"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateApiKeyCompaniesResponse(
            id: "id",
            name: Nullable<String>.value("name"),
            secretKey: "secret_key"
        )
        let response = try await client.companies.createApiKey(
            parentCompanyId: "parent_company_id",
            request: .init(childCompanyId: "child_company_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}