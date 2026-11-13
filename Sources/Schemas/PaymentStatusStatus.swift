import Foundation

/// How far the payment has got. `requires_confirmation` — nothing attempted yet, or the last attempt failed and can be retried. `requires_action` — the buyer has a step outstanding; see `next_action`. `requires_capture` — the card authorization is holding funds and must be captured. `confirming` — the buyer has done their part and the processor is deciding. `processing` — with `processing_details`, the money is moving; without them, the charge is still being decided and the status should be read again. `succeeded` — collected. `canceled` — voided or written off.
public enum PaymentStatusStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requiresConfirmation = "requires_confirmation"
    case requiresAction = "requires_action"
    case requiresCapture = "requires_capture"
    case confirming
    case processing
    case succeeded
    case canceled
}