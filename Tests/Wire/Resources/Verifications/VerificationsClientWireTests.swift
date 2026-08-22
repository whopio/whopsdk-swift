import Foundation
import Testing
import WhopSDK

@Suite("VerificationsClient Wire Tests") struct VerificationsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "address": {
                        "city": "Austin",
                        "country": "US",
                        "line1": "4180 Burnet Rd",
                        "line2": "Suite 2",
                        "postal_code": "78756",
                        "state": "TX"
                      },
                      "business_name": "Shine Time Auto Detailing, LLC",
                      "business_structure": "sole_proprietorship",
                      "country": "US",
                      "created_at": "2026-06-01T12:00:00.000Z",
                      "date_of_birth": "1990-01-01",
                      "email": "marcus@shinetime.example",
                      "first_name": "Marcus",
                      "id": "idpf_xxxxxxxxxxxx",
                      "kind": "individual",
                      "last_name": "Webb",
                      "phone": "+15551234567",
                      "requested_information": [
                        {
                          "errors": [
                            {
                              "code": "document_not_readable",
                              "reason": "The uploaded image was too blurry to read."
                            }
                          ],
                          "id": "inrqi_xxxxxxxxxxx",
                          "label": "Bank Statement or a check for account ending in 4242",
                          "optional": true,
                          "options": [
                            "sole_proprietorship"
                          ],
                          "requirement": "bank_statement",
                          "type": "files"
                        }
                      ],
                      "required_documents": [
                        {
                          "document": "id_card_front",
                          "rejection_reason": "Document image was too blurry to read."
                        }
                      ],
                      "session_url": "https://sumsub.com/session/abc",
                      "status": "not_started",
                      "updated_at": "2026-06-02T12:00:00.000Z"
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
        let expectedResponse = ListVerificationsResponse(
            data: Optional([
                ListVerificationsResponseDataItem(
                    address: Optional(Nullable<ListVerificationsResponseDataItemAddress>.value(ListVerificationsResponseDataItemAddress(
                        city: Optional(Nullable<String>.value("Austin")),
                        country: Optional(Nullable<String>.value("US")),
                        line1: Optional("4180 Burnet Rd"),
                        line2: Optional(Nullable<String>.value("Suite 2")),
                        postalCode: Optional(Nullable<String>.value("78756")),
                        state: Optional(Nullable<String>.value("TX"))
                    ))),
                    businessName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                    businessStructure: Optional(Nullable<String>.value("sole_proprietorship")),
                    country: Optional(Nullable<String>.value("US")),
                    createdAt: Optional("2026-06-01T12:00:00.000Z"),
                    dateOfBirth: Optional(Nullable<String>.value("1990-01-01")),
                    email: Optional(Nullable<String>.value("marcus@shinetime.example")),
                    firstName: Optional(Nullable<String>.value("Marcus")),
                    id: Optional("idpf_xxxxxxxxxxxx"),
                    kind: Optional(ListVerificationsResponseDataItemKind.individual),
                    lastName: Optional(Nullable<String>.value("Webb")),
                    phone: Optional(Nullable<String>.value("+15551234567")),
                    requestedInformation: Optional([
                        ListVerificationsResponseDataItemRequestedInformationItem(
                            errors: Optional([
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("document_not_readable"),
                                    reason: Optional("The uploaded image was too blurry to read.")
                                )
                            ]),
                            id: "inrqi_xxxxxxxxxxx",
                            label: "Bank Statement or a check for account ending in 4242",
                            optional: Optional(true),
                            options: Optional([
                                "sole_proprietorship"
                            ]),
                            requirement: "bank_statement",
                            type: "files"
                        )
                    ]),
                    requiredDocuments: Optional([
                        ListVerificationsResponseDataItemRequiredDocumentsItem(
                            document: Optional("id_card_front"),
                            rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read."))
                        )
                    ]),
                    sessionUrl: Optional(Nullable<String>.value("https://sumsub.com/session/abc")),
                    status: Optional(ListVerificationsResponseDataItemStatus.notStarted),
                    updatedAt: Optional("2026-06-02T12:00:00.000Z")
                )
            ])
        )
        let response = try await client.verifications.list(
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
                  "address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_structure": "sole_proprietorship",
                  "country": "US",
                  "created_at": "2026-06-01T12:00:00.000Z",
                  "date_of_birth": "1990-01-01",
                  "email": "marcus@shinetime.example",
                  "first_name": "Marcus",
                  "id": "idpf_xxxxxxxxxxxx",
                  "kind": "individual",
                  "last_name": "Webb",
                  "phone": "+15551234567",
                  "requested_information": [
                    {
                      "errors": [
                        {
                          "code": "document_not_readable",
                          "reason": "The uploaded image was too blurry to read."
                        }
                      ],
                      "id": "inrqi_xxxxxxxxxxx",
                      "label": "Bank Statement or a check for account ending in 4242",
                      "optional": true,
                      "options": [
                        "sole_proprietorship"
                      ],
                      "requirement": "bank_statement",
                      "type": "files"
                    }
                  ],
                  "required_documents": [
                    {
                      "document": "id_card_front",
                      "rejection_reason": "Document image was too blurry to read.",
                      "status": "pending_upload"
                    }
                  ],
                  "session_url": "https://sumsub.com/session/abc",
                  "status": "not_started",
                  "updated_at": "2026-06-02T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateVerificationsResponse(
            address: Optional(Nullable<CreateVerificationsResponseAddress>.value(CreateVerificationsResponseAddress(
                city: Optional(Nullable<String>.value("Austin")),
                country: Optional(Nullable<String>.value("US")),
                line1: Optional("4180 Burnet Rd"),
                line2: Optional(Nullable<String>.value("Suite 2")),
                postalCode: Optional(Nullable<String>.value("78756")),
                state: Optional(Nullable<String>.value("TX"))
            ))),
            businessName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
            businessStructure: Optional(Nullable<String>.value("sole_proprietorship")),
            country: Optional(Nullable<String>.value("US")),
            createdAt: Optional("2026-06-01T12:00:00.000Z"),
            dateOfBirth: Optional(Nullable<String>.value("1990-01-01")),
            email: Optional(Nullable<String>.value("marcus@shinetime.example")),
            firstName: Optional(Nullable<String>.value("Marcus")),
            id: Optional("idpf_xxxxxxxxxxxx"),
            kind: Optional(CreateVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("Webb")),
            phone: Optional(Nullable<String>.value("+15551234567")),
            requestedInformation: Optional([
                CreateVerificationsResponseRequestedInformationItem(
                    errors: Optional([
                        CreateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("document_not_readable"),
                            reason: Optional("The uploaded image was too blurry to read.")
                        )
                    ]),
                    id: "inrqi_xxxxxxxxxxx",
                    label: "Bank Statement or a check for account ending in 4242",
                    optional: Optional(true),
                    options: Optional([
                        "sole_proprietorship"
                    ]),
                    requirement: "bank_statement",
                    type: "files"
                )
            ]),
            requiredDocuments: Optional([
                CreateVerificationsResponseRequiredDocumentsItem(
                    document: Optional("id_card_front"),
                    rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read.")),
                    status: Optional(CreateVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                )
            ]),
            sessionUrl: Optional(Nullable<String>.value("https://sumsub.com/session/abc")),
            status: Optional(CreateVerificationsResponseStatus.notStarted),
            updatedAt: Optional("2026-06-02T12:00:00.000Z")
        )
        let response = try await client.verifications.create(
            accountId: "account_id",
            request: CreateVerificationsRequestBody.individual(
                CreateVerificationsRequestBodyIndividual(

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
                  "address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_structure": "sole_proprietorship",
                  "country": "US",
                  "created_at": "2026-06-01T12:00:00.000Z",
                  "date_of_birth": "1990-01-01",
                  "email": "marcus@shinetime.example",
                  "first_name": "Marcus",
                  "id": "idpf_xxxxxxxxxxxx",
                  "kind": "individual",
                  "last_name": "Webb",
                  "phone": "+15551234567",
                  "requested_information": [
                    {
                      "errors": [
                        {
                          "code": "document_not_readable",
                          "reason": "The uploaded image was too blurry to read."
                        }
                      ],
                      "id": "inrqi_xxxxxxxxxxx",
                      "label": "Bank Statement or a check for account ending in 4242",
                      "optional": true,
                      "options": [
                        "sole_proprietorship"
                      ],
                      "requirement": "bank_statement",
                      "type": "files"
                    }
                  ],
                  "required_documents": [
                    {
                      "document": "id_card_front",
                      "rejection_reason": "Document image was too blurry to read.",
                      "status": "pending_upload"
                    }
                  ],
                  "session_url": "https://sumsub.com/session/abc",
                  "status": "not_started",
                  "updated_at": "2026-06-02T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrieveVerificationsResponse(
            address: Optional(Nullable<RetrieveVerificationsResponseAddress>.value(RetrieveVerificationsResponseAddress(
                city: Optional(Nullable<String>.value("Austin")),
                country: Optional(Nullable<String>.value("US")),
                line1: Optional("4180 Burnet Rd"),
                line2: Optional(Nullable<String>.value("Suite 2")),
                postalCode: Optional(Nullable<String>.value("78756")),
                state: Optional(Nullable<String>.value("TX"))
            ))),
            businessName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
            businessStructure: Optional(Nullable<String>.value("sole_proprietorship")),
            country: Optional(Nullable<String>.value("US")),
            createdAt: Optional("2026-06-01T12:00:00.000Z"),
            dateOfBirth: Optional(Nullable<String>.value("1990-01-01")),
            email: Optional(Nullable<String>.value("marcus@shinetime.example")),
            firstName: Optional(Nullable<String>.value("Marcus")),
            id: Optional("idpf_xxxxxxxxxxxx"),
            kind: Optional(RetrieveVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("Webb")),
            phone: Optional(Nullable<String>.value("+15551234567")),
            requestedInformation: Optional([
                RetrieveVerificationsResponseRequestedInformationItem(
                    errors: Optional([
                        RetrieveVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("document_not_readable"),
                            reason: Optional("The uploaded image was too blurry to read.")
                        )
                    ]),
                    id: "inrqi_xxxxxxxxxxx",
                    label: "Bank Statement or a check for account ending in 4242",
                    optional: Optional(true),
                    options: Optional([
                        "sole_proprietorship"
                    ]),
                    requirement: "bank_statement",
                    type: "files"
                )
            ]),
            requiredDocuments: Optional([
                RetrieveVerificationsResponseRequiredDocumentsItem(
                    document: Optional("id_card_front"),
                    rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read.")),
                    status: Optional(RetrieveVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                )
            ]),
            sessionUrl: Optional(Nullable<String>.value("https://sumsub.com/session/abc")),
            status: Optional(RetrieveVerificationsResponseStatus.notStarted),
            updatedAt: Optional("2026-06-02T12:00:00.000Z")
        )
        let response = try await client.verifications.retrieve(
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
                  "address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_structure": "sole_proprietorship",
                  "country": "US",
                  "created_at": "2026-06-01T12:00:00.000Z",
                  "date_of_birth": "1990-01-01",
                  "email": "marcus@shinetime.example",
                  "first_name": "Marcus",
                  "id": "idpf_xxxxxxxxxxxx",
                  "kind": "individual",
                  "last_name": "Webb",
                  "phone": "+15551234567",
                  "requested_information": [
                    {
                      "errors": [
                        {
                          "code": "document_not_readable",
                          "reason": "The uploaded image was too blurry to read."
                        }
                      ],
                      "id": "inrqi_xxxxxxxxxxx",
                      "label": "Bank Statement or a check for account ending in 4242",
                      "optional": true,
                      "options": [
                        "sole_proprietorship"
                      ],
                      "requirement": "bank_statement",
                      "type": "files"
                    }
                  ],
                  "required_documents": [
                    {
                      "document": "id_card_front",
                      "rejection_reason": "Document image was too blurry to read.",
                      "status": "pending_upload"
                    }
                  ],
                  "session_url": "https://sumsub.com/session/abc",
                  "status": "not_started",
                  "updated_at": "2026-06-02T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdateVerificationsResponse(
            address: Optional(Nullable<UpdateVerificationsResponseAddress>.value(UpdateVerificationsResponseAddress(
                city: Optional(Nullable<String>.value("Austin")),
                country: Optional(Nullable<String>.value("US")),
                line1: Optional("4180 Burnet Rd"),
                line2: Optional(Nullable<String>.value("Suite 2")),
                postalCode: Optional(Nullable<String>.value("78756")),
                state: Optional(Nullable<String>.value("TX"))
            ))),
            businessName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
            businessStructure: Optional(Nullable<String>.value("sole_proprietorship")),
            country: Optional(Nullable<String>.value("US")),
            createdAt: Optional("2026-06-01T12:00:00.000Z"),
            dateOfBirth: Optional(Nullable<String>.value("1990-01-01")),
            email: Optional(Nullable<String>.value("marcus@shinetime.example")),
            firstName: Optional(Nullable<String>.value("Marcus")),
            id: Optional("idpf_xxxxxxxxxxxx"),
            kind: Optional(UpdateVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("Webb")),
            phone: Optional(Nullable<String>.value("+15551234567")),
            requestedInformation: Optional([
                UpdateVerificationsResponseRequestedInformationItem(
                    errors: Optional([
                        UpdateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("document_not_readable"),
                            reason: Optional("The uploaded image was too blurry to read.")
                        )
                    ]),
                    id: "inrqi_xxxxxxxxxxx",
                    label: "Bank Statement or a check for account ending in 4242",
                    optional: Optional(true),
                    options: Optional([
                        "sole_proprietorship"
                    ]),
                    requirement: "bank_statement",
                    type: "files"
                )
            ]),
            requiredDocuments: Optional([
                UpdateVerificationsResponseRequiredDocumentsItem(
                    document: Optional("id_card_front"),
                    rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read.")),
                    status: Optional(UpdateVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                )
            ]),
            sessionUrl: Optional(Nullable<String>.value("https://sumsub.com/session/abc")),
            status: Optional(UpdateVerificationsResponseStatus.notStarted),
            updatedAt: Optional("2026-06-02T12:00:00.000Z")
        )
        let response = try await client.verifications.update(
            id: "id",
            request: UpdateVerificationsRequestBody.updateVerificationsRequestBodyPersonalAddress(
                UpdateVerificationsRequestBodyPersonalAddress(

                )
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}