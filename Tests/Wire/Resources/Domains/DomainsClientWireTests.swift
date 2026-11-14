import Foundation
import Testing
import WhopSDK

@Suite("DomainsClient Wire Tests") struct DomainsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": null,
                      "apple_pay": null,
                      "availability": {
                        "available": false,
                        "premium": false,
                        "price": null,
                        "renewal_price": null,
                        "score": 81,
                        "transfer_price": {
                          "amount": "14.99",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "created_at": null,
                      "domain": "example.com",
                      "email": null,
                      "id": null,
                      "issues": [
                        {
                          "capability": "verification",
                          "code": "verification_required",
                          "code_block": null,
                          "dns_records": [
                            {
                              "name": "_whop.shop.example.com",
                              "type": "TXT",
                              "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                            }
                          ],
                          "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                        }
                      ],
                      "metadata": {
                        "key": "value"
                      },
                      "owned_by": null,
                      "pixel": null,
                      "platform": null,
                      "registration": null,
                      "stats": null,
                      "status": null,
                      "subdomain": null,
                      "transfer": null,
                      "updated_at": null,
                      "verification": null,
                      "website": null
                    },
                    {
                      "account_id": null,
                      "apple_pay": null,
                      "availability": {
                        "available": true,
                        "premium": false,
                        "price": {
                          "amount": "24.99",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "renewal_price": {
                          "amount": "29.99",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "score": 78,
                        "transfer_price": null
                      },
                      "created_at": null,
                      "domain": "example.co",
                      "email": null,
                      "id": null,
                      "issues": [
                        {
                          "capability": "verification",
                          "code": "verification_required",
                          "code_block": null,
                          "dns_records": [
                            {
                              "name": "_whop.shop.example.com",
                              "type": "TXT",
                              "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                            }
                          ],
                          "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                        }
                      ],
                      "metadata": {
                        "key": "value"
                      },
                      "owned_by": null,
                      "pixel": null,
                      "platform": null,
                      "registration": null,
                      "stats": null,
                      "status": null,
                      "subdomain": null,
                      "transfer": null,
                      "updated_at": null,
                      "verification": null,
                      "website": null
                    },
                    {
                      "account_id": null,
                      "apple_pay": null,
                      "availability": {
                        "available": true,
                        "premium": false,
                        "price": {
                          "amount": "12.99",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "renewal_price": {
                          "amount": "14.99",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "score": 75,
                        "transfer_price": null
                      },
                      "created_at": null,
                      "domain": "example.dev",
                      "email": null,
                      "id": null,
                      "issues": [
                        {
                          "capability": "verification",
                          "code": "verification_required",
                          "code_block": null,
                          "dns_records": [
                            {
                              "name": "_whop.shop.example.com",
                              "type": "TXT",
                              "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                            }
                          ],
                          "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                        }
                      ],
                      "metadata": {
                        "key": "value"
                      },
                      "owned_by": null,
                      "pixel": null,
                      "platform": null,
                      "registration": null,
                      "stats": null,
                      "status": null,
                      "subdomain": null,
                      "transfer": null,
                      "updated_at": null,
                      "verification": null,
                      "website": null
                    }
                  ],
                  "page_info": {
                    "end_cursor": null,
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": null
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
        let expectedResponse = ListDomainsResponse(
            data: [
                DomainListItem(
                    accountId: .null,
                    applePay: .null,
                    availability: Nullable<DomainAvailability>.value(DomainAvailability(
                        available: false,
                        premium: false,
                        price: .null,
                        renewalPrice: .null,
                        score: 81,
                        transferPrice: Nullable<Money>.value(Money(
                            amount: "14.99",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ))
                    )),
                    createdAt: .null,
                    domain: "example.com",
                    email: .null,
                    id: .null,
                    issues: [
                        DomainIssue(
                            capability: DomainIssueCapability.verification,
                            code: DomainIssueCode.verificationRequired,
                            codeBlock: .null,
                            dnsRecords: [
                                DomainDnsRecord(
                                    name: "_whop.shop.example.com",
                                    type: DomainDnsRecordType.txt,
                                    value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                                )
                            ],
                            message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                        )
                    ],
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    ownedBy: .null,
                    pixel: .null,
                    platform: .null,
                    registration: .null,
                    stats: .null,
                    status: .null,
                    subdomain: .null,
                    transfer: .null,
                    updatedAt: .null,
                    verification: .null,
                    website: .null
                ),
                DomainListItem(
                    accountId: .null,
                    applePay: .null,
                    availability: Nullable<DomainAvailability>.value(DomainAvailability(
                        available: true,
                        premium: false,
                        price: Nullable<Money>.value(Money(
                            amount: "24.99",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        renewalPrice: Nullable<Money>.value(Money(
                            amount: "29.99",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        score: 78,
                        transferPrice: .null
                    )),
                    createdAt: .null,
                    domain: "example.co",
                    email: .null,
                    id: .null,
                    issues: [
                        DomainIssue(
                            capability: DomainIssueCapability.verification,
                            code: DomainIssueCode.verificationRequired,
                            codeBlock: .null,
                            dnsRecords: [
                                DomainDnsRecord(
                                    name: "_whop.shop.example.com",
                                    type: DomainDnsRecordType.txt,
                                    value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                                )
                            ],
                            message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                        )
                    ],
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    ownedBy: .null,
                    pixel: .null,
                    platform: .null,
                    registration: .null,
                    stats: .null,
                    status: .null,
                    subdomain: .null,
                    transfer: .null,
                    updatedAt: .null,
                    verification: .null,
                    website: .null
                ),
                DomainListItem(
                    accountId: .null,
                    applePay: .null,
                    availability: Nullable<DomainAvailability>.value(DomainAvailability(
                        available: true,
                        premium: false,
                        price: Nullable<Money>.value(Money(
                            amount: "12.99",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        renewalPrice: Nullable<Money>.value(Money(
                            amount: "14.99",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        score: 75,
                        transferPrice: .null
                    )),
                    createdAt: .null,
                    domain: "example.dev",
                    email: .null,
                    id: .null,
                    issues: [
                        DomainIssue(
                            capability: DomainIssueCapability.verification,
                            code: DomainIssueCode.verificationRequired,
                            codeBlock: .null,
                            dnsRecords: [
                                DomainDnsRecord(
                                    name: "_whop.shop.example.com",
                                    type: DomainDnsRecordType.txt,
                                    value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                                )
                            ],
                            message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                        )
                    ],
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    ownedBy: .null,
                    pixel: .null,
                    platform: .null,
                    registration: .null,
                    stats: .null,
                    status: .null,
                    subdomain: .null,
                    transfer: .null,
                    updatedAt: .null,
                    verification: .null,
                    website: .null
                )
            ],
            pageInfo: ListDomainsResponsePageInfo(
                endCursor: .null,
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: .null
            )
        )
        let response = try await client.domains.list(
            tlds: [
                "com"
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
                      "account_id": "account_id",
                      "apple_pay": {
                        "state": "pending"
                      },
                      "availability": {
                        "available": true,
                        "premium": true,
                        "price": {
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
                        "score": 1,
                        "transfer_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        }
                      },
                      "created_at": "created_at",
                      "domain": "domain",
                      "email": {
                        "state": "pending"
                      },
                      "id": "id",
                      "issues": [
                        {
                          "capability": "verification",
                          "code": "verification_required",
                          "code_block": "code_block",
                          "dns_records": [
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            },
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            }
                          ],
                          "message": "message"
                        },
                        {
                          "capability": "verification",
                          "code": "verification_required",
                          "code_block": "code_block",
                          "dns_records": [
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            },
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            }
                          ],
                          "message": "message"
                        }
                      ],
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "owned_by": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "pixel": {
                        "state": "pending"
                      },
                      "platform": {
                        "state": "pending"
                      },
                      "registration": {
                        "amount_due": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "auto_renew": true,
                        "expires_at": "expires_at",
                        "method": "registration",
                        "payment_method_id": "payment_method_id",
                        "phase": "awaiting_payment",
                        "purchase_url": "purchase_url",
                        "renewal_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "state": "pending"
                      },
                      "stats": {
                        "unique_visitors_last_7_days": 1
                      },
                      "status": "idle",
                      "subdomain": {
                        "state": "pending"
                      },
                      "transfer": {
                        "code": "code",
                        "destination": "internal",
                        "state": "ready"
                      },
                      "updated_at": "updated_at",
                      "verification": {
                        "state": "pending",
                        "verification_expires_at": "verification_expires_at"
                      },
                      "website": {
                        "app": {
                          "base_url": "base_url",
                          "id": "id"
                        },
                        "state": "pending"
                      }
                    },
                    {
                      "account_id": "account_id",
                      "apple_pay": {
                        "state": "pending"
                      },
                      "availability": {
                        "available": true,
                        "premium": true,
                        "price": {
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
                        "score": 1,
                        "transfer_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        }
                      },
                      "created_at": "created_at",
                      "domain": "domain",
                      "email": {
                        "state": "pending"
                      },
                      "id": "id",
                      "issues": [
                        {
                          "capability": "verification",
                          "code": "verification_required",
                          "code_block": "code_block",
                          "dns_records": [
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            },
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            }
                          ],
                          "message": "message"
                        },
                        {
                          "capability": "verification",
                          "code": "verification_required",
                          "code_block": "code_block",
                          "dns_records": [
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            },
                            {
                              "name": "name",
                              "type": "TXT",
                              "value": "value"
                            }
                          ],
                          "message": "message"
                        }
                      ],
                      "metadata": {
                        "metadata": {
                          "key": "value"
                        }
                      },
                      "owned_by": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "pixel": {
                        "state": "pending"
                      },
                      "platform": {
                        "state": "pending"
                      },
                      "registration": {
                        "amount_due": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "auto_renew": true,
                        "expires_at": "expires_at",
                        "method": "registration",
                        "payment_method_id": "payment_method_id",
                        "phase": "awaiting_payment",
                        "purchase_url": "purchase_url",
                        "renewal_price": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "state": "pending"
                      },
                      "stats": {
                        "unique_visitors_last_7_days": 1
                      },
                      "status": "idle",
                      "subdomain": {
                        "state": "pending"
                      },
                      "transfer": {
                        "code": "code",
                        "destination": "internal",
                        "state": "ready"
                      },
                      "updated_at": "updated_at",
                      "verification": {
                        "state": "pending",
                        "verification_expires_at": "verification_expires_at"
                      },
                      "website": {
                        "app": {
                          "base_url": "base_url",
                          "id": "id"
                        },
                        "state": "pending"
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
        let expectedResponse = ListDomainsResponse(
            data: [
                DomainListItem(
                    accountId: Nullable<String>.value("account_id"),
                    applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                        state: DomainApplePayState.pending
                    )),
                    availability: Nullable<DomainAvailability>.value(DomainAvailability(
                        available: true,
                        premium: true,
                        price: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        renewalPrice: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        score: 1,
                        transferPrice: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ))
                    )),
                    createdAt: Nullable<String>.value("created_at"),
                    domain: "domain",
                    email: Nullable<DomainEmail>.value(DomainEmail(
                        state: DomainEmailState.pending
                    )),
                    id: Nullable<String>.value("id"),
                    issues: [
                        DomainIssue(
                            capability: DomainIssueCapability.verification,
                            code: DomainIssueCode.verificationRequired,
                            codeBlock: Nullable<String>.value("code_block"),
                            dnsRecords: [
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                ),
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                )
                            ],
                            message: "message"
                        ),
                        DomainIssue(
                            capability: DomainIssueCapability.verification,
                            code: DomainIssueCode.verificationRequired,
                            codeBlock: Nullable<String>.value("code_block"),
                            dnsRecords: [
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                ),
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                )
                            ],
                            message: "message"
                        )
                    ],
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    pixel: Nullable<DomainPixel>.value(DomainPixel(
                        state: DomainPixelState.pending
                    )),
                    platform: Nullable<DomainPlatform>.value(DomainPlatform(
                        state: DomainPlatformState.pending
                    )),
                    registration: Nullable<DomainRegistration>.value(DomainRegistration(
                        amountDue: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        autoRenew: true,
                        expiresAt: Nullable<String>.value("expires_at"),
                        method: DomainRegistrationMethod.registration,
                        paymentMethodId: Nullable<String>.value("payment_method_id"),
                        phase: DomainRegistrationPhase.awaitingPayment,
                        purchaseUrl: Nullable<String>.value("purchase_url"),
                        renewalPrice: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        state: DomainRegistrationState.pending
                    )),
                    stats: Nullable<DomainStats>.value(DomainStats(
                        uniqueVisitorsLast7Days: 1
                    )),
                    status: Nullable<DomainListItemStatus>.value(DomainListItemStatus.idle),
                    subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                        state: DomainSubdomainState.pending
                    )),
                    transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                        code: Nullable<String>.value("code"),
                        destination: DomainTransferDestination.internal,
                        state: DomainTransferState.ready
                    )),
                    updatedAt: Nullable<String>.value("updated_at"),
                    verification: Nullable<DomainVerification>.value(DomainVerification(
                        state: DomainVerificationState.pending,
                        verificationExpiresAt: Nullable<String>.value("verification_expires_at")
                    )),
                    website: Nullable<DomainWebsite>.value(DomainWebsite(
                        app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                            baseUrl: Nullable<String>.value("base_url"),
                            id: "id"
                        )),
                        state: DomainWebsiteState.pending
                    ))
                ),
                DomainListItem(
                    accountId: Nullable<String>.value("account_id"),
                    applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                        state: DomainApplePayState.pending
                    )),
                    availability: Nullable<DomainAvailability>.value(DomainAvailability(
                        available: true,
                        premium: true,
                        price: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        renewalPrice: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        score: 1,
                        transferPrice: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        ))
                    )),
                    createdAt: Nullable<String>.value("created_at"),
                    domain: "domain",
                    email: Nullable<DomainEmail>.value(DomainEmail(
                        state: DomainEmailState.pending
                    )),
                    id: Nullable<String>.value("id"),
                    issues: [
                        DomainIssue(
                            capability: DomainIssueCapability.verification,
                            code: DomainIssueCode.verificationRequired,
                            codeBlock: Nullable<String>.value("code_block"),
                            dnsRecords: [
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                ),
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                )
                            ],
                            message: "message"
                        ),
                        DomainIssue(
                            capability: DomainIssueCapability.verification,
                            code: DomainIssueCode.verificationRequired,
                            codeBlock: Nullable<String>.value("code_block"),
                            dnsRecords: [
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                ),
                                DomainDnsRecord(
                                    name: "name",
                                    type: DomainDnsRecordType.txt,
                                    value: "value"
                                )
                            ],
                            message: "message"
                        )
                    ],
                    metadata: [
                        "metadata": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    pixel: Nullable<DomainPixel>.value(DomainPixel(
                        state: DomainPixelState.pending
                    )),
                    platform: Nullable<DomainPlatform>.value(DomainPlatform(
                        state: DomainPlatformState.pending
                    )),
                    registration: Nullable<DomainRegistration>.value(DomainRegistration(
                        amountDue: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        autoRenew: true,
                        expiresAt: Nullable<String>.value("expires_at"),
                        method: DomainRegistrationMethod.registration,
                        paymentMethodId: Nullable<String>.value("payment_method_id"),
                        phase: DomainRegistrationPhase.awaitingPayment,
                        purchaseUrl: Nullable<String>.value("purchase_url"),
                        renewalPrice: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        state: DomainRegistrationState.pending
                    )),
                    stats: Nullable<DomainStats>.value(DomainStats(
                        uniqueVisitorsLast7Days: 1
                    )),
                    status: Nullable<DomainListItemStatus>.value(DomainListItemStatus.idle),
                    subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                        state: DomainSubdomainState.pending
                    )),
                    transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                        code: Nullable<String>.value("code"),
                        destination: DomainTransferDestination.internal,
                        state: DomainTransferState.ready
                    )),
                    updatedAt: Nullable<String>.value("updated_at"),
                    verification: Nullable<DomainVerification>.value(DomainVerification(
                        state: DomainVerificationState.pending,
                        verificationExpiresAt: Nullable<String>.value("verification_expires_at")
                    )),
                    website: Nullable<DomainWebsite>.value(DomainWebsite(
                        app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                            baseUrl: Nullable<String>.value("base_url"),
                            id: "id"
                        )),
                        state: DomainWebsiteState.pending
                    ))
                )
            ],
            pageInfo: ListDomainsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.domains.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": false,
                    "price": {
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
                    "score": 75,
                    "transfer_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain": "shop.com",
                  "email": {
                    "state": "pending"
                  },
                  "id": "dom_xxxxxxxxxxxxxx",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "_whop.shop.example.com",
                          "type": "TXT",
                          "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        }
                      ],
                      "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                    }
                  ],
                  "metadata": {
                    "project": "website"
                  },
                  "owned_by": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "logo_url",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Rival Shop"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": false,
                    "expires_at": "2026-01-01T12:00:00.000Z",
                    "name_servers": [
                      "ns1.example.com"
                    ],
                    "registered_at": "2026-01-01T12:00:00.000Z",
                    "registrant": {
                      "address": "Burlington\nMA",
                      "contact_url": "https://registrar.example/contact/example.com",
                      "country": "US",
                      "email": "email",
                      "name": "name",
                      "organization": "Privacy Protect, LLC",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "9999",
                      "name": "Example Registrar, Inc.",
                      "url": "https://registrar.example"
                    },
                    "statuses": [
                      "client transfer prohibited"
                    ],
                    "updated_at": "2026-01-01T12:00:00.000Z"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 0
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "2026-01-01T12:00:00.000Z"
                  },
                  "website": {
                    "app": {
                      "base_url": "https://domains-spec-site.whop.site",
                      "id": "app_xxxxxxxxxxxxxx"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: false,
                price: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                score: 75,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))
            )),
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            domain: "shop.com",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("dom_xxxxxxxxxxxxxx"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "_whop.shop.example.com",
                            type: DomainDnsRecordType.txt,
                            value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        )
                    ],
                    message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                )
            ],
            metadata: [
                "project": "website"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "biz_xxxxxxxxxxxxxx",
                title: "Rival Shop"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(false),
                expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                nameServers: [
                    "ns1.example.com"
                ],
                registeredAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("Burlington\nMA"),
                    contactUrl: Nullable<String>.value("https://registrar.example/contact/example.com"),
                    country: Nullable<String>.value("US"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("Privacy Protect, LLC"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("9999"),
                    name: "Example Registrar, Inc.",
                    url: Nullable<String>.value("https://registrar.example")
                )),
                statuses: [
                    "client transfer prohibited"
                ],
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 0
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("https://domains-spec-site.whop.site"),
                    id: "app_xxxxxxxxxxxxxx"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.create(
            request: .init(domain: "www.bought.com"),
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
                  "account_id": "account_id",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": true,
                    "price": {
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
                    "score": 1,
                    "transfer_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    }
                  },
                  "created_at": "created_at",
                  "domain": "domain",
                  "email": {
                    "state": "pending"
                  },
                  "id": "id",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    },
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    }
                  ],
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "owned_by": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": true,
                    "expires_at": "expires_at",
                    "name_servers": [
                      "name_servers",
                      "name_servers"
                    ],
                    "registered_at": "registered_at",
                    "registrant": {
                      "address": "address",
                      "contact_url": "contact_url",
                      "country": "country",
                      "email": "email",
                      "name": "name",
                      "organization": "organization",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "iana_id",
                      "name": "name",
                      "url": "url"
                    },
                    "statuses": [
                      "statuses",
                      "statuses"
                    ],
                    "updated_at": "updated_at"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "purchase_url",
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 1
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "updated_at",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "verification_expires_at"
                  },
                  "website": {
                    "app": {
                      "base_url": "base_url",
                      "id": "id"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("account_id"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: true,
                price: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                score: 1,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))
            )),
            createdAt: Nullable<String>.value("created_at"),
            domain: "domain",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("id"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                ),
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                )
            ],
            metadata: [
                "metadata": "metadata"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(true),
                expiresAt: Nullable<String>.value("expires_at"),
                nameServers: [
                    "name_servers",
                    "name_servers"
                ],
                registeredAt: Nullable<String>.value("registered_at"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("address"),
                    contactUrl: Nullable<String>.value("contact_url"),
                    country: Nullable<String>.value("country"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("organization"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("iana_id"),
                    name: "name",
                    url: Nullable<String>.value("url")
                )),
                statuses: [
                    "statuses",
                    "statuses"
                ],
                updatedAt: Nullable<String>.value("updated_at")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("purchase_url"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 1
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("updated_at"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("verification_expires_at")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("base_url"),
                    id: "id"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.create(
            request: .init(domain: "domain"),
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
                  "account_id": null,
                  "apple_pay": null,
                  "availability": {
                    "available": false,
                    "premium": false,
                    "price": null,
                    "renewal_price": null,
                    "score": 81,
                    "transfer_price": {
                      "amount": "14.99",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  },
                  "created_at": null,
                  "domain": "example.com",
                  "email": null,
                  "id": null,
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "_whop.shop.example.com",
                          "type": "TXT",
                          "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        }
                      ],
                      "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                    }
                  ],
                  "metadata": {
                    "key": "value"
                  },
                  "owned_by": null,
                  "pixel": null,
                  "platform": null,
                  "public_record": {
                    "dnssec": false,
                    "expires_at": "2027-08-13T04:00:00.000Z",
                    "name_servers": [
                      "ns1.example.com",
                      "ns2.example.com"
                    ],
                    "registered_at": "1995-08-14T04:00:00.000Z",
                    "registrant": {
                      "address": "Burlington\nMA",
                      "contact_url": "https://registrar.example/contact/example.com",
                      "country": "US",
                      "email": null,
                      "name": null,
                      "organization": "Privacy Protect, LLC",
                      "phone": null
                    },
                    "registrar": {
                      "iana_id": "9999",
                      "name": "Example Registrar, Inc.",
                      "url": "https://registrar.example"
                    },
                    "statuses": [
                      "client transfer prohibited"
                    ],
                    "updated_at": "2026-08-14T07:01:44.000Z"
                  },
                  "registration": null,
                  "stats": null,
                  "status": null,
                  "subdomain": null,
                  "transfer": null,
                  "updated_at": null,
                  "verification": null,
                  "website": null
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Domain(
            accountId: .null,
            applePay: .null,
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: false,
                premium: false,
                price: .null,
                renewalPrice: .null,
                score: 81,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "14.99",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))
            )),
            createdAt: .null,
            domain: "example.com",
            email: .null,
            id: .null,
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "_whop.shop.example.com",
                            type: DomainDnsRecordType.txt,
                            value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        )
                    ],
                    message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                )
            ],
            metadata: [
                "key": "value"
            ],
            ownedBy: .null,
            pixel: .null,
            platform: .null,
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(false),
                expiresAt: Nullable<String>.value("2027-08-13T04:00:00.000Z"),
                nameServers: [
                    "ns1.example.com",
                    "ns2.example.com"
                ],
                registeredAt: Nullable<String>.value("1995-08-14T04:00:00.000Z"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("Burlington\nMA"),
                    contactUrl: Nullable<String>.value("https://registrar.example/contact/example.com"),
                    country: Nullable<String>.value("US"),
                    email: .null,
                    name: .null,
                    organization: Nullable<String>.value("Privacy Protect, LLC"),
                    phone: .null
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("9999"),
                    name: "Example Registrar, Inc.",
                    url: Nullable<String>.value("https://registrar.example")
                )),
                statuses: [
                    "client transfer prohibited"
                ],
                updatedAt: Nullable<String>.value("2026-08-14T07:01:44.000Z")
            )),
            registration: .null,
            stats: .null,
            status: .null,
            subdomain: .null,
            transfer: .null,
            updatedAt: .null,
            verification: .null,
            website: .null
        )
        let response = try await client.domains.retrieve(
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
                  "account_id": "account_id",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": true,
                    "price": {
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
                    "score": 1,
                    "transfer_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    }
                  },
                  "created_at": "created_at",
                  "domain": "domain",
                  "email": {
                    "state": "pending"
                  },
                  "id": "id",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    },
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    }
                  ],
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "owned_by": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": true,
                    "expires_at": "expires_at",
                    "name_servers": [
                      "name_servers",
                      "name_servers"
                    ],
                    "registered_at": "registered_at",
                    "registrant": {
                      "address": "address",
                      "contact_url": "contact_url",
                      "country": "country",
                      "email": "email",
                      "name": "name",
                      "organization": "organization",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "iana_id",
                      "name": "name",
                      "url": "url"
                    },
                    "statuses": [
                      "statuses",
                      "statuses"
                    ],
                    "updated_at": "updated_at"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "purchase_url",
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 1
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "updated_at",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "verification_expires_at"
                  },
                  "website": {
                    "app": {
                      "base_url": "base_url",
                      "id": "id"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("account_id"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: true,
                price: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                score: 1,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))
            )),
            createdAt: Nullable<String>.value("created_at"),
            domain: "domain",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("id"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                ),
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                )
            ],
            metadata: [
                "metadata": "metadata"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(true),
                expiresAt: Nullable<String>.value("expires_at"),
                nameServers: [
                    "name_servers",
                    "name_servers"
                ],
                registeredAt: Nullable<String>.value("registered_at"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("address"),
                    contactUrl: Nullable<String>.value("contact_url"),
                    country: Nullable<String>.value("country"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("organization"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("iana_id"),
                    name: "name",
                    url: Nullable<String>.value("url")
                )),
                statuses: [
                    "statuses",
                    "statuses"
                ],
                updatedAt: Nullable<String>.value("updated_at")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("purchase_url"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 1
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("updated_at"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("verification_expires_at")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("base_url"),
                    id: "id"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.retrieve(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": false,
                    "price": {
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
                    "score": 75,
                    "transfer_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain": "shop.com",
                  "email": {
                    "state": "pending"
                  },
                  "id": "dom_xxxxxxxxxxxxxx",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "_whop.shop.example.com",
                          "type": "TXT",
                          "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        }
                      ],
                      "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                    }
                  ],
                  "metadata": {
                    "project": "website"
                  },
                  "owned_by": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "logo_url",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Rival Shop"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": false,
                    "expires_at": "2026-01-01T12:00:00.000Z",
                    "name_servers": [
                      "ns1.example.com"
                    ],
                    "registered_at": "2026-01-01T12:00:00.000Z",
                    "registrant": {
                      "address": "Burlington\nMA",
                      "contact_url": "https://registrar.example/contact/example.com",
                      "country": "US",
                      "email": "email",
                      "name": "name",
                      "organization": "Privacy Protect, LLC",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "9999",
                      "name": "Example Registrar, Inc.",
                      "url": "https://registrar.example"
                    },
                    "statuses": [
                      "client transfer prohibited"
                    ],
                    "updated_at": "2026-01-01T12:00:00.000Z"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 0
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "2026-01-01T12:00:00.000Z"
                  },
                  "website": {
                    "app": {
                      "base_url": "https://domains-spec-site.whop.site",
                      "id": "app_xxxxxxxxxxxxxx"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: false,
                price: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                score: 75,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))
            )),
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            domain: "shop.com",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("dom_xxxxxxxxxxxxxx"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "_whop.shop.example.com",
                            type: DomainDnsRecordType.txt,
                            value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        )
                    ],
                    message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                )
            ],
            metadata: [
                "project": "website"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "biz_xxxxxxxxxxxxxx",
                title: "Rival Shop"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(false),
                expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                nameServers: [
                    "ns1.example.com"
                ],
                registeredAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("Burlington\nMA"),
                    contactUrl: Nullable<String>.value("https://registrar.example/contact/example.com"),
                    country: Nullable<String>.value("US"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("Privacy Protect, LLC"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("9999"),
                    name: "Example Registrar, Inc.",
                    url: Nullable<String>.value("https://registrar.example")
                )),
                statuses: [
                    "client transfer prohibited"
                ],
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 0
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("https://domains-spec-site.whop.site"),
                    id: "app_xxxxxxxxxxxxxx"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.delete(
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
                  "account_id": "account_id",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": true,
                    "price": {
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
                    "score": 1,
                    "transfer_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    }
                  },
                  "created_at": "created_at",
                  "domain": "domain",
                  "email": {
                    "state": "pending"
                  },
                  "id": "id",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    },
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    }
                  ],
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "owned_by": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": true,
                    "expires_at": "expires_at",
                    "name_servers": [
                      "name_servers",
                      "name_servers"
                    ],
                    "registered_at": "registered_at",
                    "registrant": {
                      "address": "address",
                      "contact_url": "contact_url",
                      "country": "country",
                      "email": "email",
                      "name": "name",
                      "organization": "organization",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "iana_id",
                      "name": "name",
                      "url": "url"
                    },
                    "statuses": [
                      "statuses",
                      "statuses"
                    ],
                    "updated_at": "updated_at"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "purchase_url",
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 1
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "updated_at",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "verification_expires_at"
                  },
                  "website": {
                    "app": {
                      "base_url": "base_url",
                      "id": "id"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("account_id"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: true,
                price: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                score: 1,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))
            )),
            createdAt: Nullable<String>.value("created_at"),
            domain: "domain",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("id"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                ),
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                )
            ],
            metadata: [
                "metadata": "metadata"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(true),
                expiresAt: Nullable<String>.value("expires_at"),
                nameServers: [
                    "name_servers",
                    "name_servers"
                ],
                registeredAt: Nullable<String>.value("registered_at"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("address"),
                    contactUrl: Nullable<String>.value("contact_url"),
                    country: Nullable<String>.value("country"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("organization"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("iana_id"),
                    name: "name",
                    url: Nullable<String>.value("url")
                )),
                statuses: [
                    "statuses",
                    "statuses"
                ],
                updatedAt: Nullable<String>.value("updated_at")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("purchase_url"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 1
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("updated_at"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("verification_expires_at")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("base_url"),
                    id: "id"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.delete(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": false,
                    "price": {
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
                    "score": 75,
                    "transfer_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain": "shop.com",
                  "email": {
                    "state": "pending"
                  },
                  "id": "dom_xxxxxxxxxxxxxx",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "_whop.shop.example.com",
                          "type": "TXT",
                          "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        }
                      ],
                      "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                    }
                  ],
                  "metadata": {
                    "project": "website"
                  },
                  "owned_by": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "logo_url",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Rival Shop"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": false,
                    "expires_at": "2026-01-01T12:00:00.000Z",
                    "name_servers": [
                      "ns1.example.com"
                    ],
                    "registered_at": "2026-01-01T12:00:00.000Z",
                    "registrant": {
                      "address": "Burlington\nMA",
                      "contact_url": "https://registrar.example/contact/example.com",
                      "country": "US",
                      "email": "email",
                      "name": "name",
                      "organization": "Privacy Protect, LLC",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "9999",
                      "name": "Example Registrar, Inc.",
                      "url": "https://registrar.example"
                    },
                    "statuses": [
                      "client transfer prohibited"
                    ],
                    "updated_at": "2026-01-01T12:00:00.000Z"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 0
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "2026-01-01T12:00:00.000Z"
                  },
                  "website": {
                    "app": {
                      "base_url": "https://domains-spec-site.whop.site",
                      "id": "app_xxxxxxxxxxxxxx"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: false,
                price: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                score: 75,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))
            )),
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            domain: "shop.com",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("dom_xxxxxxxxxxxxxx"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "_whop.shop.example.com",
                            type: DomainDnsRecordType.txt,
                            value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        )
                    ],
                    message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                )
            ],
            metadata: [
                "project": "website"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "biz_xxxxxxxxxxxxxx",
                title: "Rival Shop"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(false),
                expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                nameServers: [
                    "ns1.example.com"
                ],
                registeredAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("Burlington\nMA"),
                    contactUrl: Nullable<String>.value("https://registrar.example/contact/example.com"),
                    country: Nullable<String>.value("US"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("Privacy Protect, LLC"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("9999"),
                    name: "Example Registrar, Inc.",
                    url: Nullable<String>.value("https://registrar.example")
                )),
                statuses: [
                    "client transfer prohibited"
                ],
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 0
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("https://domains-spec-site.whop.site"),
                    id: "app_xxxxxxxxxxxxxx"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.update(
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
                  "account_id": "account_id",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": true,
                    "price": {
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
                    "score": 1,
                    "transfer_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    }
                  },
                  "created_at": "created_at",
                  "domain": "domain",
                  "email": {
                    "state": "pending"
                  },
                  "id": "id",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    },
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    }
                  ],
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "owned_by": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": true,
                    "expires_at": "expires_at",
                    "name_servers": [
                      "name_servers",
                      "name_servers"
                    ],
                    "registered_at": "registered_at",
                    "registrant": {
                      "address": "address",
                      "contact_url": "contact_url",
                      "country": "country",
                      "email": "email",
                      "name": "name",
                      "organization": "organization",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "iana_id",
                      "name": "name",
                      "url": "url"
                    },
                    "statuses": [
                      "statuses",
                      "statuses"
                    ],
                    "updated_at": "updated_at"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "purchase_url",
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 1
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "updated_at",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "verification_expires_at"
                  },
                  "website": {
                    "app": {
                      "base_url": "base_url",
                      "id": "id"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("account_id"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: true,
                price: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                score: 1,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))
            )),
            createdAt: Nullable<String>.value("created_at"),
            domain: "domain",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("id"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                ),
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                )
            ],
            metadata: [
                "metadata": "metadata"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(true),
                expiresAt: Nullable<String>.value("expires_at"),
                nameServers: [
                    "name_servers",
                    "name_servers"
                ],
                registeredAt: Nullable<String>.value("registered_at"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("address"),
                    contactUrl: Nullable<String>.value("contact_url"),
                    country: Nullable<String>.value("country"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("organization"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("iana_id"),
                    name: "name",
                    url: Nullable<String>.value("url")
                )),
                statuses: [
                    "statuses",
                    "statuses"
                ],
                updatedAt: Nullable<String>.value("updated_at")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("purchase_url"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 1
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("updated_at"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("verification_expires_at")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("base_url"),
                    id: "id"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func check1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": false,
                    "price": {
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
                    "score": 75,
                    "transfer_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "domain": "shop.com",
                  "email": {
                    "state": "pending"
                  },
                  "id": "dom_xxxxxxxxxxxxxx",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "_whop.shop.example.com",
                          "type": "TXT",
                          "value": "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        }
                      ],
                      "message": "Publish this TXT record to prove you own the domain. Verification runs automatically."
                    }
                  ],
                  "metadata": {
                    "project": "website"
                  },
                  "owned_by": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "logo_url",
                    "route": "biz_xxxxxxxxxxxxxx",
                    "title": "Rival Shop"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": false,
                    "expires_at": "2026-01-01T12:00:00.000Z",
                    "name_servers": [
                      "ns1.example.com"
                    ],
                    "registered_at": "2026-01-01T12:00:00.000Z",
                    "registrant": {
                      "address": "Burlington\nMA",
                      "contact_url": "https://registrar.example/contact/example.com",
                      "country": "US",
                      "email": "email",
                      "name": "name",
                      "organization": "Privacy Protect, LLC",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "9999",
                      "name": "Example Registrar, Inc.",
                      "url": "https://registrar.example"
                    },
                    "statuses": [
                      "client transfer prohibited"
                    ],
                    "updated_at": "2026-01-01T12:00:00.000Z"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                    "renewal_price": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 0
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "2026-01-01T12:00:00.000Z"
                  },
                  "website": {
                    "app": {
                      "base_url": "https://domains-spec-site.whop.site",
                      "id": "app_xxxxxxxxxxxxxx"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: false,
                price: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                score: 75,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ))
            )),
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            domain: "shop.com",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("dom_xxxxxxxxxxxxxx"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "_whop.shop.example.com",
                            type: DomainDnsRecordType.txt,
                            value: "whop-domain-verification=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                        )
                    ],
                    message: "Publish this TXT record to prove you own the domain. Verification runs automatically."
                )
            ],
            metadata: [
                "project": "website"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "biz_xxxxxxxxxxxxxx",
                title: "Rival Shop"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(false),
                expiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                nameServers: [
                    "ns1.example.com"
                ],
                registeredAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("Burlington\nMA"),
                    contactUrl: Nullable<String>.value("https://registrar.example/contact/example.com"),
                    country: Nullable<String>.value("US"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("Privacy Protect, LLC"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("9999"),
                    name: "Example Registrar, Inc.",
                    url: Nullable<String>.value("https://registrar.example")
                )),
                statuses: [
                    "client transfer prohibited"
                ],
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("https://whop.com/checkout/ch_xxxxxxxxxxxxxx/"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 0
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("2026-01-01T12:00:00.000Z")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("https://domains-spec-site.whop.site"),
                    id: "app_xxxxxxxxxxxxxx"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.check(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func check2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "account_id",
                  "apple_pay": {
                    "state": "pending"
                  },
                  "availability": {
                    "available": true,
                    "premium": true,
                    "price": {
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
                    "score": 1,
                    "transfer_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    }
                  },
                  "created_at": "created_at",
                  "domain": "domain",
                  "email": {
                    "state": "pending"
                  },
                  "id": "id",
                  "issues": [
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    },
                    {
                      "capability": "verification",
                      "code": "verification_required",
                      "code_block": "code_block",
                      "dns_records": [
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        },
                        {
                          "name": "name",
                          "type": "TXT",
                          "value": "value"
                        }
                      ],
                      "message": "message"
                    }
                  ],
                  "metadata": {
                    "metadata": "metadata"
                  },
                  "owned_by": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "pixel": {
                    "state": "pending"
                  },
                  "platform": {
                    "state": "pending"
                  },
                  "public_record": {
                    "dnssec": true,
                    "expires_at": "expires_at",
                    "name_servers": [
                      "name_servers",
                      "name_servers"
                    ],
                    "registered_at": "registered_at",
                    "registrant": {
                      "address": "address",
                      "contact_url": "contact_url",
                      "country": "country",
                      "email": "email",
                      "name": "name",
                      "organization": "organization",
                      "phone": "phone"
                    },
                    "registrar": {
                      "iana_id": "iana_id",
                      "name": "name",
                      "url": "url"
                    },
                    "statuses": [
                      "statuses",
                      "statuses"
                    ],
                    "updated_at": "updated_at"
                  },
                  "registration": {
                    "amount_due": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "auto_renew": true,
                    "expires_at": "expires_at",
                    "method": "registration",
                    "payment_method_id": "payment_method_id",
                    "phase": "awaiting_payment",
                    "purchase_url": "purchase_url",
                    "renewal_price": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "state": "pending"
                  },
                  "stats": {
                    "unique_visitors_last_7_days": 1
                  },
                  "status": "idle",
                  "subdomain": {
                    "state": "pending"
                  },
                  "transfer": {
                    "code": "code",
                    "destination": "internal",
                    "state": "ready"
                  },
                  "updated_at": "updated_at",
                  "verification": {
                    "state": "pending",
                    "verification_expires_at": "verification_expires_at"
                  },
                  "website": {
                    "app": {
                      "base_url": "base_url",
                      "id": "id"
                    },
                    "state": "pending"
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
        let expectedResponse = Domain(
            accountId: Nullable<String>.value("account_id"),
            applePay: Nullable<DomainApplePay>.value(DomainApplePay(
                state: DomainApplePayState.pending
            )),
            availability: Nullable<DomainAvailability>.value(DomainAvailability(
                available: true,
                premium: true,
                price: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                score: 1,
                transferPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                ))
            )),
            createdAt: Nullable<String>.value("created_at"),
            domain: "domain",
            email: Nullable<DomainEmail>.value(DomainEmail(
                state: DomainEmailState.pending
            )),
            id: Nullable<String>.value("id"),
            issues: [
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                ),
                DomainIssue(
                    capability: DomainIssueCapability.verification,
                    code: DomainIssueCode.verificationRequired,
                    codeBlock: Nullable<String>.value("code_block"),
                    dnsRecords: [
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        ),
                        DomainDnsRecord(
                            name: "name",
                            type: DomainDnsRecordType.txt,
                            value: "value"
                        )
                    ],
                    message: "message"
                )
            ],
            metadata: [
                "metadata": "metadata"
            ],
            ownedBy: Nullable<DomainOwner>.value(DomainOwner(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            pixel: Nullable<DomainPixel>.value(DomainPixel(
                state: DomainPixelState.pending
            )),
            platform: Nullable<DomainPlatform>.value(DomainPlatform(
                state: DomainPlatformState.pending
            )),
            publicRecord: Nullable<DomainPublicRecord>.value(DomainPublicRecord(
                dnssec: Nullable<Bool>.value(true),
                expiresAt: Nullable<String>.value("expires_at"),
                nameServers: [
                    "name_servers",
                    "name_servers"
                ],
                registeredAt: Nullable<String>.value("registered_at"),
                registrant: Nullable<DomainRegistrant>.value(DomainRegistrant(
                    address: Nullable<String>.value("address"),
                    contactUrl: Nullable<String>.value("contact_url"),
                    country: Nullable<String>.value("country"),
                    email: Nullable<String>.value("email"),
                    name: Nullable<String>.value("name"),
                    organization: Nullable<String>.value("organization"),
                    phone: Nullable<String>.value("phone")
                )),
                registrar: Nullable<DomainRegistrar>.value(DomainRegistrar(
                    ianaId: Nullable<String>.value("iana_id"),
                    name: "name",
                    url: Nullable<String>.value("url")
                )),
                statuses: [
                    "statuses",
                    "statuses"
                ],
                updatedAt: Nullable<String>.value("updated_at")
            )),
            registration: Nullable<DomainRegistration>.value(DomainRegistration(
                amountDue: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                autoRenew: true,
                expiresAt: Nullable<String>.value("expires_at"),
                method: DomainRegistrationMethod.registration,
                paymentMethodId: Nullable<String>.value("payment_method_id"),
                phase: DomainRegistrationPhase.awaitingPayment,
                purchaseUrl: Nullable<String>.value("purchase_url"),
                renewalPrice: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                state: DomainRegistrationState.pending
            )),
            stats: Nullable<DomainStats>.value(DomainStats(
                uniqueVisitorsLast7Days: 1
            )),
            status: Nullable<DomainStatus>.value(DomainStatus.idle),
            subdomain: Nullable<DomainSubdomain>.value(DomainSubdomain(
                state: DomainSubdomainState.pending
            )),
            transfer: Nullable<DomainTransfer>.value(DomainTransfer(
                code: Nullable<String>.value("code"),
                destination: DomainTransferDestination.internal,
                state: DomainTransferState.ready
            )),
            updatedAt: Nullable<String>.value("updated_at"),
            verification: Nullable<DomainVerification>.value(DomainVerification(
                state: DomainVerificationState.pending,
                verificationExpiresAt: Nullable<String>.value("verification_expires_at")
            )),
            website: Nullable<DomainWebsite>.value(DomainWebsite(
                app: Nullable<DomainWebsiteApp>.value(DomainWebsiteApp(
                    baseUrl: Nullable<String>.value("base_url"),
                    id: "id"
                )),
                state: DomainWebsiteState.pending
            ))
        )
        let response = try await client.domains.check(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}