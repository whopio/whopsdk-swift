import Foundation

/// `pending_upload` until the document has been relayed for review; `submitted` afterwards.
public enum UpdateVerificationsResponseOwnersItemRequiredDocumentsItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pendingUpload = "pending_upload"
    case submitted
}