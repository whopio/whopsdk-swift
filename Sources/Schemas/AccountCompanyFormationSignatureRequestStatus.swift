import Foundation

/// `pending` when a signing session is ready for the founder; `unknown` when the signature state could not be determined.
public enum AccountCompanyFormationSignatureRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case unknown
}