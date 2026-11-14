import Foundation

/// Whether a question with `options` accepts one value or multiple values.
public enum UpdateVerificationsResponseRequestedInformationItemSelectionMode: String, Codable, Hashable, CaseIterable, Sendable {
    case single
    case multiple
}