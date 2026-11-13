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
                  "cancellation_emails": true,
                  "cards_auto_top_up": false,
                  "cards_notifications": true,
                  "covers_subaccount_negative_balances": true,
                  "customer_tracking": {
                    "accent_color": "accent_color",
                    "enabled": true,
                    "show_business_name": true,
                    "show_logo": true,
                    "support_email": "support_email",
                    "support_url": "support_url"
                  },
                  "dispute_fighter_enabled": false,
                  "economic_intelligence": false,
                  "economic_intelligence_auto_renew": false,
                  "economic_intelligence_ends_at": "economic_intelligence_ends_at",
                  "economic_intelligence_fee_percentage": 1.1,
                  "economic_intelligence_first_renewal_at": "economic_intelligence_first_renewal_at",
                  "economic_intelligence_offers": [
                    {
                      "auto_renew": true,
                      "duration": 3,
                      "duration_unit": "hours",
                      "fee_percentage": 3,
                      "key": "3_days",
                      "recommended": true
                    }
                  ],
                  "economic_intelligence_previous_period": {
                    "ended_at": "2026-01-01T12:00:00.000Z",
                    "fee_percentage": 3
                  },
                  "failed_payment_emails": true,
                  "feedback_options": [
                    {
                      "category": "too_expensive",
                      "id": "fo_xxxxxxxxxxxxxx",
                      "label": "I don't get my car detailed often enough"
                    }
                  ],
                  "preferred_settlement_currency": "usd",
                  "preferred_settlement_currency_changeable_at": "preferred_settlement_currency_changeable_at",
                  "renewal_reminder_emails": true,
                  "review_request_emails": true,
                  "subaccount_notifications": true,
                  "subaccount_team_view_only": true,
                  "subscription_failure_behavior": "cancel"
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
            cancellationEmails: true,
            cardsAutoTopUp: false,
            cardsNotifications: true,
            coversSubaccountNegativeBalances: Nullable<Bool>.value(true),
            customerTracking: Nullable<CustomerTrackingPreferences>.value(CustomerTrackingPreferences(
                accentColor: "accent_color",
                enabled: true,
                showBusinessName: true,
                showLogo: true,
                supportEmail: Nullable<String>.value("support_email"),
                supportUrl: Nullable<String>.value("support_url")
            )),
            disputeFighterEnabled: false,
            economicIntelligence: false,
            economicIntelligenceAutoRenew: false,
            economicIntelligenceEndsAt: Nullable<String>.value("economic_intelligence_ends_at"),
            economicIntelligenceFeePercentage: Nullable<Double>.value(1.1),
            economicIntelligenceFirstRenewalAt: Nullable<String>.value("economic_intelligence_first_renewal_at"),
            economicIntelligenceOffers: [
                RetrievePreferencesResponseEconomicIntelligenceOffersItem(
                    autoRenew: true,
                    duration: 3,
                    durationUnit: RetrievePreferencesResponseEconomicIntelligenceOffersItemDurationUnit.hours,
                    feePercentage: 3,
                    key: RetrievePreferencesResponseEconomicIntelligenceOffersItemKey.threeDays,
                    recommended: true
                )
            ],
            economicIntelligencePreviousPeriod: Nullable<RetrievePreferencesResponseEconomicIntelligencePreviousPeriod>.value(RetrievePreferencesResponseEconomicIntelligencePreviousPeriod(
                endedAt: "2026-01-01T12:00:00.000Z",
                feePercentage: 3
            )),
            failedPaymentEmails: true,
            feedbackOptions: [
                RetrievePreferencesResponseFeedbackOptionsItem(
                    category: RetrievePreferencesResponseFeedbackOptionsItemCategory.tooExpensive,
                    id: "fo_xxxxxxxxxxxxxx",
                    label: "I don't get my car detailed often enough"
                )
            ],
            preferredSettlementCurrency: Nullable<RetrievePreferencesResponsePreferredSettlementCurrency>.value(RetrievePreferencesResponsePreferredSettlementCurrency.usd),
            preferredSettlementCurrencyChangeableAt: Nullable<String>.value("preferred_settlement_currency_changeable_at"),
            renewalReminderEmails: true,
            reviewRequestEmails: true,
            subaccountNotifications: Nullable<Bool>.value(true),
            subaccountTeamViewOnly: Nullable<Bool>.value(true),
            subscriptionFailureBehavior: RetrievePreferencesResponseSubscriptionFailureBehavior.cancel
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
                  "cancellation_emails": true,
                  "cards_auto_top_up": false,
                  "cards_notifications": true,
                  "covers_subaccount_negative_balances": false,
                  "customer_tracking": {
                    "accent_color": "accent_color",
                    "enabled": true,
                    "show_business_name": true,
                    "show_logo": true,
                    "support_email": "support_email",
                    "support_url": "support_url"
                  },
                  "dispute_fighter_enabled": false,
                  "economic_intelligence": false,
                  "economic_intelligence_auto_renew": false,
                  "economic_intelligence_ends_at": "2026-01-01T12:00:00.000Z",
                  "economic_intelligence_fee_percentage": 1.5,
                  "economic_intelligence_first_renewal_at": "economic_intelligence_first_renewal_at",
                  "economic_intelligence_offers": [
                    {
                      "auto_renew": true,
                      "duration": 3,
                      "duration_unit": "hours",
                      "fee_percentage": 3,
                      "key": "3_days",
                      "recommended": true
                    }
                  ],
                  "economic_intelligence_previous_period": {
                    "ended_at": "ended_at",
                    "fee_percentage": 1.1
                  },
                  "failed_payment_emails": true,
                  "feedback_options": [
                    {
                      "category": "too_expensive",
                      "id": "fo_xxxxxxxxxxxxxx",
                      "label": "The detail missed spots"
                    }
                  ],
                  "preferred_settlement_currency": "usd",
                  "preferred_settlement_currency_changeable_at": "2026-01-01T12:00:00.000Z",
                  "renewal_reminder_emails": true,
                  "review_request_emails": true,
                  "subaccount_notifications": true,
                  "subaccount_team_view_only": false,
                  "subscription_failure_behavior": "cancel"
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
            cancellationEmails: true,
            cardsAutoTopUp: false,
            cardsNotifications: true,
            coversSubaccountNegativeBalances: Nullable<Bool>.value(false),
            customerTracking: Nullable<CustomerTrackingPreferences>.value(CustomerTrackingPreferences(
                accentColor: "accent_color",
                enabled: true,
                showBusinessName: true,
                showLogo: true,
                supportEmail: Nullable<String>.value("support_email"),
                supportUrl: Nullable<String>.value("support_url")
            )),
            disputeFighterEnabled: false,
            economicIntelligence: false,
            economicIntelligenceAutoRenew: false,
            economicIntelligenceEndsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            economicIntelligenceFeePercentage: Nullable<Double>.value(1.5),
            economicIntelligenceFirstRenewalAt: Nullable<String>.value("economic_intelligence_first_renewal_at"),
            economicIntelligenceOffers: [
                UpdatePreferencesResponseEconomicIntelligenceOffersItem(
                    autoRenew: true,
                    duration: 3,
                    durationUnit: UpdatePreferencesResponseEconomicIntelligenceOffersItemDurationUnit.hours,
                    feePercentage: 3,
                    key: UpdatePreferencesResponseEconomicIntelligenceOffersItemKey.threeDays,
                    recommended: true
                )
            ],
            economicIntelligencePreviousPeriod: Nullable<UpdatePreferencesResponseEconomicIntelligencePreviousPeriod>.value(UpdatePreferencesResponseEconomicIntelligencePreviousPeriod(
                endedAt: "ended_at",
                feePercentage: 1.1
            )),
            failedPaymentEmails: true,
            feedbackOptions: [
                UpdatePreferencesResponseFeedbackOptionsItem(
                    category: UpdatePreferencesResponseFeedbackOptionsItemCategory.tooExpensive,
                    id: "fo_xxxxxxxxxxxxxx",
                    label: "The detail missed spots"
                )
            ],
            preferredSettlementCurrency: Nullable<UpdatePreferencesResponsePreferredSettlementCurrency>.value(UpdatePreferencesResponsePreferredSettlementCurrency.usd),
            preferredSettlementCurrencyChangeableAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            renewalReminderEmails: true,
            reviewRequestEmails: true,
            subaccountNotifications: Nullable<Bool>.value(true),
            subaccountTeamViewOnly: Nullable<Bool>.value(false),
            subscriptionFailureBehavior: UpdatePreferencesResponseSubscriptionFailureBehavior.cancel
        )
        let response = try await client.accounts.preferences.update(
            accountId: "account_id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}