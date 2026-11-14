import Foundation
import Testing
import WhopSDK

@Suite("ExperiencesClient Wire Tests") struct ExperiencesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "app": {
                        "icon": {
                          "url": "https://media.whop.com/abc123/optimized.jpg"
                        },
                        "id": "app_xxxxxxxxxxxxxx",
                        "name": "Courses"
                      },
                      "company": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "route": "pickaxe",
                        "title": "Pickaxe"
                      },
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "exp_xxxxxxxxxxxxxx",
                      "image": {
                        "url": "https://media.whop.com/abc123/optimized.jpg"
                      },
                      "is_public": true,
                      "name": "Trading Signals Chat",
                      "order": "123.45"
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
        let expectedResponse = ListExperiencesResponse(
            data: [
                ExperienceListItem(
                    app: ExperienceListItemApp(
                        icon: Nullable<ExperienceListItemAppIcon>.value(ExperienceListItemAppIcon(
                            url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                        )),
                        id: "app_xxxxxxxxxxxxxx",
                        name: "Courses"
                    ),
                    company: ExperienceListItemCompany(
                        id: "biz_xxxxxxxxxxxxxx",
                        route: "pickaxe",
                        title: "Pickaxe"
                    ),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "exp_xxxxxxxxxxxxxx",
                    image: Nullable<ExperienceListItemImage>.value(ExperienceListItemImage(
                        url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                    )),
                    isPublic: true,
                    name: "Trading Signals Chat",
                    order: Nullable<String>.value("123.45")
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.experiences.list(
            first: 42,
            last: 42,
            productId: "prod_xxxxxxxxxxxxx",
            appId: "app_xxxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            accountId: "biz_xxxxxxxxxxxxxx",
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
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "company": {
                        "id": "id",
                        "route": "route",
                        "title": "title"
                      },
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "image": {
                        "url": "url"
                      },
                      "is_public": true,
                      "name": "name",
                      "order": "order"
                    },
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "company": {
                        "id": "id",
                        "route": "route",
                        "title": "title"
                      },
                      "created_at": "2024-01-15T09:30:00Z",
                      "id": "id",
                      "image": {
                        "url": "url"
                      },
                      "is_public": true,
                      "name": "name",
                      "order": "order"
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
        let expectedResponse = ListExperiencesResponse(
            data: [
                ExperienceListItem(
                    app: ExperienceListItemApp(
                        icon: Nullable<ExperienceListItemAppIcon>.value(ExperienceListItemAppIcon(
                            url: Nullable<String>.value("url")
                        )),
                        id: "id",
                        name: "name"
                    ),
                    company: ExperienceListItemCompany(
                        id: "id",
                        route: "route",
                        title: "title"
                    ),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    image: Nullable<ExperienceListItemImage>.value(ExperienceListItemImage(
                        url: Nullable<String>.value("url")
                    )),
                    isPublic: true,
                    name: "name",
                    order: Nullable<String>.value("order")
                ),
                ExperienceListItem(
                    app: ExperienceListItemApp(
                        icon: Nullable<ExperienceListItemAppIcon>.value(ExperienceListItemAppIcon(
                            url: Nullable<String>.value("url")
                        )),
                        id: "id",
                        name: "name"
                    ),
                    company: ExperienceListItemCompany(
                        id: "id",
                        route: "route",
                        title: "title"
                    ),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    id: "id",
                    image: Nullable<ExperienceListItemImage>.value(ExperienceListItemImage(
                        url: Nullable<String>.value("url")
                    )),
                    isPublic: true,
                    name: "name",
                    order: Nullable<String>.value("order")
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.experiences.list(
            accountId: "account_id",
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
                  "app": {
                    "icon": {
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Courses"
                  },
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "pickaxe",
                    "title": "Pickaxe"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "exp_xxxxxxxxxxxxxx",
                  "image": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "is_public": true,
                  "name": "Trading Signals Chat",
                  "order": "123.45",
                  "products": [
                    {
                      "id": "prod_xxxxxxxxxxxxx",
                      "route": "pickaxe-analytics",
                      "title": "Pickaxe Analytics"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )),
                id: "app_xxxxxxxxxxxxxx",
                name: "Courses"
            ),
            company: ExperienceCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "pickaxe",
                title: "Pickaxe"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "exp_xxxxxxxxxxxxxx",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            isPublic: true,
            name: "Trading Signals Chat",
            order: Nullable<String>.value("123.45"),
            products: [
                ExperienceProductsItem(
                    id: "prod_xxxxxxxxxxxxx",
                    route: "pickaxe-analytics",
                    title: "Pickaxe Analytics"
                )
            ]
        )
        let response = try await client.experiences.create(
            request: .init(
                accountId: "biz_xxxxxxxxxxxxxx",
                appId: "app_xxxxxxxxxxxxxx"
            ),
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
                  "app": {
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "image": {
                    "url": "url"
                  },
                  "is_public": true,
                  "name": "name",
                  "order": "order",
                  "products": [
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("url")
                )),
                id: "id",
                name: "name"
            ),
            company: ExperienceCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("url")
            )),
            isPublic: true,
            name: "name",
            order: Nullable<String>.value("order"),
            products: [
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                ),
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                )
            ]
        )
        let response = try await client.experiences.create(
            request: .init(
                accountId: "account_id",
                appId: "app_id"
            ),
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
                  "app": {
                    "icon": {
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Courses"
                  },
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "pickaxe",
                    "title": "Pickaxe"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "exp_xxxxxxxxxxxxxx",
                  "image": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "is_public": true,
                  "name": "Trading Signals Chat",
                  "order": "123.45",
                  "products": [
                    {
                      "id": "prod_xxxxxxxxxxxxx",
                      "route": "pickaxe-analytics",
                      "title": "Pickaxe Analytics"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )),
                id: "app_xxxxxxxxxxxxxx",
                name: "Courses"
            ),
            company: ExperienceCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "pickaxe",
                title: "Pickaxe"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "exp_xxxxxxxxxxxxxx",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            isPublic: true,
            name: "Trading Signals Chat",
            order: Nullable<String>.value("123.45"),
            products: [
                ExperienceProductsItem(
                    id: "prod_xxxxxxxxxxxxx",
                    route: "pickaxe-analytics",
                    title: "Pickaxe Analytics"
                )
            ]
        )
        let response = try await client.experiences.retrieve(
            id: "exp_xxxxxxxxxxxxxx",
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
                  "app": {
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "image": {
                    "url": "url"
                  },
                  "is_public": true,
                  "name": "name",
                  "order": "order",
                  "products": [
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("url")
                )),
                id: "id",
                name: "name"
            ),
            company: ExperienceCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("url")
            )),
            isPublic: true,
            name: "name",
            order: Nullable<String>.value("order"),
            products: [
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                ),
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                )
            ]
        )
        let response = try await client.experiences.retrieve(
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
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.experiences.delete(
            id: "exp_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.experiences.delete(
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
                  "app": {
                    "icon": {
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Courses"
                  },
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "pickaxe",
                    "title": "Pickaxe"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "exp_xxxxxxxxxxxxxx",
                  "image": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "is_public": true,
                  "name": "Trading Signals Chat",
                  "order": "123.45",
                  "products": [
                    {
                      "id": "prod_xxxxxxxxxxxxx",
                      "route": "pickaxe-analytics",
                      "title": "Pickaxe Analytics"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )),
                id: "app_xxxxxxxxxxxxxx",
                name: "Courses"
            ),
            company: ExperienceCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "pickaxe",
                title: "Pickaxe"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "exp_xxxxxxxxxxxxxx",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            isPublic: true,
            name: "Trading Signals Chat",
            order: Nullable<String>.value("123.45"),
            products: [
                ExperienceProductsItem(
                    id: "prod_xxxxxxxxxxxxx",
                    route: "pickaxe-analytics",
                    title: "Pickaxe Analytics"
                )
            ]
        )
        let response = try await client.experiences.update(
            id: "exp_xxxxxxxxxxxxxx",
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
                  "app": {
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "image": {
                    "url": "url"
                  },
                  "is_public": true,
                  "name": "name",
                  "order": "order",
                  "products": [
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("url")
                )),
                id: "id",
                name: "name"
            ),
            company: ExperienceCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("url")
            )),
            isPublic: true,
            name: "name",
            order: Nullable<String>.value("order"),
            products: [
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                ),
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                )
            ]
        )
        let response = try await client.experiences.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func attach1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "app": {
                    "icon": {
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Courses"
                  },
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "pickaxe",
                    "title": "Pickaxe"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "exp_xxxxxxxxxxxxxx",
                  "image": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "is_public": true,
                  "name": "Trading Signals Chat",
                  "order": "123.45",
                  "products": [
                    {
                      "id": "prod_xxxxxxxxxxxxx",
                      "route": "pickaxe-analytics",
                      "title": "Pickaxe Analytics"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )),
                id: "app_xxxxxxxxxxxxxx",
                name: "Courses"
            ),
            company: ExperienceCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "pickaxe",
                title: "Pickaxe"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "exp_xxxxxxxxxxxxxx",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            isPublic: true,
            name: "Trading Signals Chat",
            order: Nullable<String>.value("123.45"),
            products: [
                ExperienceProductsItem(
                    id: "prod_xxxxxxxxxxxxx",
                    route: "pickaxe-analytics",
                    title: "Pickaxe Analytics"
                )
            ]
        )
        let response = try await client.experiences.attach(
            id: "exp_xxxxxxxxxxxxxx",
            request: .init(productId: "prod_xxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func attach2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "app": {
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "image": {
                    "url": "url"
                  },
                  "is_public": true,
                  "name": "name",
                  "order": "order",
                  "products": [
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("url")
                )),
                id: "id",
                name: "name"
            ),
            company: ExperienceCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("url")
            )),
            isPublic: true,
            name: "name",
            order: Nullable<String>.value("order"),
            products: [
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                ),
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                )
            ]
        )
        let response = try await client.experiences.attach(
            id: "id",
            request: .init(productId: "product_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func detach1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "app": {
                    "icon": {
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Courses"
                  },
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "pickaxe",
                    "title": "Pickaxe"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "exp_xxxxxxxxxxxxxx",
                  "image": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "is_public": true,
                  "name": "Trading Signals Chat",
                  "order": "123.45",
                  "products": [
                    {
                      "id": "prod_xxxxxxxxxxxxx",
                      "route": "pickaxe-analytics",
                      "title": "Pickaxe Analytics"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )),
                id: "app_xxxxxxxxxxxxxx",
                name: "Courses"
            ),
            company: ExperienceCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "pickaxe",
                title: "Pickaxe"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "exp_xxxxxxxxxxxxxx",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            isPublic: true,
            name: "Trading Signals Chat",
            order: Nullable<String>.value("123.45"),
            products: [
                ExperienceProductsItem(
                    id: "prod_xxxxxxxxxxxxx",
                    route: "pickaxe-analytics",
                    title: "Pickaxe Analytics"
                )
            ]
        )
        let response = try await client.experiences.detach(
            id: "exp_xxxxxxxxxxxxxx",
            request: .init(productId: "prod_xxxxxxxxxxxxx"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func detach2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "app": {
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "image": {
                    "url": "url"
                  },
                  "is_public": true,
                  "name": "name",
                  "order": "order",
                  "products": [
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("url")
                )),
                id: "id",
                name: "name"
            ),
            company: ExperienceCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("url")
            )),
            isPublic: true,
            name: "name",
            order: Nullable<String>.value("order"),
            products: [
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                ),
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                )
            ]
        )
        let response = try await client.experiences.detach(
            id: "id",
            request: .init(productId: "product_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func duplicate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "app": {
                    "icon": {
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    },
                    "id": "app_xxxxxxxxxxxxxx",
                    "name": "Courses"
                  },
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "pickaxe",
                    "title": "Pickaxe"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "exp_xxxxxxxxxxxxxx",
                  "image": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "is_public": true,
                  "name": "Trading Signals Chat",
                  "order": "123.45",
                  "products": [
                    {
                      "id": "prod_xxxxxxxxxxxxx",
                      "route": "pickaxe-analytics",
                      "title": "Pickaxe Analytics"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )),
                id: "app_xxxxxxxxxxxxxx",
                name: "Courses"
            ),
            company: ExperienceCompany(
                id: "biz_xxxxxxxxxxxxxx",
                route: "pickaxe",
                title: "Pickaxe"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "exp_xxxxxxxxxxxxxx",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            isPublic: true,
            name: "Trading Signals Chat",
            order: Nullable<String>.value("123.45"),
            products: [
                ExperienceProductsItem(
                    id: "prod_xxxxxxxxxxxxx",
                    route: "pickaxe-analytics",
                    title: "Pickaxe Analytics"
                )
            ]
        )
        let response = try await client.experiences.duplicate(
            id: "exp_xxxxxxxxxxxxxx",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func duplicate2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "app": {
                    "icon": {
                      "url": "url"
                    },
                    "id": "id",
                    "name": "name"
                  },
                  "company": {
                    "id": "id",
                    "route": "route",
                    "title": "title"
                  },
                  "created_at": "2024-01-15T09:30:00Z",
                  "id": "id",
                  "image": {
                    "url": "url"
                  },
                  "is_public": true,
                  "name": "name",
                  "order": "order",
                  "products": [
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "route": "route",
                      "title": "title"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Experience(
            app: ExperienceApp(
                icon: Nullable<ExperienceAppIcon>.value(ExperienceAppIcon(
                    url: Nullable<String>.value("url")
                )),
                id: "id",
                name: "name"
            ),
            company: ExperienceCompany(
                id: "id",
                route: "route",
                title: "title"
            ),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            id: "id",
            image: Nullable<ExperienceImage>.value(ExperienceImage(
                url: Nullable<String>.value("url")
            )),
            isPublic: true,
            name: "name",
            order: Nullable<String>.value("order"),
            products: [
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                ),
                ExperienceProductsItem(
                    id: "id",
                    route: "route",
                    title: "title"
                )
            ]
        )
        let response = try await client.experiences.duplicate(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}