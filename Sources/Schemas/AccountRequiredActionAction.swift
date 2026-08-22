import Foundation

/// What the holder must do; new values may be added, so handle unknown actions gracefully
public enum AccountRequiredActionAction: String, Codable, Hashable, CaseIterable, Sendable {
    case depositFunds = "deposit_funds"
    case submitInformationRequest = "submit_information_request"
    case reauthorizePayoutMethods = "reauthorize_payout_methods"
    case updatePayoutProfile = "update_payout_profile"
    case cardUsageReview = "card_usage_review"
    case verifyIdentity = "verify_identity"
    case signFormationDocuments = "sign_formation_documents"
    case connectFulfillmentTracker = "connect_fulfillment_tracker"
    case setupApplePayDomains = "setup_apple_pay_domains"
    case configureTaxRemitter = "configure_tax_remitter"
    case addVatRegistration = "add_vat_registration"
}