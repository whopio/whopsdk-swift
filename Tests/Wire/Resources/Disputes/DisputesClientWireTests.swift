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
                            "content_type": null,
                            "document_type": "return_policy",
                            "filename": "customer-order-history.png",
                            "id": "file_xxxxxxxxxxxxxx",
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
                      "evidence_editable": false,
                      "evidence_locked_reason": "submitted",
                      "evidence_submitted_at": "2026-01-01T12:00:00.000Z",
                      "generated_response_attachment": {
                        "content_type": "image/png",
                        "filename": "booking-confirmation-email.png",
                        "id": "file_xxxxxxxxxxxxxx",
                        "platform": false,
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      },
                      "id": "dspt_xxxxxxxxxxxxxx",
                      "inquiry": false,
                      "issuer_comments": [
                        {
                          "received_at": "2026-01-01T12:00:00.000Z",
                          "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
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
                            "last4": "4242"
                          },
                          "display_name": "Visa •••• 4242",
                          "icons": {
                            "card": {
                              "dark": {
                                "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                              },
                              "light": {
                                "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                              }
                            },
                            "square": {
                              "dark": {
                                "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                              },
                              "light": {
                                "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                              }
                            }
                          },
                          "installment_count": null,
                          "payment_method_type": "card"
                        },
                        "payment_method_type": "card",
                        "payment_processor": "stripe"
                      },
                      "plan_id": "plan_xxxxxxxxxxxxxx",
                      "product_id": "prod_xxxxxxxxxxxxxx",
                      "rapid_dispute_resolution": false,
                      "reason": "fraudulent",
                      "reason_code": "13.1",
                      "status": "needs_response",
                      "updated_at": "2026-01-01T12:00:00.000Z"
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
        let expectedResponse = ListDisputesResponse(
            data: [
                Dispute(
                    accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
                    amount: 150,
                    buyer: Nullable<DisputeBuyer>.value(DisputeBuyer(
                        email: Nullable<String>.value("marcus@shinetime.example"),
                        memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                        name: Nullable<String>.value("Dana Whitfield"),
                        userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                        username: Nullable<String>.value("danawhitfield")
                    )),
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
                                contentType: .null,
                                documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                                filename: Nullable<String>.value("customer-order-history.png"),
                                id: "file_xxxxxxxxxxxxxx",
                                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
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
                    evidenceEditable: false,
                    evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
                    evidenceSubmittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    generatedResponseAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                        contentType: Nullable<String>.value("image/png"),
                        filename: Nullable<String>.value("booking-confirmation-email.png"),
                        id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                        platform: false,
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
                    )),
                    id: "dspt_xxxxxxxxxxxxxx",
                    inquiry: false,
                    issuerComments: [
                        DisputeIssuerComment(
                            receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                            text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                        )
                    ],
                    payment: Nullable<DisputePayment>.value(DisputePayment(
                        amount: Nullable<Double>.value(249),
                        cardBrand: Nullable<String>.value("visa"),
                        cardLast4: Nullable<String>.value("4242"),
                        createdAt: "2026-01-01T12:00:00.000Z",
                        currency: Nullable<String>.value("usd"),
                        id: "pay_xxxxxxxxxxxxxx",
                        paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                            card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                                brand: "visa",
                                last4: Nullable<String>.value("4242")
                            )),
                            displayName: "Visa •••• 4242",
                            icons: PaymentMethodIcons(
                                card: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                                    )
                                ),
                                square: PaymentMethodIconVariants(
                                    dark: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                                    ),
                                    light: PaymentMethodIconFiles(
                                        png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                        png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                        png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                        svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                                    )
                                )
                            ),
                            installmentCount: .null,
                            paymentMethodType: "card"
                        )),
                        paymentMethodType: Nullable<String>.value("card"),
                        paymentProcessor: Nullable<String>.value("stripe")
                    )),
                    planId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
                    productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
                    rapidDisputeResolution: false,
                    reason: DisputeReason.fraudulent,
                    reasonCode: Nullable<String>.value("13.1"),
                    status: DisputeStatus.needsResponse,
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListDisputesResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
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
                      "closed": 0,
                      "lost": 0,
                      "needs_response": 1,
                      "under_review": 0,
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
                    closed: 0,
                    lost: 0,
                    needsResponse: 1,
                    underReview: 0,
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
                        "content_type": null,
                        "document_type": "return_policy",
                        "filename": "customer-order-history.png",
                        "id": "file_xxxxxxxxxxxxxx",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
                  "evidence_editable": false,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "2026-01-01T12:00:00.000Z",
                  "generated_response_attachment": {
                    "content_type": "image/png",
                    "filename": "booking-confirmation-email.png",
                    "id": "file_xxxxxxxxxxxxxx",
                    "platform": false,
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
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
                        "last4": "4242"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "stripe"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "rapid_dispute_resolution": false,
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "updated_at": "2026-01-01T12:00:00.000Z"
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
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: Nullable<DisputeBuyer>.value(DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            )),
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
                        contentType: .null,
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        id: "file_xxxxxxxxxxxxxx",
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
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
            evidenceEditable: false,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            generatedResponseAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                contentType: Nullable<String>.value("image/png"),
                filename: Nullable<String>.value("booking-confirmation-email.png"),
                id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                platform: false,
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            )),
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            payment: Nullable<DisputePayment>.value(DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: "visa",
                        last4: Nullable<String>.value("4242")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("stripe")
            )),
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            rapidDisputeResolution: false,
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            updatedAt: "2026-01-01T12:00:00.000Z"
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
                        "content_type": null,
                        "document_type": "return_policy",
                        "filename": "customer-order-history.png",
                        "id": "file_xxxxxxxxxxxxxx",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
                  "evidence_editable": false,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "2026-01-01T12:00:00.000Z",
                  "generated_response_attachment": {
                    "content_type": "image/png",
                    "filename": "booking-confirmation-email.png",
                    "id": "file_xxxxxxxxxxxxxx",
                    "platform": false,
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
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
                        "last4": "4242"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "stripe"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "rapid_dispute_resolution": false,
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "updated_at": "2026-01-01T12:00:00.000Z"
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
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: Nullable<DisputeBuyer>.value(DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            )),
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
                        contentType: .null,
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        id: "file_xxxxxxxxxxxxxx",
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
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
            evidenceEditable: false,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            generatedResponseAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                contentType: Nullable<String>.value("image/png"),
                filename: Nullable<String>.value("booking-confirmation-email.png"),
                id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                platform: false,
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            )),
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            payment: Nullable<DisputePayment>.value(DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: "visa",
                        last4: Nullable<String>.value("4242")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("stripe")
            )),
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            rapidDisputeResolution: false,
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.disputes.update(
            id: "id",
            request: .init(),
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
                        "content_type": null,
                        "document_type": "return_policy",
                        "filename": "customer-order-history.png",
                        "id": "file_xxxxxxxxxxxxxx",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
                  "evidence_editable": false,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "2026-01-01T12:00:00.000Z",
                  "generated_response_attachment": {
                    "content_type": "image/png",
                    "filename": "booking-confirmation-email.png",
                    "id": "file_xxxxxxxxxxxxxx",
                    "platform": false,
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
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
                        "last4": "4242"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "stripe"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "rapid_dispute_resolution": false,
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "updated_at": "2026-01-01T12:00:00.000Z"
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
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: Nullable<DisputeBuyer>.value(DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            )),
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
                        contentType: .null,
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        id: "file_xxxxxxxxxxxxxx",
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
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
            evidenceEditable: false,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            generatedResponseAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                contentType: Nullable<String>.value("image/png"),
                filename: Nullable<String>.value("booking-confirmation-email.png"),
                id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                platform: false,
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            )),
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            payment: Nullable<DisputePayment>.value(DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: "visa",
                        last4: Nullable<String>.value("4242")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("stripe")
            )),
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            rapidDisputeResolution: false,
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.disputes.submit(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func submitEvidenceDispute1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
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
                        "content_type": null,
                        "document_type": "return_policy",
                        "filename": "customer-order-history.png",
                        "id": "file_xxxxxxxxxxxxxx",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
                  "evidence_editable": false,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "2026-01-01T12:00:00.000Z",
                  "generated_response_attachment": {
                    "content_type": "image/png",
                    "filename": "booking-confirmation-email.png",
                    "id": "file_xxxxxxxxxxxxxx",
                    "platform": false,
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
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
                        "last4": "4242"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "stripe"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "rapid_dispute_resolution": false,
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "updated_at": "2026-01-01T12:00:00.000Z"
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
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: Nullable<DisputeBuyer>.value(DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            )),
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
                        contentType: .null,
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        id: "file_xxxxxxxxxxxxxx",
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
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
            evidenceEditable: false,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            generatedResponseAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                contentType: Nullable<String>.value("image/png"),
                filename: Nullable<String>.value("booking-confirmation-email.png"),
                id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                platform: false,
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            )),
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            payment: Nullable<DisputePayment>.value(DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: "visa",
                        last4: Nullable<String>.value("4242")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("stripe")
            )),
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            rapidDisputeResolution: false,
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.disputes.submitEvidenceDispute(
            id: "dspt_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateEvidenceDispute1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
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
                        "content_type": null,
                        "document_type": "return_policy",
                        "filename": "customer-order-history.png",
                        "id": "file_xxxxxxxxxxxxxx",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
                  "evidence_editable": false,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "2026-01-01T12:00:00.000Z",
                  "generated_response_attachment": {
                    "content_type": "image/png",
                    "filename": "booking-confirmation-email.png",
                    "id": "file_xxxxxxxxxxxxxx",
                    "platform": false,
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
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
                        "last4": "4242"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "stripe"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "rapid_dispute_resolution": false,
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "updated_at": "2026-01-01T12:00:00.000Z"
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
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: Nullable<DisputeBuyer>.value(DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            )),
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
                        contentType: .null,
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        id: "file_xxxxxxxxxxxxxx",
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
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
            evidenceEditable: false,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            generatedResponseAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                contentType: Nullable<String>.value("image/png"),
                filename: Nullable<String>.value("booking-confirmation-email.png"),
                id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                platform: false,
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            )),
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            payment: Nullable<DisputePayment>.value(DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: "visa",
                        last4: Nullable<String>.value("4242")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("stripe")
            )),
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            rapidDisputeResolution: false,
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.disputes.updateEvidenceDispute(
            id: "dspt_xxxxxxxxxxxxx",
            request: .init(),
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
                        "content_type": null,
                        "document_type": "return_policy",
                        "filename": "customer-order-history.png",
                        "id": "file_xxxxxxxxxxxxxx",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
                  "evidence_editable": false,
                  "evidence_locked_reason": "submitted",
                  "evidence_submitted_at": "2026-01-01T12:00:00.000Z",
                  "generated_response_attachment": {
                    "content_type": "image/png",
                    "filename": "booking-confirmation-email.png",
                    "id": "file_xxxxxxxxxxxxxx",
                    "platform": false,
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "id": "dspt_xxxxxxxxxxxxxx",
                  "inquiry": false,
                  "issuer_comments": [
                    {
                      "received_at": "2026-01-01T12:00:00.000Z",
                      "text": "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
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
                        "last4": "4242"
                      },
                      "display_name": "Visa •••• 4242",
                      "icons": {
                        "card": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        },
                        "square": {
                          "dark": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          },
                          "light": {
                            "png_1x": "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                            "png_2x": "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                            "png_4x": "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                            "svg": "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                          }
                        }
                      },
                      "installment_count": 1.1,
                      "payment_method_type": "card"
                    },
                    "payment_method_type": "card",
                    "payment_processor": "stripe"
                  },
                  "plan_id": "plan_xxxxxxxxxxxxxx",
                  "product_id": "prod_xxxxxxxxxxxxxx",
                  "rapid_dispute_resolution": false,
                  "reason": "fraudulent",
                  "reason_code": "13.1",
                  "status": "needs_response",
                  "updated_at": "2026-01-01T12:00:00.000Z"
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
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: 150,
            buyer: Nullable<DisputeBuyer>.value(DisputeBuyer(
                email: Nullable<String>.value("marcus@shinetime.example"),
                memberId: Nullable<String>.value("mber_xxxxxxxxxxxxxx"),
                name: Nullable<String>.value("Dana Whitfield"),
                userId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                username: Nullable<String>.value("danawhitfield")
            )),
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
                        contentType: .null,
                        documentType: DisputeEvidenceDocumentDocumentType.returnPolicy,
                        filename: Nullable<String>.value("customer-order-history.png"),
                        id: "file_xxxxxxxxxxxxxx",
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
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
            evidenceEditable: false,
            evidenceLockedReason: Nullable<DisputeEvidenceLockedReason>.value(DisputeEvidenceLockedReason.submitted),
            evidenceSubmittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            generatedResponseAttachment: Nullable<DisputeAttachment>.value(DisputeAttachment(
                contentType: Nullable<String>.value("image/png"),
                filename: Nullable<String>.value("booking-confirmation-email.png"),
                id: Nullable<String>.value("file_xxxxxxxxxxxxxx"),
                platform: false,
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
            )),
            id: "dspt_xxxxxxxxxxxxxx",
            inquiry: false,
            issuerComments: [
                DisputeIssuerComment(
                    receivedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    text: "Note: Cardholder states the ceramic coating appointment never took place\nCancellation method: By phone"
                )
            ],
            payment: Nullable<DisputePayment>.value(DisputePayment(
                amount: Nullable<Double>.value(249),
                cardBrand: Nullable<String>.value("visa"),
                cardLast4: Nullable<String>.value("4242"),
                createdAt: "2026-01-01T12:00:00.000Z",
                currency: Nullable<String>.value("usd"),
                id: "pay_xxxxxxxxxxxxxx",
                paymentInstrument: Nullable<PaymentInstrument>.value(PaymentInstrument(
                    card: Nullable<PaymentInstrumentCard>.value(PaymentInstrumentCard(
                        brand: "visa",
                        last4: Nullable<String>.value("4242")
                    )),
                    displayName: "Visa •••• 4242",
                    icons: PaymentMethodIcons(
                        card: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        ),
                        square: PaymentMethodIconVariants(
                            dark: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            ),
                            light: PaymentMethodIconFiles(
                                png1X: "https://content.whop.com/payment_methods/visa/icons/card_dark_30.png",
                                png2X: "https://content.whop.com/payment_methods/visa/icons/card_dark_60.png",
                                png4X: "https://content.whop.com/payment_methods/visa/icons/card_dark_120.png",
                                svg: "https://content.whop.com/payment_methods/visa/icons/card_dark.svg"
                            )
                        )
                    ),
                    installmentCount: Nullable<Double>.value(1.1),
                    paymentMethodType: "card"
                )),
                paymentMethodType: Nullable<String>.value("card"),
                paymentProcessor: Nullable<String>.value("stripe")
            )),
            planId: Nullable<String>.value("plan_xxxxxxxxxxxxxx"),
            productId: Nullable<String>.value("prod_xxxxxxxxxxxxxx"),
            rapidDisputeResolution: false,
            reason: DisputeReason.fraudulent,
            reasonCode: Nullable<String>.value("13.1"),
            status: DisputeStatus.needsResponse,
            updatedAt: "2026-01-01T12:00:00.000Z"
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