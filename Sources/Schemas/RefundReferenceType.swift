import Foundation

/// The kind of tracking reference, such as an acquirer reference number.
public enum RefundReferenceType: String, Codable, Hashable, CaseIterable, Sendable {
    case acquirerReferenceNumber = "acquirer_reference_number"
    case retrievalReferenceNumber = "retrieval_reference_number"
    case systemTraceAuditNumber = "system_trace_audit_number"
}