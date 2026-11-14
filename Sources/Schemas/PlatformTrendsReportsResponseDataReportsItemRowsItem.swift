import Foundation

public struct PlatformTrendsReportsResponseDataReportsItemRowsItem: Codable, Hashable, Sendable {
    public let accountCountry: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>?
    /// Gross revenue per payment.
    public let aov: Nullable<Money>?
    /// Average age in months of the businesses that sold.
    public let avgBusinessAge: Nullable<Double>?
    /// Average age in years of the paying customers.
    public let avgCustomerAge: Nullable<Double>?
    /// Average age in years of those businesses' owners.
    public let avgOwnerAge: Nullable<Double>?
    public let businessType: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>?
    /// Businesses with a paid payment.
    public let businesses: Nullable<Int>?
    public let customerCountry: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>?
    /// Distinct paying customers. A customer who pays in two groups counts in both.
    public let customers: Nullable<Int>?
    /// Paid sales, before refunds and fees, measured the way an account's gross revenue is.
    public let grossRevenue: Nullable<Money>?
    public let industryType: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>?
    /// The median paid volume per business that sold.
    public let medianGrossRevenue: Nullable<Money>?
    /// Businesses created in the window that also sold in it.
    public let newBusinesses: Nullable<Int>?
    /// Customers who joined Whop in the window and paid in it. A customer who pays in two groups counts in both.
    public let newCustomers: Nullable<Int>?
    /// Paid payments.
    public let payments: Nullable<Int>?
    public let productCategory: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>?
    /// Products with a paid payment.
    public let products: Nullable<Int>?
    /// Share of customers who paid more than once, as a fraction.
    public let repeatRate: Nullable<Double>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountCountry: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry>? = nil,
        aov: Nullable<Money>? = nil,
        avgBusinessAge: Nullable<Double>? = nil,
        avgCustomerAge: Nullable<Double>? = nil,
        avgOwnerAge: Nullable<Double>? = nil,
        businessType: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType>? = nil,
        businesses: Nullable<Int>? = nil,
        customerCountry: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry>? = nil,
        customers: Nullable<Int>? = nil,
        grossRevenue: Nullable<Money>? = nil,
        industryType: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType>? = nil,
        medianGrossRevenue: Nullable<Money>? = nil,
        newBusinesses: Nullable<Int>? = nil,
        newCustomers: Nullable<Int>? = nil,
        payments: Nullable<Int>? = nil,
        productCategory: Nullable<PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory>? = nil,
        products: Nullable<Int>? = nil,
        repeatRate: Nullable<Double>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountCountry = accountCountry
        self.aov = aov
        self.avgBusinessAge = avgBusinessAge
        self.avgCustomerAge = avgCustomerAge
        self.avgOwnerAge = avgOwnerAge
        self.businessType = businessType
        self.businesses = businesses
        self.customerCountry = customerCountry
        self.customers = customers
        self.grossRevenue = grossRevenue
        self.industryType = industryType
        self.medianGrossRevenue = medianGrossRevenue
        self.newBusinesses = newBusinesses
        self.newCustomers = newCustomers
        self.payments = payments
        self.productCategory = productCategory
        self.products = products
        self.repeatRate = repeatRate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountCountry = try container.decodeNullableIfPresent(PlatformTrendsReportsResponseDataReportsItemRowsItemAccountCountry.self, forKey: .accountCountry)
        self.aov = try container.decodeNullableIfPresent(Money.self, forKey: .aov)
        self.avgBusinessAge = try container.decodeNullableIfPresent(Double.self, forKey: .avgBusinessAge)
        self.avgCustomerAge = try container.decodeNullableIfPresent(Double.self, forKey: .avgCustomerAge)
        self.avgOwnerAge = try container.decodeNullableIfPresent(Double.self, forKey: .avgOwnerAge)
        self.businessType = try container.decodeNullableIfPresent(PlatformTrendsReportsResponseDataReportsItemRowsItemBusinessType.self, forKey: .businessType)
        self.businesses = try container.decodeNullableIfPresent(Int.self, forKey: .businesses)
        self.customerCountry = try container.decodeNullableIfPresent(PlatformTrendsReportsResponseDataReportsItemRowsItemCustomerCountry.self, forKey: .customerCountry)
        self.customers = try container.decodeNullableIfPresent(Int.self, forKey: .customers)
        self.grossRevenue = try container.decodeNullableIfPresent(Money.self, forKey: .grossRevenue)
        self.industryType = try container.decodeNullableIfPresent(PlatformTrendsReportsResponseDataReportsItemRowsItemIndustryType.self, forKey: .industryType)
        self.medianGrossRevenue = try container.decodeNullableIfPresent(Money.self, forKey: .medianGrossRevenue)
        self.newBusinesses = try container.decodeNullableIfPresent(Int.self, forKey: .newBusinesses)
        self.newCustomers = try container.decodeNullableIfPresent(Int.self, forKey: .newCustomers)
        self.payments = try container.decodeNullableIfPresent(Int.self, forKey: .payments)
        self.productCategory = try container.decodeNullableIfPresent(PlatformTrendsReportsResponseDataReportsItemRowsItemProductCategory.self, forKey: .productCategory)
        self.products = try container.decodeNullableIfPresent(Int.self, forKey: .products)
        self.repeatRate = try container.decodeNullableIfPresent(Double.self, forKey: .repeatRate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accountCountry, forKey: .accountCountry)
        try container.encodeNullableIfPresent(self.aov, forKey: .aov)
        try container.encodeNullableIfPresent(self.avgBusinessAge, forKey: .avgBusinessAge)
        try container.encodeNullableIfPresent(self.avgCustomerAge, forKey: .avgCustomerAge)
        try container.encodeNullableIfPresent(self.avgOwnerAge, forKey: .avgOwnerAge)
        try container.encodeNullableIfPresent(self.businessType, forKey: .businessType)
        try container.encodeNullableIfPresent(self.businesses, forKey: .businesses)
        try container.encodeNullableIfPresent(self.customerCountry, forKey: .customerCountry)
        try container.encodeNullableIfPresent(self.customers, forKey: .customers)
        try container.encodeNullableIfPresent(self.grossRevenue, forKey: .grossRevenue)
        try container.encodeNullableIfPresent(self.industryType, forKey: .industryType)
        try container.encodeNullableIfPresent(self.medianGrossRevenue, forKey: .medianGrossRevenue)
        try container.encodeNullableIfPresent(self.newBusinesses, forKey: .newBusinesses)
        try container.encodeNullableIfPresent(self.newCustomers, forKey: .newCustomers)
        try container.encodeNullableIfPresent(self.payments, forKey: .payments)
        try container.encodeNullableIfPresent(self.productCategory, forKey: .productCategory)
        try container.encodeNullableIfPresent(self.products, forKey: .products)
        try container.encodeNullableIfPresent(self.repeatRate, forKey: .repeatRate)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountCountry = "account_country"
        case aov
        case avgBusinessAge = "avg_business_age"
        case avgCustomerAge = "avg_customer_age"
        case avgOwnerAge = "avg_owner_age"
        case businessType = "business_type"
        case businesses
        case customerCountry = "customer_country"
        case customers
        case grossRevenue = "gross_revenue"
        case industryType = "industry_type"
        case medianGrossRevenue = "median_gross_revenue"
        case newBusinesses = "new_businesses"
        case newCustomers = "new_customers"
        case payments
        case productCategory = "product_category"
        case products
        case repeatRate = "repeat_rate"
    }
}