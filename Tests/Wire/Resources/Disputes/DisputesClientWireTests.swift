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

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "acceptable": true,
                      "account_id": "account_id",
                      "amount": 1.1,
                      "buyer": {
                        "email": "email",
                        "member_id": "member_id",
                        "name": "name",
                        "user_id": "user_id",
                        "username": "username"
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "evidence": {
                        "access_activity_log": "access_activity_log",
                        "billing_address": "billing_address",
                        "cancellation_policy_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        },
                        "cancellation_policy_disclosure": "cancellation_policy_disclosure",
                        "customer_communication_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        },
                        "customer_email_address": "customer_email_address",
                        "customer_name": "customer_name",
                        "documents": [
                          {
                            "blurhash": "blurhash",
                            "content_type": "application/pdf",
                            "created_at": "created_at",
                            "document_type": "return_policy",
                            "duration_seconds": 1.1,
                            "filename": "filename",
                            "height": 1,
                            "id": "id",
                            "multipart_chunk_size": 1,
                            "multipart_upload_id": "multipart_upload_id",
                            "multipart_upload_urls": [
                              {
                                "part_number": 1,
                                "url": "url"
                              },
                              {
                                "part_number": 1,
                                "url": "url"
                              }
                            ],
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
                            "content_type": "application/pdf",
                            "created_at": "created_at",
                            "document_type": "return_policy",
                            "duration_seconds": 1.1,
                            "filename": "filename",
                            "height": 1,
                            "id": "id",
                            "multipart_chunk_size": 1,
                            "multipart_upload_id": "multipart_upload_id",
                            "multipart_upload_urls": [
                              {
                                "part_number": 1,
                                "url": "url"
                              },
                              {
                                "part_number": 1,
                                "url": "url"
                              }
                            ],
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
                        "notes": "notes",
                        "product_description": "product_description",
                        "refund_policy_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        },
                        "refund_policy_disclosure": "refund_policy_disclosure",
                        "refund_refusal_explanation": "refund_refusal_explanation",
                        "service_date": "service_date",
                        "uncategorized_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        }
                      },
                      "evidence_due_at": "evidence_due_at",
                      "evidence_editable": true,
                      "evidence_locked_reason": "submitted",
                      "evidence_submitted_at": "evidence_submitted_at",
                      "fee": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "fee_charged": true,
                      "id": "id",
                      "inquiry": true,
                      "issuer_comments": [
                        {
                          "received_at": "received_at",
                          "text": "text"
                        },
                        {
                          "received_at": "received_at",
                          "text": "text"
                        }
                      ],
                      "line_items": [
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        },
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        }
                      ],
                      "payment": {
                        "amount": 1.1,
                        "card_brand": "card_brand",
                        "card_last4": "card_last4",
                        "created_at": "created_at",
                        "currency": "currency",
                        "id": "id",
                        "payment_instrument": {
                          "card": {
                            "brand": "brand",
                            "exp_month": 1.1,
                            "exp_year": 1.1,
                            "issuer_identification_number": "issuer_identification_number",
                            "last4": "last4",
                            "network_transaction_id": "network_transaction_id"
                          },
                          "display_name": "display_name",
                          "icons": {
                            "card": {
                              "dark": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              },
                              "light": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              }
                            },
                            "square": {
                              "dark": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              },
                              "light": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              }
                            }
                          },
                          "installment_count": 1.1,
                          "payment_method_type": "payment_method_type"
                        },
                        "payment_method_type": "payment_method_type",
                        "payment_processor": "payment_processor"
                      },
                      "product_id": "product_id",
                      "reason": "fraudulent",
                      "reason_code": "reason_code",
                      "status": "needs_response",
                      "submission_failure_reason": "submission_failure_reason",
                      "updated_at": "updated_at",
                      "variant_id": "variant_id"
                    },
                    {
                      "acceptable": true,
                      "account_id": "account_id",
                      "amount": 1.1,
                      "buyer": {
                        "email": "email",
                        "member_id": "member_id",
                        "name": "name",
                        "user_id": "user_id",
                        "username": "username"
                      },
                      "created_at": "created_at",
                      "currency": "currency",
                      "evidence": {
                        "access_activity_log": "access_activity_log",
                        "billing_address": "billing_address",
                        "cancellation_policy_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        },
                        "cancellation_policy_disclosure": "cancellation_policy_disclosure",
                        "customer_communication_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        },
                        "customer_email_address": "customer_email_address",
                        "customer_name": "customer_name",
                        "documents": [
                          {
                            "blurhash": "blurhash",
                            "content_type": "application/pdf",
                            "created_at": "created_at",
                            "document_type": "return_policy",
                            "duration_seconds": 1.1,
                            "filename": "filename",
                            "height": 1,
                            "id": "id",
                            "multipart_chunk_size": 1,
                            "multipart_upload_id": "multipart_upload_id",
                            "multipart_upload_urls": [
                              {
                                "part_number": 1,
                                "url": "url"
                              },
                              {
                                "part_number": 1,
                                "url": "url"
                              }
                            ],
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
                            "content_type": "application/pdf",
                            "created_at": "created_at",
                            "document_type": "return_policy",
                            "duration_seconds": 1.1,
                            "filename": "filename",
                            "height": 1,
                            "id": "id",
                            "multipart_chunk_size": 1,
                            "multipart_upload_id": "multipart_upload_id",
                            "multipart_upload_urls": [
                              {
                                "part_number": 1,
                                "url": "url"
                              },
                              {
                                "part_number": 1,
                                "url": "url"
                              }
                            ],
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
                        "notes": "notes",
                        "product_description": "product_description",
                        "refund_policy_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        },
                        "refund_policy_disclosure": "refund_policy_disclosure",
                        "refund_refusal_explanation": "refund_refusal_explanation",
                        "service_date": "service_date",
                        "uncategorized_attachment": {
                          "content_type": "content_type",
                          "filename": "filename",
                          "id": "id",
                          "platform": true,
                          "url": "url"
                        }
                      },
                      "evidence_due_at": "evidence_due_at",
                      "evidence_editable": true,
                      "evidence_locked_reason": "submitted",
                      "evidence_submitted_at": "evidence_submitted_at",
                      "fee": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "fee_charged": true,
                      "id": "id",
                      "inquiry": true,
                      "issuer_comments": [
                        {
                          "received_at": "received_at",
                          "text": "text"
                        },
                        {
                          "received_at": "received_at",
                          "text": "text"
                        }
                      ],
                      "line_items": [
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        },
                        {
                          "id": "id",
                          "label": "label",
                          "product_id": "product_id",
                          "product_title": "product_title",
                          "quantity": 1.1,
                          "sku": "sku",
                          "subtotal": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "variant_id": "variant_id",
                          "variant_title": "variant_title"
                        }
                      ],
                      "payment": {
                        "amount": 1.1,
                        "card_brand": "card_brand",
                        "card_last4": "card_last4",
                        "created_at": "created_at",
                        "currency": "currency",
                        "id": "id",
                        "payment_instrument": {
                          "card": {
                            "brand": "brand",
                            "exp_month": 1.1,
                            "exp_year": 1.1,
                            "issuer_identification_number": "issuer_identification_number",
                            "last4": "last4",
                            "network_transaction_id": "network_transaction_id"
                          },
                          "display_name": "display_name",
                          "icons": {
                            "card": {
                              "dark": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              },
                              "light": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              }
                            },
                            "square": {
                              "dark": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              },
                              "light": {
                                "png_1x": "png_1x",
                                "png_2x": "png_2x",
                                "png_4x": "png_4x",
                                "svg": "svg"
                              }
                            }
                          },
                          "installment_count": 1.1,
                          "payment_method_type": "payment_method_type"
                        },
                        "payment_method_type": "payment_method_type",
                        "payment_processor": "payment_processor"
                      },
                      "product_id": "product_id",
                      "reason": "fraudulent",
                      "reason_code": "reason_code",
                      "status": "needs_response",
                      "submission_failure_reason": "submission_failure_reason",
                      "updated_at": "updated_at",
                      "variant_id": "variant_id"
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
        let expectedResponse = ListDisputesResponse(
            data: [
                Dispute(
                    acceptable: true,
                    accountId: Nullable<String>.value("account_id"),
                    amount: 1.1,
                    buyer: DisputeBuyer(
                        email: Nullable<String>.value("email"),
                        memberId: Nullable<String>.value("member_id"),
                        name: Nullable<String>.value("name"),
                        userId: Nullable<String>.value("user_id"),
                        username: Nullable<String>.value("username")
                    ),
                    createdAt: "created_at",
                    currency: "currency",
                    evidence: DisputeEvidence(
                        accessActivityLog: Nullable<String>.value("access_activity_log"),
                        billingAddress: Nullable<String>.value("billing_address"),
                        cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        )),
                        cancellationPolicyDisclosure: Nullable<String>.value("cancellation_policy_disclosure"),
                        customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        )),
                        customerEmailAddress: Nullable<String>.value("customer_email_address"),
                        customerName: Nullable<String>.value("customer_name"),
                        documents: [
                            DisputeEvidenceDocument(
                                blurhash: Nullable<String>.value("blurhash"),
                                contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                                createdAt: "created_at",
                                documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                                durationSeconds: Nullable<Double>.value(1.1),
                                filename: Nullable<String>.value("filename"),
                                height: Nullable<Int>.value(1),
                                id: "id",
                                multipartChunkSize: Optional(Nullable<Int>.value(1)),
                                multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    ),
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    )
                                ])),
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
                                uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                                uploadUrl: Optional(Nullable<String>.value("upload_url")),
                                url: Nullable<String>.value("url"),
                                visibility: DisputeEvidenceDocumentVisibility.public,
                                waveformUrl: Nullable<String>.value("waveform_url"),
                                width: Nullable<Int>.value(1)
                            ),
                            DisputeEvidenceDocument(
                                blurhash: Nullable<String>.value("blurhash"),
                                contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                                createdAt: "created_at",
                                documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                                durationSeconds: Nullable<Double>.value(1.1),
                                filename: Nullable<String>.value("filename"),
                                height: Nullable<Int>.value(1),
                                id: "id",
                                multipartChunkSize: Optional(Nullable<Int>.value(1)),
                                multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    ),
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    )
                                ])),
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
                                uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                                uploadUrl: Optional(Nullable<String>.value("upload_url")),
                                url: Nullable<String>.value("url"),
                                visibility: DisputeEvidenceDocumentVisibility.public,
                                waveformUrl: Nullable<String>.value("waveform_url"),
                                width: Nullable<Int>.value(1)
                            )
                        ],
                        notes: Nullable<String>.value("notes"),
                        productDescription: Nullable<String>.value("product_description"),
                        refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        )),
                        refundPolicyDisclosure: Nullable<String>.value("refund_policy_disclosure"),
                        refundRefusalExplanation: Nullable<String>.value("refund_refusal_explanation"),
                        serviceDate: Nullable<String>.value("service_date"),
                        uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        ))
                    ),
                    evidenceDueAt: Nullable<String>.value("evidence_due_at"),
                    evidenceEditable: true,
                    evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
                    evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
                    fee: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    feeCharged: true,
                    id: "id",
                    inquiry: true,
                    issuerComments: [
                        DisputeIssuerComment(
                            receivedAt: Nullable<String>.value("received_at"),
                            text: "text"
                        ),
                        DisputeIssuerComment(
                            receivedAt: Nullable<String>.value("received_at"),
                            text: "text"
                        )
                    ],
                    lineItems: [
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        ),
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        )
                    ],
                    payment: DisputePayment(
                        amount: Nullable<Double>.value(1.1),
                        cardBrand: Nullable<String>.value("card_brand"),
                        cardLast4: Nullable<String>.value("card_last4"),
                        createdAt: "created_at",
                        currency: Nullable<String>.value("currency"),
                        id: "id",
                        paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                            card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                                brand: Nullable<String>.value("brand"),
                                expMonth: Nullable<Double>.value(1.1),
                                expYear: Nullable<Double>.value(1.1),
                                issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                                last4: Nullable<String>.value("last4"),
                                networkTransactionId: Nullable<String>.value("network_transaction_id")
                            )),
                            displayName: "display_name",
                            icons: PaymentMethodIcons(
                                card: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    )
                                ),
                                square: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    )
                                )
                            ),
                            installmentCount: Nullable<Double>.value(1.1),
                            paymentMethodType: "payment_method_type"
                        )),
                        paymentMethodType: Nullable<String>.value("payment_method_type"),
                        paymentProcessor: Nullable<String>.value("payment_processor")
                    ),
                    productId: Nullable<String>.value("product_id"),
                    reason: DisputeReason.fraudulent,
                    reasonCode: Nullable<String>.value("reason_code"),
                    status: DisputeStatus.needsResponse,
                    submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
                    updatedAt: "updated_at",
                    variantId: Nullable<String>.value("variant_id")
                ),
                Dispute(
                    acceptable: true,
                    accountId: Nullable<String>.value("account_id"),
                    amount: 1.1,
                    buyer: DisputeBuyer(
                        email: Nullable<String>.value("email"),
                        memberId: Nullable<String>.value("member_id"),
                        name: Nullable<String>.value("name"),
                        userId: Nullable<String>.value("user_id"),
                        username: Nullable<String>.value("username")
                    ),
                    createdAt: "created_at",
                    currency: "currency",
                    evidence: DisputeEvidence(
                        accessActivityLog: Nullable<String>.value("access_activity_log"),
                        billingAddress: Nullable<String>.value("billing_address"),
                        cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        )),
                        cancellationPolicyDisclosure: Nullable<String>.value("cancellation_policy_disclosure"),
                        customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        )),
                        customerEmailAddress: Nullable<String>.value("customer_email_address"),
                        customerName: Nullable<String>.value("customer_name"),
                        documents: [
                            DisputeEvidenceDocument(
                                blurhash: Nullable<String>.value("blurhash"),
                                contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                                createdAt: "created_at",
                                documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                                durationSeconds: Nullable<Double>.value(1.1),
                                filename: Nullable<String>.value("filename"),
                                height: Nullable<Int>.value(1),
                                id: "id",
                                multipartChunkSize: Optional(Nullable<Int>.value(1)),
                                multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    ),
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    )
                                ])),
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
                                uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                                uploadUrl: Optional(Nullable<String>.value("upload_url")),
                                url: Nullable<String>.value("url"),
                                visibility: DisputeEvidenceDocumentVisibility.public,
                                waveformUrl: Nullable<String>.value("waveform_url"),
                                width: Nullable<Int>.value(1)
                            ),
                            DisputeEvidenceDocument(
                                blurhash: Nullable<String>.value("blurhash"),
                                contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                                createdAt: "created_at",
                                documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                                durationSeconds: Nullable<Double>.value(1.1),
                                filename: Nullable<String>.value("filename"),
                                height: Nullable<Int>.value(1),
                                id: "id",
                                multipartChunkSize: Optional(Nullable<Int>.value(1)),
                                multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    ),
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "url"
                                    )
                                ])),
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
                                uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                                uploadUrl: Optional(Nullable<String>.value("upload_url")),
                                url: Nullable<String>.value("url"),
                                visibility: DisputeEvidenceDocumentVisibility.public,
                                waveformUrl: Nullable<String>.value("waveform_url"),
                                width: Nullable<Int>.value(1)
                            )
                        ],
                        notes: Nullable<String>.value("notes"),
                        productDescription: Nullable<String>.value("product_description"),
                        refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        )),
                        refundPolicyDisclosure: Nullable<String>.value("refund_policy_disclosure"),
                        refundRefusalExplanation: Nullable<String>.value("refund_refusal_explanation"),
                        serviceDate: Nullable<String>.value("service_date"),
                        uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                            contentType: Nullable<String>.value("content_type"),
                            filename: Nullable<String>.value("filename"),
                            id: Nullable<String>.value("id"),
                            platform: true,
                            url: Nullable<String>.value("url")
                        ))
                    ),
                    evidenceDueAt: Nullable<String>.value("evidence_due_at"),
                    evidenceEditable: true,
                    evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
                    evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
                    fee: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    feeCharged: true,
                    id: "id",
                    inquiry: true,
                    issuerComments: [
                        DisputeIssuerComment(
                            receivedAt: Nullable<String>.value("received_at"),
                            text: "text"
                        ),
                        DisputeIssuerComment(
                            receivedAt: Nullable<String>.value("received_at"),
                            text: "text"
                        )
                    ],
                    lineItems: [
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        ),
                        ReceiptLineItem(
                            id: Nullable<String>.value("id"),
                            label: Nullable<String>.value("label"),
                            productId: Nullable<String>.value("product_id"),
                            productTitle: Nullable<String>.value("product_title"),
                            quantity: 1.1,
                            sku: Nullable<String>.value("sku"),
                            subtotal: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            variantId: Nullable<String>.value("variant_id"),
                            variantTitle: Nullable<String>.value("variant_title")
                        )
                    ],
                    payment: DisputePayment(
                        amount: Nullable<Double>.value(1.1),
                        cardBrand: Nullable<String>.value("card_brand"),
                        cardLast4: Nullable<String>.value("card_last4"),
                        createdAt: "created_at",
                        currency: Nullable<String>.value("currency"),
                        id: "id",
                        paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                            card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                                brand: Nullable<String>.value("brand"),
                                expMonth: Nullable<Double>.value(1.1),
                                expYear: Nullable<Double>.value(1.1),
                                issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                                last4: Nullable<String>.value("last4"),
                                networkTransactionId: Nullable<String>.value("network_transaction_id")
                            )),
                            displayName: "display_name",
                            icons: PaymentMethodIcons(
                                card: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    )
                                ),
                                square: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "png_1x",
                                        png2X: "png_2x",
                                        png4X: "png_4x",
                                        svg: "svg"
                                    )
                                )
                            ),
                            installmentCount: Nullable<Double>.value(1.1),
                            paymentMethodType: "payment_method_type"
                        )),
                        paymentMethodType: Nullable<String>.value("payment_method_type"),
                        paymentProcessor: Nullable<String>.value("payment_processor")
                    ),
                    productId: Nullable<String>.value("product_id"),
                    reason: DisputeReason.fraudulent,
                    reasonCode: Nullable<String>.value("reason_code"),
                    status: DisputeStatus.needsResponse,
                    submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
                    updatedAt: "updated_at",
                    variantId: Nullable<String>.value("variant_id")
                )
            ],
            pageInfo: ListDisputesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
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

    @Test func summary2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "groups": {
                    "currency": {
                      "currency": 1
                    },
                    "status": {
                      "generating_response": 1,
                      "lost": 1,
                      "needs_response": 1,
                      "prevented": 1,
                      "under_review": 1,
                      "warning_closed": 1,
                      "warning_needs_response": 1,
                      "warning_under_review": 1,
                      "won": 1
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
                    "currency": 1
                ]),
                status: Optional(SummaryDisputesResponseGroupsStatus(
                    generatingResponse: 1,
                    lost: 1,
                    needsResponse: 1,
                    prevented: 1,
                    underReview: 1,
                    warningClosed: 1,
                    warningNeedsResponse: 1,
                    warningUnderReview: 1,
                    won: 1
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

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "account_id",
                  "amount": 1.1,
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "evidence": {
                    "access_activity_log": "access_activity_log",
                    "billing_address": "billing_address",
                    "cancellation_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "cancellation_policy_disclosure": "cancellation_policy_disclosure",
                    "customer_communication_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "customer_email_address": "customer_email_address",
                    "customer_name": "customer_name",
                    "documents": [
                      {
                        "blurhash": "blurhash",
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                    "notes": "notes",
                    "product_description": "product_description",
                    "refund_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "refund_policy_disclosure": "refund_policy_disclosure",
                    "refund_refusal_explanation": "refund_refusal_explanation",
                    "service_date": "service_date",
                    "uncategorized_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    }
                  },
                  "evidence_due_at": "evidence_due_at",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "fee_charged": true,
                  "id": "id",
                  "inquiry": true,
                  "issuer_comments": [
                    {
                      "received_at": "received_at",
                      "text": "text"
                    },
                    {
                      "received_at": "received_at",
                      "text": "text"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "payment": {
                    "amount": 1.1,
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "currency": "currency",
                    "id": "id",
                    "payment_instrument": {
                      "card": {
                        "brand": "brand",
                        "exp_month": 1.1,
                        "exp_year": 1.1,
                        "issuer_identification_number": "issuer_identification_number",
                        "last4": "last4",
                        "network_transaction_id": "network_transaction_id"
                      },
                      "display_name": "display_name",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "payment_method_type"
                    },
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "reason_code": "reason_code",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
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
            accountId: Nullable<String>.value("account_id"),
            amount: 1.1,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: "currency",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("access_activity_log"),
                billingAddress: Nullable<String>.value("billing_address"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("cancellation_policy_disclosure"),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                customerEmailAddress: Nullable<String>.value("customer_email_address"),
                customerName: Nullable<String>.value("customer_name"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    ),
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    )
                ],
                notes: Nullable<String>.value("notes"),
                productDescription: Nullable<String>.value("product_description"),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                refundPolicyDisclosure: Nullable<String>.value("refund_policy_disclosure"),
                refundRefusalExplanation: Nullable<String>.value("refund_refusal_explanation"),
                serviceDate: Nullable<String>.value("service_date"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("evidence_due_at"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            feeCharged: true,
            id: "id",
            inquiry: true,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                ),
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(1.1),
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                currency: Nullable<String>.value("currency"),
                id: "id",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("brand"),
                        expMonth: Nullable<Double>.value(1.1),
                        expYear: Nullable<Double>.value(1.1),
                        issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                        last4: Nullable<String>.value("last4"),
                        networkTransactionId: Nullable<String>.value("network_transaction_id")
                    )),
                    displayName: "display_name",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "payment_method_type"
                )),
                paymentMethodType: Nullable<String>.value("payment_method_type"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("reason_code"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
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

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "account_id",
                  "amount": 1.1,
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "evidence": {
                    "access_activity_log": "access_activity_log",
                    "billing_address": "billing_address",
                    "cancellation_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "cancellation_policy_disclosure": "cancellation_policy_disclosure",
                    "customer_communication_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "customer_email_address": "customer_email_address",
                    "customer_name": "customer_name",
                    "documents": [
                      {
                        "blurhash": "blurhash",
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                    "notes": "notes",
                    "product_description": "product_description",
                    "refund_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "refund_policy_disclosure": "refund_policy_disclosure",
                    "refund_refusal_explanation": "refund_refusal_explanation",
                    "service_date": "service_date",
                    "uncategorized_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    }
                  },
                  "evidence_due_at": "evidence_due_at",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "fee_charged": true,
                  "id": "id",
                  "inquiry": true,
                  "issuer_comments": [
                    {
                      "received_at": "received_at",
                      "text": "text"
                    },
                    {
                      "received_at": "received_at",
                      "text": "text"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "payment": {
                    "amount": 1.1,
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "currency": "currency",
                    "id": "id",
                    "payment_instrument": {
                      "card": {
                        "brand": "brand",
                        "exp_month": 1.1,
                        "exp_year": 1.1,
                        "issuer_identification_number": "issuer_identification_number",
                        "last4": "last4",
                        "network_transaction_id": "network_transaction_id"
                      },
                      "display_name": "display_name",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "payment_method_type"
                    },
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "reason_code": "reason_code",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
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
            accountId: Nullable<String>.value("account_id"),
            amount: 1.1,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: "currency",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("access_activity_log"),
                billingAddress: Nullable<String>.value("billing_address"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("cancellation_policy_disclosure"),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                customerEmailAddress: Nullable<String>.value("customer_email_address"),
                customerName: Nullable<String>.value("customer_name"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    ),
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    )
                ],
                notes: Nullable<String>.value("notes"),
                productDescription: Nullable<String>.value("product_description"),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                refundPolicyDisclosure: Nullable<String>.value("refund_policy_disclosure"),
                refundRefusalExplanation: Nullable<String>.value("refund_refusal_explanation"),
                serviceDate: Nullable<String>.value("service_date"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("evidence_due_at"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            feeCharged: true,
            id: "id",
            inquiry: true,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                ),
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(1.1),
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                currency: Nullable<String>.value("currency"),
                id: "id",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("brand"),
                        expMonth: Nullable<Double>.value(1.1),
                        expYear: Nullable<Double>.value(1.1),
                        issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                        last4: Nullable<String>.value("last4"),
                        networkTransactionId: Nullable<String>.value("network_transaction_id")
                    )),
                    displayName: "display_name",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "payment_method_type"
                )),
                paymentMethodType: Nullable<String>.value("payment_method_type"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("reason_code"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
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

    @Test func accept2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "account_id",
                  "amount": 1.1,
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "evidence": {
                    "access_activity_log": "access_activity_log",
                    "billing_address": "billing_address",
                    "cancellation_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "cancellation_policy_disclosure": "cancellation_policy_disclosure",
                    "customer_communication_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "customer_email_address": "customer_email_address",
                    "customer_name": "customer_name",
                    "documents": [
                      {
                        "blurhash": "blurhash",
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                    "notes": "notes",
                    "product_description": "product_description",
                    "refund_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "refund_policy_disclosure": "refund_policy_disclosure",
                    "refund_refusal_explanation": "refund_refusal_explanation",
                    "service_date": "service_date",
                    "uncategorized_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    }
                  },
                  "evidence_due_at": "evidence_due_at",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "fee_charged": true,
                  "id": "id",
                  "inquiry": true,
                  "issuer_comments": [
                    {
                      "received_at": "received_at",
                      "text": "text"
                    },
                    {
                      "received_at": "received_at",
                      "text": "text"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "payment": {
                    "amount": 1.1,
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "currency": "currency",
                    "id": "id",
                    "payment_instrument": {
                      "card": {
                        "brand": "brand",
                        "exp_month": 1.1,
                        "exp_year": 1.1,
                        "issuer_identification_number": "issuer_identification_number",
                        "last4": "last4",
                        "network_transaction_id": "network_transaction_id"
                      },
                      "display_name": "display_name",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "payment_method_type"
                    },
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "reason_code": "reason_code",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
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
            accountId: Nullable<String>.value("account_id"),
            amount: 1.1,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: "currency",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("access_activity_log"),
                billingAddress: Nullable<String>.value("billing_address"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("cancellation_policy_disclosure"),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                customerEmailAddress: Nullable<String>.value("customer_email_address"),
                customerName: Nullable<String>.value("customer_name"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    ),
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    )
                ],
                notes: Nullable<String>.value("notes"),
                productDescription: Nullable<String>.value("product_description"),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                refundPolicyDisclosure: Nullable<String>.value("refund_policy_disclosure"),
                refundRefusalExplanation: Nullable<String>.value("refund_refusal_explanation"),
                serviceDate: Nullable<String>.value("service_date"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("evidence_due_at"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            feeCharged: true,
            id: "id",
            inquiry: true,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                ),
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(1.1),
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                currency: Nullable<String>.value("currency"),
                id: "id",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("brand"),
                        expMonth: Nullable<Double>.value(1.1),
                        expYear: Nullable<Double>.value(1.1),
                        issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                        last4: Nullable<String>.value("last4"),
                        networkTransactionId: Nullable<String>.value("network_transaction_id")
                    )),
                    displayName: "display_name",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "payment_method_type"
                )),
                paymentMethodType: Nullable<String>.value("payment_method_type"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("reason_code"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
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

    @Test func submit2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "account_id",
                  "amount": 1.1,
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "evidence": {
                    "access_activity_log": "access_activity_log",
                    "billing_address": "billing_address",
                    "cancellation_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "cancellation_policy_disclosure": "cancellation_policy_disclosure",
                    "customer_communication_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "customer_email_address": "customer_email_address",
                    "customer_name": "customer_name",
                    "documents": [
                      {
                        "blurhash": "blurhash",
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                    "notes": "notes",
                    "product_description": "product_description",
                    "refund_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "refund_policy_disclosure": "refund_policy_disclosure",
                    "refund_refusal_explanation": "refund_refusal_explanation",
                    "service_date": "service_date",
                    "uncategorized_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    }
                  },
                  "evidence_due_at": "evidence_due_at",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "fee_charged": true,
                  "id": "id",
                  "inquiry": true,
                  "issuer_comments": [
                    {
                      "received_at": "received_at",
                      "text": "text"
                    },
                    {
                      "received_at": "received_at",
                      "text": "text"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "payment": {
                    "amount": 1.1,
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "currency": "currency",
                    "id": "id",
                    "payment_instrument": {
                      "card": {
                        "brand": "brand",
                        "exp_month": 1.1,
                        "exp_year": 1.1,
                        "issuer_identification_number": "issuer_identification_number",
                        "last4": "last4",
                        "network_transaction_id": "network_transaction_id"
                      },
                      "display_name": "display_name",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "payment_method_type"
                    },
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "reason_code": "reason_code",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
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
            accountId: Nullable<String>.value("account_id"),
            amount: 1.1,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: "currency",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("access_activity_log"),
                billingAddress: Nullable<String>.value("billing_address"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("cancellation_policy_disclosure"),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                customerEmailAddress: Nullable<String>.value("customer_email_address"),
                customerName: Nullable<String>.value("customer_name"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    ),
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    )
                ],
                notes: Nullable<String>.value("notes"),
                productDescription: Nullable<String>.value("product_description"),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                refundPolicyDisclosure: Nullable<String>.value("refund_policy_disclosure"),
                refundRefusalExplanation: Nullable<String>.value("refund_refusal_explanation"),
                serviceDate: Nullable<String>.value("service_date"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("evidence_due_at"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            feeCharged: true,
            id: "id",
            inquiry: true,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                ),
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(1.1),
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                currency: Nullable<String>.value("currency"),
                id: "id",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("brand"),
                        expMonth: Nullable<Double>.value(1.1),
                        expYear: Nullable<Double>.value(1.1),
                        issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                        last4: Nullable<String>.value("last4"),
                        networkTransactionId: Nullable<String>.value("network_transaction_id")
                    )),
                    displayName: "display_name",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "payment_method_type"
                )),
                paymentMethodType: Nullable<String>.value("payment_method_type"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("reason_code"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
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

    @Test func uploadEvidence2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "acceptable": true,
                  "account_id": "account_id",
                  "amount": 1.1,
                  "buyer": {
                    "email": "email",
                    "member_id": "member_id",
                    "name": "name",
                    "user_id": "user_id",
                    "username": "username"
                  },
                  "created_at": "created_at",
                  "currency": "currency",
                  "evidence": {
                    "access_activity_log": "access_activity_log",
                    "billing_address": "billing_address",
                    "cancellation_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "cancellation_policy_disclosure": "cancellation_policy_disclosure",
                    "customer_communication_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "customer_email_address": "customer_email_address",
                    "customer_name": "customer_name",
                    "documents": [
                      {
                        "blurhash": "blurhash",
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                        "content_type": "application/pdf",
                        "created_at": "created_at",
                        "document_type": "return_policy",
                        "duration_seconds": 1.1,
                        "filename": "filename",
                        "height": 1,
                        "id": "id",
                        "multipart_chunk_size": 1,
                        "multipart_upload_id": "multipart_upload_id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "url"
                          },
                          {
                            "part_number": 1,
                            "url": "url"
                          }
                        ],
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
                    "notes": "notes",
                    "product_description": "product_description",
                    "refund_policy_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    },
                    "refund_policy_disclosure": "refund_policy_disclosure",
                    "refund_refusal_explanation": "refund_refusal_explanation",
                    "service_date": "service_date",
                    "uncategorized_attachment": {
                      "content_type": "content_type",
                      "filename": "filename",
                      "id": "id",
                      "platform": true,
                      "url": "url"
                    }
                  },
                  "evidence_due_at": "evidence_due_at",
                  "evidence_editable": true,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "evidence_submitted_at",
                  "fee": {
                    "amount": "amount",
                    "currency": "currency",
                    "decimals": 1,
                    "display_decimals": 1
                  },
                  "fee_charged": true,
                  "id": "id",
                  "inquiry": true,
                  "issuer_comments": [
                    {
                      "received_at": "received_at",
                      "text": "text"
                    },
                    {
                      "received_at": "received_at",
                      "text": "text"
                    }
                  ],
                  "line_items": [
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    },
                    {
                      "id": "id",
                      "label": "label",
                      "product_id": "product_id",
                      "product_title": "product_title",
                      "quantity": 1.1,
                      "sku": "sku",
                      "subtotal": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "variant_id": "variant_id",
                      "variant_title": "variant_title"
                    }
                  ],
                  "payment": {
                    "amount": 1.1,
                    "card_brand": "card_brand",
                    "card_last4": "card_last4",
                    "created_at": "created_at",
                    "currency": "currency",
                    "id": "id",
                    "payment_instrument": {
                      "card": {
                        "brand": "brand",
                        "exp_month": 1.1,
                        "exp_year": 1.1,
                        "issuer_identification_number": "issuer_identification_number",
                        "last4": "last4",
                        "network_transaction_id": "network_transaction_id"
                      },
                      "display_name": "display_name",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          },
                          "light": {
                            "png_1x": "png_1x",
                            "png_2x": "png_2x",
                            "png_4x": "png_4x",
                            "svg": "svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "payment_method_type"
                    },
                    "payment_method_type": "payment_method_type",
                    "payment_processor": "payment_processor"
                  },
                  "product_id": "product_id",
                  "reason": "fraudulent",
                  "reason_code": "reason_code",
                  "status": "needs_response",
                  "submission_failure_reason": "submission_failure_reason",
                  "updated_at": "updated_at",
                  "variant_id": "variant_id"
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
            accountId: Nullable<String>.value("account_id"),
            amount: 1.1,
            buyer: DisputeBuyer(
                email: Nullable<String>.value("email"),
                memberId: Nullable<String>.value("member_id"),
                name: Nullable<String>.value("name"),
                userId: Nullable<String>.value("user_id"),
                username: Nullable<String>.value("username")
            ),
            createdAt: "created_at",
            currency: "currency",
            evidence: DisputeEvidence(
                accessActivityLog: Nullable<String>.value("access_activity_log"),
                billingAddress: Nullable<String>.value("billing_address"),
                cancellationPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                cancellationPolicyDisclosure: Nullable<String>.value("cancellation_policy_disclosure"),
                customerCommunicationAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                customerEmailAddress: Nullable<String>.value("customer_email_address"),
                customerName: Nullable<String>.value("customer_name"),
                documents: [
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    ),
                    DisputeEvidenceDocument(
                        blurhash: Nullable<String>.value("blurhash"),
                        contentType: Nullable<DisputeEvidenceDocumentContentType>.value(DisputeEvidenceDocumentContentType.applicationPdf),
                        createdAt: "created_at",
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        durationSeconds: Nullable<Double>.value(1.1),
                        filename: Nullable<String>.value("filename"),
                        height: Nullable<Int>.value(1),
                        id: "id",
                        multipartChunkSize: Optional(Nullable<Int>.value(1)),
                        multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            ),
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "url"
                            )
                        ])),
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
                        uploadStatus: DisputeEvidenceDocumentUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("upload_url")),
                        url: Nullable<String>.value("url"),
                        visibility: DisputeEvidenceDocumentVisibility.public,
                        waveformUrl: Nullable<String>.value("waveform_url"),
                        width: Nullable<Int>.value(1)
                    )
                ],
                notes: Nullable<String>.value("notes"),
                productDescription: Nullable<String>.value("product_description"),
                refundPolicyAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                )),
                refundPolicyDisclosure: Nullable<String>.value("refund_policy_disclosure"),
                refundRefusalExplanation: Nullable<String>.value("refund_refusal_explanation"),
                serviceDate: Nullable<String>.value("service_date"),
                uncategorizedAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                    contentType: Nullable<String>.value("content_type"),
                    filename: Nullable<String>.value("filename"),
                    id: Nullable<String>.value("id"),
                    platform: true,
                    url: Nullable<String>.value("url")
                ))
            ),
            evidenceDueAt: Nullable<String>.value("evidence_due_at"),
            evidenceEditable: true,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("evidence_submitted_at"),
            fee: Nullable<Money>.value(Money(
                amount: "amount",
                currency: "currency",
                decimals: 1,
                displayDecimals: 1
            )),
            feeCharged: true,
            id: "id",
            inquiry: true,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                ),
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("received_at"),
                    text: "text"
                )
            ],
            lineItems: [
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                ),
                ReceiptLineItem(
                    id: Nullable<String>.value("id"),
                    label: Nullable<String>.value("label"),
                    productId: Nullable<String>.value("product_id"),
                    productTitle: Nullable<String>.value("product_title"),
                    quantity: 1.1,
                    sku: Nullable<String>.value("sku"),
                    subtotal: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    variantId: Nullable<String>.value("variant_id"),
                    variantTitle: Nullable<String>.value("variant_title")
                )
            ],
            payment: DisputePayment(
                amount: Nullable<Double>.value(1.1),
                cardBrand: Nullable<String>.value("card_brand"),
                cardLast4: Nullable<String>.value("card_last4"),
                createdAt: "created_at",
                currency: Nullable<String>.value("currency"),
                id: "id",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: Nullable<String>.value("brand"),
                        expMonth: Nullable<Double>.value(1.1),
                        expYear: Nullable<Double>.value(1.1),
                        issuerIdentificationNumber: Nullable<String>.value("issuer_identification_number"),
                        last4: Nullable<String>.value("last4"),
                        networkTransactionId: Nullable<String>.value("network_transaction_id")
                    )),
                    displayName: "display_name",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "png_1x",
                                png2X: "png_2x",
                                png4X: "png_4x",
                                svg: "svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "payment_method_type"
                )),
                paymentMethodType: Nullable<String>.value("payment_method_type"),
                paymentProcessor: Nullable<String>.value("payment_processor")
            ),
            productId: Nullable<String>.value("product_id"),
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("reason_code"),
            status: DisputeStatus.needsResponse,
            submissionFailureReason: Nullable<String>.value("submission_failure_reason"),
            updatedAt: "updated_at",
            variantId: Nullable<String>.value("variant_id")
        )
        let response = try await client.disputes.uploadEvidence(
            id: "id",
            request: .init(documents: [
                UploadEvidenceDisputesRequestDocumentsItem(
                    documentType: .returnPolicy
                ),
                UploadEvidenceDisputesRequestDocumentsItem(
                    documentType: .returnPolicy
                )
            ]),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}