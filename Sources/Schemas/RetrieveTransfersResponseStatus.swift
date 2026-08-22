import Foundation

/// Transfer status. `processing` means the on-chain leg is still executing — poll the transfer until it resolves to `succeeded` or `failed`. A `failed` transfer may be retried under the same ID and later resolve to `succeeded`.
public enum RetrieveTransfersResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case succeeded
    case failed
}