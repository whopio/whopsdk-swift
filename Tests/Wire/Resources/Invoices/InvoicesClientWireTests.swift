import Foundation
import Testing
import WhopSDK

@Suite("InvoicesClient Wire Tests") struct InvoicesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "current_plan": {
                        "currency": "usd",
                        "formatted_price": "$10.00",
                        "id": "plan_xxxxxxxxxxxxx"
                      },
                      "due_date": "2023-12-01T05:00:00Z",
                      "email_address": "customer@example.com",
                      "fetch_invoice_token": "eyJhbGciOiJIUzI1NiJ9...",
                      "id": "inv_xxxxxxxxxxxxxx",
                      "line_items": [
                        {
                          "label": "Platform subscription",
                          "position": 42,
                          "quantity": 6.9,
                          "total": 6.9,
                          "unit_price": 6.9
                        }
                      ],
                      "number": "#0001",
                      "payment_processing": true,
                      "status": "draft",
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
        let expectedResponse = ListInvoicesResponse(
            data: [
                InvoiceListItem(
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currentPlan: InvoiceListItemCurrentPlan(
                        currency: Currencies.usd,
                        formattedPrice: "$10.00",
                        id: "plan_xxxxxxxxxxxxx"
                    ),
                    dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    emailAddress: Nullable<String>.value("customer@example.com"),
                    fetchInvoiceToken: "eyJhbGciOiJIUzI1NiJ9...",
                    id: "inv_xxxxxxxxxxxxxx",
                    lineItems: [
                        InvoiceListItemLineItemsItem(
                            label: "Platform subscription",
                            position: 42,
                            quantity: 6.9,
                            total: 6.9,
                            unitPrice: 6.9
                        )
                    ],
                    number: "#0001",
                    paymentProcessing: true,
                    status: InvoiceStatuses.draft,
                    user: Nullable<InvoiceListItemUser>.value(InvoiceListItemUser(
                        id: "user_xxxxxxxxxxxxx",
                        name: Nullable<String>.value("John Doe"),
                        username: "johndoe42"
                    ))
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.invoices.list(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
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
                  "automatically_finalizes_at": "2023-12-01T05:00:00Z",
                  "charge_buyer_fee": true,
                  "collection_method": "send_invoice",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "current_plan": {
                    "currency": "usd",
                    "description": "Monthly access to all premium analytics dashboards and data exports.",
                    "formatted_price": "$10.00",
                    "id": "plan_xxxxxxxxxxxxx"
                  },
                  "customer_name": "Jane Doe",
                  "due_date": "2023-12-01T05:00:00Z",
                  "email_address": "customer@example.com",
                  "fetch_invoice_token": "eyJhbGciOiJIUzI1NiJ9...",
                  "id": "inv_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "label": "Platform subscription",
                      "position": 42,
                      "quantity": 6.9,
                      "total": 6.9,
                      "unit_price": 6.9
                    }
                  ],
                  "mailing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "phone": "phone",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "member": {
                    "id": "id"
                  },
                  "number": "#0001",
                  "pay_online_url": "pay_online_url",
                  "payment": {
                    "id": "pay_xxxxxxxxxxxxxx"
                  },
                  "payment_processing": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "status": "draft",
                  "subscription_billing_anchor_at": "2023-12-01T05:00:00Z",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "email": "john.doe@example.com",
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
        let expectedResponse = Invoice(
            automaticallyFinalizesAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            chargeBuyerFee: true,
            collectionMethod: InvoiceCollectionMethods.sendInvoice,
            company: InvoiceCompany(
                id: "biz_xxxxxxxxxxxxxx"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currentPlan: InvoiceCurrentPlan(
                currency: Currencies.usd,
                description: Nullable<String>.value("Monthly access to all premium analytics dashboards and data exports."),
                formattedPrice: "$10.00",
                id: "plan_xxxxxxxxxxxxx"
            ),
            customerName: Nullable<String>.value("Jane Doe"),
            dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            emailAddress: Nullable<String>.value("customer@example.com"),
            fetchInvoiceToken: "eyJhbGciOiJIUzI1NiJ9...",
            id: "inv_xxxxxxxxxxxxxx",
            lineItems: [
                InvoiceLineItemsItem(
                    label: "Platform subscription",
                    position: 42,
                    quantity: 6.9,
                    total: 6.9,
                    unitPrice: 6.9
                )
            ],
            mailingAddress: Nullable<InvoiceMailingAddress>.value(InvoiceMailingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                phone: Nullable<String>.value("phone"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            member: Nullable<InvoiceMember>.value(InvoiceMember(
                id: "id"
            )),
            number: "#0001",
            payOnlineUrl: Nullable<String>.value("pay_online_url"),
            payment: Nullable<InvoicePayment>.value(InvoicePayment(
                id: "pay_xxxxxxxxxxxxxx"
            )),
            paymentProcessing: true,
            product: InvoiceProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            ),
            status: InvoiceStatuses.draft,
            subscriptionBillingAnchorAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: Nullable<InvoiceUser>.value(InvoiceUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ))
        )
        let response = try await client.invoices.create(
            request: CreateInvoicesRequest.createInvoicesRequestProduct(
                CreateInvoicesRequestProduct(
                    collectionMethod: .sendInvoice,
                    companyId: "biz_xxxxxxxxxxxxxx",
                    plan: CreateInvoicesRequestProductPlan(

                    ),
                    product: CreateInvoicesRequestProductProduct(
                        title: "title"
                    )
                )
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
                  "automatically_finalizes_at": "2023-12-01T05:00:00Z",
                  "charge_buyer_fee": true,
                  "collection_method": "send_invoice",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "current_plan": {
                    "currency": "usd",
                    "description": "Monthly access to all premium analytics dashboards and data exports.",
                    "formatted_price": "$10.00",
                    "id": "plan_xxxxxxxxxxxxx"
                  },
                  "customer_name": "Jane Doe",
                  "due_date": "2023-12-01T05:00:00Z",
                  "email_address": "customer@example.com",
                  "fetch_invoice_token": "eyJhbGciOiJIUzI1NiJ9...",
                  "id": "inv_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "label": "Platform subscription",
                      "position": 42,
                      "quantity": 6.9,
                      "total": 6.9,
                      "unit_price": 6.9
                    }
                  ],
                  "mailing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "phone": "phone",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "member": {
                    "id": "id"
                  },
                  "number": "#0001",
                  "pay_online_url": "pay_online_url",
                  "payment": {
                    "id": "pay_xxxxxxxxxxxxxx"
                  },
                  "payment_processing": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "status": "draft",
                  "subscription_billing_anchor_at": "2023-12-01T05:00:00Z",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "email": "john.doe@example.com",
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
        let expectedResponse = Invoice(
            automaticallyFinalizesAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            chargeBuyerFee: true,
            collectionMethod: InvoiceCollectionMethods.sendInvoice,
            company: InvoiceCompany(
                id: "biz_xxxxxxxxxxxxxx"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currentPlan: InvoiceCurrentPlan(
                currency: Currencies.usd,
                description: Nullable<String>.value("Monthly access to all premium analytics dashboards and data exports."),
                formattedPrice: "$10.00",
                id: "plan_xxxxxxxxxxxxx"
            ),
            customerName: Nullable<String>.value("Jane Doe"),
            dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            emailAddress: Nullable<String>.value("customer@example.com"),
            fetchInvoiceToken: "eyJhbGciOiJIUzI1NiJ9...",
            id: "inv_xxxxxxxxxxxxxx",
            lineItems: [
                InvoiceLineItemsItem(
                    label: "Platform subscription",
                    position: 42,
                    quantity: 6.9,
                    total: 6.9,
                    unitPrice: 6.9
                )
            ],
            mailingAddress: Nullable<InvoiceMailingAddress>.value(InvoiceMailingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                phone: Nullable<String>.value("phone"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            member: Nullable<InvoiceMember>.value(InvoiceMember(
                id: "id"
            )),
            number: "#0001",
            payOnlineUrl: Nullable<String>.value("pay_online_url"),
            payment: Nullable<InvoicePayment>.value(InvoicePayment(
                id: "pay_xxxxxxxxxxxxxx"
            )),
            paymentProcessing: true,
            product: InvoiceProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            ),
            status: InvoiceStatuses.draft,
            subscriptionBillingAnchorAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: Nullable<InvoiceUser>.value(InvoiceUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ))
        )
        let response = try await client.invoices.retrieve(
            id: "inv_xxxxxxxxxxxxxx",
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
        let response = try await client.invoices.delete(
            id: "inv_xxxxxxxxxxxxxx",
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
                  "automatically_finalizes_at": "2023-12-01T05:00:00Z",
                  "charge_buyer_fee": true,
                  "collection_method": "send_invoice",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "current_plan": {
                    "currency": "usd",
                    "description": "Monthly access to all premium analytics dashboards and data exports.",
                    "formatted_price": "$10.00",
                    "id": "plan_xxxxxxxxxxxxx"
                  },
                  "customer_name": "Jane Doe",
                  "due_date": "2023-12-01T05:00:00Z",
                  "email_address": "customer@example.com",
                  "fetch_invoice_token": "eyJhbGciOiJIUzI1NiJ9...",
                  "id": "inv_xxxxxxxxxxxxxx",
                  "line_items": [
                    {
                      "label": "Platform subscription",
                      "position": 42,
                      "quantity": 6.9,
                      "total": 6.9,
                      "unit_price": 6.9
                    }
                  ],
                  "mailing_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "name": "name",
                    "phone": "phone",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "member": {
                    "id": "id"
                  },
                  "number": "#0001",
                  "pay_online_url": "pay_online_url",
                  "payment": {
                    "id": "pay_xxxxxxxxxxxxxx"
                  },
                  "payment_processing": true,
                  "product": {
                    "id": "prod_xxxxxxxxxxxxx",
                    "title": "Pickaxe Analytics"
                  },
                  "status": "draft",
                  "subscription_billing_anchor_at": "2023-12-01T05:00:00Z",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "email": "john.doe@example.com",
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
        let expectedResponse = Invoice(
            automaticallyFinalizesAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            chargeBuyerFee: true,
            collectionMethod: InvoiceCollectionMethods.sendInvoice,
            company: InvoiceCompany(
                id: "biz_xxxxxxxxxxxxxx"
            ),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currentPlan: InvoiceCurrentPlan(
                currency: Currencies.usd,
                description: Nullable<String>.value("Monthly access to all premium analytics dashboards and data exports."),
                formattedPrice: "$10.00",
                id: "plan_xxxxxxxxxxxxx"
            ),
            customerName: Nullable<String>.value("Jane Doe"),
            dueDate: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            emailAddress: Nullable<String>.value("customer@example.com"),
            fetchInvoiceToken: "eyJhbGciOiJIUzI1NiJ9...",
            id: "inv_xxxxxxxxxxxxxx",
            lineItems: [
                InvoiceLineItemsItem(
                    label: "Platform subscription",
                    position: 42,
                    quantity: 6.9,
                    total: 6.9,
                    unitPrice: 6.9
                )
            ],
            mailingAddress: Nullable<InvoiceMailingAddress>.value(InvoiceMailingAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                name: Nullable<String>.value("name"),
                phone: Nullable<String>.value("phone"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            member: Nullable<InvoiceMember>.value(InvoiceMember(
                id: "id"
            )),
            number: "#0001",
            payOnlineUrl: Nullable<String>.value("pay_online_url"),
            payment: Nullable<InvoicePayment>.value(InvoicePayment(
                id: "pay_xxxxxxxxxxxxxx"
            )),
            paymentProcessing: true,
            product: InvoiceProduct(
                id: "prod_xxxxxxxxxxxxx",
                title: "Pickaxe Analytics"
            ),
            status: InvoiceStatuses.draft,
            subscriptionBillingAnchorAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: Nullable<InvoiceUser>.value(InvoiceUser(
                email: Nullable<String>.value("john.doe@example.com"),
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            ))
        )
        let response = try await client.invoices.update(
            id: "inv_xxxxxxxxxxxxxx",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func markPaid1() async throws -> Void {
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
        let response = try await client.invoices.markPaid(
            id: "inv_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func markUncollectible1() async throws -> Void {
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
        let response = try await client.invoices.markUncollectible(
            id: "inv_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resend1() async throws -> Void {
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
        let response = try await client.invoices.resend(
            id: "inv_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func void1() async throws -> Void {
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
        let response = try await client.invoices.void(
            id: "inv_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}