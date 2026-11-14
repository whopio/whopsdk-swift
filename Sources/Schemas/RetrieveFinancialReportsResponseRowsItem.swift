import Foundation

public struct RetrieveFinancialReportsResponseRowsItem: Codable, Hashable, Sendable {
    public let accountIkPath: Nullable<String>?
    public let accountName: Nullable<String>?
    public let accountType: Nullable<String>?
    public let amount: Double
    /// The family the row's `line_category` rolls up into. Balance summary rows are always `balance`.
    public let grouping: RetrieveFinancialReportsResponseRowsItemGrouping
    /// The ledger line category the row aggregates. Balance summary rows carry the balance bucket instead.
    public let lineCategory: RetrieveFinancialReportsResponseRowsItemLineCategory
    public let lineCount: Nullable<Int>?
    /// Start of the time bucket this row covers, truncated to `group_by`.
    public let period: String
    /// Which side of the income statement the category falls on, or `null` when it is not a P&L category.
    public let profitAndLossSection: Nullable<RetrieveFinancialReportsResponseRowsItemProfitAndLossSection>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountIkPath: Nullable<String>? = nil,
        accountName: Nullable<String>? = nil,
        accountType: Nullable<String>? = nil,
        amount: Double,
        grouping: RetrieveFinancialReportsResponseRowsItemGrouping,
        lineCategory: RetrieveFinancialReportsResponseRowsItemLineCategory,
        lineCount: Nullable<Int>? = nil,
        period: String,
        profitAndLossSection: Nullable<RetrieveFinancialReportsResponseRowsItemProfitAndLossSection>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountIkPath = accountIkPath
        self.accountName = accountName
        self.accountType = accountType
        self.amount = amount
        self.grouping = grouping
        self.lineCategory = lineCategory
        self.lineCount = lineCount
        self.period = period
        self.profitAndLossSection = profitAndLossSection
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountIkPath = try container.decodeNullableIfPresent(String.self, forKey: .accountIkPath)
        self.accountName = try container.decodeNullableIfPresent(String.self, forKey: .accountName)
        self.accountType = try container.decodeNullableIfPresent(String.self, forKey: .accountType)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.grouping = try container.decode(RetrieveFinancialReportsResponseRowsItemGrouping.self, forKey: .grouping)
        self.lineCategory = try container.decode(RetrieveFinancialReportsResponseRowsItemLineCategory.self, forKey: .lineCategory)
        self.lineCount = try container.decodeNullableIfPresent(Int.self, forKey: .lineCount)
        self.period = try container.decode(String.self, forKey: .period)
        self.profitAndLossSection = try container.decodeNullableIfPresent(RetrieveFinancialReportsResponseRowsItemProfitAndLossSection.self, forKey: .profitAndLossSection)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accountIkPath, forKey: .accountIkPath)
        try container.encodeNullableIfPresent(self.accountName, forKey: .accountName)
        try container.encodeNullableIfPresent(self.accountType, forKey: .accountType)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.grouping, forKey: .grouping)
        try container.encode(self.lineCategory, forKey: .lineCategory)
        try container.encodeNullableIfPresent(self.lineCount, forKey: .lineCount)
        try container.encode(self.period, forKey: .period)
        try container.encodeNullableIfPresent(self.profitAndLossSection, forKey: .profitAndLossSection)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountIkPath = "account_ik_path"
        case accountName = "account_name"
        case accountType = "account_type"
        case amount
        case grouping
        case lineCategory = "line_category"
        case lineCount = "line_count"
        case period
        case profitAndLossSection = "profit_and_loss_section"
    }
}