import Foundation

/// The customer-facing payment method family or standalone service.
public enum RetrieveFinancialReportsResponsePaymentFeeBreakdownItemCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case appStorePayments = "app_store_payments"
    case bankPayments = "bank_payments"
    case buyNowPayLater = "buy_now_pay_later"
    case cardPayments = "card_payments"
    case cryptoPayments = "crypto_payments"
    case fraudPrevention = "fraud_prevention"
    case localPayments = "local_payments"
    case otherPaymentMethods = "other_payment_methods"
    case subscriptionBilling = "subscription_billing"
    case walletPayments = "wallet_payments"
    case whopBalance = "whop_balance"
    case whopOrchestration = "whop_orchestration"
}