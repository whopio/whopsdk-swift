import Foundation

/// How the authenticator holding this passkey can be reached, as it reported at registration. Empty when unknown.
public enum PasskeyCredentialDescriptorTransportsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case ble
    case hybrid
    case `internal`
    case nfc
    case smartCard = "smart-card"
    case usb
}