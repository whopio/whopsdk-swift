import Foundation

/// The webhook event that enrolls the member it's about, such as `payment.succeeded`. `null` for an automation that only `POST /automations/{id}/trigger` enrolls into. Fixed once the automation has been published.
public enum CreateAutomationsRequestTriggerEvent: String, Codable, Hashable, CaseIterable, Sendable {
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