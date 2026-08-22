import Foundation
import Testing
import WhopSDK

@Suite("ProductsClient Wire Tests") struct ProductsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "external_identifier": "SHINE-CERAMIC-01",
                      "gallery_images": [
                        {
                          "content_type": "image/png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      ],
                      "headline": "A showroom finish that lasts three years",
                      "id": "prod_xxxxxxxxxxxxxx",
                      "labels": [
                        "courses"
                      ],
                      "member_count": 0,
                      "metadata": {
                        "key": "value"
                      },
                      "published_reviews_count": 0,
                      "route": "ceramic-coating-package",
                      "title": "Ceramic Coating Package",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "verified": false,
                      "visibility": "visible"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
                    "has_next_page": false,
                    "has_previous_page": false,
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
        let expectedResponse = ListProductsResponse(
            data: [
                ProductListItem(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    externalIdentifier: Nullable<String>.value("SHINE-CERAMIC-01"),
                    galleryImages: [
                        ProductGalleryImage(
                            contentType: Nullable<String>.value("image/png"),
                            id: "file_xxxxxxxxxxxxxx",
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )
                    ],
                    headline: Nullable<String>.value("A showroom finish that lasts three years"),
                    id: "prod_xxxxxxxxxxxxxx",
                    labels: [
                        "courses"
                    ],
                    memberCount: 0,
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    publishedReviewsCount: 0,
                    route: "ceramic-coating-package",
                    title: "Ceramic Coating Package",
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    verified: false,
                    visibility: Nullable<String>.value("visible")
                )
            ],
            pageInfo: ListProductsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.products.list(
            accountId: "account_id",
            visibilities: [
                "visible"
            ],
            accessPassTypes: [
                "regular"
            ],
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "external_identifier": "SHINE-CERAMIC-01",
                  "gallery_images": [
                    {
                      "content_type": "image/png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "global_affiliate_percentage": 10,
                  "global_affiliate_status": "enabled",
                  "headline": "Steam, shampoo, and odor removal in one visit",
                  "id": "prod_xxxxxxxxxxxxxx",
                  "labels": [
                    "interior"
                  ],
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 5,
                  "member_affiliate_status": "enabled",
                  "member_count": 0,
                  "metadata": {
                    "bay": "1",
                    "duration_hours": "4"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "published_reviews_count": 0,
                  "route": "interior-deep-clean",
                  "title": "Interior Deep Clean",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verified": false,
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Product(
            account: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "route": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Shine Time Auto Detailing")
            ]),
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            externalIdentifier: Nullable<String>.value("SHINE-CERAMIC-01"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("image/png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(10),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("Steam, shampoo, and odor removal in one visit"),
            id: "prod_xxxxxxxxxxxxxx",
            labels: [
                "interior"
            ],
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(5),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 0,
            metadata: Nullable<[String: JSONValue]>.value([
                "bay": JSONValue.string("1"), 
                "duration_hours": JSONValue.string("4")
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("user_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("Marcus Webb"), 
                "username": JSONValue.string("marcuswebb")
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            publishedReviewsCount: 0,
            route: "interior-deep-clean",
            title: "Interior Deep Clean",
            updatedAt: "2026-01-01T12:00:00.000Z",
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.create(
            request: .init(title: "Interior Deep Clean"),
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
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "external_identifier": "SHINE-CERAMIC-01",
                  "gallery_images": [
                    {
                      "content_type": "image/png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "global_affiliate_percentage": 10,
                  "global_affiliate_status": "enabled",
                  "headline": "Steam, shampoo, and odor removal in one visit",
                  "id": "prod_xxxxxxxxxxxxxx",
                  "labels": [
                    "interior"
                  ],
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 5,
                  "member_affiliate_status": "enabled",
                  "member_count": 0,
                  "metadata": {
                    "bay": "1",
                    "duration_hours": "4"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "published_reviews_count": 0,
                  "route": "interior-deep-clean",
                  "title": "Interior Deep Clean",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verified": false,
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Product(
            account: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "route": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Shine Time Auto Detailing")
            ]),
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            externalIdentifier: Nullable<String>.value("SHINE-CERAMIC-01"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("image/png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(10),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("Steam, shampoo, and odor removal in one visit"),
            id: "prod_xxxxxxxxxxxxxx",
            labels: [
                "interior"
            ],
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(5),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 0,
            metadata: Nullable<[String: JSONValue]>.value([
                "bay": JSONValue.string("1"), 
                "duration_hours": JSONValue.string("4")
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("user_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("Marcus Webb"), 
                "username": JSONValue.string("marcuswebb")
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            publishedReviewsCount: 0,
            route: "interior-deep-clean",
            title: "Interior Deep Clean",
            updatedAt: "2026-01-01T12:00:00.000Z",
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.retrieve(
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
                  "id": "prod_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteProductsResponse(
            deleted: true,
            id: "prod_xxxxxxxxxxxxxx"
        )
        let response = try await client.products.delete(
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "external_identifier": "SHINE-CERAMIC-01",
                  "gallery_images": [
                    {
                      "content_type": "image/png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "global_affiliate_percentage": 10,
                  "global_affiliate_status": "enabled",
                  "headline": "Steam, shampoo, and odor removal in one visit",
                  "id": "prod_xxxxxxxxxxxxxx",
                  "labels": [
                    "interior"
                  ],
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 5,
                  "member_affiliate_status": "enabled",
                  "member_count": 0,
                  "metadata": {
                    "bay": "1",
                    "duration_hours": "4"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "published_reviews_count": 0,
                  "route": "interior-deep-clean",
                  "title": "Interior Deep Clean",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verified": false,
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Product(
            account: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "route": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Shine Time Auto Detailing")
            ]),
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            externalIdentifier: Nullable<String>.value("SHINE-CERAMIC-01"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("image/png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(10),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("Steam, shampoo, and odor removal in one visit"),
            id: "prod_xxxxxxxxxxxxxx",
            labels: [
                "interior"
            ],
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(5),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 0,
            metadata: Nullable<[String: JSONValue]>.value([
                "bay": JSONValue.string("1"), 
                "duration_hours": JSONValue.string("4")
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("user_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("Marcus Webb"), 
                "username": JSONValue.string("marcuswebb")
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            publishedReviewsCount: 0,
            route: "interior-deep-clean",
            title: "Interior Deep Clean",
            updatedAt: "2026-01-01T12:00:00.000Z",
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func publish1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "external_identifier": "SHINE-CERAMIC-01",
                  "gallery_images": [
                    {
                      "content_type": "image/png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "global_affiliate_percentage": 10,
                  "global_affiliate_status": "enabled",
                  "headline": "Steam, shampoo, and odor removal in one visit",
                  "id": "prod_xxxxxxxxxxxxxx",
                  "labels": [
                    "interior"
                  ],
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 5,
                  "member_affiliate_status": "enabled",
                  "member_count": 0,
                  "metadata": {
                    "bay": "1",
                    "duration_hours": "4"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "published_reviews_count": 0,
                  "route": "interior-deep-clean",
                  "title": "Interior Deep Clean",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verified": false,
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Product(
            account: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "route": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Shine Time Auto Detailing")
            ]),
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            externalIdentifier: Nullable<String>.value("SHINE-CERAMIC-01"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("image/png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(10),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("Steam, shampoo, and odor removal in one visit"),
            id: "prod_xxxxxxxxxxxxxx",
            labels: [
                "interior"
            ],
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(5),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 0,
            metadata: Nullable<[String: JSONValue]>.value([
                "bay": JSONValue.string("1"), 
                "duration_hours": JSONValue.string("4")
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("user_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("Marcus Webb"), 
                "username": JSONValue.string("marcuswebb")
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            publishedReviewsCount: 0,
            route: "interior-deep-clean",
            title: "Interior Deep Clean",
            updatedAt: "2026-01-01T12:00:00.000Z",
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.publish(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unpublish1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "external_identifier": "SHINE-CERAMIC-01",
                  "gallery_images": [
                    {
                      "content_type": "image/png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  ],
                  "global_affiliate_percentage": 10,
                  "global_affiliate_status": "enabled",
                  "headline": "Steam, shampoo, and odor removal in one visit",
                  "id": "prod_xxxxxxxxxxxxxx",
                  "labels": [
                    "interior"
                  ],
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 5,
                  "member_affiliate_status": "enabled",
                  "member_count": 0,
                  "metadata": {
                    "bay": "1",
                    "duration_hours": "4"
                  },
                  "owner_user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "published_reviews_count": 0,
                  "route": "interior-deep-clean",
                  "title": "Interior Deep Clean",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verified": false,
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Product(
            account: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "route": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                "title": JSONValue.string("Shine Time Auto Detailing")
            ]),
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            externalIdentifier: Nullable<String>.value("SHINE-CERAMIC-01"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("image/png"),
                    id: "file_xxxxxxxxxxxxxx",
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(10),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("Steam, shampoo, and odor removal in one visit"),
            id: "prod_xxxxxxxxxxxxxx",
            labels: [
                "interior"
            ],
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(5),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 0,
            metadata: Nullable<[String: JSONValue]>.value([
                "bay": JSONValue.string("1"), 
                "duration_hours": JSONValue.string("4")
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("user_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("Marcus Webb"), 
                "username": JSONValue.string("marcuswebb")
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            publishedReviewsCount: 0,
            route: "interior-deep-clean",
            title: "Interior Deep Clean",
            updatedAt: "2026-01-01T12:00:00.000Z",
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.unpublish(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}