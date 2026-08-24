import Foundation

/// Where the account's ads services agreement stands.
public enum RetrievePreferencesResponseAdsAgreementStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case notRequired = "not_required"
    case pendingSignature = "pending_signature"
    case signed
}