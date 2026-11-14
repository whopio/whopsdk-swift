import Foundation

/// How batches are classified: manual batches use `send` when no earlier completed email history exists and `resend` otherwise. Classification happens when history is recorded. Earlier unrecorded emails are unknown. Automatic sends use `scheduled_send` for a scheduled send and `reminder` for a reminder after the due date. They use `payment_follow_up` for the payment link after a charge to the saved payment method failed or needed the customer to act.
public enum InvoiceSendKind: String, Codable, Hashable, CaseIterable, Sendable {
    case send
    case resend
    case scheduledSend = "scheduled_send"
    case reminder
    case paymentFollowUp = "payment_follow_up"
}