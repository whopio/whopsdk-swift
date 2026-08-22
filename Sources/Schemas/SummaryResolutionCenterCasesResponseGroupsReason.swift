import Foundation

/// How many of the matching cases were opened for each reason. Every reason is present, including those with a count of zero.
public struct SummaryResolutionCenterCasesResponseGroupsReason: Codable, Hashable, Sendable {
    public let fraudulent: Int
    public let notAsDescribed: Int
    public let productNotReceived: Int
    public let productUnacceptable: Int
    public let subscriptionCanceled: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fraudulent: Int,
        notAsDescribed: Int,
        productNotReceived: Int,
        productUnacceptable: Int,
        subscriptionCanceled: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fraudulent = fraudulent
        self.notAsDescribed = notAsDescribed
        self.productNotReceived = productNotReceived
        self.productUnacceptable = productUnacceptable
        self.subscriptionCanceled = subscriptionCanceled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fraudulent = try container.decode(Int.self, forKey: .fraudulent)
        self.notAsDescribed = try container.decode(Int.self, forKey: .notAsDescribed)
        self.productNotReceived = try container.decode(Int.self, forKey: .productNotReceived)
        self.productUnacceptable = try container.decode(Int.self, forKey: .productUnacceptable)
        self.subscriptionCanceled = try container.decode(Int.self, forKey: .subscriptionCanceled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fraudulent, forKey: .fraudulent)
        try container.encode(self.notAsDescribed, forKey: .notAsDescribed)
        try container.encode(self.productNotReceived, forKey: .productNotReceived)
        try container.encode(self.productUnacceptable, forKey: .productUnacceptable)
        try container.encode(self.subscriptionCanceled, forKey: .subscriptionCanceled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fraudulent
        case notAsDescribed = "not_as_described"
        case productNotReceived = "product_not_received"
        case productUnacceptable = "product_unacceptable"
        case subscriptionCanceled = "subscription_canceled"
    }
}