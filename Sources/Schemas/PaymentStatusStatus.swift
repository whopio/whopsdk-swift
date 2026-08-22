import Foundation

/// How far the payment has got. `requires_confirmation` — nothing attempted yet, or the last attempt failed and can be retried. `requires_action` — the buyer has a step outstanding; see `next_action`. `confirming` — the buyer has done their part and the processor is deciding. `processing` — the money is moving; see `processing_details`. `succeeded` — collected. `canceled` — voided or written off.
public enum PaymentStatusStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requiresConfirmation = "requires_confirmation"
    case requiresAction = "requires_action"
    case confirming
    case processing
    case succeeded
    case canceled
}