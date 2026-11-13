import Foundation

/// Whether a question with `options` accepts one value or multiple values.
public enum CreateVerificationsResponseRequestedInformationItemSelectionMode: String, Codable, Hashable, CaseIterable, Sendable {
    case single
    case multiple
}