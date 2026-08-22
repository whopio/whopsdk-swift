import Foundation
import Testing
import WhopSDK

@Suite("IdentityProfilesClient Wire Tests") struct IdentityProfilesClientWireTests {
    @Test func listIdentityProfile1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "business_address": {
                        "city": null,
                        "country": null,
                        "line1": null,
                        "line2": null,
                        "postal_code": null,
                        "state": null
                      },
                      "business_name": "business_name",
                      "business_structure": "business_structure",
                      "country": "country",
                      "created_at": "2023-12-01T05:00:00Z",
                      "date_of_birth": "date_of_birth",
                      "email": "email",
                      "first_name": "first_name",
                      "id": "idpf_xxxxxxxxxxxxx",
                      "last_name": "last_name",
                      "linked_companies": [
                        {
                          "id": "biz_xxxxxxxxxxxxxx",
                          "title": "Pickaxe"
                        }
                      ],
                      "payout_status": "connected",
                      "payouts_enabled": true,
                      "personal_address": {
                        "city": null,
                        "country": null,
                        "line1": null,
                        "line2": null,
                        "postal_code": null,
                        "state": null
                      },
                      "phone": "phone",
                      "profile_type": "profile_type",
                      "status": "not_started",
                      "updated_at": "2023-12-01T05:00:00Z",
                      "verifications": [
                        {
                          "created_at": "2023-12-01T05:00:00Z",
                          "id": "verf_xxxxxxxxxxxxx",
                          "last_error_code": null,
                          "last_error_reason": "Document image was too blurry to read.",
                          "session_url": "https://verify.stripe.com/session/abc123",
                          "status": "requires_input"
                        }
                      ]
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
        let expectedResponse = ListIdentityProfileResponse(
            data: [
                IdentityProfileListItem(
                    businessAddress: Nullable<IdentityProfileListItemBusinessAddress>.value(IdentityProfileListItemBusinessAddress(
                        city: .null,
                        country: .null,
                        line1: .null,
                        line2: .null,
                        postalCode: .null,
                        state: .null
                    )),
                    businessName: Nullable<String>.value("business_name"),
                    businessStructure: Nullable<String>.value("business_structure"),
                    country: Nullable<String>.value("country"),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    email: Nullable<String>.value("email"),
                    firstName: Nullable<String>.value("first_name"),
                    id: "idpf_xxxxxxxxxxxxx",
                    lastName: Nullable<String>.value("last_name"),
                    linkedCompanies: [
                        IdentityProfileListItemLinkedCompaniesItem(
                            id: "biz_xxxxxxxxxxxxxx",
                            title: "Pickaxe"
                        )
                    ],
                    payoutStatus: PayoutAccountCalculatedStatuses.connected,
                    payoutsEnabled: true,
                    personalAddress: Nullable<IdentityProfileListItemPersonalAddress>.value(IdentityProfileListItemPersonalAddress(
                        city: .null,
                        country: .null,
                        line1: .null,
                        line2: .null,
                        postalCode: .null,
                        state: .null
                    )),
                    phone: Nullable<String>.value("phone"),
                    profileType: "profile_type",
                    status: IdentityProfileStatuses.notStarted,
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    verifications: [
                        IdentityProfileListItemVerificationsItem(
                            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                            id: "verf_xxxxxxxxxxxxx",
                            lastErrorCode: .null,
                            lastErrorReason: Nullable<String>.value("Document image was too blurry to read."),
                            sessionUrl: Nullable<String>.value("https://verify.stripe.com/session/abc123"),
                            status: VerificationStatuses.requiresInput
                        )
                    ]
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.identityProfiles.listIdentityProfile(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieveIdentityProfile1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "business_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "business_name": "business_name",
                  "business_structure": "business_structure",
                  "country": "country",
                  "created_at": "2023-12-01T05:00:00Z",
                  "date_of_birth": "date_of_birth",
                  "email": "email",
                  "first_name": "first_name",
                  "id": "idpf_xxxxxxxxxxxxx",
                  "last_name": "last_name",
                  "linked_companies": [
                    {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Pickaxe"
                    }
                  ],
                  "payout_status": "connected",
                  "payouts_enabled": true,
                  "personal_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "phone": "phone",
                  "profile_type": "profile_type",
                  "status": "not_started",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "verifications": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "verf_xxxxxxxxxxxxx",
                      "last_error_code": "abandoned",
                      "last_error_reason": "Document image was too blurry to read.",
                      "session_url": "https://verify.stripe.com/session/abc123",
                      "status": "requires_input"
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
        let expectedResponse = IdentityProfile(
            businessAddress: Nullable<IdentityProfileBusinessAddress>.value(IdentityProfileBusinessAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            businessName: Nullable<String>.value("business_name"),
            businessStructure: Nullable<String>.value("business_structure"),
            country: Nullable<String>.value("country"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            email: Nullable<String>.value("email"),
            firstName: Nullable<String>.value("first_name"),
            id: "idpf_xxxxxxxxxxxxx",
            lastName: Nullable<String>.value("last_name"),
            linkedCompanies: [
                IdentityProfileLinkedCompaniesItem(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Pickaxe"
                )
            ],
            payoutStatus: PayoutAccountCalculatedStatuses.connected,
            payoutsEnabled: true,
            personalAddress: Nullable<IdentityProfilePersonalAddress>.value(IdentityProfilePersonalAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            phone: Nullable<String>.value("phone"),
            profileType: "profile_type",
            status: IdentityProfileStatuses.notStarted,
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            verifications: [
                IdentityProfileVerificationsItem(
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "verf_xxxxxxxxxxxxx",
                    lastErrorCode: Nullable<VerificationErrorCodes>.value(VerificationErrorCodes.abandoned),
                    lastErrorReason: Nullable<String>.value("Document image was too blurry to read."),
                    sessionUrl: Nullable<String>.value("https://verify.stripe.com/session/abc123"),
                    status: VerificationStatuses.requiresInput
                )
            ]
        )
        let response = try await client.identityProfiles.retrieveIdentityProfile(
            id: "idpf_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unlinkIdentityProfile1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "business_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "business_name": "business_name",
                  "business_structure": "business_structure",
                  "country": "country",
                  "created_at": "2023-12-01T05:00:00Z",
                  "date_of_birth": "date_of_birth",
                  "email": "email",
                  "first_name": "first_name",
                  "id": "idpf_xxxxxxxxxxxxx",
                  "last_name": "last_name",
                  "linked_companies": [
                    {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Pickaxe"
                    }
                  ],
                  "payout_status": "connected",
                  "payouts_enabled": true,
                  "personal_address": {
                    "city": "city",
                    "country": "country",
                    "line1": "line1",
                    "line2": "line2",
                    "postal_code": "postal_code",
                    "state": "state"
                  },
                  "phone": "phone",
                  "profile_type": "profile_type",
                  "status": "not_started",
                  "updated_at": "2023-12-01T05:00:00Z",
                  "verifications": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "verf_xxxxxxxxxxxxx",
                      "last_error_code": "abandoned",
                      "last_error_reason": "Document image was too blurry to read.",
                      "session_url": "https://verify.stripe.com/session/abc123",
                      "status": "requires_input"
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
        let expectedResponse = IdentityProfile(
            businessAddress: Nullable<IdentityProfileBusinessAddress>.value(IdentityProfileBusinessAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            businessName: Nullable<String>.value("business_name"),
            businessStructure: Nullable<String>.value("business_structure"),
            country: Nullable<String>.value("country"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            dateOfBirth: Nullable<String>.value("date_of_birth"),
            email: Nullable<String>.value("email"),
            firstName: Nullable<String>.value("first_name"),
            id: "idpf_xxxxxxxxxxxxx",
            lastName: Nullable<String>.value("last_name"),
            linkedCompanies: [
                IdentityProfileLinkedCompaniesItem(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Pickaxe"
                )
            ],
            payoutStatus: PayoutAccountCalculatedStatuses.connected,
            payoutsEnabled: true,
            personalAddress: Nullable<IdentityProfilePersonalAddress>.value(IdentityProfilePersonalAddress(
                city: Nullable<String>.value("city"),
                country: Nullable<String>.value("country"),
                line1: Nullable<String>.value("line1"),
                line2: Nullable<String>.value("line2"),
                postalCode: Nullable<String>.value("postal_code"),
                state: Nullable<String>.value("state")
            )),
            phone: Nullable<String>.value("phone"),
            profileType: "profile_type",
            status: IdentityProfileStatuses.notStarted,
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            verifications: [
                IdentityProfileVerificationsItem(
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "verf_xxxxxxxxxxxxx",
                    lastErrorCode: Nullable<VerificationErrorCodes>.value(VerificationErrorCodes.abandoned),
                    lastErrorReason: Nullable<String>.value("Document image was too blurry to read."),
                    sessionUrl: Nullable<String>.value("https://verify.stripe.com/session/abc123"),
                    status: VerificationStatuses.requiresInput
                )
            ]
        )
        let response = try await client.identityProfiles.unlinkIdentityProfile(
            id: "idpf_xxxxxxxxxxxxx",
            ledgerAccountId: "ldgr_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listVerificationsIdentityProfile1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "verf_xxxxxxxxxxxxx",
                      "last_error_code": "abandoned",
                      "last_error_reason": "Document image was too blurry to read.",
                      "session_url": "https://verify.stripe.com/session/abc123",
                      "status": "requires_input"
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
        let expectedResponse = ListVerificationsIdentityProfileResponse(
            data: [
                ListVerificationsIdentityProfileResponseDataItem(
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "verf_xxxxxxxxxxxxx",
                    lastErrorCode: Nullable<VerificationErrorCodes>.value(VerificationErrorCodes.abandoned),
                    lastErrorReason: Nullable<String>.value("Document image was too blurry to read."),
                    sessionUrl: Nullable<String>.value("https://verify.stripe.com/session/abc123"),
                    status: VerificationStatuses.requiresInput
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.identityProfiles.listVerificationsIdentityProfile(
            id: "idpf_xxxxxxxxxxxxx",
            first: 42,
            last: 42,
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}