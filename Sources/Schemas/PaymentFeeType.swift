import Foundation

/// The family the fee belongs to: `whop_fee`, `processing_fee`, `affiliate_program_fee`, or `other_fee`.
public enum PaymentFeeType: String, Codable, Hashable, CaseIterable, Sendable {
    case whopFee = "whop_fee"
    case processingFee = "processing_fee"
    case affiliateProgramFee = "affiliate_program_fee"
    case otherFee = "other_fee"
}