import Foundation
import Testing
import WhopSDK

@Suite("PayoutMethodsClient Wire Tests") struct PayoutMethodsClientWireTests {
    @Test func listPayoutMethod1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_reference": "****1234",
                      "company": {
                        "id": "biz_xxxxxxxxxxxxxx"
                      },
                      "created_at": "2023-12-01T05:00:00Z",
                      "currency": "USD",
                      "destination": {
                        "category": "crypto",
                        "country_code": "country_code",
                        "name": "name"
                      },
                      "id": "potk_xxxxxxxxxxxxx",
                      "institution_name": "Frost Bank",
                      "is_default": true,
                      "nickname": "Ops checking"
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
        let expectedResponse = ListPayoutMethodResponse(
            data: [
                PayoutMethodListItem(
                    accountReference: Nullable<String>.value("****1234"),
                    company: Nullable<PayoutMethodListItemCompany>.value(PayoutMethodListItemCompany(
                        id: "biz_xxxxxxxxxxxxxx"
                    )),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    currency: "USD",
                    destination: Nullable<PayoutMethodListItemDestination>.value(PayoutMethodListItemDestination(
                        category: PayoutDestinationCategory.crypto,
                        countryCode: "country_code",
                        name: "name"
                    )),
                    id: "potk_xxxxxxxxxxxxx",
                    institutionName: Nullable<String>.value("Frost Bank"),
                    isDefault: true,
                    nickname: Nullable<String>.value("Ops checking")
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.payoutMethods.listPayoutMethod(
            first: 42,
            last: 42,
            companyId: "biz_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrievePayoutMethod1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_reference": "****1234",
                  "company": {
                    "id": "biz_xxxxxxxxxxxxxx"
                  },
                  "created_at": "2023-12-01T05:00:00Z",
                  "currency": "USD",
                  "destination": {
                    "category": "crypto",
                    "country_code": "country_code",
                    "name": "name"
                  },
                  "id": "potk_xxxxxxxxxxxxx",
                  "institution_name": "Frost Bank",
                  "is_default": true,
                  "nickname": "Ops checking"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PayoutMethod(
            accountReference: Nullable<String>.value("****1234"),
            company: Nullable<PayoutMethodCompany>.value(PayoutMethodCompany(
                id: "biz_xxxxxxxxxxxxxx"
            )),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            currency: "USD",
            destination: Nullable<PayoutMethodDestination>.value(PayoutMethodDestination(
                category: PayoutDestinationCategory.crypto,
                countryCode: "country_code",
                name: "name"
            )),
            id: "potk_xxxxxxxxxxxxx",
            institutionName: Nullable<String>.value("Frost Bank"),
            isDefault: true,
            nickname: Nullable<String>.value("Ops checking")
        )
        let response = try await client.payoutMethods.retrievePayoutMethod(
            id: "potk_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}