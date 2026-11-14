import Foundation

/// The webhook event that enrolled the member. `null` when `POST /automations/{id}/trigger` enrolled them.
public enum AutomationEnrollmentTriggerEvent: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentSucceeded = "payment.succeeded"
    case paymentFailed = "payment.failed"
    case membershipActivated = "membership.activated"
    case membershipTrialEndingSoon = "membership.trial_ending_soon"
    case memberCreated = "member.created"
    case invoiceCreated = "invoice.created"
    case invoicePaid = "invoice.paid"
    case invoicePastDue = "invoice.past_due"
    case refundCreated = "refund.created"
    case disputeCreated = "dispute.created"
    case resolutionCenterCaseCreated = "resolution_center_case.created"
    case resolutionCenterCaseDecided = "resolution_center_case.decided"
    case courseLessonInteractionCompleted = "course_lesson_interaction.completed"
}