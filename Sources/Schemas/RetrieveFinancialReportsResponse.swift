import Foundation

public struct RetrieveFinancialReportsResponse: Codable, Hashable, Sendable {
    public let beginningBalance: Nullable<Double>?
    /// Cashflow currencies ordered by volume in the requested period. Includes lifetime currencies unless `period_only_currencies` is true.
    public let currencies: [String]?
    public let endingBalance: Nullable<Double>?
    public let fxExcludedCurrencies: [String]?
    /// Payment costs grouped by customer-facing payment method and provider when requested.
    public let paymentFeeBreakdown: [RetrieveFinancialReportsResponsePaymentFeeBreakdownItem]?
    /// The report that was generated, echoing the requested `report_type`.
    public let reportType: RetrieveFinancialReportsResponseReportType
    public let rows: [RetrieveFinancialReportsResponseRowsItem]
    public let total: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        beginningBalance: Nullable<Double>? = nil,
        currencies: [String]? = nil,
        endingBalance: Nullable<Double>? = nil,
        fxExcludedCurrencies: [String]? = nil,
        paymentFeeBreakdown: [RetrieveFinancialReportsResponsePaymentFeeBreakdownItem]? = nil,
        reportType: RetrieveFinancialReportsResponseReportType,
        rows: [RetrieveFinancialReportsResponseRowsItem],
        total: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.beginningBalance = beginningBalance
        self.currencies = currencies
        self.endingBalance = endingBalance
        self.fxExcludedCurrencies = fxExcludedCurrencies
        self.paymentFeeBreakdown = paymentFeeBreakdown
        self.reportType = reportType
        self.rows = rows
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.beginningBalance = try container.decodeNullableIfPresent(Double.self, forKey: .beginningBalance)
        self.currencies = try container.decodeIfPresent([String].self, forKey: .currencies)
        self.endingBalance = try container.decodeNullableIfPresent(Double.self, forKey: .endingBalance)
        self.fxExcludedCurrencies = try container.decodeIfPresent([String].self, forKey: .fxExcludedCurrencies)
        self.paymentFeeBreakdown = try container.decodeIfPresent([RetrieveFinancialReportsResponsePaymentFeeBreakdownItem].self, forKey: .paymentFeeBreakdown)
        self.reportType = try container.decode(RetrieveFinancialReportsResponseReportType.self, forKey: .reportType)
        self.rows = try container.decode([RetrieveFinancialReportsResponseRowsItem].self, forKey: .rows)
        self.total = try container.decode(Double.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.beginningBalance, forKey: .beginningBalance)
        try container.encodeIfPresent(self.currencies, forKey: .currencies)
        try container.encodeNullableIfPresent(self.endingBalance, forKey: .endingBalance)
        try container.encodeIfPresent(self.fxExcludedCurrencies, forKey: .fxExcludedCurrencies)
        try container.encodeIfPresent(self.paymentFeeBreakdown, forKey: .paymentFeeBreakdown)
        try container.encode(self.reportType, forKey: .reportType)
        try container.encode(self.rows, forKey: .rows)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case beginningBalance = "beginning_balance"
        case currencies
        case endingBalance = "ending_balance"
        case fxExcludedCurrencies = "fx_excluded_currencies"
        case paymentFeeBreakdown = "payment_fee_breakdown"
        case reportType = "report_type"
        case rows
        case total
    }
}