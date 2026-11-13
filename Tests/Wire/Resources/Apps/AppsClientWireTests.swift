import Foundation
import Testing
import WhopSDK

@Suite("AppsClient Wire Tests") struct AppsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "fees": {
                          "crypto_swap_markup": {
                            "fixed_fee_usd": 0,
                            "percentage_fee": 3
                          },
                          "transfer_markup": {
                            "fixed_fee_usd": 0,
                            "percentage_fee": 0
                          }
                        },
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-holdings",
                        "title": "Shine Time Holdings"
                      },
                      "app_type": "b2b_app",
                      "average_review_rating": 0,
                      "banner_image": {
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "base_url": "https://shine-time-booking-store.whop.site",
                      "businesses_created_count": 0,
                      "businesses_created_logo_urls": [
                        "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      ],
                      "businesses_with_recent_sales_count": 0,
                      "category": {
                        "id": "mcat_xxxxxxxxxxxxxx",
                        "name": "Business & Productivity",
                        "route": "business-productivity"
                      },
                      "creator": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Marcus Webb",
                        "username": "marcuswebb"
                      },
                      "dashboard_path": "/dashboard/[companyId]",
                      "description": "Let members book a mobile detailing appointment without leaving your whop.",
                      "discover_path": "/discover",
                      "domain_id": "whopappdomain0000001",
                      "domains": [
                        {
                          "domain": "from-template.whop.site",
                          "id": "dom_xxxxxxxxxxxxxx",
                          "status": "idle"
                        }
                      ],
                      "experience_path": "/experiences/[experienceId]",
                      "hosted_url": "https://shine-time-booking-store.whop.site",
                      "icon": {
                        "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                      },
                      "id": "app_xxxxxxxxxxxxxx",
                      "is_whop_app": false,
                      "name": "Shine Time Booking",
                      "openapi_path": "/openapi.json",
                      "origin": "https://whopappdomain0000001.apps.whop.com",
                      "product_category": "pressure_washing",
                      "published_reviews_count": 0,
                      "route": "shine-time-booking-store",
                      "skills_path": "/skills",
                      "status": "live",
                      "verified": true
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
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
        let expectedResponse = ListAppsResponse(
            data: [
                AppListItem(
                    account: AccountParent(
                        fees: Optional([
                            "crypto_swap_markup": AccountParentFeesValue(
                                fixedFeeUsd: 0,
                                percentageFee: 3
                            ), 
                            "transfer_markup": AccountParentFeesValue(
                                fixedFeeUsd: 0,
                                percentageFee: 0
                            )
                        ]),
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-holdings",
                        title: "Shine Time Holdings"
                    ),
                    appType: AppListItemAppType.b2BApp,
                    averageReviewRating: 0,
                    bannerImage: Nullable<AppBannerImage>.value(AppBannerImage(
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )),
                    baseUrl: Nullable<String>.value("https://shine-time-booking-store.whop.site"),
                    businessesCreatedCount: 0,
                    businessesCreatedLogoUrls: [
                        "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    ],
                    businessesWithRecentSalesCount: 0,
                    category: Nullable<AppCategory>.value(AppCategory(
                        id: "mcat_xxxxxxxxxxxxxx",
                        name: "Business & Productivity",
                        route: "business-productivity"
                    )),
                    creator: AppCreator(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Marcus Webb"),
                        username: "marcuswebb"
                    ),
                    dashboardPath: Nullable<String>.value("/dashboard/[companyId]"),
                    description: Nullable<String>.value("Let members book a mobile detailing appointment without leaving your whop."),
                    discoverPath: Nullable<String>.value("/discover"),
                    domainId: "whopappdomain0000001",
                    domains: [
                        AppDomain(
                            domain: "from-template.whop.site",
                            id: "dom_xxxxxxxxxxxxxx",
                            status: AppDomainStatus.idle
                        )
                    ],
                    experiencePath: Nullable<String>.value("/experiences/[experienceId]"),
                    hostedUrl: Nullable<String>.value("https://shine-time-booking-store.whop.site"),
                    icon: AppIcon(
                        url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                    ),
                    id: "app_xxxxxxxxxxxxxx",
                    isWhopApp: false,
                    name: "Shine Time Booking",
                    openapiPath: Nullable<String>.value("/openapi.json"),
                    origin: Nullable<String>.value("https://whopappdomain0000001.apps.whop.com"),
                    productCategory: Nullable<String>.value("pressure_washing"),
                    publishedReviewsCount: 0,
                    route: Nullable<String>.value("shine-time-booking-store"),
                    skillsPath: Nullable<String>.value("/skills"),
                    status: AppListItemStatus.live,
                    verified: true
                )
            ],
            pageInfo: ListAppsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.apps.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "api_key": {
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "token": "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                    "id": "id"
                  },
                  "app_store_description": "Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off.",
                  "app_type": "b2b_app",
                  "average_review_rating": 0,
                  "banner_image": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "base_url": "https://shine-time-booking.whop.site",
                  "businesses_created_count": 5,
                  "businesses_created_logo_urls": [
                    "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  ],
                  "businesses_with_recent_sales_count": 0,
                  "category": {
                    "id": "mcat_xxxxxxxxxxxxxx",
                    "name": "Business & Productivity",
                    "route": "business-productivity"
                  },
                  "creator": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "dashboard_path": "/dashboard/[companyId]",
                  "default_api_key": {
                    "id": "apik_xxxxxxxxxxxxxx",
                    "name": "Default",
                    "obfuscated_secret_key": "apik_xxxx....xxxx",
                    "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                  },
                  "deployment": {
                    "app_id": "app_xxxxxxxxxxxxxx",
                    "build_id": "build_id",
                    "draft": false,
                    "error": "error",
                    "estimated_duration_ms": 150000,
                    "estimated_remaining_ms": 91000,
                    "finished_at": 1,
                    "phase": "install",
                    "progress": 0.39,
                    "started_at": 1767268800000,
                    "status": "published",
                    "url": "url"
                  },
                  "description": "Let members book a mobile detailing appointment without leaving your whop.",
                  "discover_path": "/discover",
                  "domain_id": "whopappdomain0000001",
                  "domains": [
                    {
                      "domain": "from-template.whop.site",
                      "id": "dom_xxxxxxxxxxxxxx",
                      "status": "idle"
                    }
                  ],
                  "elements_used": [
                    "ads"
                  ],
                  "experience_path": "/experiences/[experienceId]",
                  "hosted_url": "https://shine-time-booking.whop.site",
                  "icon": {
                    "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                  },
                  "id": "app_xxxxxxxxxxxxxx",
                  "imported_from_url": "https://shinetime.example",
                  "is_app_store_listed": false,
                  "is_whop_app": false,
                  "marketplace_status": "not_available",
                  "name": "Shine Time Booking",
                  "oauth_client_type": "public",
                  "openapi_path": "/openapi.json",
                  "origin": "https://whopappdomain0000001.apps.whop.com",
                  "per_install_schedule": "*/15 * * * *",
                  "preview_token": "whop_preview_pass_example",
                  "product_category": "product_category",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "production_android_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_ios_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_web_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "published_reviews_count": 0,
                  "redirect_uris": [
                    "https://booking.shinetime.example/oauth/callback"
                  ],
                  "requested_permissions": [
                    {
                      "is_required": true,
                      "justification": "Creates apps on behalf of the installing company.",
                      "permission_action": {
                        "action": "company:basic:read",
                        "name": "Read business information"
                      }
                    }
                  ],
                  "required_scopes": [
                    "read_user"
                  ],
                  "route": "shine-time-booking",
                  "schedule": "0 * * * *",
                  "secrets": {
                    "BOOKING_CALENDAR_ID": "cal_9f21"
                  },
                  "skills_path": "/skills",
                  "status": "live",
                  "verified": false
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = App(
            account: AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            ),
            apiKey: Nullable<AppApiKey>.value(AppApiKey(
                createdAt: "2026-01-01T12:00:00.000Z",
                token: "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                id: "id"
            )),
            appStoreDescription: Nullable<String>.value("Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off."),
            appType: AppAppType.b2BApp,
            averageReviewRating: 0,
            bannerImage: Nullable<AppBannerImage>.value(AppBannerImage(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            baseUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            businessesCreatedCount: 5,
            businessesCreatedLogoUrls: [
                "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            ],
            businessesWithRecentSalesCount: 0,
            category: Nullable<AppCategory>.value(AppCategory(
                id: "mcat_xxxxxxxxxxxxxx",
                name: "Business & Productivity",
                route: "business-productivity"
            )),
            creator: AppCreator(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Marcus Webb"),
                username: "marcuswebb"
            ),
            dashboardPath: Nullable<String>.value("/dashboard/[companyId]"),
            defaultApiKey: Nullable<AppDefaultApiKey>.value(AppDefaultApiKey(
                id: "apik_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Default"),
                obfuscatedSecretKey: "apik_xxxx....xxxx",
                secretKey: Nullable<String>.value("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
            )),
            deployment: Nullable<AppDeployment>.value(AppDeployment(
                appId: "app_xxxxxxxxxxxxxx",
                buildId: Nullable<String>.value("build_id"),
                draft: false,
                error: Nullable<String>.value("error"),
                estimatedDurationMs: Nullable<Int>.value(150000),
                estimatedRemainingMs: Nullable<Int>.value(91000),
                finishedAt: Nullable<Int>.value(1),
                phase: Nullable<AppDeploymentPhase>.value(AppDeploymentPhase.install),
                progress: Nullable<Double>.value(0.39),
                startedAt: Nullable<Int>.value(1767268800000),
                status: AppDeploymentStatus.published,
                url: Nullable<String>.value("url")
            )),
            description: Nullable<String>.value("Let members book a mobile detailing appointment without leaving your whop."),
            discoverPath: Nullable<String>.value("/discover"),
            domainId: "whopappdomain0000001",
            domains: [
                AppDomain(
                    domain: "from-template.whop.site",
                    id: "dom_xxxxxxxxxxxxxx",
                    status: AppDomainStatus.idle
                )
            ],
            elementsUsed: [
                AppElementsUsedItem.ads
            ],
            experiencePath: Nullable<String>.value("/experiences/[experienceId]"),
            hostedUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            icon: AppIcon(
                url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
            ),
            id: "app_xxxxxxxxxxxxxx",
            importedFromUrl: Nullable<String>.value("https://shinetime.example"),
            isAppStoreListed: false,
            isWhopApp: false,
            marketplaceStatus: Nullable<AppMarketplaceStatus>.value(AppMarketplaceStatus.notAvailable),
            name: "Shine Time Booking",
            oauthClientType: AppOauthClientType.public,
            openapiPath: Nullable<String>.value("/openapi.json"),
            origin: Nullable<String>.value("https://whopappdomain0000001.apps.whop.com"),
            perInstallSchedule: Nullable<String>.value("*/15 * * * *"),
            previewToken: Nullable<String>.value("whop_preview_pass_example"),
            productCategory: Nullable<String>.value("product_category"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            productionAndroidBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionIosBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionWebBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            publishedReviewsCount: 0,
            redirectUris: [
                "https://booking.shinetime.example/oauth/callback"
            ],
            requestedPermissions: [
                AppRequestedPermission(
                    isRequired: true,
                    justification: Nullable<String>.value("Creates apps on behalf of the installing company."),
                    permissionAction: AppRequestedPermissionAction(
                        action: "company:basic:read",
                        name: "Read business information"
                    )
                )
            ],
            requiredScopes: [
                AppRequiredScopesItem.readUser
            ],
            route: Nullable<String>.value("shine-time-booking"),
            schedule: Nullable<String>.value("0 * * * *"),
            secrets: Nullable<[String: JSONValue]>.value([
                "BOOKING_CALENDAR_ID": JSONValue.string("cal_9f21")
            ]),
            skillsPath: Nullable<String>.value("/skills"),
            status: AppStatus.live,
            verified: false
        )
        let response = try await client.apps.create(
            request: .init(name: "Shine Time Booking"),
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
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "api_key": {
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "token": "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                    "id": "id"
                  },
                  "app_store_description": "Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off.",
                  "app_type": "b2b_app",
                  "average_review_rating": 0,
                  "banner_image": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "base_url": "https://shine-time-booking.whop.site",
                  "businesses_created_count": 5,
                  "businesses_created_logo_urls": [
                    "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  ],
                  "businesses_with_recent_sales_count": 0,
                  "category": {
                    "id": "mcat_xxxxxxxxxxxxxx",
                    "name": "Business & Productivity",
                    "route": "business-productivity"
                  },
                  "creator": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "dashboard_path": "/dashboard/[companyId]",
                  "default_api_key": {
                    "id": "apik_xxxxxxxxxxxxxx",
                    "name": "Default",
                    "obfuscated_secret_key": "apik_xxxx....xxxx",
                    "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                  },
                  "deployment": {
                    "app_id": "app_xxxxxxxxxxxxxx",
                    "build_id": "build_id",
                    "draft": false,
                    "error": "error",
                    "estimated_duration_ms": 150000,
                    "estimated_remaining_ms": 91000,
                    "finished_at": 1,
                    "phase": "install",
                    "progress": 0.39,
                    "started_at": 1767268800000,
                    "status": "published",
                    "url": "url"
                  },
                  "description": "Let members book a mobile detailing appointment without leaving your whop.",
                  "discover_path": "/discover",
                  "domain_id": "whopappdomain0000001",
                  "domains": [
                    {
                      "domain": "from-template.whop.site",
                      "id": "dom_xxxxxxxxxxxxxx",
                      "status": "idle"
                    }
                  ],
                  "elements_used": [
                    "ads"
                  ],
                  "experience_path": "/experiences/[experienceId]",
                  "hosted_url": "https://shine-time-booking.whop.site",
                  "icon": {
                    "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                  },
                  "id": "app_xxxxxxxxxxxxxx",
                  "imported_from_url": "https://shinetime.example",
                  "is_app_store_listed": false,
                  "is_whop_app": false,
                  "marketplace_status": "not_available",
                  "name": "Shine Time Booking",
                  "oauth_client_type": "public",
                  "openapi_path": "/openapi.json",
                  "origin": "https://whopappdomain0000001.apps.whop.com",
                  "per_install_schedule": "*/15 * * * *",
                  "preview_token": "whop_preview_pass_example",
                  "product_category": "product_category",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "production_android_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_ios_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_web_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "published_reviews_count": 0,
                  "redirect_uris": [
                    "https://booking.shinetime.example/oauth/callback"
                  ],
                  "requested_permissions": [
                    {
                      "is_required": true,
                      "justification": "Creates apps on behalf of the installing company.",
                      "permission_action": {
                        "action": "company:basic:read",
                        "name": "Read business information"
                      }
                    }
                  ],
                  "required_scopes": [
                    "read_user"
                  ],
                  "route": "shine-time-booking",
                  "schedule": "0 * * * *",
                  "secrets": {
                    "BOOKING_CALENDAR_ID": "cal_9f21"
                  },
                  "skills_path": "/skills",
                  "status": "live",
                  "verified": false
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = App(
            account: AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            ),
            apiKey: Nullable<AppApiKey>.value(AppApiKey(
                createdAt: "2026-01-01T12:00:00.000Z",
                token: "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                id: "id"
            )),
            appStoreDescription: Nullable<String>.value("Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off."),
            appType: AppAppType.b2BApp,
            averageReviewRating: 0,
            bannerImage: Nullable<AppBannerImage>.value(AppBannerImage(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            baseUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            businessesCreatedCount: 5,
            businessesCreatedLogoUrls: [
                "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            ],
            businessesWithRecentSalesCount: 0,
            category: Nullable<AppCategory>.value(AppCategory(
                id: "mcat_xxxxxxxxxxxxxx",
                name: "Business & Productivity",
                route: "business-productivity"
            )),
            creator: AppCreator(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Marcus Webb"),
                username: "marcuswebb"
            ),
            dashboardPath: Nullable<String>.value("/dashboard/[companyId]"),
            defaultApiKey: Nullable<AppDefaultApiKey>.value(AppDefaultApiKey(
                id: "apik_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Default"),
                obfuscatedSecretKey: "apik_xxxx....xxxx",
                secretKey: Nullable<String>.value("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
            )),
            deployment: Nullable<AppDeployment>.value(AppDeployment(
                appId: "app_xxxxxxxxxxxxxx",
                buildId: Nullable<String>.value("build_id"),
                draft: false,
                error: Nullable<String>.value("error"),
                estimatedDurationMs: Nullable<Int>.value(150000),
                estimatedRemainingMs: Nullable<Int>.value(91000),
                finishedAt: Nullable<Int>.value(1),
                phase: Nullable<AppDeploymentPhase>.value(AppDeploymentPhase.install),
                progress: Nullable<Double>.value(0.39),
                startedAt: Nullable<Int>.value(1767268800000),
                status: AppDeploymentStatus.published,
                url: Nullable<String>.value("url")
            )),
            description: Nullable<String>.value("Let members book a mobile detailing appointment without leaving your whop."),
            discoverPath: Nullable<String>.value("/discover"),
            domainId: "whopappdomain0000001",
            domains: [
                AppDomain(
                    domain: "from-template.whop.site",
                    id: "dom_xxxxxxxxxxxxxx",
                    status: AppDomainStatus.idle
                )
            ],
            elementsUsed: [
                AppElementsUsedItem.ads
            ],
            experiencePath: Nullable<String>.value("/experiences/[experienceId]"),
            hostedUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            icon: AppIcon(
                url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
            ),
            id: "app_xxxxxxxxxxxxxx",
            importedFromUrl: Nullable<String>.value("https://shinetime.example"),
            isAppStoreListed: false,
            isWhopApp: false,
            marketplaceStatus: Nullable<AppMarketplaceStatus>.value(AppMarketplaceStatus.notAvailable),
            name: "Shine Time Booking",
            oauthClientType: AppOauthClientType.public,
            openapiPath: Nullable<String>.value("/openapi.json"),
            origin: Nullable<String>.value("https://whopappdomain0000001.apps.whop.com"),
            perInstallSchedule: Nullable<String>.value("*/15 * * * *"),
            previewToken: Nullable<String>.value("whop_preview_pass_example"),
            productCategory: Nullable<String>.value("product_category"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            productionAndroidBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionIosBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionWebBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            publishedReviewsCount: 0,
            redirectUris: [
                "https://booking.shinetime.example/oauth/callback"
            ],
            requestedPermissions: [
                AppRequestedPermission(
                    isRequired: true,
                    justification: Nullable<String>.value("Creates apps on behalf of the installing company."),
                    permissionAction: AppRequestedPermissionAction(
                        action: "company:basic:read",
                        name: "Read business information"
                    )
                )
            ],
            requiredScopes: [
                AppRequiredScopesItem.readUser
            ],
            route: Nullable<String>.value("shine-time-booking"),
            schedule: Nullable<String>.value("0 * * * *"),
            secrets: Nullable<[String: JSONValue]>.value([
                "BOOKING_CALENDAR_ID": JSONValue.string("cal_9f21")
            ]),
            skillsPath: Nullable<String>.value("/skills"),
            status: AppStatus.live,
            verified: false
        )
        let response = try await client.apps.retrieve(
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
                  "id": "app_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAppsResponse(
            deleted: true,
            id: "app_xxxxxxxxxxxxxx"
        )
        let response = try await client.apps.delete(
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
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "api_key": {
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "token": "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                    "id": "id"
                  },
                  "app_store_description": "Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off.",
                  "app_type": "b2b_app",
                  "average_review_rating": 0,
                  "banner_image": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "base_url": "https://shine-time-booking.whop.site",
                  "businesses_created_count": 5,
                  "businesses_created_logo_urls": [
                    "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  ],
                  "businesses_with_recent_sales_count": 0,
                  "category": {
                    "id": "mcat_xxxxxxxxxxxxxx",
                    "name": "Business & Productivity",
                    "route": "business-productivity"
                  },
                  "creator": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "dashboard_path": "/dashboard/[companyId]",
                  "default_api_key": {
                    "id": "apik_xxxxxxxxxxxxxx",
                    "name": "Default",
                    "obfuscated_secret_key": "apik_xxxx....xxxx",
                    "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                  },
                  "deployment": {
                    "app_id": "app_xxxxxxxxxxxxxx",
                    "build_id": "build_id",
                    "draft": false,
                    "error": "error",
                    "estimated_duration_ms": 150000,
                    "estimated_remaining_ms": 91000,
                    "finished_at": 1,
                    "phase": "install",
                    "progress": 0.39,
                    "started_at": 1767268800000,
                    "status": "published",
                    "url": "url"
                  },
                  "description": "Let members book a mobile detailing appointment without leaving your whop.",
                  "discover_path": "/discover",
                  "domain_id": "whopappdomain0000001",
                  "domains": [
                    {
                      "domain": "from-template.whop.site",
                      "id": "dom_xxxxxxxxxxxxxx",
                      "status": "idle"
                    }
                  ],
                  "elements_used": [
                    "ads"
                  ],
                  "experience_path": "/experiences/[experienceId]",
                  "hosted_url": "https://shine-time-booking.whop.site",
                  "icon": {
                    "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                  },
                  "id": "app_xxxxxxxxxxxxxx",
                  "imported_from_url": "https://shinetime.example",
                  "is_app_store_listed": false,
                  "is_whop_app": false,
                  "marketplace_status": "not_available",
                  "name": "Shine Time Booking",
                  "oauth_client_type": "public",
                  "openapi_path": "/openapi.json",
                  "origin": "https://whopappdomain0000001.apps.whop.com",
                  "per_install_schedule": "*/15 * * * *",
                  "preview_token": "whop_preview_pass_example",
                  "product_category": "product_category",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "production_android_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_ios_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_web_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "published_reviews_count": 0,
                  "redirect_uris": [
                    "https://booking.shinetime.example/oauth/callback"
                  ],
                  "requested_permissions": [
                    {
                      "is_required": true,
                      "justification": "Creates apps on behalf of the installing company.",
                      "permission_action": {
                        "action": "company:basic:read",
                        "name": "Read business information"
                      }
                    }
                  ],
                  "required_scopes": [
                    "read_user"
                  ],
                  "route": "shine-time-booking",
                  "schedule": "0 * * * *",
                  "secrets": {
                    "BOOKING_CALENDAR_ID": "cal_9f21"
                  },
                  "skills_path": "/skills",
                  "status": "live",
                  "verified": false
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = App(
            account: AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            ),
            apiKey: Nullable<AppApiKey>.value(AppApiKey(
                createdAt: "2026-01-01T12:00:00.000Z",
                token: "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                id: "id"
            )),
            appStoreDescription: Nullable<String>.value("Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off."),
            appType: AppAppType.b2BApp,
            averageReviewRating: 0,
            bannerImage: Nullable<AppBannerImage>.value(AppBannerImage(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            baseUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            businessesCreatedCount: 5,
            businessesCreatedLogoUrls: [
                "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            ],
            businessesWithRecentSalesCount: 0,
            category: Nullable<AppCategory>.value(AppCategory(
                id: "mcat_xxxxxxxxxxxxxx",
                name: "Business & Productivity",
                route: "business-productivity"
            )),
            creator: AppCreator(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Marcus Webb"),
                username: "marcuswebb"
            ),
            dashboardPath: Nullable<String>.value("/dashboard/[companyId]"),
            defaultApiKey: Nullable<AppDefaultApiKey>.value(AppDefaultApiKey(
                id: "apik_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Default"),
                obfuscatedSecretKey: "apik_xxxx....xxxx",
                secretKey: Nullable<String>.value("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
            )),
            deployment: Nullable<AppDeployment>.value(AppDeployment(
                appId: "app_xxxxxxxxxxxxxx",
                buildId: Nullable<String>.value("build_id"),
                draft: false,
                error: Nullable<String>.value("error"),
                estimatedDurationMs: Nullable<Int>.value(150000),
                estimatedRemainingMs: Nullable<Int>.value(91000),
                finishedAt: Nullable<Int>.value(1),
                phase: Nullable<AppDeploymentPhase>.value(AppDeploymentPhase.install),
                progress: Nullable<Double>.value(0.39),
                startedAt: Nullable<Int>.value(1767268800000),
                status: AppDeploymentStatus.published,
                url: Nullable<String>.value("url")
            )),
            description: Nullable<String>.value("Let members book a mobile detailing appointment without leaving your whop."),
            discoverPath: Nullable<String>.value("/discover"),
            domainId: "whopappdomain0000001",
            domains: [
                AppDomain(
                    domain: "from-template.whop.site",
                    id: "dom_xxxxxxxxxxxxxx",
                    status: AppDomainStatus.idle
                )
            ],
            elementsUsed: [
                AppElementsUsedItem.ads
            ],
            experiencePath: Nullable<String>.value("/experiences/[experienceId]"),
            hostedUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            icon: AppIcon(
                url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
            ),
            id: "app_xxxxxxxxxxxxxx",
            importedFromUrl: Nullable<String>.value("https://shinetime.example"),
            isAppStoreListed: false,
            isWhopApp: false,
            marketplaceStatus: Nullable<AppMarketplaceStatus>.value(AppMarketplaceStatus.notAvailable),
            name: "Shine Time Booking",
            oauthClientType: AppOauthClientType.public,
            openapiPath: Nullable<String>.value("/openapi.json"),
            origin: Nullable<String>.value("https://whopappdomain0000001.apps.whop.com"),
            perInstallSchedule: Nullable<String>.value("*/15 * * * *"),
            previewToken: Nullable<String>.value("whop_preview_pass_example"),
            productCategory: Nullable<String>.value("product_category"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            productionAndroidBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionIosBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionWebBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            publishedReviewsCount: 0,
            redirectUris: [
                "https://booking.shinetime.example/oauth/callback"
            ],
            requestedPermissions: [
                AppRequestedPermission(
                    isRequired: true,
                    justification: Nullable<String>.value("Creates apps on behalf of the installing company."),
                    permissionAction: AppRequestedPermissionAction(
                        action: "company:basic:read",
                        name: "Read business information"
                    )
                )
            ],
            requiredScopes: [
                AppRequiredScopesItem.readUser
            ],
            route: Nullable<String>.value("shine-time-booking"),
            schedule: Nullable<String>.value("0 * * * *"),
            secrets: Nullable<[String: JSONValue]>.value([
                "BOOKING_CALENDAR_ID": JSONValue.string("cal_9f21")
            ]),
            skillsPath: Nullable<String>.value("/skills"),
            status: AppStatus.live,
            verified: false
        )
        let response = try await client.apps.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deploy1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "app_id": "app_xxxxxxxxxxxxxx",
                  "build_id": "build_id",
                  "draft": false,
                  "error": "error",
                  "estimated_duration_ms": 150000,
                  "estimated_remaining_ms": 91000,
                  "finished_at": 1,
                  "phase": "install",
                  "progress": 0.39,
                  "started_at": 1767268800000,
                  "status": "published",
                  "url": "url"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = AppDeployment(
            appId: "app_xxxxxxxxxxxxxx",
            buildId: Nullable<String>.value("build_id"),
            draft: false,
            error: Nullable<String>.value("error"),
            estimatedDurationMs: Nullable<Int>.value(150000),
            estimatedRemainingMs: Nullable<Int>.value(91000),
            finishedAt: Nullable<Int>.value(1),
            phase: Nullable<AppDeploymentPhase>.value(AppDeploymentPhase.install),
            progress: Nullable<Double>.value(0.39),
            startedAt: Nullable<Int>.value(1767268800000),
            status: AppDeploymentStatus.published,
            url: Nullable<String>.value("url")
        )
        let response = try await client.apps.deploy(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logs1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "app_build_id": "abld_123",
                      "app_id": "app_xxxxxxxxxxxxxx",
                      "cpu_time_ms": 8,
                      "created_at": "2026-01-01T12:00:00Z",
                      "level": "log",
                      "message": "TypeError: Cannot read properties of undefined (reading 'slotId')",
                      "outcome": "exception",
                      "request_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "request_method": "GET",
                      "request_path": "/api/slots",
                      "response_status": 500,
                      "source": "console",
                      "stack": "TypeError: Cannot read properties of undefined (reading 'slotId')\n    at renderBookingSlot (/worker/booking.js:118:24)\n    at handleRequest (/worker/index.js:42:11)",
                      "truncated": false,
                      "wall_time_ms": 31
                    }
                  ],
                  "page_info": {
                    "end_cursor": "cursor_end",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "cursor_start"
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
        let expectedResponse = LogsAppsResponse(
            data: [
                LogsAppsResponseDataItem(
                    appBuildId: "abld_123",
                    appId: "app_xxxxxxxxxxxxxx",
                    cpuTimeMs: Optional(8),
                    createdAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
                    level: LogsAppsResponseDataItemLevel.log,
                    message: "TypeError: Cannot read properties of undefined (reading 'slotId')",
                    outcome: Optional(Nullable<String>.value("exception")),
                    requestId: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    requestMethod: Optional(Nullable<String>.value("GET")),
                    requestPath: Optional(Nullable<String>.value("/api/slots")),
                    responseStatus: Optional(Nullable<Int>.value(500)),
                    source: LogsAppsResponseDataItemSource.console,
                    stack: Optional(Nullable<String>.value("TypeError: Cannot read properties of undefined (reading 'slotId')\n    at renderBookingSlot (/worker/booking.js:118:24)\n    at handleRequest (/worker/index.js:42:11)")),
                    truncated: Optional(false),
                    wallTimeMs: Optional(31)
                )
            ],
            pageInfo: LogsAppsResponsePageInfo(
                endCursor: Optional(Nullable<String>.value("cursor_end")),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Optional(Nullable<String>.value("cursor_start"))
            )
        )
        let response = try await client.apps.logs(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updatePermissions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "api_key": {
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "token": "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                    "id": "id"
                  },
                  "app_store_description": "Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off.",
                  "app_type": "b2b_app",
                  "average_review_rating": 0,
                  "banner_image": {
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "base_url": "https://shine-time-booking.whop.site",
                  "businesses_created_count": 5,
                  "businesses_created_logo_urls": [
                    "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  ],
                  "businesses_with_recent_sales_count": 0,
                  "category": {
                    "id": "mcat_xxxxxxxxxxxxxx",
                    "name": "Business & Productivity",
                    "route": "business-productivity"
                  },
                  "creator": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Marcus Webb",
                    "username": "marcuswebb"
                  },
                  "dashboard_path": "/dashboard/[companyId]",
                  "default_api_key": {
                    "id": "apik_xxxxxxxxxxxxxx",
                    "name": "Default",
                    "obfuscated_secret_key": "apik_xxxx....xxxx",
                    "secret_key": "apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                  },
                  "deployment": {
                    "app_id": "app_xxxxxxxxxxxxxx",
                    "build_id": "build_id",
                    "draft": false,
                    "error": "error",
                    "estimated_duration_ms": 150000,
                    "estimated_remaining_ms": 91000,
                    "finished_at": 1,
                    "phase": "install",
                    "progress": 0.39,
                    "started_at": 1767268800000,
                    "status": "published",
                    "url": "url"
                  },
                  "description": "Let members book a mobile detailing appointment without leaving your whop.",
                  "discover_path": "/discover",
                  "domain_id": "whopappdomain0000001",
                  "domains": [
                    {
                      "domain": "from-template.whop.site",
                      "id": "dom_xxxxxxxxxxxxxx",
                      "status": "idle"
                    }
                  ],
                  "elements_used": [
                    "ads"
                  ],
                  "experience_path": "/experiences/[experienceId]",
                  "hosted_url": "https://shine-time-booking.whop.site",
                  "icon": {
                    "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                  },
                  "id": "app_xxxxxxxxxxxxxx",
                  "imported_from_url": "https://shinetime.example",
                  "is_app_store_listed": false,
                  "is_whop_app": false,
                  "marketplace_status": "not_available",
                  "name": "Shine Time Booking",
                  "oauth_client_type": "public",
                  "openapi_path": "/openapi.json",
                  "origin": "https://whopappdomain0000001.apps.whop.com",
                  "per_install_schedule": "*/15 * * * *",
                  "preview_token": "whop_preview_pass_example",
                  "product_category": "product_category",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "production_android_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_ios_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "production_web_build": {
                    "checksum": "xxxxxxxxxxxxxxxx",
                    "file_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "id": "apbu_xxxxxxxxxxxxxx",
                    "source_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "status": "draft"
                  },
                  "published_reviews_count": 0,
                  "redirect_uris": [
                    "https://booking.shinetime.example/oauth/callback"
                  ],
                  "requested_permissions": [
                    {
                      "is_required": true,
                      "justification": "Creates apps on behalf of the installing company.",
                      "permission_action": {
                        "action": "company:basic:read",
                        "name": "Read business information"
                      }
                    }
                  ],
                  "required_scopes": [
                    "read_user"
                  ],
                  "route": "shine-time-booking",
                  "schedule": "0 * * * *",
                  "secrets": {
                    "BOOKING_CALENDAR_ID": "cal_9f21"
                  },
                  "skills_path": "/skills",
                  "status": "live",
                  "verified": false
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = App(
            account: AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            ),
            apiKey: Nullable<AppApiKey>.value(AppApiKey(
                createdAt: "2026-01-01T12:00:00.000Z",
                token: "eyJhbGciOiJFUzI1NiJ9.xxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxx",
                id: "id"
            )),
            appStoreDescription: Nullable<String>.value("Shine Time Booking turns a whop into a booking calendar. Members pick a package, choose a slot that fits the day's route, and pay up front. A reminder goes out the night before and the receipt lands as soon as the job is signed off."),
            appType: AppAppType.b2BApp,
            averageReviewRating: 0,
            bannerImage: Nullable<AppBannerImage>.value(AppBannerImage(
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            baseUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            businessesCreatedCount: 5,
            businessesCreatedLogoUrls: [
                "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            ],
            businessesWithRecentSalesCount: 0,
            category: Nullable<AppCategory>.value(AppCategory(
                id: "mcat_xxxxxxxxxxxxxx",
                name: "Business & Productivity",
                route: "business-productivity"
            )),
            creator: AppCreator(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Marcus Webb"),
                username: "marcuswebb"
            ),
            dashboardPath: Nullable<String>.value("/dashboard/[companyId]"),
            defaultApiKey: Nullable<AppDefaultApiKey>.value(AppDefaultApiKey(
                id: "apik_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Default"),
                obfuscatedSecretKey: "apik_xxxx....xxxx",
                secretKey: Nullable<String>.value("apik_xxxxxxxxxxxxxx_C0000_C_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
            )),
            deployment: Nullable<AppDeployment>.value(AppDeployment(
                appId: "app_xxxxxxxxxxxxxx",
                buildId: Nullable<String>.value("build_id"),
                draft: false,
                error: Nullable<String>.value("error"),
                estimatedDurationMs: Nullable<Int>.value(150000),
                estimatedRemainingMs: Nullable<Int>.value(91000),
                finishedAt: Nullable<Int>.value(1),
                phase: Nullable<AppDeploymentPhase>.value(AppDeploymentPhase.install),
                progress: Nullable<Double>.value(0.39),
                startedAt: Nullable<Int>.value(1767268800000),
                status: AppDeploymentStatus.published,
                url: Nullable<String>.value("url")
            )),
            description: Nullable<String>.value("Let members book a mobile detailing appointment without leaving your whop."),
            discoverPath: Nullable<String>.value("/discover"),
            domainId: "whopappdomain0000001",
            domains: [
                AppDomain(
                    domain: "from-template.whop.site",
                    id: "dom_xxxxxxxxxxxxxx",
                    status: AppDomainStatus.idle
                )
            ],
            elementsUsed: [
                AppElementsUsedItem.ads
            ],
            experiencePath: Nullable<String>.value("/experiences/[experienceId]"),
            hostedUrl: Nullable<String>.value("https://shine-time-booking.whop.site"),
            icon: AppIcon(
                url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
            ),
            id: "app_xxxxxxxxxxxxxx",
            importedFromUrl: Nullable<String>.value("https://shinetime.example"),
            isAppStoreListed: false,
            isWhopApp: false,
            marketplaceStatus: Nullable<AppMarketplaceStatus>.value(AppMarketplaceStatus.notAvailable),
            name: "Shine Time Booking",
            oauthClientType: AppOauthClientType.public,
            openapiPath: Nullable<String>.value("/openapi.json"),
            origin: Nullable<String>.value("https://whopappdomain0000001.apps.whop.com"),
            perInstallSchedule: Nullable<String>.value("*/15 * * * *"),
            previewToken: Nullable<String>.value("whop_preview_pass_example"),
            productCategory: Nullable<String>.value("product_category"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            productionAndroidBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionIosBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            productionWebBuild: Nullable<AppProductionBuild>.value(AppProductionBuild(
                checksum: Nullable<String>.value("xxxxxxxxxxxxxxxx"),
                fileUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                id: "apbu_xxxxxxxxxxxxxx",
                sourceUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                status: AppProductionBuildStatus.draft
            )),
            publishedReviewsCount: 0,
            redirectUris: [
                "https://booking.shinetime.example/oauth/callback"
            ],
            requestedPermissions: [
                AppRequestedPermission(
                    isRequired: true,
                    justification: Nullable<String>.value("Creates apps on behalf of the installing company."),
                    permissionAction: AppRequestedPermissionAction(
                        action: "company:basic:read",
                        name: "Read business information"
                    )
                )
            ],
            requiredScopes: [
                AppRequiredScopesItem.readUser
            ],
            route: Nullable<String>.value("shine-time-booking"),
            schedule: Nullable<String>.value("0 * * * *"),
            secrets: Nullable<[String: JSONValue]>.value([
                "BOOKING_CALENDAR_ID": JSONValue.string("cal_9f21")
            ]),
            skillsPath: Nullable<String>.value("/skills"),
            status: AppStatus.live,
            verified: false
        )
        let response = try await client.apps.updatePermissions(
            id: "id",
            request: .init(requestedPermissions: [
                UpdatePermissionsAppsRequestRequestedPermissionsItem(
                    action: "company:basic:read",
                    isRequired: true,
                    justification: "Reads basic account info to render the dashboard home."
                )
            ]),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}