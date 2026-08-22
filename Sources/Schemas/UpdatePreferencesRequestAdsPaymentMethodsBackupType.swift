import Foundation

/// The funding source kind.
public enum UpdatePreferencesRequestAdsPaymentMethodsBackupType: String, Codable, Hashable, CaseIterable, Sendable {
    case platformBalance = "platform_balance"
    case card
}