import Foundation

/// Current transfer status. A transfer can be created `processing` and settle a few seconds later; poll Retrieve Transfer or listen for the `transfer.completed` and `transfer.failed` webhooks instead of treating the create response as final. `succeeded` and `failed` are final.
public enum CreateTransfersResponseTransferStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case succeeded
    case failed
}