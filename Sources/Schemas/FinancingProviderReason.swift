import Foundation

/// Why the provider has this status, when known. On `active` it is `dispute_rate_near_limit` when the provider is close to being turned off. On `inactive` it names what keeps it off, including `not_included` when the account's approval doesn't cover it, `turned_off` when it was switched off after setup, `setup_failed`, and `declined` when the provider turned the account down without a reason Whop recognizes. More reasons may be added.
public enum FinancingProviderReason: String, Codable, Hashable, CaseIterable, Sendable {
    case accountNotSupported = "account_not_supported"
    case payinAccountRequired = "payin_account_required"
    case paymentAccountRequired = "payment_account_required"
    case processorConnectionRequired = "processor_connection_required"
    case minimumVolumeNotMet = "minimum_volume_not_met"
    case turnedOffInCheckoutSettings = "turned_off_in_checkout_settings"
    case providerReview = "provider_review"
    case disputeRateNearLimit = "dispute_rate_near_limit"
    case disputeRateExceeded = "dispute_rate_exceeded"
    case whopRiskControl = "whop_risk_control"
    case notIncluded = "not_included"
    case turnedOff = "turned_off"
    case declined
    case setupFailed = "setup_failed"
    case payoutAccountCountryUnsupported = "payout_account_country_unsupported"
    case sellerCountryUnsupported = "seller_country_unsupported"
    case approvedDisputeRateTooHigh = "approved_dispute_rate_too_high"
    case restrictedIndustry = "restricted_industry"
    case incomeClaims = "income_claims"
    case missingStoreDetails = "missing_store_details"
    case duplicateAccount = "duplicate_account"
    case invalidWebsite = "invalid_website"
    case unspecified
}