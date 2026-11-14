import Foundation

/// What the holder must do; new values may be added, so handle unknown actions gracefully
public enum AccountRequiredActionAction: String, Codable, Hashable, CaseIterable, Sendable {
    case depositFunds = "deposit_funds"
    case reviewHeldPayments = "review_held_payments"
    case submitInformationRequest = "submit_information_request"
    case updateAutomaticWithdrawalMethod = "update_automatic_withdrawal_method"
    case reauthorizePayoutMethods = "reauthorize_payout_methods"
    case updatePayoutMethod = "update_payout_method"
    case updatePayoutProfile = "update_payout_profile"
    case cardUsageReview = "card_usage_review"
    case verifyIdentity = "verify_identity"
    case scaleAccountSetup = "scale_account_setup"
    case signFormationDocuments = "sign_formation_documents"
    case configureTaxRemitter = "configure_tax_remitter"
    case addVatRegistration = "add_vat_registration"
    case confirmTaxDetails = "confirm_tax_details"
    case acceptPayoutTerms = "accept_payout_terms"
    case enableTwoFactorAuthentication = "enable_two_factor_authentication"
    case respondToAbuseReport = "respond_to_abuse_report"
}