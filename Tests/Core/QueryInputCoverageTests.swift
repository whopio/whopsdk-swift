import Foundation
import Testing
@testable import WhopSDK

@Suite(.serialized)
struct QueryInputCoverageTests {
    @Test func allGeneratedEnumArrayInputsKeepEveryValue() throws {
        let inputs: [(String, String, QueryParameter, [String])] = [
            ("Sources/Resources/Channels/ChannelsClient.swift:kind", "kind", .unknown(ListChannelsRequestKindItem.allCases), ListChannelsRequestKindItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Disputes/DisputesClient.swift:status", "status", .unknown(ListDisputesRequestStatusItem.allCases), ListDisputesRequestStatusItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Disputes/DisputesClient.swift:groups", "groups", .unknown(SummaryDisputesRequestGroupsItem.allCases), SummaryDisputesRequestGroupsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Disputes/DisputesClient.swift:status", "status", .unknown(SummaryDisputesRequestStatusItem.allCases), SummaryDisputesRequestStatusItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ExternalAccounts/ExternalAccountsClient.swift:scopes", "scopes", .unknown(ListExternalAccountsRequestScopesItem.allCases), ListExternalAccountsRequestScopesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/FinancialActivity/FinancialActivityClient.swift:line_types", "line_types", .unknown(ListFinancialActivityRequestLineTypesItem.allCases), ListFinancialActivityRequestLineTypesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/FinancialReports/FinancialReportsClient.swift:line_types", "line_types", .unknown(RetrieveFinancialReportsRequestLineTypesItem.allCases), RetrieveFinancialReportsRequestLineTypesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Members/MembersClient.swift:most_recent_actions", "most_recent_actions", .unknown(ListMembersRequestMostRecentActionsItem.allCases), ListMembersRequestMostRecentActionsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Memberships/MembershipsClient.swift:statuses", "statuses", .unknown(ListMembershipsRequestStatusesItem.allCases), ListMembershipsRequestStatusesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Partners/Businesses/Earnings/EarningsClient.swift:income_source", "income_source", .unknown(ListEarningsRequestIncomeSourceItem.allCases), ListEarningsRequestIncomeSourceItem.allCases.map(\.rawValue)),
            ("Sources/Resources/PaymentMethods/PaymentMethodsClient.swift:payment_method_types", "payment_method_types", .unknown(PaymentMethodTypes.allCases), PaymentMethodTypes.allCases.map(\.rawValue)),
            ("Sources/Resources/PaymentMethods/PaymentMethodsClient.swift:card_brands", "card_brands", .unknown(CardBrands.allCases), CardBrands.allCases.map(\.rawValue)),
            ("Sources/Resources/PaymentMethods/PaymentMethodsClient.swift:card_funding_types", "card_funding_types", .unknown(CardFundingTypes.allCases), CardFundingTypes.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:statuses", "statuses", .unknown(ListPaymentsRequestStatusesItem.allCases), ListPaymentsRequestStatusesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:substatuses", "substatuses", .unknown(ListPaymentsRequestSubstatusesItem.allCases), ListPaymentsRequestSubstatusesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:billing_reasons", "billing_reasons", .unknown(ListPaymentsRequestBillingReasonsItem.allCases), ListPaymentsRequestBillingReasonsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:payment_methods", "payment_methods", .unknown(ListPaymentsRequestPaymentMethodsItem.allCases), ListPaymentsRequestPaymentMethodsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:tracking_states", "tracking_states", .unknown(ListPaymentsRequestTrackingStatesItem.allCases), ListPaymentsRequestTrackingStatesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:groups", "groups", .unknown(SummaryPaymentsRequestGroupsItem.allCases), SummaryPaymentsRequestGroupsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:statuses", "statuses", .unknown(SummaryPaymentsRequestStatusesItem.allCases), SummaryPaymentsRequestStatusesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:substatuses", "substatuses", .unknown(SummaryPaymentsRequestSubstatusesItem.allCases), SummaryPaymentsRequestSubstatusesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:billing_reasons", "billing_reasons", .unknown(SummaryPaymentsRequestBillingReasonsItem.allCases), SummaryPaymentsRequestBillingReasonsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:payment_methods", "payment_methods", .unknown(SummaryPaymentsRequestPaymentMethodsItem.allCases), SummaryPaymentsRequestPaymentMethodsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Payments/PaymentsClient.swift:tracking_states", "tracking_states", .unknown(SummaryPaymentsRequestTrackingStatesItem.allCases), SummaryPaymentsRequestTrackingStatesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Products/ProductsClient.swift:billing_types", "billing_types", .unknown(ListProductsRequestBillingTypesItem.allCases), ListProductsRequestBillingTypesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift:status", "status", .unknown(ListResolutionCenterCasesRequestStatusItem.allCases), ListResolutionCenterCasesRequestStatusItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift:reason", "reason", .unknown(ListResolutionCenterCasesRequestReasonItem.allCases), ListResolutionCenterCasesRequestReasonItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift:outcome", "outcome", .unknown(ListResolutionCenterCasesRequestOutcomeItem.allCases), ListResolutionCenterCasesRequestOutcomeItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift:groups", "groups", .unknown(SummaryResolutionCenterCasesRequestGroupsItem.allCases), SummaryResolutionCenterCasesRequestGroupsItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift:status", "status", .unknown(SummaryResolutionCenterCasesRequestStatusItem.allCases), SummaryResolutionCenterCasesRequestStatusItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift:reason", "reason", .unknown(SummaryResolutionCenterCasesRequestReasonItem.allCases), SummaryResolutionCenterCasesRequestReasonItem.allCases.map(\.rawValue)),
            ("Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift:outcome", "outcome", .unknown(SummaryResolutionCenterCasesRequestOutcomeItem.allCases), SummaryResolutionCenterCasesRequestOutcomeItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Search/SearchClient.swift:types", "types", .unknown(ListSearchRequestTypesItem.allCases), ListSearchRequestTypesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/SocialAccounts/SocialAccountsClient.swift:scopes", "scopes", .unknown(ListSocialAccountsRequestScopesItem.allCases), ListSocialAccountsRequestScopesItem.allCases.map(\.rawValue)),
            ("Sources/Resources/Webhooks/WebhooksClient.swift:events", "events", .unknown(ListDeliveriesWebhooksRequestEventsItem.allCases), ListDeliveriesWebhooksRequestEventsItem.allCases.map(\.rawValue)),
        ]
        for (source, name, input, values) in inputs {
            let items = try input.queryItems(name: name)
            #expect(items.map(\.name) == Array(repeating: name, count: values.count), "\(source)")
            #expect(items.compactMap(\.value) == values, "\(source)")
        }
    }
}
