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
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "route": "biz_xxxxxxxxxxxxxx",
                        "title": "Shine Time Auto Detailing"
                      },
                      "average_review_rating": 0,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "default_variant": {
                        "billing_period": 30,
                        "billing_type": "renewal",
                        "expiration_days": null,
                        "id": "plan_xxxxxxxxxxxxxx",
                        "initial_price": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "renewal_price": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "title": null,
                        "trial_period_days": null,
                        "unlimited_stock": true,
                        "visibility": "visible"
                      },
                      "description": "empower rich infrastructures",
                      "experiences": [
                        {
                          "app": {
                            "icon": {
                              "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                            },
                            "id": "app_xxxxxxxxxxxxxx",
                            "name": "Chat"
                          },
                          "id": "exp_xxxxxxxxxxxxxx",
                          "logo_url": null,
                          "name": "Name1"
                        }
                      ],
                      "external_identifier": "SHINE-CERAMIC-01",
                      "gallery_images": [
                        {
                          "content_type": "image/png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      ],
                      "headline": "thought leadership",
                      "id": "prod_xxxxxxxxxxxxxx",
                      "labels": [
                        "courses"
                      ],
                      "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "member_count": 0,
                      "metadata": {
                        "key": "value"
                      },
                      "published_reviews_count": 0,
                      "route": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "title": "Wash Club Tee",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "variant_attributes": {
                        "color": [
                          "Blue",
                          "Red"
                        ],
                        "size": [
                          "L",
                          "S"
                        ]
                      },
                      "verified": false,
                      "visibility": "visible"
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
        let expectedResponse = ListProductsResponse(
            data: [
                ProductListItem(
                    account: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                        "route": JSONValue.string("biz_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Shine Time Auto Detailing")
                    ]),
                    averageReviewRating: 0,
                    createdAt: "2026-01-01T12:00:00.000Z",
                    defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                        billingPeriod: Nullable<Double>.value(30),
                        billingType: ProductPublicVariantBillingType.renewal,
                        expirationDays: .null,
                        id: "plan_xxxxxxxxxxxxxx",
                        initialPrice: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        renewalPrice: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        title: .null,
                        trialPeriodDays: .null,
                        unlimitedStock: true,
                        visibility: ProductPublicVariantVisibility.visible
                    )),
                    description: Nullable<String>.value("empower rich infrastructures"),
                    experiences: [
                        ProductExperience(
                            app: ProductExperienceApp(
                                icon: AppIcon(
                                    url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                                ),
                                id: "app_xxxxxxxxxxxxxx",
                                name: "Chat"
                            ),
                            id: "exp_xxxxxxxxxxxxxx",
                            logoUrl: .null,
                            name: "Name1"
                        )
                    ],
                    externalIdentifier: Nullable<String>.value("SHINE-CERAMIC-01"),
                    galleryImages: [
                        ProductGalleryImage(
                            contentType: Nullable<String>.value("image/png"),
                            id: "file_xxxxxxxxxxxxxx",
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )
                    ],
                    headline: Nullable<String>.value("thought leadership"),
                    id: "prod_xxxxxxxxxxxxxx",
                    labels: [
                        "courses"
                    ],
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    memberCount: 0,
                    metadata: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    publishedReviewsCount: 0,
                    route: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    title: "Wash Club Tee",
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    variantAttributes: Nullable<[String: JSONValue]>.value([
                        "color": JSONValue.array([
                            JSONValue.string("Blue"),
                            JSONValue.string("Red")
                        ]), 
                        "size": JSONValue.array([
                            JSONValue.string("L"),
                            JSONValue.string("S")
                        ])
                    ]),
                    verified: false,
                    visibility: Nullable<String>.value("visible")
                )
            ],
            pageInfo: ListProductsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.products.list(
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

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account": {
                        "account": {
                          "key": "value"
                        }
                      },
                      "average_review_rating": 1.1,
                      "created_at": "created_at",
                      "default_variant": {
                        "billing_period": 1.1,
                        "billing_type": "renewal",
                        "expiration_days": 1.1,
                        "id": "id",
                        "initial_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "renewal_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "title": "title",
                        "trial_period_days": 1.1,
                        "unlimited_stock": true,
                        "visibility": "visible"
                      },
                      "description": "description",
                      "experiences": [
                        {
                          "app": {
                            "icon": {
                              "url": "url"
                            },
                            "id": "id",
                            "name": "name"
                          },
                          "id": "id",
                          "logo_url": "logo_url",
                          "name": "name"
                        },
                        {
                          "app": {
                            "icon": {
                              "url": "url"
                            },
                            "id": "id",
                            "name": "name"
                          },
                          "id": "id",
                          "logo_url": "logo_url",
                          "name": "name"
                        }
                      ],
                      "external_identifier": "external_identifier",
                      "gallery_images": [
                        {
                          "content_type": "content_type",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "content_type": "content_type",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "headline": "headline",
                      "id": "id",
                      "labels": [
                        "labels",
                        "labels"
                      ],
                      "logo_url": "logo_url",
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "published_reviews_count": 1.1,
                      "route": "route",
                      "title": "title",
                      "updated_at": "updated_at",
                      "variant_attributes": {
                        "variant_attributes": {
                          "key": "value"
                        }
                      },
                      "verified": true,
                      "visibility": "visibility"
                    },
                    {
                      "account": {
                        "account": {
                          "key": "value"
                        }
                      },
                      "average_review_rating": 1.1,
                      "created_at": "created_at",
                      "default_variant": {
                        "billing_period": 1.1,
                        "billing_type": "renewal",
                        "expiration_days": 1.1,
                        "id": "id",
                        "initial_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "renewal_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "title": "title",
                        "trial_period_days": 1.1,
                        "unlimited_stock": true,
                        "visibility": "visible"
                      },
                      "description": "description",
                      "experiences": [
                        {
                          "app": {
                            "icon": {
                              "url": "url"
                            },
                            "id": "id",
                            "name": "name"
                          },
                          "id": "id",
                          "logo_url": "logo_url",
                          "name": "name"
                        },
                        {
                          "app": {
                            "icon": {
                              "url": "url"
                            },
                            "id": "id",
                            "name": "name"
                          },
                          "id": "id",
                          "logo_url": "logo_url",
                          "name": "name"
                        }
                      ],
                      "external_identifier": "external_identifier",
                      "gallery_images": [
                        {
                          "content_type": "content_type",
                          "id": "id",
                          "url": "url"
                        },
                        {
                          "content_type": "content_type",
                          "id": "id",
                          "url": "url"
                        }
                      ],
                      "headline": "headline",
                      "id": "id",
                      "labels": [
                        "labels",
                        "labels"
                      ],
                      "logo_url": "logo_url",
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "published_reviews_count": 1.1,
                      "route": "route",
                      "title": "title",
                      "updated_at": "updated_at",
                      "variant_attributes": {
                        "variant_attributes": {
                          "key": "value"
                        }
                      },
                      "verified": true,
                      "visibility": "visibility"
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
        let expectedResponse = ListProductsResponse(
            data: [
                ProductListItem(
                    account: Nullable<[String: JSONValue]>.value([
                        "account": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    averageReviewRating: 1.1,
                    createdAt: "created_at",
                    defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                        billingPeriod: Nullable<Double>.value(1.1),
                        billingType: ProductPublicVariantBillingType.renewal,
                        expirationDays: Nullable<Double>.value(1.1),
                        id: "id",
                        initialPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        renewalPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        title: Nullable<String>.value("title"),
                        trialPeriodDays: Nullable<Double>.value(1.1),
                        unlimitedStock: true,
                        visibility: ProductPublicVariantVisibility.visible
                    )),
                    description: Nullable<String>.value("description"),
                    experiences: [
                        ProductExperience(
                            app: ProductExperienceApp(
                                icon: AppIcon(
                                    url: "url"
                                ),
                                id: "id",
                                name: "name"
                            ),
                            id: "id",
                            logoUrl: Nullable<String>.value("logo_url"),
                            name: "name"
                        ),
                        ProductExperience(
                            app: ProductExperienceApp(
                                icon: AppIcon(
                                    url: "url"
                                ),
                                id: "id",
                                name: "name"
                            ),
                            id: "id",
                            logoUrl: Nullable<String>.value("logo_url"),
                            name: "name"
                        )
                    ],
                    externalIdentifier: Nullable<String>.value("external_identifier"),
                    galleryImages: [
                        ProductGalleryImage(
                            contentType: Nullable<String>.value("content_type"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ProductGalleryImage(
                            contentType: Nullable<String>.value("content_type"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    headline: Nullable<String>.value("headline"),
                    id: "id",
                    labels: [
                        "labels",
                        "labels"
                    ],
                    logoUrl: Nullable<String>.value("logo_url"),
                    memberCount: 1.1,
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    publishedReviewsCount: 1.1,
                    route: "route",
                    title: "title",
                    updatedAt: "updated_at",
                    variantAttributes: Nullable<[String: JSONValue]>.value([
                        "variant_attributes": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    verified: true,
                    visibility: Nullable<String>.value("visibility")
                ),
                ProductListItem(
                    account: Nullable<[String: JSONValue]>.value([
                        "account": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    averageReviewRating: 1.1,
                    createdAt: "created_at",
                    defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                        billingPeriod: Nullable<Double>.value(1.1),
                        billingType: ProductPublicVariantBillingType.renewal,
                        expirationDays: Nullable<Double>.value(1.1),
                        id: "id",
                        initialPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        renewalPrice: Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ),
                        title: Nullable<String>.value("title"),
                        trialPeriodDays: Nullable<Double>.value(1.1),
                        unlimitedStock: true,
                        visibility: ProductPublicVariantVisibility.visible
                    )),
                    description: Nullable<String>.value("description"),
                    experiences: [
                        ProductExperience(
                            app: ProductExperienceApp(
                                icon: AppIcon(
                                    url: "url"
                                ),
                                id: "id",
                                name: "name"
                            ),
                            id: "id",
                            logoUrl: Nullable<String>.value("logo_url"),
                            name: "name"
                        ),
                        ProductExperience(
                            app: ProductExperienceApp(
                                icon: AppIcon(
                                    url: "url"
                                ),
                                id: "id",
                                name: "name"
                            ),
                            id: "id",
                            logoUrl: Nullable<String>.value("logo_url"),
                            name: "name"
                        )
                    ],
                    externalIdentifier: Nullable<String>.value("external_identifier"),
                    galleryImages: [
                        ProductGalleryImage(
                            contentType: Nullable<String>.value("content_type"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        ),
                        ProductGalleryImage(
                            contentType: Nullable<String>.value("content_type"),
                            id: "id",
                            url: Nullable<String>.value("url")
                        )
                    ],
                    headline: Nullable<String>.value("headline"),
                    id: "id",
                    labels: [
                        "labels",
                        "labels"
                    ],
                    logoUrl: Nullable<String>.value("logo_url"),
                    memberCount: 1.1,
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    publishedReviewsCount: 1.1,
                    route: "route",
                    title: "title",
                    updatedAt: "updated_at",
                    variantAttributes: Nullable<[String: JSONValue]>.value([
                        "variant_attributes": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    verified: true,
                    visibility: Nullable<String>.value("visibility")
                )
            ],
            pageInfo: ListProductsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.products.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                  "average_review_rating": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "default_variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        },
                        "id": "app_xxxxxxxxxxxxxx",
                        "name": "Chat"
                      },
                      "id": "exp_xxxxxxxxxxxxxx",
                      "logo_url": "logo_url",
                      "name": "Name1"
                    }
                  ],
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
                  "logo_url": "logo_url",
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
                  "variant_attributes": {
                    "color": [
                      "Red",
                      "Blue"
                    ],
                    "size": [
                      "M",
                      "S"
                    ]
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": false,
                      "attributes": {
                        "color": "Blue",
                        "size": "S"
                      },
                      "billing_period": 30,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 3,
                      "cancel_discount_percentage": 20,
                      "checkout_styling": {
                        "background_color": "#0f172a",
                        "border_style": "rounded",
                        "button_color": "#f59e0b",
                        "font_family": "roboto"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "field_xxxxxxxxxxxxxx",
                          "name": "Link your website or main social profile",
                          "order": 1,
                          "placeholder": "https://",
                          "required": false
                        }
                      ],
                      "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                      "expiration_days": 365,
                      "formatted_price": "$59.00 / month",
                      "id": "plan_xxxxxxxxxxxxxx",
                      "image": {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "initial_price": 0,
                      "initial_price_due": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                      "invoice": {
                        "key": "value"
                      },
                      "member_count": 0,
                      "metadata": {
                        "custom_cta": "subscribe",
                        "custom_cta_url": "https://shinetime.example/wash-club"
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                      "release_method": "buy_now",
                      "renewal_price": 59,
                      "sku": "CERAMIC-COATING-S-BLUE",
                      "split_pay_required_payments": 4,
                      "stock": 0,
                      "strike_through_initial_price": 99,
                      "strike_through_renewal_price": 79,
                      "three_ds_level": "mandate_challenge",
                      "title": "Unlimited Wash Club",
                      "trial_period_days": 7,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visibility": "visible"
                    }
                  ],
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
            averageReviewRating: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        ),
                        id: "app_xxxxxxxxxxxxxx",
                        name: "Chat"
                    ),
                    id: "exp_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "Name1"
                )
            ],
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
            logoUrl: Nullable<String>.value("logo_url"),
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
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "color": JSONValue.array([
                    JSONValue.string("Red"),
                    JSONValue.string("Blue")
                ]), 
                "size": JSONValue.array([
                    JSONValue.string("M"),
                    JSONValue.string("S")
                ])
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: false,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "color": Nullable<String>.value("Blue"), 
                        "size": Nullable<String>.value("S")
                    ]),
                    billingPeriod: Nullable<Double>.value(30),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(3),
                    cancelDiscountPercentage: Nullable<Double>.value(20),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "background_color": JSONValue.string("#0f172a"), 
                        "border_style": JSONValue.string("rounded"), 
                        "button_color": JSONValue.string("#f59e0b"), 
                        "font_family": JSONValue.string("roboto")
                    ]),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "field_xxxxxxxxxxxxxx",
                            name: "Link your website or main social profile",
                            order: 1,
                            placeholder: Nullable<String>.value("https://"),
                            required: false
                        )
                    ],
                    description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
                    expirationDays: Nullable<Double>.value(365),
                    formattedPrice: "$59.00 / month",
                    id: "plan_xxxxxxxxxxxxxx",
                    image: Nullable<[String: JSONValue]>.value([
                        "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                        "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                    ]),
                    initialPrice: 0,
                    initialPriceDue: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    memberCount: Nullable<Double>.value(0),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "custom_cta": JSONValue.string("subscribe"), 
                        "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "disabled": JSONValue.array([
                            JSONValue.string("crypto")
                        ]), 
                        "enabled": JSONValue.array([
                            JSONValue.string("card")
                        ]), 
                        "include_platform_defaults": JSONValue.bool(true)
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Ceramic Coating Package")
                    ]),
                    purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 59,
                    sku: Nullable<String>.value("CERAMIC-COATING-S-BLUE"),
                    splitPayRequiredPayments: Nullable<Double>.value(4),
                    stock: Nullable<Double>.value(0),
                    strikeThroughInitialPrice: Nullable<Double>.value(99),
                    strikeThroughRenewalPrice: Nullable<Double>.value(79),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("Unlimited Wash Club"),
                    trialPeriodDays: Nullable<Double>.value(7),
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.create(
            request: .init(title: "Interior Deep Clean"),
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
                  "account": {
                    "account": {
                      "key": "value"
                    }
                  },
                  "average_review_rating": 1.1,
                  "created_at": "created_at",
                  "custom_cta": "get_access",
                  "custom_cta_url": "custom_cta_url",
                  "custom_statement_descriptor": "custom_statement_descriptor",
                  "default_variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "description",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    },
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    }
                  ],
                  "external_identifier": "external_identifier",
                  "gallery_images": [
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "global_affiliate_percentage": 1.1,
                  "global_affiliate_status": "enabled",
                  "headline": "headline",
                  "id": "id",
                  "labels": [
                    "labels",
                    "labels"
                  ],
                  "logo_url": "logo_url",
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 1.1,
                  "member_affiliate_status": "enabled",
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "owner_user": {
                    "owner_user": {
                      "key": "value"
                    }
                  },
                  "product_tax_code": {
                    "product_tax_code": {
                      "key": "value"
                    }
                  },
                  "published_reviews_count": 1.1,
                  "route": "route",
                  "title": "title",
                  "updated_at": "updated_at",
                  "variant_attributes": {
                    "variant_attributes": {
                      "key": "value"
                    }
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    }
                  ],
                  "verified": true,
                  "visibility": "visibility"
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
                "account": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            averageReviewRating: 1.1,
            createdAt: "created_at",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("custom_cta_url"),
            customStatementDescriptor: Nullable<String>.value("custom_statement_descriptor"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("description"),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                ),
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                )
            ],
            externalIdentifier: Nullable<String>.value("external_identifier"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(1.1),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("headline"),
            id: "id",
            labels: [
                "labels",
                "labels"
            ],
            logoUrl: Nullable<String>.value("logo_url"),
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(1.1),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 1.1,
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "owner_user": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "product_tax_code": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            publishedReviewsCount: 1.1,
            route: "route",
            title: "title",
            updatedAt: "updated_at",
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "variant_attributes": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                ),
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: true,
            visibility: Nullable<String>.value("visibility")
        )
        let response = try await client.products.create(
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "average_review_rating": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "default_variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        },
                        "id": "app_xxxxxxxxxxxxxx",
                        "name": "Chat"
                      },
                      "id": "exp_xxxxxxxxxxxxxx",
                      "logo_url": "logo_url",
                      "name": "Name1"
                    }
                  ],
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
                  "logo_url": "logo_url",
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
                  "variant_attributes": {
                    "color": [
                      "Red",
                      "Blue"
                    ],
                    "size": [
                      "M",
                      "S"
                    ]
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": false,
                      "attributes": {
                        "color": "Blue",
                        "size": "S"
                      },
                      "billing_period": 30,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 3,
                      "cancel_discount_percentage": 20,
                      "checkout_styling": {
                        "background_color": "#0f172a",
                        "border_style": "rounded",
                        "button_color": "#f59e0b",
                        "font_family": "roboto"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "field_xxxxxxxxxxxxxx",
                          "name": "Link your website or main social profile",
                          "order": 1,
                          "placeholder": "https://",
                          "required": false
                        }
                      ],
                      "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                      "expiration_days": 365,
                      "formatted_price": "$59.00 / month",
                      "id": "plan_xxxxxxxxxxxxxx",
                      "image": {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "initial_price": 0,
                      "initial_price_due": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                      "invoice": {
                        "key": "value"
                      },
                      "member_count": 0,
                      "metadata": {
                        "custom_cta": "subscribe",
                        "custom_cta_url": "https://shinetime.example/wash-club"
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                      "release_method": "buy_now",
                      "renewal_price": 59,
                      "sku": "CERAMIC-COATING-S-BLUE",
                      "split_pay_required_payments": 4,
                      "stock": 0,
                      "strike_through_initial_price": 99,
                      "strike_through_renewal_price": 79,
                      "three_ds_level": "mandate_challenge",
                      "title": "Unlimited Wash Club",
                      "trial_period_days": 7,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visibility": "visible"
                    }
                  ],
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
            averageReviewRating: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        ),
                        id: "app_xxxxxxxxxxxxxx",
                        name: "Chat"
                    ),
                    id: "exp_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "Name1"
                )
            ],
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
            logoUrl: Nullable<String>.value("logo_url"),
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
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "color": JSONValue.array([
                    JSONValue.string("Red"),
                    JSONValue.string("Blue")
                ]), 
                "size": JSONValue.array([
                    JSONValue.string("M"),
                    JSONValue.string("S")
                ])
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: false,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "color": Nullable<String>.value("Blue"), 
                        "size": Nullable<String>.value("S")
                    ]),
                    billingPeriod: Nullable<Double>.value(30),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(3),
                    cancelDiscountPercentage: Nullable<Double>.value(20),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "background_color": JSONValue.string("#0f172a"), 
                        "border_style": JSONValue.string("rounded"), 
                        "button_color": JSONValue.string("#f59e0b"), 
                        "font_family": JSONValue.string("roboto")
                    ]),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "field_xxxxxxxxxxxxxx",
                            name: "Link your website or main social profile",
                            order: 1,
                            placeholder: Nullable<String>.value("https://"),
                            required: false
                        )
                    ],
                    description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
                    expirationDays: Nullable<Double>.value(365),
                    formattedPrice: "$59.00 / month",
                    id: "plan_xxxxxxxxxxxxxx",
                    image: Nullable<[String: JSONValue]>.value([
                        "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                        "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                    ]),
                    initialPrice: 0,
                    initialPriceDue: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    memberCount: Nullable<Double>.value(0),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "custom_cta": JSONValue.string("subscribe"), 
                        "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "disabled": JSONValue.array([
                            JSONValue.string("crypto")
                        ]), 
                        "enabled": JSONValue.array([
                            JSONValue.string("card")
                        ]), 
                        "include_platform_defaults": JSONValue.bool(true)
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Ceramic Coating Package")
                    ]),
                    purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 59,
                    sku: Nullable<String>.value("CERAMIC-COATING-S-BLUE"),
                    splitPayRequiredPayments: Nullable<Double>.value(4),
                    stock: Nullable<Double>.value(0),
                    strikeThroughInitialPrice: Nullable<Double>.value(99),
                    strikeThroughRenewalPrice: Nullable<Double>.value(79),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("Unlimited Wash Club"),
                    trialPeriodDays: Nullable<Double>.value(7),
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.retrieve(
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
                  "account": {
                    "account": {
                      "key": "value"
                    }
                  },
                  "average_review_rating": 1.1,
                  "created_at": "created_at",
                  "custom_cta": "get_access",
                  "custom_cta_url": "custom_cta_url",
                  "custom_statement_descriptor": "custom_statement_descriptor",
                  "default_variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "description",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    },
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    }
                  ],
                  "external_identifier": "external_identifier",
                  "gallery_images": [
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "global_affiliate_percentage": 1.1,
                  "global_affiliate_status": "enabled",
                  "headline": "headline",
                  "id": "id",
                  "labels": [
                    "labels",
                    "labels"
                  ],
                  "logo_url": "logo_url",
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 1.1,
                  "member_affiliate_status": "enabled",
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "owner_user": {
                    "owner_user": {
                      "key": "value"
                    }
                  },
                  "product_tax_code": {
                    "product_tax_code": {
                      "key": "value"
                    }
                  },
                  "published_reviews_count": 1.1,
                  "route": "route",
                  "title": "title",
                  "updated_at": "updated_at",
                  "variant_attributes": {
                    "variant_attributes": {
                      "key": "value"
                    }
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    }
                  ],
                  "verified": true,
                  "visibility": "visibility"
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
                "account": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            averageReviewRating: 1.1,
            createdAt: "created_at",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("custom_cta_url"),
            customStatementDescriptor: Nullable<String>.value("custom_statement_descriptor"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("description"),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                ),
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                )
            ],
            externalIdentifier: Nullable<String>.value("external_identifier"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(1.1),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("headline"),
            id: "id",
            labels: [
                "labels",
                "labels"
            ],
            logoUrl: Nullable<String>.value("logo_url"),
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(1.1),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 1.1,
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "owner_user": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "product_tax_code": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            publishedReviewsCount: 1.1,
            route: "route",
            title: "title",
            updatedAt: "updated_at",
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "variant_attributes": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                ),
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: true,
            visibility: Nullable<String>.value("visibility")
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
        let expectedResponse = DeleteProductsResponse(
            deleted: true,
            id: "id"
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
                  "average_review_rating": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "default_variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        },
                        "id": "app_xxxxxxxxxxxxxx",
                        "name": "Chat"
                      },
                      "id": "exp_xxxxxxxxxxxxxx",
                      "logo_url": "logo_url",
                      "name": "Name1"
                    }
                  ],
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
                  "logo_url": "logo_url",
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
                  "variant_attributes": {
                    "color": [
                      "Red",
                      "Blue"
                    ],
                    "size": [
                      "M",
                      "S"
                    ]
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": false,
                      "attributes": {
                        "color": "Blue",
                        "size": "S"
                      },
                      "billing_period": 30,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 3,
                      "cancel_discount_percentage": 20,
                      "checkout_styling": {
                        "background_color": "#0f172a",
                        "border_style": "rounded",
                        "button_color": "#f59e0b",
                        "font_family": "roboto"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "field_xxxxxxxxxxxxxx",
                          "name": "Link your website or main social profile",
                          "order": 1,
                          "placeholder": "https://",
                          "required": false
                        }
                      ],
                      "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                      "expiration_days": 365,
                      "formatted_price": "$59.00 / month",
                      "id": "plan_xxxxxxxxxxxxxx",
                      "image": {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "initial_price": 0,
                      "initial_price_due": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                      "invoice": {
                        "key": "value"
                      },
                      "member_count": 0,
                      "metadata": {
                        "custom_cta": "subscribe",
                        "custom_cta_url": "https://shinetime.example/wash-club"
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                      "release_method": "buy_now",
                      "renewal_price": 59,
                      "sku": "CERAMIC-COATING-S-BLUE",
                      "split_pay_required_payments": 4,
                      "stock": 0,
                      "strike_through_initial_price": 99,
                      "strike_through_renewal_price": 79,
                      "three_ds_level": "mandate_challenge",
                      "title": "Unlimited Wash Club",
                      "trial_period_days": 7,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visibility": "visible"
                    }
                  ],
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
            averageReviewRating: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        ),
                        id: "app_xxxxxxxxxxxxxx",
                        name: "Chat"
                    ),
                    id: "exp_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "Name1"
                )
            ],
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
            logoUrl: Nullable<String>.value("logo_url"),
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
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "color": JSONValue.array([
                    JSONValue.string("Red"),
                    JSONValue.string("Blue")
                ]), 
                "size": JSONValue.array([
                    JSONValue.string("M"),
                    JSONValue.string("S")
                ])
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: false,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "color": Nullable<String>.value("Blue"), 
                        "size": Nullable<String>.value("S")
                    ]),
                    billingPeriod: Nullable<Double>.value(30),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(3),
                    cancelDiscountPercentage: Nullable<Double>.value(20),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "background_color": JSONValue.string("#0f172a"), 
                        "border_style": JSONValue.string("rounded"), 
                        "button_color": JSONValue.string("#f59e0b"), 
                        "font_family": JSONValue.string("roboto")
                    ]),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "field_xxxxxxxxxxxxxx",
                            name: "Link your website or main social profile",
                            order: 1,
                            placeholder: Nullable<String>.value("https://"),
                            required: false
                        )
                    ],
                    description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
                    expirationDays: Nullable<Double>.value(365),
                    formattedPrice: "$59.00 / month",
                    id: "plan_xxxxxxxxxxxxxx",
                    image: Nullable<[String: JSONValue]>.value([
                        "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                        "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                    ]),
                    initialPrice: 0,
                    initialPriceDue: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    memberCount: Nullable<Double>.value(0),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "custom_cta": JSONValue.string("subscribe"), 
                        "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "disabled": JSONValue.array([
                            JSONValue.string("crypto")
                        ]), 
                        "enabled": JSONValue.array([
                            JSONValue.string("card")
                        ]), 
                        "include_platform_defaults": JSONValue.bool(true)
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Ceramic Coating Package")
                    ]),
                    purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 59,
                    sku: Nullable<String>.value("CERAMIC-COATING-S-BLUE"),
                    splitPayRequiredPayments: Nullable<Double>.value(4),
                    stock: Nullable<Double>.value(0),
                    strikeThroughInitialPrice: Nullable<Double>.value(99),
                    strikeThroughRenewalPrice: Nullable<Double>.value(79),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("Unlimited Wash Club"),
                    trialPeriodDays: Nullable<Double>.value(7),
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
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

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "account": {
                      "key": "value"
                    }
                  },
                  "average_review_rating": 1.1,
                  "created_at": "created_at",
                  "custom_cta": "get_access",
                  "custom_cta_url": "custom_cta_url",
                  "custom_statement_descriptor": "custom_statement_descriptor",
                  "default_variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "description",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    },
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    }
                  ],
                  "external_identifier": "external_identifier",
                  "gallery_images": [
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "global_affiliate_percentage": 1.1,
                  "global_affiliate_status": "enabled",
                  "headline": "headline",
                  "id": "id",
                  "labels": [
                    "labels",
                    "labels"
                  ],
                  "logo_url": "logo_url",
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 1.1,
                  "member_affiliate_status": "enabled",
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "owner_user": {
                    "owner_user": {
                      "key": "value"
                    }
                  },
                  "product_tax_code": {
                    "product_tax_code": {
                      "key": "value"
                    }
                  },
                  "published_reviews_count": 1.1,
                  "route": "route",
                  "title": "title",
                  "updated_at": "updated_at",
                  "variant_attributes": {
                    "variant_attributes": {
                      "key": "value"
                    }
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    }
                  ],
                  "verified": true,
                  "visibility": "visibility"
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
                "account": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            averageReviewRating: 1.1,
            createdAt: "created_at",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("custom_cta_url"),
            customStatementDescriptor: Nullable<String>.value("custom_statement_descriptor"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("description"),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                ),
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                )
            ],
            externalIdentifier: Nullable<String>.value("external_identifier"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(1.1),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("headline"),
            id: "id",
            labels: [
                "labels",
                "labels"
            ],
            logoUrl: Nullable<String>.value("logo_url"),
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(1.1),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 1.1,
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "owner_user": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "product_tax_code": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            publishedReviewsCount: 1.1,
            route: "route",
            title: "title",
            updatedAt: "updated_at",
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "variant_attributes": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                ),
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: true,
            visibility: Nullable<String>.value("visibility")
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
                  "average_review_rating": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "default_variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        },
                        "id": "app_xxxxxxxxxxxxxx",
                        "name": "Chat"
                      },
                      "id": "exp_xxxxxxxxxxxxxx",
                      "logo_url": "logo_url",
                      "name": "Name1"
                    }
                  ],
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
                  "logo_url": "logo_url",
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
                  "variant_attributes": {
                    "color": [
                      "Red",
                      "Blue"
                    ],
                    "size": [
                      "M",
                      "S"
                    ]
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": false,
                      "attributes": {
                        "color": "Blue",
                        "size": "S"
                      },
                      "billing_period": 30,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 3,
                      "cancel_discount_percentage": 20,
                      "checkout_styling": {
                        "background_color": "#0f172a",
                        "border_style": "rounded",
                        "button_color": "#f59e0b",
                        "font_family": "roboto"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "field_xxxxxxxxxxxxxx",
                          "name": "Link your website or main social profile",
                          "order": 1,
                          "placeholder": "https://",
                          "required": false
                        }
                      ],
                      "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                      "expiration_days": 365,
                      "formatted_price": "$59.00 / month",
                      "id": "plan_xxxxxxxxxxxxxx",
                      "image": {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "initial_price": 0,
                      "initial_price_due": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                      "invoice": {
                        "key": "value"
                      },
                      "member_count": 0,
                      "metadata": {
                        "custom_cta": "subscribe",
                        "custom_cta_url": "https://shinetime.example/wash-club"
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                      "release_method": "buy_now",
                      "renewal_price": 59,
                      "sku": "CERAMIC-COATING-S-BLUE",
                      "split_pay_required_payments": 4,
                      "stock": 0,
                      "strike_through_initial_price": 99,
                      "strike_through_renewal_price": 79,
                      "three_ds_level": "mandate_challenge",
                      "title": "Unlimited Wash Club",
                      "trial_period_days": 7,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visibility": "visible"
                    }
                  ],
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
            averageReviewRating: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        ),
                        id: "app_xxxxxxxxxxxxxx",
                        name: "Chat"
                    ),
                    id: "exp_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "Name1"
                )
            ],
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
            logoUrl: Nullable<String>.value("logo_url"),
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
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "color": JSONValue.array([
                    JSONValue.string("Red"),
                    JSONValue.string("Blue")
                ]), 
                "size": JSONValue.array([
                    JSONValue.string("M"),
                    JSONValue.string("S")
                ])
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: false,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "color": Nullable<String>.value("Blue"), 
                        "size": Nullable<String>.value("S")
                    ]),
                    billingPeriod: Nullable<Double>.value(30),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(3),
                    cancelDiscountPercentage: Nullable<Double>.value(20),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "background_color": JSONValue.string("#0f172a"), 
                        "border_style": JSONValue.string("rounded"), 
                        "button_color": JSONValue.string("#f59e0b"), 
                        "font_family": JSONValue.string("roboto")
                    ]),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "field_xxxxxxxxxxxxxx",
                            name: "Link your website or main social profile",
                            order: 1,
                            placeholder: Nullable<String>.value("https://"),
                            required: false
                        )
                    ],
                    description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
                    expirationDays: Nullable<Double>.value(365),
                    formattedPrice: "$59.00 / month",
                    id: "plan_xxxxxxxxxxxxxx",
                    image: Nullable<[String: JSONValue]>.value([
                        "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                        "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                    ]),
                    initialPrice: 0,
                    initialPriceDue: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    memberCount: Nullable<Double>.value(0),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "custom_cta": JSONValue.string("subscribe"), 
                        "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "disabled": JSONValue.array([
                            JSONValue.string("crypto")
                        ]), 
                        "enabled": JSONValue.array([
                            JSONValue.string("card")
                        ]), 
                        "include_platform_defaults": JSONValue.bool(true)
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Ceramic Coating Package")
                    ]),
                    purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 59,
                    sku: Nullable<String>.value("CERAMIC-COATING-S-BLUE"),
                    splitPayRequiredPayments: Nullable<Double>.value(4),
                    stock: Nullable<Double>.value(0),
                    strikeThroughInitialPrice: Nullable<Double>.value(99),
                    strikeThroughRenewalPrice: Nullable<Double>.value(79),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("Unlimited Wash Club"),
                    trialPeriodDays: Nullable<Double>.value(7),
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.publish(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func publish2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "account": {
                      "key": "value"
                    }
                  },
                  "average_review_rating": 1.1,
                  "created_at": "created_at",
                  "custom_cta": "get_access",
                  "custom_cta_url": "custom_cta_url",
                  "custom_statement_descriptor": "custom_statement_descriptor",
                  "default_variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "description",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    },
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    }
                  ],
                  "external_identifier": "external_identifier",
                  "gallery_images": [
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "global_affiliate_percentage": 1.1,
                  "global_affiliate_status": "enabled",
                  "headline": "headline",
                  "id": "id",
                  "labels": [
                    "labels",
                    "labels"
                  ],
                  "logo_url": "logo_url",
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 1.1,
                  "member_affiliate_status": "enabled",
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "owner_user": {
                    "owner_user": {
                      "key": "value"
                    }
                  },
                  "product_tax_code": {
                    "product_tax_code": {
                      "key": "value"
                    }
                  },
                  "published_reviews_count": 1.1,
                  "route": "route",
                  "title": "title",
                  "updated_at": "updated_at",
                  "variant_attributes": {
                    "variant_attributes": {
                      "key": "value"
                    }
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    }
                  ],
                  "verified": true,
                  "visibility": "visibility"
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
                "account": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            averageReviewRating: 1.1,
            createdAt: "created_at",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("custom_cta_url"),
            customStatementDescriptor: Nullable<String>.value("custom_statement_descriptor"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("description"),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                ),
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                )
            ],
            externalIdentifier: Nullable<String>.value("external_identifier"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(1.1),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("headline"),
            id: "id",
            labels: [
                "labels",
                "labels"
            ],
            logoUrl: Nullable<String>.value("logo_url"),
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(1.1),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 1.1,
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "owner_user": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "product_tax_code": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            publishedReviewsCount: 1.1,
            route: "route",
            title: "title",
            updatedAt: "updated_at",
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "variant_attributes": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                ),
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: true,
            visibility: Nullable<String>.value("visibility")
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
                  "average_review_rating": 0,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "custom_cta": "get_access",
                  "custom_cta_url": "https://shinetime.example/book",
                  "custom_statement_descriptor": "WHOP*SHINETIME",
                  "default_variant": {
                    "billing_period": 30,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "plan_xxxxxxxxxxxxxx",
                    "initial_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "Full interior extraction, leather conditioning, and an ozone odor treatment.",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        },
                        "id": "app_xxxxxxxxxxxxxx",
                        "name": "Chat"
                      },
                      "id": "exp_xxxxxxxxxxxxxx",
                      "logo_url": "logo_url",
                      "name": "Name1"
                    }
                  ],
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
                  "logo_url": "logo_url",
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
                  "variant_attributes": {
                    "color": [
                      "Red",
                      "Blue"
                    ],
                    "size": [
                      "M",
                      "S"
                    ]
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": false,
                      "attributes": {
                        "color": "Blue",
                        "size": "S"
                      },
                      "billing_period": 30,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 3,
                      "cancel_discount_percentage": 20,
                      "checkout_styling": {
                        "background_color": "#0f172a",
                        "border_style": "rounded",
                        "button_color": "#f59e0b",
                        "font_family": "roboto"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "field_xxxxxxxxxxxxxx",
                          "name": "Link your website or main social profile",
                          "order": 1,
                          "placeholder": "https://",
                          "required": false
                        }
                      ],
                      "description": "Two hand washes a month, interior vacuum, and a quarterly sealant top-up.",
                      "expiration_days": 365,
                      "formatted_price": "$59.00 / month",
                      "id": "plan_xxxxxxxxxxxxxx",
                      "image": {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "initial_price": 0,
                      "initial_price_due": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "internal_notes": "Maintenance tier. Upsell the interior shampoo add-on at renewal.",
                      "invoice": {
                        "key": "value"
                      },
                      "member_count": 0,
                      "metadata": {
                        "custom_cta": "subscribe",
                        "custom_cta_url": "https://shinetime.example/wash-club"
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "disabled": [
                          "crypto"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "product": {
                        "id": "prod_xxxxxxxxxxxxxx",
                        "title": "Ceramic Coating Package"
                      },
                      "purchase_url": "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                      "release_method": "buy_now",
                      "renewal_price": 59,
                      "sku": "CERAMIC-COATING-S-BLUE",
                      "split_pay_required_payments": 4,
                      "stock": 0,
                      "strike_through_initial_price": 99,
                      "strike_through_renewal_price": 79,
                      "three_ds_level": "mandate_challenge",
                      "title": "Unlimited Wash Club",
                      "trial_period_days": 7,
                      "unlimited_stock": false,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "visibility": "visible"
                    }
                  ],
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
            averageReviewRating: 0,
            createdAt: "2026-01-01T12:00:00.000Z",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("https://shinetime.example/book"),
            customStatementDescriptor: Nullable<String>.value("WHOP*SHINETIME"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(30),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "plan_xxxxxxxxxxxxxx",
                initialPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                renewalPrice: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("Full interior extraction, leather conditioning, and an ozone odor treatment."),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "https://pub-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.r2.dev/custom-perk-icon.svg"
                        ),
                        id: "app_xxxxxxxxxxxxxx",
                        name: "Chat"
                    ),
                    id: "exp_xxxxxxxxxxxxxx",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "Name1"
                )
            ],
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
            logoUrl: Nullable<String>.value("logo_url"),
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
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "color": JSONValue.array([
                    JSONValue.string("Red"),
                    JSONValue.string("Blue")
                ]), 
                "size": JSONValue.array([
                    JSONValue.string("M"),
                    JSONValue.string("S")
                ])
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: false,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "color": Nullable<String>.value("Blue"), 
                        "size": Nullable<String>.value("S")
                    ]),
                    billingPeriod: Nullable<Double>.value(30),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(3),
                    cancelDiscountPercentage: Nullable<Double>.value(20),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "background_color": JSONValue.string("#0f172a"), 
                        "border_style": JSONValue.string("rounded"), 
                        "button_color": JSONValue.string("#f59e0b"), 
                        "font_family": JSONValue.string("roboto")
                    ]),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "field_xxxxxxxxxxxxxx",
                            name: "Link your website or main social profile",
                            order: 1,
                            placeholder: Nullable<String>.value("https://"),
                            required: false
                        )
                    ],
                    description: Nullable<String>.value("Two hand washes a month, interior vacuum, and a quarterly sealant top-up."),
                    expirationDays: Nullable<Double>.value(365),
                    formattedPrice: "$59.00 / month",
                    id: "plan_xxxxxxxxxxxxxx",
                    image: Nullable<[String: JSONValue]>.value([
                        "blurhash": JSONValue.string("LA6bDXT$E3b:R6i+RibEIWbp%ej1"), 
                        "url": JSONValue.string("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                    ]),
                    initialPrice: 0,
                    initialPriceDue: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    internalNotes: Nullable<String>.value("Maintenance tier. Upsell the interior shampoo add-on at renewal."),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ]),
                    memberCount: Nullable<Double>.value(0),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "custom_cta": JSONValue.string("subscribe"), 
                        "custom_cta_url": JSONValue.string("https://shinetime.example/wash-club")
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "disabled": JSONValue.array([
                            JSONValue.string("crypto")
                        ]), 
                        "enabled": JSONValue.array([
                            JSONValue.string("card")
                        ]), 
                        "include_platform_defaults": JSONValue.bool(true)
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("prod_xxxxxxxxxxxxxx"), 
                        "title": JSONValue.string("Ceramic Coating Package")
                    ]),
                    purchaseUrl: "https://whop.com/checkout/plan_xxxxxxxxxxxxxx",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 59,
                    sku: Nullable<String>.value("CERAMIC-COATING-S-BLUE"),
                    splitPayRequiredPayments: Nullable<Double>.value(4),
                    stock: Nullable<Double>.value(0),
                    strikeThroughInitialPrice: Nullable<Double>.value(99),
                    strikeThroughRenewalPrice: Nullable<Double>.value(79),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("Unlimited Wash Club"),
                    trialPeriodDays: Nullable<Double>.value(7),
                    unlimitedStock: false,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: false,
            visibility: Nullable<String>.value("visible")
        )
        let response = try await client.products.unpublish(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unpublish2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "account": {
                      "key": "value"
                    }
                  },
                  "average_review_rating": 1.1,
                  "created_at": "created_at",
                  "custom_cta": "get_access",
                  "custom_cta_url": "custom_cta_url",
                  "custom_statement_descriptor": "custom_statement_descriptor",
                  "default_variant": {
                    "billing_period": 1.1,
                    "billing_type": "renewal",
                    "expiration_days": 1.1,
                    "id": "id",
                    "initial_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "title": "title",
                    "trial_period_days": 1.1,
                    "unlimited_stock": true,
                    "visibility": "visible"
                  },
                  "description": "description",
                  "experiences": [
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    },
                    {
                      "app": {
                        "icon": {
                          "url": "url"
                        },
                        "id": "id",
                        "name": "name"
                      },
                      "id": "id",
                      "logo_url": "logo_url",
                      "name": "name"
                    }
                  ],
                  "external_identifier": "external_identifier",
                  "gallery_images": [
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    },
                    {
                      "content_type": "content_type",
                      "id": "id",
                      "url": "url"
                    }
                  ],
                  "global_affiliate_percentage": 1.1,
                  "global_affiliate_status": "enabled",
                  "headline": "headline",
                  "id": "id",
                  "labels": [
                    "labels",
                    "labels"
                  ],
                  "logo_url": "logo_url",
                  "marketplace_status": "not_available",
                  "member_affiliate_percentage": 1.1,
                  "member_affiliate_status": "enabled",
                  "member_count": 1.1,
                  "metadata": {
                    "metadata": {
                      "key": "value"
                    }
                  },
                  "owner_user": {
                    "owner_user": {
                      "key": "value"
                    }
                  },
                  "product_tax_code": {
                    "product_tax_code": {
                      "key": "value"
                    }
                  },
                  "published_reviews_count": 1.1,
                  "route": "route",
                  "title": "title",
                  "updated_at": "updated_at",
                  "variant_attributes": {
                    "variant_attributes": {
                      "key": "value"
                    }
                  },
                  "variants": [
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    },
                    {
                      "account": {
                        "id": "id",
                        "title": "title"
                      },
                      "adaptive_pricing_enabled": true,
                      "allow_multiple_quantity": true,
                      "attributes": {
                        "attributes": "attributes"
                      },
                      "billing_period": 1.1,
                      "billing_type": "renewal",
                      "cancel_discount_intervals": 1.1,
                      "cancel_discount_percentage": 1.1,
                      "checkout_styling": {
                        "checkout_styling": {
                          "key": "value"
                        }
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "custom_fields": [
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        },
                        {
                          "field_type": "text",
                          "id": "id",
                          "name": "name",
                          "order": 1.1,
                          "placeholder": "placeholder",
                          "required": true
                        }
                      ],
                      "description": "description",
                      "expiration_days": 1.1,
                      "formatted_price": "formatted_price",
                      "id": "id",
                      "image": {
                        "image": {
                          "key": "value"
                        }
                      },
                      "initial_price": 1.1,
                      "initial_price_due": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "internal_notes": "internal_notes",
                      "invoice": {
                        "invoice": {
                          "key": "value"
                        }
                      },
                      "member_count": 1.1,
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "offer_cancel_discount": true,
                      "payment_method_configuration": {
                        "payment_method_configuration": {
                          "key": "value"
                        }
                      },
                      "product": {
                        "product": {
                          "key": "value"
                        }
                      },
                      "purchase_url": "purchase_url",
                      "release_method": "buy_now",
                      "renewal_price": 1.1,
                      "sku": "sku",
                      "split_pay_required_payments": 1.1,
                      "stock": 1.1,
                      "strike_through_initial_price": 1.1,
                      "strike_through_renewal_price": 1.1,
                      "three_ds_level": "mandate_challenge",
                      "title": "title",
                      "trial_period_days": 1.1,
                      "unlimited_stock": true,
                      "updated_at": "updated_at",
                      "visibility": "visible"
                    }
                  ],
                  "verified": true,
                  "visibility": "visibility"
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
                "account": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            averageReviewRating: 1.1,
            createdAt: "created_at",
            customCta: Nullable<ProductCustomCta>.value(ProductCustomCta.getAccess),
            customCtaUrl: Nullable<String>.value("custom_cta_url"),
            customStatementDescriptor: Nullable<String>.value("custom_statement_descriptor"),
            defaultVariant: Nullable<ProductPublicVariant>.value(ProductPublicVariant(
                billingPeriod: Nullable<Double>.value(1.1),
                billingType: ProductPublicVariantBillingType.renewal,
                expirationDays: Nullable<Double>.value(1.1),
                id: "id",
                initialPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                renewalPrice: Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ),
                title: Nullable<String>.value("title"),
                trialPeriodDays: Nullable<Double>.value(1.1),
                unlimitedStock: true,
                visibility: ProductPublicVariantVisibility.visible
            )),
            description: Nullable<String>.value("description"),
            experiences: [
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                ),
                ProductExperience(
                    app: ProductExperienceApp(
                        icon: AppIcon(
                            url: "url"
                        ),
                        id: "id",
                        name: "name"
                    ),
                    id: "id",
                    logoUrl: Nullable<String>.value("logo_url"),
                    name: "name"
                )
            ],
            externalIdentifier: Nullable<String>.value("external_identifier"),
            galleryImages: [
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                ),
                ProductGalleryImage(
                    contentType: Nullable<String>.value("content_type"),
                    id: "id",
                    url: Nullable<String>.value("url")
                )
            ],
            globalAffiliatePercentage: Nullable<Double>.value(1.1),
            globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>.value(ProductGlobalAffiliateStatus.enabled),
            headline: Nullable<String>.value("headline"),
            id: "id",
            labels: [
                "labels",
                "labels"
            ],
            logoUrl: Nullable<String>.value("logo_url"),
            marketplaceStatus: ProductMarketplaceStatus.notAvailable,
            memberAffiliatePercentage: Nullable<Double>.value(1.1),
            memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>.value(ProductMemberAffiliateStatus.enabled),
            memberCount: 1.1,
            metadata: Nullable<[String: JSONValue]>.value([
                "metadata": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            ownerUser: Nullable<[String: JSONValue]>.value([
                "owner_user": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "product_tax_code": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            publishedReviewsCount: 1.1,
            route: "route",
            title: "title",
            updatedAt: "updated_at",
            variantAttributes: Nullable<[String: JSONValue]>.value([
                "variant_attributes": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ]),
            variants: Nullable<[VariantListItem]>.value([
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                ),
                VariantListItem(
                    account: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    adaptivePricingEnabled: true,
                    allowMultipleQuantity: true,
                    attributes: Nullable<[String: Nullable<String>]>.value([
                        "attributes": Nullable<String>.value("attributes")
                    ]),
                    billingPeriod: Nullable<Double>.value(1.1),
                    billingType: VariantListItemBillingType.renewal,
                    cancelDiscountIntervals: Nullable<Double>.value(1.1),
                    cancelDiscountPercentage: Nullable<Double>.value(1.1),
                    checkoutStyling: Nullable<[String: JSONValue]>.value([
                        "checkout_styling": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    createdAt: "created_at",
                    currency: "currency",
                    customFields: [
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        ),
                        PlanCustomField(
                            fieldType: PlanCustomFieldFieldType.text,
                            id: "id",
                            name: "name",
                            order: 1.1,
                            placeholder: Nullable<String>.value("placeholder"),
                            required: true
                        )
                    ],
                    description: Nullable<String>.value("description"),
                    expirationDays: Nullable<Double>.value(1.1),
                    formattedPrice: "formatted_price",
                    id: "id",
                    image: Nullable<[String: JSONValue]>.value([
                        "image": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    initialPrice: 1.1,
                    initialPriceDue: Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    ),
                    internalNotes: Nullable<String>.value("internal_notes"),
                    invoice: Nullable<[String: JSONValue]>.value([
                        "invoice": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    memberCount: Nullable<Double>.value(1.1),
                    metadata: Nullable<[String: JSONValue]>.value([
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    offerCancelDiscount: Nullable<Bool>.value(true),
                    paymentMethodConfiguration: Nullable<[String: JSONValue]>.value([
                        "payment_method_configuration": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    product: Nullable<[String: JSONValue]>.value([
                        "product": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    purchaseUrl: "purchase_url",
                    releaseMethod: VariantListItemReleaseMethod.buyNow,
                    renewalPrice: 1.1,
                    sku: Nullable<String>.value("sku"),
                    splitPayRequiredPayments: Nullable<Double>.value(1.1),
                    stock: Nullable<Double>.value(1.1),
                    strikeThroughInitialPrice: Nullable<Double>.value(1.1),
                    strikeThroughRenewalPrice: Nullable<Double>.value(1.1),
                    threeDsLevel: Nullable<VariantListItemThreeDsLevel>.value(VariantListItemThreeDsLevel.mandateChallenge),
                    title: Nullable<String>.value("title"),
                    trialPeriodDays: Nullable<Double>.value(1.1),
                    unlimitedStock: true,
                    updatedAt: "updated_at",
                    visibility: VariantListItemVisibility.visible
                )
            ]),
            verified: true,
            visibility: Nullable<String>.value("visibility")
        )
        let response = try await client.products.unpublish(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}