import Foundation

/// Whether the profile is a business account or a user.
public enum CreateTransfersResponseTransferDestinationObject: String, Codable, Hashable, CaseIterable, Sendable {
    case account
    case user
}