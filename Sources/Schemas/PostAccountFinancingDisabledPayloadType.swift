import Foundation

/// The webhook event type
public enum PostAccountFinancingDisabledPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case accountFinancingDisabled = "account.financing_disabled"
}