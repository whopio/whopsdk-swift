import Foundation

public enum ListAppsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case discoverableAt = "discoverable_at"
    case templateRecentSales = "template_recent_sales"
    case templateUsage = "template_usage"
    case totalInstallsLast30Days = "total_installs_last_30_days"
    case totalInstallsLast7Days = "total_installs_last_7_days"
}