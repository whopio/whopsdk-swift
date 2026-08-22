import Foundation

public struct GetFinancialReportResponse: Codable, Hashable, Sendable {
    public let beginningBalance: Nullable<Double>?
    public let endingBalance: Nullable<Double>?
    public let fxExcludedCurrencies: [String]?
    /// The report that was generated, echoing the requested `report_type`.
    public let reportType: GetFinancialReportResponseReportType
    public let rows: [GetFinancialReportResponseRowsItem]
    public let total: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        beginningBalance: Nullable<Double>? = nil,
        endingBalance: Nullable<Double>? = nil,
        fxExcludedCurrencies: [String]? = nil,
        reportType: GetFinancialReportResponseReportType,
        rows: [GetFinancialReportResponseRowsItem],
        total: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.beginningBalance = beginningBalance
        self.endingBalance = endingBalance
        self.fxExcludedCurrencies = fxExcludedCurrencies
        self.reportType = reportType
        self.rows = rows
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.beginningBalance = try container.decodeNullableIfPresent(Double.self, forKey: .beginningBalance)
        self.endingBalance = try container.decodeNullableIfPresent(Double.self, forKey: .endingBalance)
        self.fxExcludedCurrencies = try container.decodeIfPresent([String].self, forKey: .fxExcludedCurrencies)
        self.reportType = try container.decode(GetFinancialReportResponseReportType.self, forKey: .reportType)
        self.rows = try container.decode([GetFinancialReportResponseRowsItem].self, forKey: .rows)
        self.total = try container.decode(Double.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.beginningBalance, forKey: .beginningBalance)
        try container.encodeNullableIfPresent(self.endingBalance, forKey: .endingBalance)
        try container.encodeIfPresent(self.fxExcludedCurrencies, forKey: .fxExcludedCurrencies)
        try container.encode(self.reportType, forKey: .reportType)
        try container.encode(self.rows, forKey: .rows)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case beginningBalance = "beginning_balance"
        case endingBalance = "ending_balance"
        case fxExcludedCurrencies = "fx_excluded_currencies"
        case reportType = "report_type"
        case rows
        case total
    }
}