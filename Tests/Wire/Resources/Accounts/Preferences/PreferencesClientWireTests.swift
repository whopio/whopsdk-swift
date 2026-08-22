import Foundation
import Testing
import WhopSDK

@Suite("PreferencesClient Wire Tests") struct PreferencesClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ads_agreement": {
                    "accepted_at": "2026-01-01T12:00:00.000Z",
                    "agreement_version": "2026-01-01",
                    "printed_name": "Marcus Webb",
                    "status": "not_required"
                  },
                  "ads_payment_methods": {
                    "backup": {
                      "card_brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "ldgr_xxxxxxxxxxxxxx",
                      "last4": "4242",
                      "title": "Shine Time Auto Detailing",
                      "type": "platform_balance"
                    },
                    "primary": {
                      "card_brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "ldgr_xxxxxxxxxxxxxx",
                      "last4": "4242",
                      "title": "Shine Time Auto Detailing",
                      "type": "platform_balance"
                    }
                  },
                  "ads_reporting_currency": "usd",
                  "ads_scheduling_timezone": "America/New_York",
                  "ads_triple_whale_integration": {
                    "masked_api_key": "tw_live_********",
                    "shop_domain": "shinetime.myshopify.com",
                    "status": "connected"
                  },
                  "cards_auto_top_up": false,
                  "dispute_fighter_enabled": false
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetrievePreferencesResponse(
            adsAgreement: RetrievePreferencesResponseAdsAgreement(
                acceptedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                agreementVersion: Nullable<String>.value("2026-01-01"),
                printedName: Nullable<String>.value("Marcus Webb"),
                status: RetrievePreferencesResponseAdsAgreementStatus.notRequired
            ),
            adsPaymentMethods: Nullable<RetrievePreferencesResponseAdsPaymentMethods>.value(RetrievePreferencesResponseAdsPaymentMethods(
                backup: Nullable<RetrievePreferencesResponseAdsPaymentMethodsBackup>.value(RetrievePreferencesResponseAdsPaymentMethodsBackup(
                    cardBrand: Optional(Nullable<String>.value("visa")),
                    expMonth: Optional(Nullable<Int>.value(10)),
                    expYear: Optional(Nullable<Int>.value(2031)),
                    iconUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                    id: "ldgr_xxxxxxxxxxxxxx",
                    last4: Optional(Nullable<String>.value("4242")),
                    title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                    type: RetrievePreferencesResponseAdsPaymentMethodsBackupType.platformBalance
                )),
                primary: Nullable<RetrievePreferencesResponseAdsPaymentMethodsPrimary>.value(RetrievePreferencesResponseAdsPaymentMethodsPrimary(
                    cardBrand: Optional(Nullable<String>.value("visa")),
                    expMonth: Optional(Nullable<Int>.value(10)),
                    expYear: Optional(Nullable<Int>.value(2031)),
                    iconUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                    id: "ldgr_xxxxxxxxxxxxxx",
                    last4: Optional(Nullable<String>.value("4242")),
                    title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                    type: RetrievePreferencesResponseAdsPaymentMethodsPrimaryType.platformBalance
                ))
            )),
            adsReportingCurrency: "usd",
            adsSchedulingTimezone: "America/New_York",
            adsTripleWhaleIntegration: RetrievePreferencesResponseAdsTripleWhaleIntegration(
                maskedApiKey: Nullable<String>.value("tw_live_********"),
                shopDomain: Nullable<String>.value("shinetime.myshopify.com"),
                status: RetrievePreferencesResponseAdsTripleWhaleIntegrationStatus.connected
            ),
            cardsAutoTopUp: false,
            disputeFighterEnabled: false
        )
        let response = try await client.accounts.preferences.retrieve(
            accountId: "account_id",
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
                  "ads_agreement": {
                    "accepted_at": "2026-01-01T12:00:00.000Z",
                    "agreement_version": "2026-01-01",
                    "printed_name": "Marcus Webb",
                    "status": "not_required"
                  },
                  "ads_payment_methods": {
                    "backup": {
                      "card_brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "ldgr_xxxxxxxxxxxxxx",
                      "last4": "4242",
                      "title": "Shine Time Auto Detailing",
                      "type": "platform_balance"
                    },
                    "primary": {
                      "card_brand": "visa",
                      "exp_month": 10,
                      "exp_year": 2031,
                      "icon_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "id": "ldgr_xxxxxxxxxxxxxx",
                      "last4": "4242",
                      "title": "Shine Time Auto Detailing",
                      "type": "platform_balance"
                    }
                  },
                  "ads_reporting_currency": "usd",
                  "ads_scheduling_timezone": "America/New_York",
                  "ads_triple_whale_integration": {
                    "masked_api_key": "tw_live_********",
                    "shop_domain": "shinetime.myshopify.com",
                    "status": "connected"
                  },
                  "cards_auto_top_up": false,
                  "dispute_fighter_enabled": false
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UpdatePreferencesResponse(
            adsAgreement: UpdatePreferencesResponseAdsAgreement(
                acceptedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                agreementVersion: Nullable<String>.value("2026-01-01"),
                printedName: Nullable<String>.value("Marcus Webb"),
                status: UpdatePreferencesResponseAdsAgreementStatus.notRequired
            ),
            adsPaymentMethods: Nullable<UpdatePreferencesResponseAdsPaymentMethods>.value(UpdatePreferencesResponseAdsPaymentMethods(
                backup: Nullable<UpdatePreferencesResponseAdsPaymentMethodsBackup>.value(UpdatePreferencesResponseAdsPaymentMethodsBackup(
                    cardBrand: Optional(Nullable<String>.value("visa")),
                    expMonth: Optional(Nullable<Int>.value(10)),
                    expYear: Optional(Nullable<Int>.value(2031)),
                    iconUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                    id: "ldgr_xxxxxxxxxxxxxx",
                    last4: Optional(Nullable<String>.value("4242")),
                    title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                    type: UpdatePreferencesResponseAdsPaymentMethodsBackupType.platformBalance
                )),
                primary: Nullable<UpdatePreferencesResponseAdsPaymentMethodsPrimary>.value(UpdatePreferencesResponseAdsPaymentMethodsPrimary(
                    cardBrand: Optional(Nullable<String>.value("visa")),
                    expMonth: Optional(Nullable<Int>.value(10)),
                    expYear: Optional(Nullable<Int>.value(2031)),
                    iconUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")),
                    id: "ldgr_xxxxxxxxxxxxxx",
                    last4: Optional(Nullable<String>.value("4242")),
                    title: Optional(Nullable<String>.value("Shine Time Auto Detailing")),
                    type: UpdatePreferencesResponseAdsPaymentMethodsPrimaryType.platformBalance
                ))
            )),
            adsReportingCurrency: "usd",
            adsSchedulingTimezone: "America/New_York",
            adsTripleWhaleIntegration: UpdatePreferencesResponseAdsTripleWhaleIntegration(
                maskedApiKey: Nullable<String>.value("tw_live_********"),
                shopDomain: Nullable<String>.value("shinetime.myshopify.com"),
                status: UpdatePreferencesResponseAdsTripleWhaleIntegrationStatus.connected
            ),
            cardsAutoTopUp: false,
            disputeFighterEnabled: false
        )
        let response = try await client.accounts.preferences.update(
            accountId: "account_id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}