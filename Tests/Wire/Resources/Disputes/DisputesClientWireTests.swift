import Foundation
import Testing
import WhopSDK

@Suite("DisputesClient Wire Tests") struct DisputesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "acceptable": true,
                      "account_id": "biz_xxxxxxxxxxxxxx",
                      "amount": 150,
                      "buyer": {
                        "email": "marcus@shinetime.example",
                        "member_id": "mber_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "user_id": "user_xxxxxxxxxxxxxx",
                        "username": "danawhitfield"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "evidence": {
                        "access_activity_log": "Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file.",
                        "billing_address": "4180 Burnet Rd, Austin, TX 78756, US",
                        "cancellation_policy_attachment": {
                          "content_type": "image/png",
                          "filename": "booking-confirmation-email.png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "platform": false,
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        },
                        "cancellation_policy_disclosure": "Shown at checkout and again in the booking confirmation email.",
                        "customer_communication_attachment": {
                          "content_type": "image/png",
                          "filename": "booking-confirmation-email.png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "platform": false,
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        },
                        "customer_email_address": "marcus@shinetime.example",
                        "customer_name": "Dana Whitfield",
                        "documents": [
                          {
                            "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                            "content_type": null,
                            "created_at": "2026-01-01T12:00:00.000Z",
                            "document_type": "return_policy",
                            "duration_seconds": null,
                            "filename": "customer-order-history.png",
                            "height": 100,
                            "id": "file_xxxxxxxxxxxxxx",
                            "multipart_upload_urls": [
                              {
                                "part_number": 1,
                                "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                              }
                            ],
                            "object": "file",
                            "removed_by_moderation": false,
                            "size": 1024,
                            "upload_status": "pending",
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                            "visibility": "public",
                            "waveform_url": null,
                            "width": 100
                          }
                        ],
                        "notes": "Two-day ceramic coating completed and collected. Before and after photos attached.",
                        "product_description": "Two-stage paint correction with a three-year ceramic coating.",
                        "refund_policy_attachment": {
                          "content_type": "image/png",
                          "filename": "booking-confirmation-email.png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "platform": false,
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        },
                        "refund_policy_disclosure": "Linked from the booking page and accepted at checkout.",
                        "refund_refusal_explanation": "Work was completed and the vehicle collected, so the deposit is non-refundable.",
                        "service_date": "2026-01-01",
                        "uncategorized_attachment": {
                          "content_type": "image/png",
                          "filename": "booking-confirmation-email.png",
                          "id": "file_xxxxxxxxxxxxxx",
                          "platform": false,
                          "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                        }
                      },
                      "evidence_due_at": "2026-01-01T12:00:00.000Z",
                      "evidence_editable": true,
                      "evidence_locked_reason": "submitted",
                      "evidence_submitted_at": "evidence_submitted_at",
                      "fee": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "fee_charged": true,
                      "id": "dspt_xxxxxxxxxxxxxx",
                      "inquiry": false,
                      "issuer_comments": [
                        {
                          "received_at": "2026-01-01T12:00:00.000Z",
                          "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                        }
                      ],
                      "line_items": [
                        {
                          "id": "li_xxxxxxxxxxxxxx",
                          "label": "Ceramic Coating Package",
                          "product_id": "prod_xxxxxxxxxxxxxx",
                          "product_title": "Ceramic Coating Package",
                          "quantity": 1,
                          "sku": null,
                          "subtotal": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "variant_id": "plan_xxxxxxxxxxxxxx",
                          "variant_title": "Ceramic Coating — Full Vehicle"
                        }
                      ],
                      "payment": {
                        "amount": 249,
                        "card_brand": "visa",
                        "card_last4": "4242",
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "currency": "usd",
                        "id": "pay_xxxxxxxxxxxxxx",
                        "payment_instrument": {
                          "card": {
                            "brand": "visa",
                            "exp_month": 10,
                            "exp_year": 2031,
                            "issuer_identification_number": "41111111",
                            "last4": "4242",
                            "network_transaction_id": "016153570198200"
                          },
                          "display_name": "Visa •••• 4242",
                          "icons": {
                            "card": {
                              "dark": {
                                "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                              },
                              "light": {
                                "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                              }
                            },
                            "square": {
                              "dark": {
                                "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                              },
                              "light": {
                                "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                              }
                            }
                          },
                          "installment_count": null,
                          "payment_method_type": "card"
                        },
                        "payment_method_type": "card",
                        "payment_processor": null
                      },
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "reason": "fraudulent",
                      "reason_code": "13.1",
                      "status": "needs_response",
                      "submission_failure_reason": "submission_failure_reason",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "variant_id": "plan_xxxxxxxxxxxxxx"
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
        let expectedResponse = ListDisputesResponse(
            data: [
                Dispute(
                    acceptable: true,
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    amount: 150,
                    buyer: DisputeBuyer(
                        email: Nullable<String>.value("marcus@shinetime.example"),
                        memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                        name: Nullable<String>.value("Dana Whitfield"),
                        userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                        username: Nullable<String>.value("danawhitfield")
                    ),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    evidence: DisputeEvidence(
                        accessActivityLog: Nullable<String>.value("Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file."),
                        billingAddress: Nullable<String>.value("4180 Burnet Rd, Austin, TX 78756, US"),
                        cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("image/png"),
                            filename: Nullable<String>.value("booking-confirmation-email.png"),
                            id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                            platform: false,
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )),
                        cancellationPolicyDisclosure: Nullable<String>.value("Shown at checkout and again in the booking confirmation email."),
                        customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("image/png"),
                            filename: Nullable<String>.value("booking-confirmation-email.png"),
                            id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                            platform: false,
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )),
                        customerEmailAddress: Nullable<String>.value("marcus@shinetime.example"),
                        customerName: Nullable<String>.value("Dana Whitfield"),
                        documents: [
                            DisputeEvidenceDocument(
                                blurhash: Nullable<String>.value("LA6bDXT$E3b:R6i+RibEIWbp%ej1"),
                                contentType: .null,
                                createdAt: "2026-01-01T12:00:00.000Z",
                                documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                                durationSeconds: .null,
                                filename: Nullable<String>.value("customer-order-history.png"),
                                height: Nullable<Int>.value(100),
                                id: "file_xxxxxxxxxxxxxx",
                                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                    )
                                ])),
                                object: "file",
                                removedByModeration: false,
                                size: Nullable<Int>.value(1024),
                                uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                                visibility: DisputeEvidenceDocumentVisibility.public,
                                waveformUrl: .null,
                                width: Nullable<Int>.value(100)
                            )
                        ],
                        notes: Nullable<String>.value("Two-day ceramic coating completed and collected. Before and after photos attached."),
                        productDescription: Nullable<String>.value("Two-stage paint correction with a three-year ceramic coating."),
                        refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("image/png"),
                            filename: Nullable<String>.value("booking-confirmation-email.png"),
                            id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                            platform: false,
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        )),
                        refundPolicyDisclosure: Nullable<String>.value("Linked from the booking page and accepted at checkout."),
                        refundRefusalExplanation: Nullable<String>.value("Work was completed and the vehicle collected, so the deposit is non-refundable."),
                        serviceDate: Nullable<String>.value("2026-01-01"),
                        uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("image/png"),
                            filename: Nullable<String>.value("booking-confirmation-email.png"),
                            id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                            platform: false,
                            url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                        ))
                    ),
                    evidenceDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    evidenceEditable: true,
                    evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
                    evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
                    fee: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    feeCharged: true,
                    id: "dspt_xxxxxxxxxxxxxx",
                    inquiry: false,
                    issuerComments: [
                        DisputeIssuerComment(
                            receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                            text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                        )
                    ],
                    lineItems: [
                        ReceiptLineItem(
                            id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                            label: Nullable<String>.value("Ceramic Coating Package"),
                            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                            productTitle: Nullable<String>.value("Ceramic Coating Package"),
                            quantity: 1,
                            sku: .null,
                            subtotal: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                            variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                        )
                    ],
                    payment: DisputePayment(
                        amount: Nullable<Double>.value(249),
                        cardBrand: Nullable<String>.value("visa"),
                        cardLast4: Nullable<String>.value("4242"),
                        createdAt: "2026-01-01T12:00:00.000Z",
                        currency: Nullable<String>.value("usd"),
                        id: "pay_xxxxxxxxxxxxxx",
                        paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                            card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                                brand: Nullable<String>.value("visa"),
                                expMonth: Nullable<Double>.value(10),
                                expYear: Nullable<Double>.value(2031),
                                issuerIdentificationNumber: Nullable<String>.value("41111111"),
                                last4: Nullable<String>.value("4242"),
                                networkTransactionId: Nullable<String>.value("016153570198200")
                            )),
                            displayName: "Visa •••• 4242",
                            icons: PaymentMethodIcons(
                                card: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                    )
                                ),
                                square: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                                    )
                                )
                            ),
                            installmentCount: .null,
                            paymentMethodType: "card"
                        )),
                        paymentMethodType: Nullable<String>.value("card"),
                        paymentProcessor: .null
                    ),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    reason: DisputeReason.fraudulent,
                    reasonCode: Nullable<String>.value("13.1"),
                    status: DisputeStatus.needsResponse,
                    submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
                )
            ],
            pageInfo: ListDisputesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.disputes.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func summary1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "groups": {
                    "currency": {
                      "usd": 1
                    },
                    "status": {
                      "generating_response": 0,
                      "lost": 0,
                      "needs_response": 1,
                      "prevented": 0,
                      "under_review": 0,
                      "warning_closed": 0,
                      "warning_needs_response": 0,
                      "warning_under_review": 0,
                      "won": 0
                    }
                  },
                  "total": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SummaryDisputesResponse(
            groups: SummaryDisputesResponseGroups(
                currency: Optional([
                    "usd": 1
                ]),
                status: Optional(SummaryDisputesResponseGroupsStatus(
                    generatingResponse: 0,
                    lost: 0,
                    needsResponse: 1,
                    prevented: 0,
                    underReview: 0,
                    warningClosed: 0,
                    warningNeedsResponse: 0,
                    warningUnderReview: 0,
                    won: 0
                ))
            ),
            total: 1
        )
        let response = try await client.disputes.summary(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": 150,
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "evidence": {
                    "access_activity_log": "Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file.",
                    "billing_address": "4180 Burnet Rd, Austin, TX 78756, US",
                    "cancellation_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "cancellation_policy_disclosure": "Shown at checkout and again in the booking confirmation email.",
                    "customer_communication_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "customer_email_address": "marcus@shinetime.example",
                    "customer_name": "Dana Whitfield",
                    "documents": [
                      {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "content_type": null,
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "document_type": "return_policy",
                        "duration_seconds": null,
                        "filename": "customer-order-history.png",
                        "height": 100,
                        "id": "file_xxxxxxxxxxxxxx",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                          }
                        ],
                        "object": "file",
                        "removed_by_moderation": false,
                        "size": 1024,
                        "upload_status": "pending",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "visibility": "public",
                        "waveform_url": null,
                        "width": 100
                      }
                    ],
                    "notes": "Two-day ceramic coating completed and collected. Before and after photos attached.",
                    "product_description": "Two-stage paint correction with a three-year ceramic coating.",
                    "refund_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "refund_policy_disclosure": "Linked from the booking page and accepted at checkout.",
                    "refund_refusal_explanation": "Work was completed and the vehicle collected, so the deposit is non-refundable.",
                    "service_date": "2026-01-01",
                    "uncategorized_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  },
                  "evidence_due_at": "2026-01-01T12:00:00.000Z",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "fee_charged": true,
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "payment": {
                    "amount": 249,
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "currency": "usd",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_instrument": {
                      "card": {
                        "brand": "visa",
                        "exp_month": 10,
                        "exp_year": 2031,
                        "issuer_identification_number": "41111111",
                        "last4": "4242",
                        "network_transaction_id": "016153570198200"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Dispute(
            acceptable: true,
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file."),
                billingAddress: Nullable<String>.value("4180 Burnet Rd, Austin, TX 78756, US"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("Shown at checkout and again in the booking confirmation email."),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                customerEmailAddress: Nullable<String>.value("marcus@shinetime.example"),
                customerName: Nullable<String>.value("Dana Whitfield"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("LA6bDXT$E3b:R6i+RibEIWbp%ej1"),
                        contentType: .null,
                        createdAt: "2026-01-01T12:00:00.000Z",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: .null,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        height: Nullable<Int>.value(100),
                        id: "file_xxxxxxxxxxxxxx",
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            )
                        ])),
                        object: "file",
                        removedByModeration: false,
                        size: Nullable<Int>.value(1024),
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: .null,
                        width: Nullable<Int>.value(100)
                    )
                ],
                notes: Nullable<String>.value("Two-day ceramic coating completed and collected. Before and after photos attached."),
                productDescription: Nullable<String>.value("Two-stage paint correction with a three-year ceramic coating."),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                refundPolicyDisclosure: Nullable<String>.value("Linked from the booking page and accepted at checkout."),
                refundRefusalExplanation: Nullable<String>.value("Work was completed and the vehicle collected, so the deposit is non-refundable."),
                serviceDate: Nullable<String>.value("2026-01-01"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            feeCharged: true,
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("visa"),
                        expMonth: Nullable<Double>.value(10),
                        expYear: Nullable<Double>.value(2031),
                        issuerIdentificationNumber: Nullable<String>.value("41111111"),
                        last4: Nullable<String>.value("4242"),
                        networkTransactionId: Nullable<String>.value("016153570198200")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.disputes.retrieve(
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
                  "acceptable": true,
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": 150,
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "evidence": {
                    "access_activity_log": "Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file.",
                    "billing_address": "4180 Burnet Rd, Austin, TX 78756, US",
                    "cancellation_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "cancellation_policy_disclosure": "Shown at checkout and again in the booking confirmation email.",
                    "customer_communication_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "customer_email_address": "marcus@shinetime.example",
                    "customer_name": "Dana Whitfield",
                    "documents": [
                      {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "content_type": null,
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "document_type": "return_policy",
                        "duration_seconds": null,
                        "filename": "customer-order-history.png",
                        "height": 100,
                        "id": "file_xxxxxxxxxxxxxx",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                          }
                        ],
                        "object": "file",
                        "removed_by_moderation": false,
                        "size": 1024,
                        "upload_status": "pending",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "visibility": "public",
                        "waveform_url": null,
                        "width": 100
                      }
                    ],
                    "notes": "Two-day ceramic coating completed and collected. Before and after photos attached.",
                    "product_description": "Two-stage paint correction with a three-year ceramic coating.",
                    "refund_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "refund_policy_disclosure": "Linked from the booking page and accepted at checkout.",
                    "refund_refusal_explanation": "Work was completed and the vehicle collected, so the deposit is non-refundable.",
                    "service_date": "2026-01-01",
                    "uncategorized_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  },
                  "evidence_due_at": "2026-01-01T12:00:00.000Z",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "fee_charged": true,
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "payment": {
                    "amount": 249,
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "currency": "usd",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_instrument": {
                      "card": {
                        "brand": "visa",
                        "exp_month": 10,
                        "exp_year": 2031,
                        "issuer_identification_number": "41111111",
                        "last4": "4242",
                        "network_transaction_id": "016153570198200"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Dispute(
            acceptable: true,
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file."),
                billingAddress: Nullable<String>.value("4180 Burnet Rd, Austin, TX 78756, US"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("Shown at checkout and again in the booking confirmation email."),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                customerEmailAddress: Nullable<String>.value("marcus@shinetime.example"),
                customerName: Nullable<String>.value("Dana Whitfield"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("LA6bDXT$E3b:R6i+RibEIWbp%ej1"),
                        contentType: .null,
                        createdAt: "2026-01-01T12:00:00.000Z",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: .null,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        height: Nullable<Int>.value(100),
                        id: "file_xxxxxxxxxxxxxx",
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            )
                        ])),
                        object: "file",
                        removedByModeration: false,
                        size: Nullable<Int>.value(1024),
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: .null,
                        width: Nullable<Int>.value(100)
                    )
                ],
                notes: Nullable<String>.value("Two-day ceramic coating completed and collected. Before and after photos attached."),
                productDescription: Nullable<String>.value("Two-stage paint correction with a three-year ceramic coating."),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                refundPolicyDisclosure: Nullable<String>.value("Linked from the booking page and accepted at checkout."),
                refundRefusalExplanation: Nullable<String>.value("Work was completed and the vehicle collected, so the deposit is non-refundable."),
                serviceDate: Nullable<String>.value("2026-01-01"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            feeCharged: true,
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("visa"),
                        expMonth: Nullable<Double>.value(10),
                        expYear: Nullable<Double>.value(2031),
                        issuerIdentificationNumber: Nullable<String>.value("41111111"),
                        last4: Nullable<String>.value("4242"),
                        networkTransactionId: Nullable<String>.value("016153570198200")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.disputes.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func accept1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": 150,
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "evidence": {
                    "access_activity_log": "Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file.",
                    "billing_address": "4180 Burnet Rd, Austin, TX 78756, US",
                    "cancellation_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "cancellation_policy_disclosure": "Shown at checkout and again in the booking confirmation email.",
                    "customer_communication_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "customer_email_address": "marcus@shinetime.example",
                    "customer_name": "Dana Whitfield",
                    "documents": [
                      {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "content_type": null,
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "document_type": "return_policy",
                        "duration_seconds": null,
                        "filename": "customer-order-history.png",
                        "height": 100,
                        "id": "file_xxxxxxxxxxxxxx",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                          }
                        ],
                        "object": "file",
                        "removed_by_moderation": false,
                        "size": 1024,
                        "upload_status": "pending",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "visibility": "public",
                        "waveform_url": null,
                        "width": 100
                      }
                    ],
                    "notes": "Two-day ceramic coating completed and collected. Before and after photos attached.",
                    "product_description": "Two-stage paint correction with a three-year ceramic coating.",
                    "refund_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "refund_policy_disclosure": "Linked from the booking page and accepted at checkout.",
                    "refund_refusal_explanation": "Work was completed and the vehicle collected, so the deposit is non-refundable.",
                    "service_date": "2026-01-01",
                    "uncategorized_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  },
                  "evidence_due_at": "2026-01-01T12:00:00.000Z",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "fee_charged": true,
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "payment": {
                    "amount": 249,
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "currency": "usd",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_instrument": {
                      "card": {
                        "brand": "visa",
                        "exp_month": 10,
                        "exp_year": 2031,
                        "issuer_identification_number": "41111111",
                        "last4": "4242",
                        "network_transaction_id": "016153570198200"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Dispute(
            acceptable: true,
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file."),
                billingAddress: Nullable<String>.value("4180 Burnet Rd, Austin, TX 78756, US"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("Shown at checkout and again in the booking confirmation email."),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                customerEmailAddress: Nullable<String>.value("marcus@shinetime.example"),
                customerName: Nullable<String>.value("Dana Whitfield"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("LA6bDXT$E3b:R6i+RibEIWbp%ej1"),
                        contentType: .null,
                        createdAt: "2026-01-01T12:00:00.000Z",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: .null,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        height: Nullable<Int>.value(100),
                        id: "file_xxxxxxxxxxxxxx",
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            )
                        ])),
                        object: "file",
                        removedByModeration: false,
                        size: Nullable<Int>.value(1024),
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: .null,
                        width: Nullable<Int>.value(100)
                    )
                ],
                notes: Nullable<String>.value("Two-day ceramic coating completed and collected. Before and after photos attached."),
                productDescription: Nullable<String>.value("Two-stage paint correction with a three-year ceramic coating."),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                refundPolicyDisclosure: Nullable<String>.value("Linked from the booking page and accepted at checkout."),
                refundRefusalExplanation: Nullable<String>.value("Work was completed and the vehicle collected, so the deposit is non-refundable."),
                serviceDate: Nullable<String>.value("2026-01-01"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            feeCharged: true,
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("visa"),
                        expMonth: Nullable<Double>.value(10),
                        expYear: Nullable<Double>.value(2031),
                        issuerIdentificationNumber: Nullable<String>.value("41111111"),
                        last4: Nullable<String>.value("4242"),
                        networkTransactionId: Nullable<String>.value("016153570198200")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.disputes.accept(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func submit1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": 150,
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "evidence": {
                    "access_activity_log": "Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file.",
                    "billing_address": "4180 Burnet Rd, Austin, TX 78756, US",
                    "cancellation_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "cancellation_policy_disclosure": "Shown at checkout and again in the booking confirmation email.",
                    "customer_communication_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "customer_email_address": "marcus@shinetime.example",
                    "customer_name": "Dana Whitfield",
                    "documents": [
                      {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "content_type": null,
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "document_type": "return_policy",
                        "duration_seconds": null,
                        "filename": "customer-order-history.png",
                        "height": 100,
                        "id": "file_xxxxxxxxxxxxxx",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                          }
                        ],
                        "object": "file",
                        "removed_by_moderation": false,
                        "size": 1024,
                        "upload_status": "pending",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "visibility": "public",
                        "waveform_url": null,
                        "width": 100
                      }
                    ],
                    "notes": "Two-day ceramic coating completed and collected. Before and after photos attached.",
                    "product_description": "Two-stage paint correction with a three-year ceramic coating.",
                    "refund_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "refund_policy_disclosure": "Linked from the booking page and accepted at checkout.",
                    "refund_refusal_explanation": "Work was completed and the vehicle collected, so the deposit is non-refundable.",
                    "service_date": "2026-01-01",
                    "uncategorized_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  },
                  "evidence_due_at": "2026-01-01T12:00:00.000Z",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "fee_charged": true,
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "payment": {
                    "amount": 249,
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "currency": "usd",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_instrument": {
                      "card": {
                        "brand": "visa",
                        "exp_month": 10,
                        "exp_year": 2031,
                        "issuer_identification_number": "41111111",
                        "last4": "4242",
                        "network_transaction_id": "016153570198200"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Dispute(
            acceptable: true,
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file."),
                billingAddress: Nullable<String>.value("4180 Burnet Rd, Austin, TX 78756, US"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("Shown at checkout and again in the booking confirmation email."),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                customerEmailAddress: Nullable<String>.value("marcus@shinetime.example"),
                customerName: Nullable<String>.value("Dana Whitfield"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("LA6bDXT$E3b:R6i+RibEIWbp%ej1"),
                        contentType: .null,
                        createdAt: "2026-01-01T12:00:00.000Z",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: .null,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        height: Nullable<Int>.value(100),
                        id: "file_xxxxxxxxxxxxxx",
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            )
                        ])),
                        object: "file",
                        removedByModeration: false,
                        size: Nullable<Int>.value(1024),
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: .null,
                        width: Nullable<Int>.value(100)
                    )
                ],
                notes: Nullable<String>.value("Two-day ceramic coating completed and collected. Before and after photos attached."),
                productDescription: Nullable<String>.value("Two-stage paint correction with a three-year ceramic coating."),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                refundPolicyDisclosure: Nullable<String>.value("Linked from the booking page and accepted at checkout."),
                refundRefusalExplanation: Nullable<String>.value("Work was completed and the vehicle collected, so the deposit is non-refundable."),
                serviceDate: Nullable<String>.value("2026-01-01"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            feeCharged: true,
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("visa"),
                        expMonth: Nullable<Double>.value(10),
                        expYear: Nullable<Double>.value(2031),
                        issuerIdentificationNumber: Nullable<String>.value("41111111"),
                        last4: Nullable<String>.value("4242"),
                        networkTransactionId: Nullable<String>.value("016153570198200")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.disputes.submit(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func uploadEvidence1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": 150,
                  "buyer": {
                    "email": "marcus@shinetime.example",
                    "member_id": "mber_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "user_id": "user_xxxxxxxxxxxxxx",
                    "username": "danawhitfield"
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "evidence": {
                    "access_activity_log": "Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file.",
                    "billing_address": "4180 Burnet Rd, Austin, TX 78756, US",
                    "cancellation_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "cancellation_policy_disclosure": "Shown at checkout and again in the booking confirmation email.",
                    "customer_communication_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "customer_email_address": "marcus@shinetime.example",
                    "customer_name": "Dana Whitfield",
                    "documents": [
                      {
                        "blurhash": "LA6bDXT$E3b:R6i+RibEIWbp%ej1",
                        "content_type": null,
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "document_type": "return_policy",
                        "duration_seconds": null,
                        "filename": "customer-order-history.png",
                        "height": 100,
                        "id": "file_xxxxxxxxxxxxxx",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                          }
                        ],
                        "object": "file",
                        "removed_by_moderation": false,
                        "size": 1024,
                        "upload_status": "pending",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "visibility": "public",
                        "waveform_url": null,
                        "width": 100
                      }
                    ],
                    "notes": "Two-day ceramic coating completed and collected. Before and after photos attached.",
                    "product_description": "Two-stage paint correction with a three-year ceramic coating.",
                    "refund_policy_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    },
                    "refund_policy_disclosure": "Linked from the booking page and accepted at checkout.",
                    "refund_refusal_explanation": "Work was completed and the vehicle collected, so the deposit is non-refundable.",
                    "service_date": "2026-01-01",
                    "uncategorized_attachment": {
                      "content_type": "image/png",
                      "filename": "booking-confirmation-email.png",
                      "id": "file_xxxxxxxxxxxxxx",
                      "platform": false,
                      "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    }
                  },
                  "evidence_due_at": "2026-01-01T12:00:00.000Z",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "-1234.56",
                    "currency": "usd",
                    "decimals": 2,
                    "display_decimals": 2
                  },
                  "fee_charged": true,
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "li_xxxxxxxxxxxxxx",
                      "label": "Ceramic Coating Package",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "product_title": "Ceramic Coating Package",
                      "quantity": 1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "variant_id": "plan_xxxxxxxxxxxxxx",
                      "variant_title": "Ceramic Coating — Full Vehicle"
                    }
                  ],
                  "payment": {
                    "amount": 249,
                    "card_brand": "visa",
                    "card_last4": "4242",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "currency": "usd",
                    "id": "pay_xxxxxxxxxxxxxx",
                    "payment_instrument": {
                      "card": {
                        "brand": "visa",
                        "exp_month": 10,
                        "exp_year": 2031,
                        "issuer_identification_number": "41111111",
                        "last4": "4242",
                        "network_transaction_id": "016153570198200"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "variant_id": "plan_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Dispute(
            acceptable: true,
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            ),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("Vehicle checked in 2026-01-04 09:02, released 2026-01-05 16:40. Signed release on file."),
                billingAddress: Nullable<String>.value("4180 Burnet Rd, Austin, TX 78756, US"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("Shown at checkout and again in the booking confirmation email."),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                customerEmailAddress: Nullable<String>.value("marcus@shinetime.example"),
                customerName: Nullable<String>.value("Dana Whitfield"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("LA6bDXT$E3b:R6i+RibEIWbp%ej1"),
                        contentType: .null,
                        createdAt: "2026-01-01T12:00:00.000Z",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: .null,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        height: Nullable<Int>.value(100),
                        id: "file_xxxxxxxxxxxxxx",
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            )
                        ])),
                        object: "file",
                        removedByModeration: false,
                        size: Nullable<Int>.value(1024),
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: .null,
                        width: Nullable<Int>.value(100)
                    )
                ],
                notes: Nullable<String>.value("Two-day ceramic coating completed and collected. Before and after photos attached."),
                productDescription: Nullable<String>.value("Two-stage paint correction with a three-year ceramic coating."),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                )),
                refundPolicyDisclosure: Nullable<String>.value("Linked from the booking page and accepted at checkout."),
                refundRefusalExplanation: Nullable<String>.value("Work was completed and the vehicle collected, so the deposit is non-refundable."),
                serviceDate: Nullable<String>.value("2026-01-01"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("image/png"),
                    filename: Nullable<String>.value("booking-confirmation-email.png"),
                    id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                    platform: false,
                    url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "-1234.56",
                currency: "usd",
                decimals: 2,
                displayDecimals: 2
            )),
            feeCharged: true,
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("li_xxxxxxxxxxxxxx"),
                    label: Nullable<String>.value("Ceramic Coating Package"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    productTitle: Nullable<String>.value("Ceramic Coating Package"),
                    quantity: 1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    variantTitle: Nullable<String>.value("Ceramic Coating — Full Vehicle")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("visa"),
                        expMonth: Nullable<Double>.value(10),
                        expYear: Nullable<Double>.value(2031),
                        issuerIdentificationNumber: Nullable<String>.value("41111111"),
                        last4: Nullable<String>.value("4242"),
                        networkTransactionId: Nullable<String>.value("016153570198200")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/card/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/card/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/card/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/card/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            variantId: Nullable<String>.value("plan_xxxxxxxxxxxxxx")
        )
        let response = try await client.disputes.uploadEvidence(
            id: "id",
            request: .init(documents: [
                UploadEvidenceDisputesRequestDocumentsItem(
                    documentType: .returnPolicy
                )
            ]),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}