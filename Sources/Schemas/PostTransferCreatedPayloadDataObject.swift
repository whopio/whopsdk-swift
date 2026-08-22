import Foundation

/// The object type. Discriminates the create response from a send or a claim link.
public enum PostTransferCreatedPayloadDataObject: String, Codable, Hashable, CaseIterable, Sendable {
    case transfer
}