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
                      "account_ids": [
                        "biz_xxxxxxxxxxxxxx"
                      ],
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
                      "incorporation_date": "2021-03-15",
                      "kind": "individual",
                      "last_name": "Webb",
                      "owners": [
                        {
                          "date_of_birth": "1985-06-01",
                          "first_name": "Riley",
                          "id": "own_xxxxxxxxxxxxxx",
                          "last_name": "Owner",
                          "ownership_percentage": 60,
                          "rejected_checks": [
                            "details"
                          ],
                          "required_documents": [
                            {
                              "document": "id_card_front",
                              "rejection_reason": "Document image was too blurry to read."
                            }
                          ],
                          "roles": [
                            "ubo"
                          ],
                          "status": "not_started"
                        }
                      ],
                      "phone": "+15551234567",
                      "place_of_incorporation": "Delaware",
                      "registration_number": "7654321",
                      "requested_information": [
                        {
                          "alternative_document_label": "IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter",
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
                          "supporting_documents": [
                            {
                              "blurhash": null,
                              "content_type": "application/pdf",
                              "created_at": "2026-01-01T12:00:00.000Z",
                              "duration_seconds": null,
                              "filename": "evidence.pdf",
                              "height": null,
                              "id": "file_xxxxxxxxxxxxxx",
                              "multipart_chunk_size": 5242880,
                              "multipart_upload_id": "upload-id",
                              "multipart_upload_urls": [
                                {
                                  "part_number": 1,
                                  "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                }
                              ],
                              "object": "file",
                              "removed_by_moderation": false,
                              "size": 9670,
                              "upload_headers": {
                                "key": "value"
                              },
                              "upload_status": "pending",
                              "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                              "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                              "visibility": "public",
                              "waveform_url": null,
                              "width": null
                            }
                          ],
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
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
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
        let expectedResponse = ListVerificationsResponse(
            data: [
                ListVerificationsResponseDataItem(
                    accountIds: [
                        "biz_xxxxxxxxxxxxxx"
                    ],
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
                    incorporationDate: Optional(Nullable<String>.value("2021-03-15")),
                    kind: Optional(ListVerificationsResponseDataItemKind.individual),
                    lastName: Optional(Nullable<String>.value("Webb")),
                    owners: [
                        ListVerificationsResponseDataItemOwnersItem(
                            dateOfBirth: Nullable<String>.value("1985-06-01"),
                            firstName: Nullable<String>.value("Riley"),
                            id: "own_xxxxxxxxxxxxxx",
                            lastName: Nullable<String>.value("Owner"),
                            ownershipPercentage: Nullable<Double>.value(60),
                            rejectedChecks: [
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details
                            ],
                            requiredDocuments: [
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("id_card_front"),
                                    rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read."))
                                )
                            ],
                            roles: [
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo
                            ],
                            status: ListVerificationsResponseDataItemOwnersItemStatus.notStarted
                        )
                    ],
                    phone: Optional(Nullable<String>.value("+15551234567")),
                    placeOfIncorporation: Optional(Nullable<String>.value("Delaware")),
                    registrationNumber: Optional(Nullable<String>.value("7654321")),
                    requestedInformation: Optional([
                        ListVerificationsResponseDataItemRequestedInformationItem(
                            alternativeDocumentLabel: Optional("IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter"),
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
                            supportingDocuments: Optional([
                                File(
                                    blurhash: .null,
                                    contentType: Nullable<String>.value("application/pdf"),
                                    createdAt: "2026-01-01T12:00:00.000Z",
                                    durationSeconds: .null,
                                    filename: Nullable<String>.value("evidence.pdf"),
                                    height: .null,
                                    id: "file_xxxxxxxxxxxxxx",
                                    multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                                    multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                        FileMultipartUrl(
                                            partNumber: 1,
                                            url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                        )
                                    ])),
                                    object: "file",
                                    removedByModeration: false,
                                    size: Nullable<Int>.value(9670),
                                    uploadHeaders: Optional([
                                        "key": JSONValue.string("value")
                                    ]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: .null,
                                    width: .null
                                )
                            ]),
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
            ],
            pageInfo: ListVerificationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.verifications.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                      "account_ids": [
                        "account_ids",
                        "account_ids"
                      ],
                      "address": {
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
                      "created_at": "created_at",
                      "date_of_birth": "date_of_birth",
                      "email": "email",
                      "first_name": "first_name",
                      "id": "id",
                      "incorporation_date": "incorporation_date",
                      "kind": "individual",
                      "last_name": "last_name",
                      "owners": [
                        {
                          "date_of_birth": "date_of_birth",
                          "first_name": "first_name",
                          "id": "id",
                          "last_name": "last_name",
                          "ownership_percentage": 1.1,
                          "rejected_checks": [
                            "details",
                            "details"
                          ],
                          "required_documents": [
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            },
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            }
                          ],
                          "roles": [
                            "ubo",
                            "ubo"
                          ],
                          "status": "not_started"
                        },
                        {
                          "date_of_birth": "date_of_birth",
                          "first_name": "first_name",
                          "id": "id",
                          "last_name": "last_name",
                          "ownership_percentage": 1.1,
                          "rejected_checks": [
                            "details",
                            "details"
                          ],
                          "required_documents": [
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            },
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            }
                          ],
                          "roles": [
                            "ubo",
                            "ubo"
                          ],
                          "status": "not_started"
                        }
                      ],
                      "phone": "phone",
                      "place_of_incorporation": "place_of_incorporation",
                      "registration_number": "registration_number",
                      "requested_information": [
                        {
                          "action_url": "action_url",
                          "alternative_document_label": "alternative_document_label",
                          "details_label": "details_label",
                          "details_required": true,
                          "details_visible_for": [
                            "details_visible_for",
                            "details_visible_for"
                          ],
                          "errors": [
                            {
                              "code": "code",
                              "reason": "reason"
                            },
                            {
                              "code": "code",
                              "reason": "reason"
                            }
                          ],
                          "id": "id",
                          "label": "label",
                          "optional": true,
                          "options": [
                            "options",
                            "options"
                          ],
                          "requirement": "requirement",
                          "response_type": "yes_no",
                          "selection_mode": "single",
                          "supporting_documents": [
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            },
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            }
                          ],
                          "supporting_files_explanation_allowed": true,
                          "supporting_files_required": true,
                          "supporting_files_visible_for": [
                            "supporting_files_visible_for",
                            "supporting_files_visible_for"
                          ],
                          "type": "type"
                        },
                        {
                          "action_url": "action_url",
                          "alternative_document_label": "alternative_document_label",
                          "details_label": "details_label",
                          "details_required": true,
                          "details_visible_for": [
                            "details_visible_for",
                            "details_visible_for"
                          ],
                          "errors": [
                            {
                              "code": "code",
                              "reason": "reason"
                            },
                            {
                              "code": "code",
                              "reason": "reason"
                            }
                          ],
                          "id": "id",
                          "label": "label",
                          "optional": true,
                          "options": [
                            "options",
                            "options"
                          ],
                          "requirement": "requirement",
                          "response_type": "yes_no",
                          "selection_mode": "single",
                          "supporting_documents": [
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            },
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            }
                          ],
                          "supporting_files_explanation_allowed": true,
                          "supporting_files_required": true,
                          "supporting_files_visible_for": [
                            "supporting_files_visible_for",
                            "supporting_files_visible_for"
                          ],
                          "type": "type"
                        }
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "session_url": "session_url",
                      "status": "not_started",
                      "updated_at": "updated_at"
                    },
                    {
                      "account_ids": [
                        "account_ids",
                        "account_ids"
                      ],
                      "address": {
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
                      "created_at": "created_at",
                      "date_of_birth": "date_of_birth",
                      "email": "email",
                      "first_name": "first_name",
                      "id": "id",
                      "incorporation_date": "incorporation_date",
                      "kind": "individual",
                      "last_name": "last_name",
                      "owners": [
                        {
                          "date_of_birth": "date_of_birth",
                          "first_name": "first_name",
                          "id": "id",
                          "last_name": "last_name",
                          "ownership_percentage": 1.1,
                          "rejected_checks": [
                            "details",
                            "details"
                          ],
                          "required_documents": [
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            },
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            }
                          ],
                          "roles": [
                            "ubo",
                            "ubo"
                          ],
                          "status": "not_started"
                        },
                        {
                          "date_of_birth": "date_of_birth",
                          "first_name": "first_name",
                          "id": "id",
                          "last_name": "last_name",
                          "ownership_percentage": 1.1,
                          "rejected_checks": [
                            "details",
                            "details"
                          ],
                          "required_documents": [
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            },
                            {
                              "document": "document",
                              "rejection_reason": "rejection_reason",
                              "status": "pending_upload"
                            }
                          ],
                          "roles": [
                            "ubo",
                            "ubo"
                          ],
                          "status": "not_started"
                        }
                      ],
                      "phone": "phone",
                      "place_of_incorporation": "place_of_incorporation",
                      "registration_number": "registration_number",
                      "requested_information": [
                        {
                          "action_url": "action_url",
                          "alternative_document_label": "alternative_document_label",
                          "details_label": "details_label",
                          "details_required": true,
                          "details_visible_for": [
                            "details_visible_for",
                            "details_visible_for"
                          ],
                          "errors": [
                            {
                              "code": "code",
                              "reason": "reason"
                            },
                            {
                              "code": "code",
                              "reason": "reason"
                            }
                          ],
                          "id": "id",
                          "label": "label",
                          "optional": true,
                          "options": [
                            "options",
                            "options"
                          ],
                          "requirement": "requirement",
                          "response_type": "yes_no",
                          "selection_mode": "single",
                          "supporting_documents": [
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            },
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            }
                          ],
                          "supporting_files_explanation_allowed": true,
                          "supporting_files_required": true,
                          "supporting_files_visible_for": [
                            "supporting_files_visible_for",
                            "supporting_files_visible_for"
                          ],
                          "type": "type"
                        },
                        {
                          "action_url": "action_url",
                          "alternative_document_label": "alternative_document_label",
                          "details_label": "details_label",
                          "details_required": true,
                          "details_visible_for": [
                            "details_visible_for",
                            "details_visible_for"
                          ],
                          "errors": [
                            {
                              "code": "code",
                              "reason": "reason"
                            },
                            {
                              "code": "code",
                              "reason": "reason"
                            }
                          ],
                          "id": "id",
                          "label": "label",
                          "optional": true,
                          "options": [
                            "options",
                            "options"
                          ],
                          "requirement": "requirement",
                          "response_type": "yes_no",
                          "selection_mode": "single",
                          "supporting_documents": [
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            },
                            {
                              "blurhash": "blurhash",
                              "content_type": "content_type",
                              "created_at": "created_at",
                              "duration_seconds": 1.1,
                              "filename": "filename",
                              "height": 1,
                              "id": "id",
                              "multipart_chunk_size": null,
                              "multipart_upload_id": null,
                              "multipart_upload_urls": null,
                              "object": "object",
                              "removed_by_moderation": true,
                              "size": 1,
                              "upload_headers": {},
                              "upload_status": "pending",
                              "upload_url": null,
                              "url": "url",
                              "visibility": "public",
                              "waveform_url": "waveform_url",
                              "width": 1
                            }
                          ],
                          "supporting_files_explanation_allowed": true,
                          "supporting_files_required": true,
                          "supporting_files_visible_for": [
                            "supporting_files_visible_for",
                            "supporting_files_visible_for"
                          ],
                          "type": "type"
                        }
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "session_url": "session_url",
                      "status": "not_started",
                      "updated_at": "updated_at"
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
        let expectedResponse = ListVerificationsResponse(
            data: [
                ListVerificationsResponseDataItem(
                    accountIds: [
                        "account_ids",
                        "account_ids"
                    ],
                    address: Optional(Nullable<ListVerificationsResponseDataItemAddress>.value(ListVerificationsResponseDataItemAddress(
                        city: Optional(Nullable<String>.value("city")),
                        country: Optional(Nullable<String>.value("country")),
                        line1: Optional("line1"),
                        line2: Optional(Nullable<String>.value("line2")),
                        postalCode: Optional(Nullable<String>.value("postal_code")),
                        state: Optional(Nullable<String>.value("state"))
                    ))),
                    businessName: Optional(Nullable<String>.value("business_name")),
                    businessStructure: Optional(Nullable<String>.value("business_structure")),
                    country: Optional(Nullable<String>.value("country")),
                    createdAt: Optional("created_at"),
                    dateOfBirth: Optional(Nullable<String>.value("date_of_birth")),
                    email: Optional(Nullable<String>.value("email")),
                    firstName: Optional(Nullable<String>.value("first_name")),
                    id: Optional("id"),
                    incorporationDate: Optional(Nullable<String>.value("incorporation_date")),
                    kind: Optional(ListVerificationsResponseDataItemKind.individual),
                    lastName: Optional(Nullable<String>.value("last_name")),
                    owners: [
                        ListVerificationsResponseDataItemOwnersItem(
                            dateOfBirth: Nullable<String>.value("date_of_birth"),
                            firstName: Nullable<String>.value("first_name"),
                            id: "id",
                            lastName: Nullable<String>.value("last_name"),
                            ownershipPercentage: Nullable<Double>.value(1.1),
                            rejectedChecks: [
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details,
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details
                            ],
                            requiredDocuments: [
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                ),
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                )
                            ],
                            roles: [
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo,
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo
                            ],
                            status: ListVerificationsResponseDataItemOwnersItemStatus.notStarted
                        ),
                        ListVerificationsResponseDataItemOwnersItem(
                            dateOfBirth: Nullable<String>.value("date_of_birth"),
                            firstName: Nullable<String>.value("first_name"),
                            id: "id",
                            lastName: Nullable<String>.value("last_name"),
                            ownershipPercentage: Nullable<Double>.value(1.1),
                            rejectedChecks: [
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details,
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details
                            ],
                            requiredDocuments: [
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                ),
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                )
                            ],
                            roles: [
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo,
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo
                            ],
                            status: ListVerificationsResponseDataItemOwnersItemStatus.notStarted
                        )
                    ],
                    phone: Optional(Nullable<String>.value("phone")),
                    placeOfIncorporation: Optional(Nullable<String>.value("place_of_incorporation")),
                    registrationNumber: Optional(Nullable<String>.value("registration_number")),
                    requestedInformation: Optional([
                        ListVerificationsResponseDataItemRequestedInformationItem(
                            actionUrl: Optional("action_url"),
                            alternativeDocumentLabel: Optional("alternative_document_label"),
                            detailsLabel: Optional("details_label"),
                            detailsRequired: Optional(true),
                            detailsVisibleFor: Optional([
                                "details_visible_for",
                                "details_visible_for"
                            ]),
                            errors: Optional([
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                ),
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                )
                            ]),
                            id: "id",
                            label: "label",
                            optional: Optional(true),
                            options: Optional([
                                "options",
                                "options"
                            ]),
                            requirement: "requirement",
                            responseType: Optional(ListVerificationsResponseDataItemRequestedInformationItemResponseType.yesNo),
                            selectionMode: Optional(ListVerificationsResponseDataItemRequestedInformationItemSelectionMode.single),
                            supportingDocuments: Optional([
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                ),
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                )
                            ]),
                            supportingFilesExplanationAllowed: Optional(true),
                            supportingFilesRequired: Optional(true),
                            supportingFilesVisibleFor: Optional([
                                "supporting_files_visible_for",
                                "supporting_files_visible_for"
                            ]),
                            type: "type"
                        ),
                        ListVerificationsResponseDataItemRequestedInformationItem(
                            actionUrl: Optional("action_url"),
                            alternativeDocumentLabel: Optional("alternative_document_label"),
                            detailsLabel: Optional("details_label"),
                            detailsRequired: Optional(true),
                            detailsVisibleFor: Optional([
                                "details_visible_for",
                                "details_visible_for"
                            ]),
                            errors: Optional([
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                ),
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                )
                            ]),
                            id: "id",
                            label: "label",
                            optional: Optional(true),
                            options: Optional([
                                "options",
                                "options"
                            ]),
                            requirement: "requirement",
                            responseType: Optional(ListVerificationsResponseDataItemRequestedInformationItemResponseType.yesNo),
                            selectionMode: Optional(ListVerificationsResponseDataItemRequestedInformationItemSelectionMode.single),
                            supportingDocuments: Optional([
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                ),
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                )
                            ]),
                            supportingFilesExplanationAllowed: Optional(true),
                            supportingFilesRequired: Optional(true),
                            supportingFilesVisibleFor: Optional([
                                "supporting_files_visible_for",
                                "supporting_files_visible_for"
                            ]),
                            type: "type"
                        )
                    ]),
                    requiredDocuments: Optional([
                        ListVerificationsResponseDataItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(ListVerificationsResponseDataItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        ListVerificationsResponseDataItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(ListVerificationsResponseDataItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ]),
                    sessionUrl: Optional(Nullable<String>.value("session_url")),
                    status: Optional(ListVerificationsResponseDataItemStatus.notStarted),
                    updatedAt: Optional("updated_at")
                ),
                ListVerificationsResponseDataItem(
                    accountIds: [
                        "account_ids",
                        "account_ids"
                    ],
                    address: Optional(Nullable<ListVerificationsResponseDataItemAddress>.value(ListVerificationsResponseDataItemAddress(
                        city: Optional(Nullable<String>.value("city")),
                        country: Optional(Nullable<String>.value("country")),
                        line1: Optional("line1"),
                        line2: Optional(Nullable<String>.value("line2")),
                        postalCode: Optional(Nullable<String>.value("postal_code")),
                        state: Optional(Nullable<String>.value("state"))
                    ))),
                    businessName: Optional(Nullable<String>.value("business_name")),
                    businessStructure: Optional(Nullable<String>.value("business_structure")),
                    country: Optional(Nullable<String>.value("country")),
                    createdAt: Optional("created_at"),
                    dateOfBirth: Optional(Nullable<String>.value("date_of_birth")),
                    email: Optional(Nullable<String>.value("email")),
                    firstName: Optional(Nullable<String>.value("first_name")),
                    id: Optional("id"),
                    incorporationDate: Optional(Nullable<String>.value("incorporation_date")),
                    kind: Optional(ListVerificationsResponseDataItemKind.individual),
                    lastName: Optional(Nullable<String>.value("last_name")),
                    owners: [
                        ListVerificationsResponseDataItemOwnersItem(
                            dateOfBirth: Nullable<String>.value("date_of_birth"),
                            firstName: Nullable<String>.value("first_name"),
                            id: "id",
                            lastName: Nullable<String>.value("last_name"),
                            ownershipPercentage: Nullable<Double>.value(1.1),
                            rejectedChecks: [
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details,
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details
                            ],
                            requiredDocuments: [
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                ),
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                )
                            ],
                            roles: [
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo,
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo
                            ],
                            status: ListVerificationsResponseDataItemOwnersItemStatus.notStarted
                        ),
                        ListVerificationsResponseDataItemOwnersItem(
                            dateOfBirth: Nullable<String>.value("date_of_birth"),
                            firstName: Nullable<String>.value("first_name"),
                            id: "id",
                            lastName: Nullable<String>.value("last_name"),
                            ownershipPercentage: Nullable<Double>.value(1.1),
                            rejectedChecks: [
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details,
                                ListVerificationsResponseDataItemOwnersItemRejectedChecksItem.details
                            ],
                            requiredDocuments: [
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                ),
                                ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItem(
                                    document: Optional("document"),
                                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                                    status: Optional(ListVerificationsResponseDataItemOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                                )
                            ],
                            roles: [
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo,
                                ListVerificationsResponseDataItemOwnersItemRolesItem.ubo
                            ],
                            status: ListVerificationsResponseDataItemOwnersItemStatus.notStarted
                        )
                    ],
                    phone: Optional(Nullable<String>.value("phone")),
                    placeOfIncorporation: Optional(Nullable<String>.value("place_of_incorporation")),
                    registrationNumber: Optional(Nullable<String>.value("registration_number")),
                    requestedInformation: Optional([
                        ListVerificationsResponseDataItemRequestedInformationItem(
                            actionUrl: Optional("action_url"),
                            alternativeDocumentLabel: Optional("alternative_document_label"),
                            detailsLabel: Optional("details_label"),
                            detailsRequired: Optional(true),
                            detailsVisibleFor: Optional([
                                "details_visible_for",
                                "details_visible_for"
                            ]),
                            errors: Optional([
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                ),
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                )
                            ]),
                            id: "id",
                            label: "label",
                            optional: Optional(true),
                            options: Optional([
                                "options",
                                "options"
                            ]),
                            requirement: "requirement",
                            responseType: Optional(ListVerificationsResponseDataItemRequestedInformationItemResponseType.yesNo),
                            selectionMode: Optional(ListVerificationsResponseDataItemRequestedInformationItemSelectionMode.single),
                            supportingDocuments: Optional([
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                ),
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                )
                            ]),
                            supportingFilesExplanationAllowed: Optional(true),
                            supportingFilesRequired: Optional(true),
                            supportingFilesVisibleFor: Optional([
                                "supporting_files_visible_for",
                                "supporting_files_visible_for"
                            ]),
                            type: "type"
                        ),
                        ListVerificationsResponseDataItemRequestedInformationItem(
                            actionUrl: Optional("action_url"),
                            alternativeDocumentLabel: Optional("alternative_document_label"),
                            detailsLabel: Optional("details_label"),
                            detailsRequired: Optional(true),
                            detailsVisibleFor: Optional([
                                "details_visible_for",
                                "details_visible_for"
                            ]),
                            errors: Optional([
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                ),
                                ListVerificationsResponseDataItemRequestedInformationItemErrorsItem(
                                    code: Optional("code"),
                                    reason: Optional("reason")
                                )
                            ]),
                            id: "id",
                            label: "label",
                            optional: Optional(true),
                            options: Optional([
                                "options",
                                "options"
                            ]),
                            requirement: "requirement",
                            responseType: Optional(ListVerificationsResponseDataItemRequestedInformationItemResponseType.yesNo),
                            selectionMode: Optional(ListVerificationsResponseDataItemRequestedInformationItemSelectionMode.single),
                            supportingDocuments: Optional([
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                ),
                                File(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    contentType: Nullable<String>.value("content_type"),
                                    createdAt: "created_at",
                                    durationSeconds: Nullable<Double>.value(1.1),
                                    filename: Nullable<String>.value("filename"),
                                    height: Nullable<Int>.value(1),
                                    id: "id",
                                    multipartChunkSize: Optional(.null),
                                    multipartUploadId: Optional(.null),
                                    multipartUploadUrls: Optional(.null),
                                    object: "object",
                                    removedByModeration: true,
                                    size: Nullable<Int>.value(1),
                                    uploadHeaders: Optional([:]),
                                    uploadStatus: FileUploadStatus.pending,
                                    uploadUrl: Optional(.null),
                                    url: Nullable<String>.value("url"),
                                    visibility: FileVisibility.public,
                                    waveformUrl: Nullable<String>.value("waveform_url"),
                                    width: Nullable<Int>.value(1)
                                )
                            ]),
                            supportingFilesExplanationAllowed: Optional(true),
                            supportingFilesRequired: Optional(true),
                            supportingFilesVisibleFor: Optional([
                                "supporting_files_visible_for",
                                "supporting_files_visible_for"
                            ]),
                            type: "type"
                        )
                    ]),
                    requiredDocuments: Optional([
                        ListVerificationsResponseDataItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(ListVerificationsResponseDataItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        ListVerificationsResponseDataItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(ListVerificationsResponseDataItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ]),
                    sessionUrl: Optional(Nullable<String>.value("session_url")),
                    status: Optional(ListVerificationsResponseDataItemStatus.notStarted),
                    updatedAt: Optional("updated_at")
                )
            ],
            pageInfo: ListVerificationsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.verifications.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_ids": [
                    "biz_xxxxxxxxxxxxxx"
                  ],
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
                  "incorporation_date": "2021-03-15",
                  "kind": "individual",
                  "last_name": "Webb",
                  "owners": [
                    {
                      "date_of_birth": "1985-06-01",
                      "first_name": "Riley",
                      "id": "own_xxxxxxxxxxxxxx",
                      "last_name": "Owner",
                      "ownership_percentage": 60,
                      "rejected_checks": [
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "id_card_front",
                          "rejection_reason": "Document image was too blurry to read."
                        }
                      ],
                      "roles": [
                        "ubo"
                      ],
                      "status": "not_started"
                    }
                  ],
                  "phone": "+15551234567",
                  "place_of_incorporation": "Delaware",
                  "registration_number": "7654321",
                  "requested_information": [
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for"
                      ],
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
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": null,
                          "content_type": "application/pdf",
                          "created_at": "2026-01-01T12:00:00.000Z",
                          "duration_seconds": null,
                          "filename": "evidence.pdf",
                          "height": null,
                          "id": "file_xxxxxxxxxxxxxx",
                          "multipart_chunk_size": 5242880,
                          "multipart_upload_id": "upload-id",
                          "multipart_upload_urls": [
                            {
                              "part_number": 1,
                              "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            }
                          ],
                          "object": "file",
                          "removed_by_moderation": false,
                          "size": 9670,
                          "upload_headers": {
                            "key": "value"
                          },
                          "upload_status": "pending",
                          "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "visibility": "public",
                          "waveform_url": null,
                          "width": null
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for"
                      ],
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
            accountIds: [
                "biz_xxxxxxxxxxxxxx"
            ],
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
            incorporationDate: Optional(Nullable<String>.value("2021-03-15")),
            kind: Optional(CreateVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("Webb")),
            owners: [
                CreateVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("1985-06-01"),
                    firstName: Nullable<String>.value("Riley"),
                    id: "own_xxxxxxxxxxxxxx",
                    lastName: Nullable<String>.value("Owner"),
                    ownershipPercentage: Nullable<Double>.value(60),
                    rejectedChecks: [
                        CreateVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        CreateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("id_card_front"),
                            rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read."))
                        )
                    ],
                    roles: [
                        CreateVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: CreateVerificationsResponseOwnersItemStatus.notStarted
                )
            ],
            phone: Optional(Nullable<String>.value("+15551234567")),
            placeOfIncorporation: Optional(Nullable<String>.value("Delaware")),
            registrationNumber: Optional(Nullable<String>.value("7654321")),
            requestedInformation: Optional([
                CreateVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for"
                    ]),
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
                    responseType: Optional(CreateVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(CreateVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: .null,
                            contentType: Nullable<String>.value("application/pdf"),
                            createdAt: "2026-01-01T12:00:00.000Z",
                            durationSeconds: .null,
                            filename: Nullable<String>.value("evidence.pdf"),
                            height: .null,
                            id: "file_xxxxxxxxxxxxxx",
                            multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                            multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                )
                            ])),
                            object: "file",
                            removedByModeration: false,
                            size: Nullable<Int>.value(9670),
                            uploadHeaders: Optional([
                                "key": JSONValue.string("value")
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                            visibility: FileVisibility.public,
                            waveformUrl: .null,
                            width: .null
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for"
                    ]),
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
            request: CreateVerificationsRequestBody.individual(
                CreateVerificationsRequestBodyIndividual(

                )
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
                  "account_ids": [
                    "account_ids",
                    "account_ids"
                  ],
                  "address": {
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
                  "created_at": "created_at",
                  "date_of_birth": "date_of_birth",
                  "email": "email",
                  "first_name": "first_name",
                  "id": "id",
                  "incorporation_date": "incorporation_date",
                  "kind": "individual",
                  "last_name": "last_name",
                  "owners": [
                    {
                      "date_of_birth": "date_of_birth",
                      "first_name": "first_name",
                      "id": "id",
                      "last_name": "last_name",
                      "ownership_percentage": 1.1,
                      "rejected_checks": [
                        "details",
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "roles": [
                        "ubo",
                        "ubo"
                      ],
                      "status": "not_started"
                    },
                    {
                      "date_of_birth": "date_of_birth",
                      "first_name": "first_name",
                      "id": "id",
                      "last_name": "last_name",
                      "ownership_percentage": 1.1,
                      "rejected_checks": [
                        "details",
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "roles": [
                        "ubo",
                        "ubo"
                      ],
                      "status": "not_started"
                    }
                  ],
                  "phone": "phone",
                  "place_of_incorporation": "place_of_incorporation",
                  "registration_number": "registration_number",
                  "requested_information": [
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "alternative_document_label",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for",
                        "details_visible_for"
                      ],
                      "errors": [
                        {
                          "code": "code",
                          "reason": "reason"
                        },
                        {
                          "code": "code",
                          "reason": "reason"
                        }
                      ],
                      "id": "id",
                      "label": "label",
                      "optional": true,
                      "options": [
                        "options",
                        "options"
                      ],
                      "requirement": "requirement",
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                      ],
                      "type": "type"
                    },
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "alternative_document_label",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for",
                        "details_visible_for"
                      ],
                      "errors": [
                        {
                          "code": "code",
                          "reason": "reason"
                        },
                        {
                          "code": "code",
                          "reason": "reason"
                        }
                      ],
                      "id": "id",
                      "label": "label",
                      "optional": true,
                      "options": [
                        "options",
                        "options"
                      ],
                      "requirement": "requirement",
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                      ],
                      "type": "type"
                    }
                  ],
                  "required_documents": [
                    {
                      "document": "document",
                      "rejection_reason": "rejection_reason",
                      "status": "pending_upload"
                    },
                    {
                      "document": "document",
                      "rejection_reason": "rejection_reason",
                      "status": "pending_upload"
                    }
                  ],
                  "session_url": "session_url",
                  "status": "not_started",
                  "updated_at": "updated_at"
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
            accountIds: [
                "account_ids",
                "account_ids"
            ],
            address: Optional(Nullable<CreateVerificationsResponseAddress>.value(CreateVerificationsResponseAddress(
                city: Optional(Nullable<String>.value("city")),
                country: Optional(Nullable<String>.value("country")),
                line1: Optional("line1"),
                line2: Optional(Nullable<String>.value("line2")),
                postalCode: Optional(Nullable<String>.value("postal_code")),
                state: Optional(Nullable<String>.value("state"))
            ))),
            businessName: Optional(Nullable<String>.value("business_name")),
            businessStructure: Optional(Nullable<String>.value("business_structure")),
            country: Optional(Nullable<String>.value("country")),
            createdAt: Optional("created_at"),
            dateOfBirth: Optional(Nullable<String>.value("date_of_birth")),
            email: Optional(Nullable<String>.value("email")),
            firstName: Optional(Nullable<String>.value("first_name")),
            id: Optional("id"),
            incorporationDate: Optional(Nullable<String>.value("incorporation_date")),
            kind: Optional(CreateVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("last_name")),
            owners: [
                CreateVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    firstName: Nullable<String>.value("first_name"),
                    id: "id",
                    lastName: Nullable<String>.value("last_name"),
                    ownershipPercentage: Nullable<Double>.value(1.1),
                    rejectedChecks: [
                        CreateVerificationsResponseOwnersItemRejectedChecksItem.details,
                        CreateVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        CreateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(CreateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        CreateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(CreateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ],
                    roles: [
                        CreateVerificationsResponseOwnersItemRolesItem.ubo,
                        CreateVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: CreateVerificationsResponseOwnersItemStatus.notStarted
                ),
                CreateVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    firstName: Nullable<String>.value("first_name"),
                    id: "id",
                    lastName: Nullable<String>.value("last_name"),
                    ownershipPercentage: Nullable<Double>.value(1.1),
                    rejectedChecks: [
                        CreateVerificationsResponseOwnersItemRejectedChecksItem.details,
                        CreateVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        CreateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(CreateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        CreateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(CreateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ],
                    roles: [
                        CreateVerificationsResponseOwnersItemRolesItem.ubo,
                        CreateVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: CreateVerificationsResponseOwnersItemStatus.notStarted
                )
            ],
            phone: Optional(Nullable<String>.value("phone")),
            placeOfIncorporation: Optional(Nullable<String>.value("place_of_incorporation")),
            registrationNumber: Optional(Nullable<String>.value("registration_number")),
            requestedInformation: Optional([
                CreateVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("alternative_document_label"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for",
                        "details_visible_for"
                    ]),
                    errors: Optional([
                        CreateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        ),
                        CreateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        )
                    ]),
                    id: "id",
                    label: "label",
                    optional: Optional(true),
                    options: Optional([
                        "options",
                        "options"
                    ]),
                    requirement: "requirement",
                    responseType: Optional(CreateVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(CreateVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                    ]),
                    type: "type"
                ),
                CreateVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("alternative_document_label"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for",
                        "details_visible_for"
                    ]),
                    errors: Optional([
                        CreateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        ),
                        CreateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        )
                    ]),
                    id: "id",
                    label: "label",
                    optional: Optional(true),
                    options: Optional([
                        "options",
                        "options"
                    ]),
                    requirement: "requirement",
                    responseType: Optional(CreateVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(CreateVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                    ]),
                    type: "type"
                )
            ]),
            requiredDocuments: Optional([
                CreateVerificationsResponseRequiredDocumentsItem(
                    document: Optional("document"),
                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                    status: Optional(CreateVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                ),
                CreateVerificationsResponseRequiredDocumentsItem(
                    document: Optional("document"),
                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                    status: Optional(CreateVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                )
            ]),
            sessionUrl: Optional(Nullable<String>.value("session_url")),
            status: Optional(CreateVerificationsResponseStatus.notStarted),
            updatedAt: Optional("updated_at")
        )
        let response = try await client.verifications.create(
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
                  "account_ids": [
                    "biz_xxxxxxxxxxxxxx"
                  ],
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
                  "incorporation_date": "2021-03-15",
                  "kind": "individual",
                  "last_name": "Webb",
                  "owners": [
                    {
                      "date_of_birth": "1985-06-01",
                      "first_name": "Riley",
                      "id": "own_xxxxxxxxxxxxxx",
                      "last_name": "Owner",
                      "ownership_percentage": 60,
                      "rejected_checks": [
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "id_card_front",
                          "rejection_reason": "Document image was too blurry to read."
                        }
                      ],
                      "roles": [
                        "ubo"
                      ],
                      "status": "not_started"
                    }
                  ],
                  "phone": "+15551234567",
                  "place_of_incorporation": "Delaware",
                  "registration_number": "7654321",
                  "requested_information": [
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for"
                      ],
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
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": null,
                          "content_type": "application/pdf",
                          "created_at": "2026-01-01T12:00:00.000Z",
                          "duration_seconds": null,
                          "filename": "evidence.pdf",
                          "height": null,
                          "id": "file_xxxxxxxxxxxxxx",
                          "multipart_chunk_size": 5242880,
                          "multipart_upload_id": "upload-id",
                          "multipart_upload_urls": [
                            {
                              "part_number": 1,
                              "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            }
                          ],
                          "object": "file",
                          "removed_by_moderation": false,
                          "size": 9670,
                          "upload_headers": {
                            "key": "value"
                          },
                          "upload_status": "pending",
                          "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "visibility": "public",
                          "waveform_url": null,
                          "width": null
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for"
                      ],
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
            accountIds: [
                "biz_xxxxxxxxxxxxxx"
            ],
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
            incorporationDate: Optional(Nullable<String>.value("2021-03-15")),
            kind: Optional(RetrieveVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("Webb")),
            owners: [
                RetrieveVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("1985-06-01"),
                    firstName: Nullable<String>.value("Riley"),
                    id: "own_xxxxxxxxxxxxxx",
                    lastName: Nullable<String>.value("Owner"),
                    ownershipPercentage: Nullable<Double>.value(60),
                    rejectedChecks: [
                        RetrieveVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("id_card_front"),
                            rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read."))
                        )
                    ],
                    roles: [
                        RetrieveVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: RetrieveVerificationsResponseOwnersItemStatus.notStarted
                )
            ],
            phone: Optional(Nullable<String>.value("+15551234567")),
            placeOfIncorporation: Optional(Nullable<String>.value("Delaware")),
            registrationNumber: Optional(Nullable<String>.value("7654321")),
            requestedInformation: Optional([
                RetrieveVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for"
                    ]),
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
                    responseType: Optional(RetrieveVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(RetrieveVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: .null,
                            contentType: Nullable<String>.value("application/pdf"),
                            createdAt: "2026-01-01T12:00:00.000Z",
                            durationSeconds: .null,
                            filename: Nullable<String>.value("evidence.pdf"),
                            height: .null,
                            id: "file_xxxxxxxxxxxxxx",
                            multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                            multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                )
                            ])),
                            object: "file",
                            removedByModeration: false,
                            size: Nullable<Int>.value(9670),
                            uploadHeaders: Optional([
                                "key": JSONValue.string("value")
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                            visibility: FileVisibility.public,
                            waveformUrl: .null,
                            width: .null
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for"
                    ]),
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_ids": [
                    "account_ids",
                    "account_ids"
                  ],
                  "address": {
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
                  "created_at": "created_at",
                  "date_of_birth": "date_of_birth",
                  "email": "email",
                  "first_name": "first_name",
                  "id": "id",
                  "incorporation_date": "incorporation_date",
                  "kind": "individual",
                  "last_name": "last_name",
                  "owners": [
                    {
                      "date_of_birth": "date_of_birth",
                      "first_name": "first_name",
                      "id": "id",
                      "last_name": "last_name",
                      "ownership_percentage": 1.1,
                      "rejected_checks": [
                        "details",
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "roles": [
                        "ubo",
                        "ubo"
                      ],
                      "status": "not_started"
                    },
                    {
                      "date_of_birth": "date_of_birth",
                      "first_name": "first_name",
                      "id": "id",
                      "last_name": "last_name",
                      "ownership_percentage": 1.1,
                      "rejected_checks": [
                        "details",
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "roles": [
                        "ubo",
                        "ubo"
                      ],
                      "status": "not_started"
                    }
                  ],
                  "phone": "phone",
                  "place_of_incorporation": "place_of_incorporation",
                  "registration_number": "registration_number",
                  "requested_information": [
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "alternative_document_label",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for",
                        "details_visible_for"
                      ],
                      "errors": [
                        {
                          "code": "code",
                          "reason": "reason"
                        },
                        {
                          "code": "code",
                          "reason": "reason"
                        }
                      ],
                      "id": "id",
                      "label": "label",
                      "optional": true,
                      "options": [
                        "options",
                        "options"
                      ],
                      "requirement": "requirement",
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                      ],
                      "type": "type"
                    },
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "alternative_document_label",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for",
                        "details_visible_for"
                      ],
                      "errors": [
                        {
                          "code": "code",
                          "reason": "reason"
                        },
                        {
                          "code": "code",
                          "reason": "reason"
                        }
                      ],
                      "id": "id",
                      "label": "label",
                      "optional": true,
                      "options": [
                        "options",
                        "options"
                      ],
                      "requirement": "requirement",
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                      ],
                      "type": "type"
                    }
                  ],
                  "required_documents": [
                    {
                      "document": "document",
                      "rejection_reason": "rejection_reason",
                      "status": "pending_upload"
                    },
                    {
                      "document": "document",
                      "rejection_reason": "rejection_reason",
                      "status": "pending_upload"
                    }
                  ],
                  "session_url": "session_url",
                  "status": "not_started",
                  "updated_at": "updated_at"
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
            accountIds: [
                "account_ids",
                "account_ids"
            ],
            address: Optional(Nullable<RetrieveVerificationsResponseAddress>.value(RetrieveVerificationsResponseAddress(
                city: Optional(Nullable<String>.value("city")),
                country: Optional(Nullable<String>.value("country")),
                line1: Optional("line1"),
                line2: Optional(Nullable<String>.value("line2")),
                postalCode: Optional(Nullable<String>.value("postal_code")),
                state: Optional(Nullable<String>.value("state"))
            ))),
            businessName: Optional(Nullable<String>.value("business_name")),
            businessStructure: Optional(Nullable<String>.value("business_structure")),
            country: Optional(Nullable<String>.value("country")),
            createdAt: Optional("created_at"),
            dateOfBirth: Optional(Nullable<String>.value("date_of_birth")),
            email: Optional(Nullable<String>.value("email")),
            firstName: Optional(Nullable<String>.value("first_name")),
            id: Optional("id"),
            incorporationDate: Optional(Nullable<String>.value("incorporation_date")),
            kind: Optional(RetrieveVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("last_name")),
            owners: [
                RetrieveVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    firstName: Nullable<String>.value("first_name"),
                    id: "id",
                    lastName: Nullable<String>.value("last_name"),
                    ownershipPercentage: Nullable<Double>.value(1.1),
                    rejectedChecks: [
                        RetrieveVerificationsResponseOwnersItemRejectedChecksItem.details,
                        RetrieveVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(RetrieveVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(RetrieveVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ],
                    roles: [
                        RetrieveVerificationsResponseOwnersItemRolesItem.ubo,
                        RetrieveVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: RetrieveVerificationsResponseOwnersItemStatus.notStarted
                ),
                RetrieveVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    firstName: Nullable<String>.value("first_name"),
                    id: "id",
                    lastName: Nullable<String>.value("last_name"),
                    ownershipPercentage: Nullable<Double>.value(1.1),
                    rejectedChecks: [
                        RetrieveVerificationsResponseOwnersItemRejectedChecksItem.details,
                        RetrieveVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(RetrieveVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        RetrieveVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(RetrieveVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ],
                    roles: [
                        RetrieveVerificationsResponseOwnersItemRolesItem.ubo,
                        RetrieveVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: RetrieveVerificationsResponseOwnersItemStatus.notStarted
                )
            ],
            phone: Optional(Nullable<String>.value("phone")),
            placeOfIncorporation: Optional(Nullable<String>.value("place_of_incorporation")),
            registrationNumber: Optional(Nullable<String>.value("registration_number")),
            requestedInformation: Optional([
                RetrieveVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("alternative_document_label"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for",
                        "details_visible_for"
                    ]),
                    errors: Optional([
                        RetrieveVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        ),
                        RetrieveVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        )
                    ]),
                    id: "id",
                    label: "label",
                    optional: Optional(true),
                    options: Optional([
                        "options",
                        "options"
                    ]),
                    requirement: "requirement",
                    responseType: Optional(RetrieveVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(RetrieveVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                    ]),
                    type: "type"
                ),
                RetrieveVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("alternative_document_label"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for",
                        "details_visible_for"
                    ]),
                    errors: Optional([
                        RetrieveVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        ),
                        RetrieveVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        )
                    ]),
                    id: "id",
                    label: "label",
                    optional: Optional(true),
                    options: Optional([
                        "options",
                        "options"
                    ]),
                    requirement: "requirement",
                    responseType: Optional(RetrieveVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(RetrieveVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                    ]),
                    type: "type"
                )
            ]),
            requiredDocuments: Optional([
                RetrieveVerificationsResponseRequiredDocumentsItem(
                    document: Optional("document"),
                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                    status: Optional(RetrieveVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                ),
                RetrieveVerificationsResponseRequiredDocumentsItem(
                    document: Optional("document"),
                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                    status: Optional(RetrieveVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                )
            ]),
            sessionUrl: Optional(Nullable<String>.value("session_url")),
            status: Optional(RetrieveVerificationsResponseStatus.notStarted),
            updatedAt: Optional("updated_at")
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
                  "account_ids": [
                    "biz_xxxxxxxxxxxxxx"
                  ],
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
                  "incorporation_date": "2021-03-15",
                  "kind": "individual",
                  "last_name": "Webb",
                  "owners": [
                    {
                      "date_of_birth": "1985-06-01",
                      "first_name": "Riley",
                      "id": "own_xxxxxxxxxxxxxx",
                      "last_name": "Owner",
                      "ownership_percentage": 60,
                      "rejected_checks": [
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "id_card_front",
                          "rejection_reason": "Document image was too blurry to read."
                        }
                      ],
                      "roles": [
                        "ubo"
                      ],
                      "status": "not_started"
                    }
                  ],
                  "phone": "+15551234567",
                  "place_of_incorporation": "Delaware",
                  "registration_number": "7654321",
                  "requested_information": [
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for"
                      ],
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
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": null,
                          "content_type": "application/pdf",
                          "created_at": "2026-01-01T12:00:00.000Z",
                          "duration_seconds": null,
                          "filename": "evidence.pdf",
                          "height": null,
                          "id": "file_xxxxxxxxxxxxxx",
                          "multipart_chunk_size": 5242880,
                          "multipart_upload_id": "upload-id",
                          "multipart_upload_urls": [
                            {
                              "part_number": 1,
                              "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            }
                          ],
                          "object": "file",
                          "removed_by_moderation": false,
                          "size": 9670,
                          "upload_headers": {
                            "key": "value"
                          },
                          "upload_status": "pending",
                          "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "visibility": "public",
                          "waveform_url": null,
                          "width": null
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for"
                      ],
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
            accountIds: [
                "biz_xxxxxxxxxxxxxx"
            ],
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
            incorporationDate: Optional(Nullable<String>.value("2021-03-15")),
            kind: Optional(UpdateVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("Webb")),
            owners: [
                UpdateVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("1985-06-01"),
                    firstName: Nullable<String>.value("Riley"),
                    id: "own_xxxxxxxxxxxxxx",
                    lastName: Nullable<String>.value("Owner"),
                    ownershipPercentage: Nullable<Double>.value(60),
                    rejectedChecks: [
                        UpdateVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        UpdateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("id_card_front"),
                            rejectionReason: Optional(Nullable<String>.value("Document image was too blurry to read."))
                        )
                    ],
                    roles: [
                        UpdateVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: UpdateVerificationsResponseOwnersItemStatus.notStarted
                )
            ],
            phone: Optional(Nullable<String>.value("+15551234567")),
            placeOfIncorporation: Optional(Nullable<String>.value("Delaware")),
            registrationNumber: Optional(Nullable<String>.value("7654321")),
            requestedInformation: Optional([
                UpdateVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("IRS EIN letter (CP 575 or 147C) that shows your business's legal name and your EIN on the same letter"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for"
                    ]),
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
                    responseType: Optional(UpdateVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(UpdateVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: .null,
                            contentType: Nullable<String>.value("application/pdf"),
                            createdAt: "2026-01-01T12:00:00.000Z",
                            durationSeconds: .null,
                            filename: Nullable<String>.value("evidence.pdf"),
                            height: .null,
                            id: "file_xxxxxxxxxxxxxx",
                            multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                            multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                )
                            ])),
                            object: "file",
                            removedByModeration: false,
                            size: Nullable<Int>.value(9670),
                            uploadHeaders: Optional([
                                "key": JSONValue.string("value")
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                            visibility: FileVisibility.public,
                            waveformUrl: .null,
                            width: .null
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for"
                    ]),
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

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_ids": [
                    "account_ids",
                    "account_ids"
                  ],
                  "address": {
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
                  "created_at": "created_at",
                  "date_of_birth": "date_of_birth",
                  "email": "email",
                  "first_name": "first_name",
                  "id": "id",
                  "incorporation_date": "incorporation_date",
                  "kind": "individual",
                  "last_name": "last_name",
                  "owners": [
                    {
                      "date_of_birth": "date_of_birth",
                      "first_name": "first_name",
                      "id": "id",
                      "last_name": "last_name",
                      "ownership_percentage": 1.1,
                      "rejected_checks": [
                        "details",
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "roles": [
                        "ubo",
                        "ubo"
                      ],
                      "status": "not_started"
                    },
                    {
                      "date_of_birth": "date_of_birth",
                      "first_name": "first_name",
                      "id": "id",
                      "last_name": "last_name",
                      "ownership_percentage": 1.1,
                      "rejected_checks": [
                        "details",
                        "details"
                      ],
                      "required_documents": [
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        },
                        {
                          "document": "document",
                          "rejection_reason": "rejection_reason",
                          "status": "pending_upload"
                        }
                      ],
                      "roles": [
                        "ubo",
                        "ubo"
                      ],
                      "status": "not_started"
                    }
                  ],
                  "phone": "phone",
                  "place_of_incorporation": "place_of_incorporation",
                  "registration_number": "registration_number",
                  "requested_information": [
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "alternative_document_label",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for",
                        "details_visible_for"
                      ],
                      "errors": [
                        {
                          "code": "code",
                          "reason": "reason"
                        },
                        {
                          "code": "code",
                          "reason": "reason"
                        }
                      ],
                      "id": "id",
                      "label": "label",
                      "optional": true,
                      "options": [
                        "options",
                        "options"
                      ],
                      "requirement": "requirement",
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                      ],
                      "type": "type"
                    },
                    {
                      "action_url": "action_url",
                      "alternative_document_label": "alternative_document_label",
                      "details_label": "details_label",
                      "details_required": true,
                      "details_visible_for": [
                        "details_visible_for",
                        "details_visible_for"
                      ],
                      "errors": [
                        {
                          "code": "code",
                          "reason": "reason"
                        },
                        {
                          "code": "code",
                          "reason": "reason"
                        }
                      ],
                      "id": "id",
                      "label": "label",
                      "optional": true,
                      "options": [
                        "options",
                        "options"
                      ],
                      "requirement": "requirement",
                      "response_type": "yes_no",
                      "selection_mode": "single",
                      "supporting_documents": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "supporting_files_explanation_allowed": true,
                      "supporting_files_required": true,
                      "supporting_files_visible_for": [
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                      ],
                      "type": "type"
                    }
                  ],
                  "required_documents": [
                    {
                      "document": "document",
                      "rejection_reason": "rejection_reason",
                      "status": "pending_upload"
                    },
                    {
                      "document": "document",
                      "rejection_reason": "rejection_reason",
                      "status": "pending_upload"
                    }
                  ],
                  "session_url": "session_url",
                  "status": "not_started",
                  "updated_at": "updated_at"
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
            accountIds: [
                "account_ids",
                "account_ids"
            ],
            address: Optional(Nullable<UpdateVerificationsResponseAddress>.value(UpdateVerificationsResponseAddress(
                city: Optional(Nullable<String>.value("city")),
                country: Optional(Nullable<String>.value("country")),
                line1: Optional("line1"),
                line2: Optional(Nullable<String>.value("line2")),
                postalCode: Optional(Nullable<String>.value("postal_code")),
                state: Optional(Nullable<String>.value("state"))
            ))),
            businessName: Optional(Nullable<String>.value("business_name")),
            businessStructure: Optional(Nullable<String>.value("business_structure")),
            country: Optional(Nullable<String>.value("country")),
            createdAt: Optional("created_at"),
            dateOfBirth: Optional(Nullable<String>.value("date_of_birth")),
            email: Optional(Nullable<String>.value("email")),
            firstName: Optional(Nullable<String>.value("first_name")),
            id: Optional("id"),
            incorporationDate: Optional(Nullable<String>.value("incorporation_date")),
            kind: Optional(UpdateVerificationsResponseKind.individual),
            lastName: Optional(Nullable<String>.value("last_name")),
            owners: [
                UpdateVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    firstName: Nullable<String>.value("first_name"),
                    id: "id",
                    lastName: Nullable<String>.value("last_name"),
                    ownershipPercentage: Nullable<Double>.value(1.1),
                    rejectedChecks: [
                        UpdateVerificationsResponseOwnersItemRejectedChecksItem.details,
                        UpdateVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        UpdateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(UpdateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        UpdateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(UpdateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ],
                    roles: [
                        UpdateVerificationsResponseOwnersItemRolesItem.ubo,
                        UpdateVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: UpdateVerificationsResponseOwnersItemStatus.notStarted
                ),
                UpdateVerificationsResponseOwnersItem(
                    dateOfBirth: Nullable<String>.value("date_of_birth"),
                    firstName: Nullable<String>.value("first_name"),
                    id: "id",
                    lastName: Nullable<String>.value("last_name"),
                    ownershipPercentage: Nullable<Double>.value(1.1),
                    rejectedChecks: [
                        UpdateVerificationsResponseOwnersItemRejectedChecksItem.details,
                        UpdateVerificationsResponseOwnersItemRejectedChecksItem.details
                    ],
                    requiredDocuments: [
                        UpdateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(UpdateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        ),
                        UpdateVerificationsResponseOwnersItemRequiredDocumentsItem(
                            document: Optional("document"),
                            rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                            status: Optional(UpdateVerificationsResponseOwnersItemRequiredDocumentsItemStatus.pendingUpload)
                        )
                    ],
                    roles: [
                        UpdateVerificationsResponseOwnersItemRolesItem.ubo,
                        UpdateVerificationsResponseOwnersItemRolesItem.ubo
                    ],
                    status: UpdateVerificationsResponseOwnersItemStatus.notStarted
                )
            ],
            phone: Optional(Nullable<String>.value("phone")),
            placeOfIncorporation: Optional(Nullable<String>.value("place_of_incorporation")),
            registrationNumber: Optional(Nullable<String>.value("registration_number")),
            requestedInformation: Optional([
                UpdateVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("alternative_document_label"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for",
                        "details_visible_for"
                    ]),
                    errors: Optional([
                        UpdateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        ),
                        UpdateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        )
                    ]),
                    id: "id",
                    label: "label",
                    optional: Optional(true),
                    options: Optional([
                        "options",
                        "options"
                    ]),
                    requirement: "requirement",
                    responseType: Optional(UpdateVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(UpdateVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                    ]),
                    type: "type"
                ),
                UpdateVerificationsResponseRequestedInformationItem(
                    actionUrl: Optional("action_url"),
                    alternativeDocumentLabel: Optional("alternative_document_label"),
                    detailsLabel: Optional("details_label"),
                    detailsRequired: Optional(true),
                    detailsVisibleFor: Optional([
                        "details_visible_for",
                        "details_visible_for"
                    ]),
                    errors: Optional([
                        UpdateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        ),
                        UpdateVerificationsResponseRequestedInformationItemErrorsItem(
                            code: Optional("code"),
                            reason: Optional("reason")
                        )
                    ]),
                    id: "id",
                    label: "label",
                    optional: Optional(true),
                    options: Optional([
                        "options",
                        "options"
                    ]),
                    requirement: "requirement",
                    responseType: Optional(UpdateVerificationsResponseRequestedInformationItemResponseType.yesNo),
                    selectionMode: Optional(UpdateVerificationsResponseRequestedInformationItemSelectionMode.single),
                    supportingDocuments: Optional([
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ]),
                    supportingFilesExplanationAllowed: Optional(true),
                    supportingFilesRequired: Optional(true),
                    supportingFilesVisibleFor: Optional([
                        "supporting_files_visible_for",
                        "supporting_files_visible_for"
                    ]),
                    type: "type"
                )
            ]),
            requiredDocuments: Optional([
                UpdateVerificationsResponseRequiredDocumentsItem(
                    document: Optional("document"),
                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                    status: Optional(UpdateVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                ),
                UpdateVerificationsResponseRequiredDocumentsItem(
                    document: Optional("document"),
                    rejectionReason: Optional(Nullable<String>.value("rejection_reason")),
                    status: Optional(UpdateVerificationsResponseRequiredDocumentsItemStatus.pendingUpload)
                )
            ]),
            sessionUrl: Optional(Nullable<String>.value("session_url")),
            status: Optional(UpdateVerificationsResponseStatus.notStarted),
            updatedAt: Optional("updated_at")
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