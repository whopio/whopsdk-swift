import Foundation

public struct ListSupportedMethodsResponseDataItem: Codable, Hashable, Sendable {
    /// How funds are delivered, for example `bank_deposit`.
    public let deliveryType: ListSupportedMethodsResponseDataItemDeliveryType
    /// Fee terms for payouts to this method: a percentage of the payout amount plus a fixed fee. The quotes carry the exact fee for a specific amount.
    public let feeStructure: ListSupportedMethodsResponseDataItemFeeStructure
    /// Supported payout method icon URL.
    public let iconUrl: Nullable<String>
    /// Supported payout method ID.
    public let id: String
    /// Supported payout method display name.
    public let name: Nullable<String>
    public let object: ListSupportedMethodsResponseDataItemObject
    /// The ID of the supported payout method that lists this one, such as the bank deposit method that lists a named bank. Show this method as a choice inside that method, not as a separate method. Null for every other method.
    public let parentId: Nullable<String>
    /// Fee and delivery estimates for the requested amount, one per destination currency. Null unless an amount was provided.
    public let quotes: Nullable<[ListSupportedMethodsResponseDataItemQuotesItem]>
    /// Fields to collect before saving this supported payout method. Present only when supported_payout_method_id narrows the request to one method.
    public let requiredFields: Nullable<[ListSupportedMethodsResponseDataItemRequiredFieldsItem]>
    public let supportsInstantDelivery: Bool
    /// Whether the payer can add this method by logging in to PayPal through `POST /payouts/paypal_link_sessions`, which confirms the PayPal account is verified and owned by the payee. True only for the PayPal method, and only once PayPal login is enabled for the account.
    public let supportsPaypalLogin: Bool?
    public let supportsStandardDelivery: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        deliveryType: ListSupportedMethodsResponseDataItemDeliveryType,
        feeStructure: ListSupportedMethodsResponseDataItemFeeStructure,
        iconUrl: Nullable<String>,
        id: String,
        name: Nullable<String>,
        object: ListSupportedMethodsResponseDataItemObject,
        parentId: Nullable<String>,
        quotes: Nullable<[ListSupportedMethodsResponseDataItemQuotesItem]>,
        requiredFields: Nullable<[ListSupportedMethodsResponseDataItemRequiredFieldsItem]>,
        supportsInstantDelivery: Bool,
        supportsPaypalLogin: Bool? = nil,
        supportsStandardDelivery: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.deliveryType = deliveryType
        self.feeStructure = feeStructure
        self.iconUrl = iconUrl
        self.id = id
        self.name = name
        self.object = object
        self.parentId = parentId
        self.quotes = quotes
        self.requiredFields = requiredFields
        self.supportsInstantDelivery = supportsInstantDelivery
        self.supportsPaypalLogin = supportsPaypalLogin
        self.supportsStandardDelivery = supportsStandardDelivery
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deliveryType = try container.decode(ListSupportedMethodsResponseDataItemDeliveryType.self, forKey: .deliveryType)
        self.feeStructure = try container.decode(ListSupportedMethodsResponseDataItemFeeStructure.self, forKey: .feeStructure)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.object = try container.decode(ListSupportedMethodsResponseDataItemObject.self, forKey: .object)
        self.parentId = try container.decode(Nullable<String>.self, forKey: .parentId)
        self.quotes = try container.decode(Nullable<[ListSupportedMethodsResponseDataItemQuotesItem]>.self, forKey: .quotes)
        self.requiredFields = try container.decode(Nullable<[ListSupportedMethodsResponseDataItemRequiredFieldsItem]>.self, forKey: .requiredFields)
        self.supportsInstantDelivery = try container.decode(Bool.self, forKey: .supportsInstantDelivery)
        self.supportsPaypalLogin = try container.decodeIfPresent(Bool.self, forKey: .supportsPaypalLogin)
        self.supportsStandardDelivery = try container.decode(Bool.self, forKey: .supportsStandardDelivery)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.deliveryType, forKey: .deliveryType)
        try container.encode(self.feeStructure, forKey: .feeStructure)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.parentId, forKey: .parentId)
        try container.encode(self.quotes, forKey: .quotes)
        try container.encode(self.requiredFields, forKey: .requiredFields)
        try container.encode(self.supportsInstantDelivery, forKey: .supportsInstantDelivery)
        try container.encodeIfPresent(self.supportsPaypalLogin, forKey: .supportsPaypalLogin)
        try container.encode(self.supportsStandardDelivery, forKey: .supportsStandardDelivery)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case deliveryType = "delivery_type"
        case feeStructure = "fee_structure"
        case iconUrl = "icon_url"
        case id
        case name
        case object
        case parentId = "parent_id"
        case quotes
        case requiredFields = "required_fields"
        case supportsInstantDelivery = "supports_instant_delivery"
        case supportsPaypalLogin = "supports_paypal_login"
        case supportsStandardDelivery = "supports_standard_delivery"
    }
}