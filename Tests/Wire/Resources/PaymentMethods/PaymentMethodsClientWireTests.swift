import Foundation
import Testing
import WhopSDK

@Suite("PaymentMethodsClient Wire Tests") struct PaymentMethodsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2023-12-01T05:00:00Z",
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
                      "id": "payt_xxxxxxxxxxxxx",
                      "payment_method_type": "acss_debit",
                      "typename": "BasePaymentMethod"
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
        let expectedResponse = ListPaymentMethodsResponse(
            data: [
                PaymentMethodListItem.basePaymentMethod(
                    .init(
                        createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                        icons: PaymentMethodListItemBasePaymentMethodIcons(
                            card: PaymentMethodListItemBasePaymentMethodIconsCard(
                                dark: PaymentMethodListItemBasePaymentMethodIconsCardDark(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentMethodListItemBasePaymentMethodIconsCardLight(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            ),
                            square: PaymentMethodListItemBasePaymentMethodIconsSquare(
                                dark: PaymentMethodListItemBasePaymentMethodIconsSquareDark(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                ),
                                light: PaymentMethodListItemBasePaymentMethodIconsSquareLight(
                                    png1X: "png_1x",
                                    png2X: "png_2x",
                                    png4X: "png_4x",
                                    svg: "svg"
                                )
                            )
                        ),
                        id: "payt_xxxxxxxxxxxxx",
                        paymentMethodType: PaymentMethodTypes.acssDebit,
                        additionalProperties: [
                            "typename": JSONValue.string("BasePaymentMethod")
                        ]
                    )
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.paymentMethods.list(
            first: 42,
            last: 42,
            memberId: "mber_xxxxxxxxxxxxx",
            companyId: "biz_xxxxxxxxxxxxxx",
            createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
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
                  "created_at": "2023-12-01T05:00:00Z",
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
                  "id": "payt_xxxxxxxxxxxxx",
                  "payment_method_type": "acss_debit",
                  "typename": "BasePaymentMethod"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PaymentMethod.basePaymentMethod(
            .init(
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                icons: PaymentMethodBasePaymentMethodIcons(
                    card: PaymentMethodBasePaymentMethodIconsCard(
                        dark: PaymentMethodBasePaymentMethodIconsCardDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodBasePaymentMethodIconsCardLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    ),
                    square: PaymentMethodBasePaymentMethodIconsSquare(
                        dark: PaymentMethodBasePaymentMethodIconsSquareDark(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        ),
                        light: PaymentMethodBasePaymentMethodIconsSquareLight(
                            png1X: "png_1x",
                            png2X: "png_2x",
                            png4X: "png_4x",
                            svg: "svg"
                        )
                    )
                ),
                id: "payt_xxxxxxxxxxxxx",
                paymentMethodType: PaymentMethodTypes.acssDebit,
                additionalProperties: [
                    "typename": JSONValue.string("BasePaymentMethod")
                ]
            )
        )
        let response = try await client.paymentMethods.retrieve(
            id: "payt_xxxxxxxxxxxxx",
            companyId: "biz_xxxxxxxxxxxxxx",
            memberId: "mber_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func deletePaymentMethod1() async throws -> Void {
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
        let response = try await client.paymentMethods.deletePaymentMethod(
            id: "payt_xxxxxxxxxxxxx",
            companyId: "biz_xxxxxxxxxxxxxx",
            memberId: "mber_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}