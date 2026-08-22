import Foundation

public struct AccountPaymentControls: Codable, Hashable, Sendable {
    /// Automatic refund settings for pre-chargeback dispute alerts.
    public let disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl
    /// Fee charged for each dispute alert in USD. `null` when unavailable.
    public let disputeAlertFeeUsd: Nullable<Double>
    /// Whether 3-D Secure is forced on every card payment at checkout. The account cannot bypass it while set.
    public let enforce3Ds: Bool
    /// Whether payment health controls explicitly disable financing. This is independent of financing approval in `capabilities.accept_bnpl_payments`.
    public let financingDisabled: Bool
    /// Additional processing fee percentage for high-risk processing.
    public let highRiskProcessingFeePercentage: Double
    /// Percentage fee charged when pending, not-yet-settled balance is advanced to fund the account's cards balance, where `2` means 2%. `0` when the account is exempt.
    public let pendingAutoTopupFeePercentage: Double
    /// Additional days payments remain pending before becoming available.
    public let pendingBalanceDelayDays: Int
    /// Reserve currently applied to incoming payment volume.
    public let reserve: AccountReserveControl
    /// Automatic refund settings for resolution center cases.
    public let resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl
    public let restrictedPaymentMethods: [AccountPaymentControlsRestrictedPaymentMethodsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl,
        disputeAlertFeeUsd: Nullable<Double>,
        enforce3Ds: Bool,
        financingDisabled: Bool,
        highRiskProcessingFeePercentage: Double,
        pendingAutoTopupFeePercentage: Double,
        pendingBalanceDelayDays: Int,
        reserve: AccountReserveControl,
        resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl,
        restrictedPaymentMethods: [AccountPaymentControlsRestrictedPaymentMethodsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.disputeAlertAutoRefund = disputeAlertAutoRefund
        self.disputeAlertFeeUsd = disputeAlertFeeUsd
        self.enforce3Ds = enforce3Ds
        self.financingDisabled = financingDisabled
        self.highRiskProcessingFeePercentage = highRiskProcessingFeePercentage
        self.pendingAutoTopupFeePercentage = pendingAutoTopupFeePercentage
        self.pendingBalanceDelayDays = pendingBalanceDelayDays
        self.reserve = reserve
        self.resolutionCenterAutoRefund = resolutionCenterAutoRefund
        self.restrictedPaymentMethods = restrictedPaymentMethods
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.disputeAlertAutoRefund = try container.decode(AccountDisputeAlertAutoRefundControl.self, forKey: .disputeAlertAutoRefund)
        self.disputeAlertFeeUsd = try container.decode(Nullable<Double>.self, forKey: .disputeAlertFeeUsd)
        self.enforce3Ds = try container.decode(Bool.self, forKey: .enforce3Ds)
        self.financingDisabled = try container.decode(Bool.self, forKey: .financingDisabled)
        self.highRiskProcessingFeePercentage = try container.decode(Double.self, forKey: .highRiskProcessingFeePercentage)
        self.pendingAutoTopupFeePercentage = try container.decode(Double.self, forKey: .pendingAutoTopupFeePercentage)
        self.pendingBalanceDelayDays = try container.decode(Int.self, forKey: .pendingBalanceDelayDays)
        self.reserve = try container.decode(AccountReserveControl.self, forKey: .reserve)
        self.resolutionCenterAutoRefund = try container.decode(AccountResolutionCenterAutoRefundControl.self, forKey: .resolutionCenterAutoRefund)
        self.restrictedPaymentMethods = try container.decode([AccountPaymentControlsRestrictedPaymentMethodsItem].self, forKey: .restrictedPaymentMethods)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.disputeAlertAutoRefund, forKey: .disputeAlertAutoRefund)
        try container.encode(self.disputeAlertFeeUsd, forKey: .disputeAlertFeeUsd)
        try container.encode(self.enforce3Ds, forKey: .enforce3Ds)
        try container.encode(self.financingDisabled, forKey: .financingDisabled)
        try container.encode(self.highRiskProcessingFeePercentage, forKey: .highRiskProcessingFeePercentage)
        try container.encode(self.pendingAutoTopupFeePercentage, forKey: .pendingAutoTopupFeePercentage)
        try container.encode(self.pendingBalanceDelayDays, forKey: .pendingBalanceDelayDays)
        try container.encode(self.reserve, forKey: .reserve)
        try container.encode(self.resolutionCenterAutoRefund, forKey: .resolutionCenterAutoRefund)
        try container.encode(self.restrictedPaymentMethods, forKey: .restrictedPaymentMethods)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case disputeAlertAutoRefund = "dispute_alert_auto_refund"
        case disputeAlertFeeUsd = "dispute_alert_fee_usd"
        case enforce3Ds = "enforce_3ds"
        case financingDisabled = "financing_disabled"
        case highRiskProcessingFeePercentage = "high_risk_processing_fee_percentage"
        case pendingAutoTopupFeePercentage = "pending_auto_topup_fee_percentage"
        case pendingBalanceDelayDays = "pending_balance_delay_days"
        case reserve
        case resolutionCenterAutoRefund = "resolution_center_auto_refund"
        case restrictedPaymentMethods = "restricted_payment_methods"
    }
}