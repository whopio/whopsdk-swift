import Foundation

/// How far the setup has got. **A 200 means we answered, not that the method was saved — always branch on this.** `requires_action` — the buyer has a step outstanding; see `next_action`. `processing` — the buyer has done their part and the processor is deciding. `succeeded` — the payment method is saved, and only this one means saved. `canceled` — abandoned or refused; see `last_setup_error` to tell which.
public enum SetupStatusStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case succeeded
    case canceled
    case requiresAction = "requires_action"
}