import Foundation

/// How far the setup has got. **A 201 or 200 means we answered, not that the method was saved — always branch on this.** `requires_action` — the buyer has a step outstanding; hand `client_secret` to the elements or poll Retrieve setup status. `processing` — the processor is deciding. `succeeded` — the method is saved, and only this one means saved. `canceled` — abandoned or refused; see `last_setup_error`.
public enum SetupIntentStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case succeeded
    case canceled
    case requiresAction = "requires_action"
}