import Foundation
import Testing
import WhopSDK

@Suite("MembershipsClient Wire Tests") struct MembershipsClientWireTests {
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
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-auto-detailing",
                        "title": "Shine Time Auto Detailing"
                      },
                      "cancel_at_period_end": false,
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "current_period_end": "2026-01-01T12:00:00.000Z",
                      "id": "mem_xxxxxxxxxxxxxx",
                      "license_key": "WHOP-XXXX-XXXX-XXXX",
                      "member": {
                        "access_level": "no_access",
                        "last_accessed_at": "2026-01-01T12:00:00.000Z",
                        "position": 1767268800000
                      },
                      "metadata": {
                        "key": "value"
                      },
                      "plan_id": "plan_xxxxxxxxxxxxxx",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "status": "trialing",
                      "user_id": "user_xxxxxxxxxxxxxx"
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
        let expectedResponse = ListMembershipsResponse(
            data: [
                Membership(
                    account: MembershipAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-auto-detailing",
                        title: "Shine Time Auto Detailing"
                    ),
                    cancelAtPeriodEnd: false,
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    id: "mem_xxxxxxxxxxxxxx",
                    licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
                    member: Nullable<MembershipMember>.value(MembershipMember(
                        accessLevel: MembershipMemberAccessLevel.noAccess,
                        lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        position: Nullable<Double>.value(1767268800000)
                    )),
                    metadata: [
                        "key": JSONValue.string("value")
                    ],
                    planId: "plan_xxxxxxxxxxxxxx",
                    productId: "prod_xxxxxxxxxxxxxx",
                    status: MembershipStatus.trialing,
                    userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
                )
            ],
            pageInfo: ListMembershipsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.memberships.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func invite1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "invitation_sent": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = InviteMembershipsResponse(
            invitationSent: true
        )
        let response = try await client.memberships.invite(
            request: InviteMembershipsRequestBody.inviteMembershipsRequestBodyUserId(
                InviteMembershipsRequestBodyUserId(
                    planId: "plan_xxxxxxxxxxxxxx",
                    userId: "user_xxxxxxxxxxxxxx"
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
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.retrieve(
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
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func addFreeDaysMembership1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.addFreeDaysMembership(
            id: "mem_xxxxxxxxxxxxxx",
            request: .init(freeDays: 42),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.cancel(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func extend1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.extend(
            id: "id",
            request: .init(days: 7),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pause1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.pause(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resume1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.resume(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resyncAccessMembership1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.resyncAccessMembership(
            id: "mem_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func transfer1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "url": "https://whop.com/activate"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = TransferMembershipsResponse(
            url: "https://whop.com/activate"
        )
        let response = try await client.memberships.transfer(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func uncancelMembership1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "cancel_at_period_end": false,
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "current_period_end": "2026-01-01T12:00:00.000Z",
                  "id": "mem_xxxxxxxxxxxxxx",
                  "license_key": "WHOP-XXXX-XXXX-XXXX",
                  "member": {
                    "access_level": "no_access",
                    "last_accessed_at": "2026-01-01T12:00:00.000Z",
                    "position": 1767268800000
                  },
                  "metadata": {
                    "key": "value"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "status": "trialing",
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Membership(
            account: MembershipAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            ),
            cancelAtPeriodEnd: false,
            createdAt: "2026-01-01T12:00:00.000Z",
            currentPeriodEnd: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: "mem_xxxxxxxxxxxxxx",
            licenseKey: Nullable<String>.value("WHOP-XXXX-XXXX-XXXX"),
            member: Nullable<MembershipMember>.value(MembershipMember(
                accessLevel: MembershipMemberAccessLevel.noAccess,
                lastAccessedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                position: Nullable<Double>.value(1767268800000)
            )),
            metadata: [
                "key": JSONValue.string("value")
            ],
            planId: "plan_xxxxxxxxxxxxxx",
            productId: "prod_xxxxxxxxxxxxxx",
            status: MembershipStatus.trialing,
            userId: Nullable<String>.value("user_xxxxxxxxxxxxxx")
        )
        let response = try await client.memberships.uncancelMembership(
            id: "mem_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}