import Foundation

/// Why the row matched, or `null` for a ranked row whose whole ID or whole title isn't the query. `id`: its ID, or a related one such as its user's, its dispute's, or a plan or payout ID for an account. `link`: a whop.com store or product link. `name`: its whole title. `email`: the email of the user it belongs to. `owner_email`, `team_member_email` or `customer_email`: the email of a subaccount's owner, a member of its team, or one of its customers. `card`: its card's first 6 or 8 and last 4 digits, or the last 4 alone. `phone`: the phone number of the user it belongs to. `payment_number`: the number of the invoice a payment collects, so an invoice from `GET /invoices` comes back as its `payment`.
public enum SearchResultMatchReason: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case ownerEmail = "owner_email"
    case teamMemberEmail = "team_member_email"
    case email
    case customerEmail = "customer_email"
    case card
    case phone
    case paymentNumber = "payment_number"
    case link
    case name
}