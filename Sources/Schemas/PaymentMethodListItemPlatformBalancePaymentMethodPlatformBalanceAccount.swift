import Foundation

/// The account whose wallet this is. Null for the buyer's own personal wallet. A buyer sees an account's balance here when they hold permission to spend it, so a list can hold several — their own and one per account they are on.
public struct PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalanceAccount: Codable, Hashable, Sendable {
    /// The unique identifier for the company.
    public let id: String
    /// The company's logo.
    public let logo: Nullable<PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalanceAccountLogo>
    /// The display name of the company shown to customers.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        logo: Nullable<PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalanceAccountLogo>,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.logo = logo
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.logo = try container.decode(Nullable<PaymentMethodListItemPlatformBalancePaymentMethodPlatformBalanceAccountLogo>.self, forKey: .logo)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logo, forKey: .logo)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case logo
        case title
    }
}