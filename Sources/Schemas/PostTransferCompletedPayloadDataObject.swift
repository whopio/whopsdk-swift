import Foundation

/// The object type. Discriminates the create response from a send or a claim link.
public enum PostTransferCompletedPayloadDataObject: String, Codable, Hashable, CaseIterable, Sendable {
    case transfer
}