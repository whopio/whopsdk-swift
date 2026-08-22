import Foundation

/// Whether `value` is raw input or a vault token.
public enum UpdateVerificationsRequestBodyPersonalAddressRequestedInformationItemValueType: String, Codable, Hashable, CaseIterable, Sendable {
    case raw
    case vaultToken = "vault_token"
}