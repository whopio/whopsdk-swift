import Foundation

public enum ListPaymentsRequestMode: String, Codable, Hashable, CaseIterable, Sendable {
    case accountSales = "account_sales"
    case userSales = "user_sales"
}