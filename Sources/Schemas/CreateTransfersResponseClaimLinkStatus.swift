import Foundation

/// The newly funded link is ready to claim.
public enum CreateTransfersResponseClaimLinkStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
}