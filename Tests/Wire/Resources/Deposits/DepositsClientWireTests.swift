import Foundation
import Testing
import WhopSDK

@Suite("DepositsClient Wire Tests") struct DepositsClientWireTests {
    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "amount": "50.00",
                  "hosted_url": "https://whop.com/deposit/biz_xxxxxxxxxxxxxx/",
                  "metadata": {
                    "invoice": "SHINE-1042"
                  },
                  "methods": {
                    "bank": {
                      "currencies": [
                        {
                          "account_number": "8825310472",
                          "currency": "USD",
                          "deposit_bank_address": "2115 Linwood Avenue, Fort Lee, New Jersey 07024",
                          "deposit_bank_name": "Cross River Bank",
                          "deposit_beneficiary_name": "Shine Time Auto Detailing",
                          "deposit_reference": "SHINE-1042",
                          "rails": [
                            "ach"
                          ],
                          "routing_number": "021214891",
                          "swift_bic": "CRBAUS33"
                        }
                      ]
                    },
                    "crypto": [
                      {
                        "deposit_address": "soladdr",
                        "icon_url": "https://whop.com/crypto/solana.svg",
                        "name": "Ethereum",
                        "supported_currencies": [
                          {
                            "icon_url": "https://whop.com/crypto/ethereum.svg",
                            "name": "ARB"
                          }
                        ]
                      }
                    ]
                  },
                  "object": "deposit"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CreateDepositsResponse(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            amount: Optional("50.00"),
            hostedUrl: Nullable<String>.value("https://whop.com/deposit/biz_xxxxxxxxxxxxxx/"),
            metadata: [
                "invoice": JSONValue.string("SHINE-1042")
            ],
            methods: CreateDepositsResponseMethods(
                bank: Nullable<CreateDepositsResponseMethodsBank>.value(CreateDepositsResponseMethodsBank(
                    currencies: [
                        CreateDepositsResponseMethodsBankCurrenciesItem(
                            accountNumber: Nullable<String>.value("8825310472"),
                            currency: "USD",
                            depositBankAddress: Nullable<String>.value("2115 Linwood Avenue, Fort Lee, New Jersey 07024"),
                            depositBankName: Nullable<String>.value("Cross River Bank"),
                            depositBeneficiaryName: Nullable<String>.value("Shine Time Auto Detailing"),
                            depositReference: Nullable<String>.value("SHINE-1042"),
                            rails: [
                                CreateDepositsResponseMethodsBankCurrenciesItemRailsItem.ach
                            ],
                            routingNumber: Nullable<String>.value("021214891"),
                            swiftBic: Nullable<String>.value("CRBAUS33")
                        )
                    ]
                )),
                crypto: [
                    CreateDepositsResponseMethodsCryptoItem(
                        depositAddress: Nullable<String>.value("soladdr"),
                        iconUrl: Nullable<String>.value("https://whop.com/crypto/solana.svg"),
                        name: CreateDepositsResponseMethodsCryptoItemName.ethereum,
                        supportedCurrencies: [
                            CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItem(
                                iconUrl: Nullable<String>.value("https://whop.com/crypto/ethereum.svg"),
                                name: CreateDepositsResponseMethodsCryptoItemSupportedCurrenciesItemName.arb
                            )
                        ]
                    )
                ]
            ),
            object: CreateDepositsResponseObject.deposit
        )
        let response = try await client.deposits.create(
            request: .init(destination: CreateDepositsRequestDestination.string(
                "destination"
            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}