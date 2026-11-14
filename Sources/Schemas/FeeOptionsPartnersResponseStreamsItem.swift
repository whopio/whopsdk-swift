import Foundation

public struct FeeOptionsPartnersResponseStreamsItem: Codable, Hashable, Sendable {
    /// Whether a partner may lower the fee on this stream in exchange for a cut to their commission on it.
    public let adjustable: Bool
    /// The partner's commission on this stream, in percent units (30 means 30%).
    public let commissionPercentage: Nullable<Double>
    /// The merchant fee behind this stream, or null when the business is charged nothing on it.
    public let fee: Nullable<FeeOptionsPartnersResponseStreamsItemFee>
    /// The income stream these terms describe.
    public let incomeStream: FeeOptionsPartnersResponseStreamsItemIncomeStream
    /// Why the stream cannot be adjusted: `no_merchant_fee` (the business is charged nothing on it), `commission_fixed` (the commission is a flat share a fee discount may not move), `no_headroom` (already at the floor), `fee_unavailable` (no fee or rate could be resolved). Null when adjustable.
    public let unadjustableReason: Nullable<FeeOptionsPartnersResponseStreamsItemUnadjustableReason>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adjustable: Bool,
        commissionPercentage: Nullable<Double>,
        fee: Nullable<FeeOptionsPartnersResponseStreamsItemFee>,
        incomeStream: FeeOptionsPartnersResponseStreamsItemIncomeStream,
        unadjustableReason: Nullable<FeeOptionsPartnersResponseStreamsItemUnadjustableReason>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adjustable = adjustable
        self.commissionPercentage = commissionPercentage
        self.fee = fee
        self.incomeStream = incomeStream
        self.unadjustableReason = unadjustableReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adjustable = try container.decode(Bool.self, forKey: .adjustable)
        self.commissionPercentage = try container.decode(Nullable<Double>.self, forKey: .commissionPercentage)
        self.fee = try container.decode(Nullable<FeeOptionsPartnersResponseStreamsItemFee>.self, forKey: .fee)
        self.incomeStream = try container.decode(FeeOptionsPartnersResponseStreamsItemIncomeStream.self, forKey: .incomeStream)
        self.unadjustableReason = try container.decode(Nullable<FeeOptionsPartnersResponseStreamsItemUnadjustableReason>.self, forKey: .unadjustableReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adjustable, forKey: .adjustable)
        try container.encode(self.commissionPercentage, forKey: .commissionPercentage)
        try container.encode(self.fee, forKey: .fee)
        try container.encode(self.incomeStream, forKey: .incomeStream)
        try container.encode(self.unadjustableReason, forKey: .unadjustableReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adjustable
        case commissionPercentage = "commission_percentage"
        case fee
        case incomeStream = "income_stream"
        case unadjustableReason = "unadjustable_reason"
    }
}