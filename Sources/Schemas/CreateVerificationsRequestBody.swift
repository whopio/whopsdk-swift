import Foundation

public enum CreateVerificationsRequestBody: Codable, Hashable, Sendable {
    /// Request body for a business entity (KYB) verification. Set `kind` to `business`. KYB includes everything KYC provides and additionally unlocks financing options for payments and business Whop Cards.
    case business(CreateVerificationsRequestBodyBusiness)
    /// Request body for an individual (KYC) verification. Omit `kind` or set it to `individual`. KYC is required to pay out funds and is a prerequisite for Whop Card access. Accepting payments does not require verification until a business reaches $5000 in payments.
    ///
    /// Add `business_name` and `business_structure` if the individual operates under a business entity — this enables payouts to be received by a business bank account. `country` is always the individual's own country, and the supported `business_structure` values vary by it — see [Business structures](/developer/verification/business-structures).
    case individual(CreateVerificationsRequestBodyIndividual)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .kind)
        switch discriminant {
        case "business":
            self = .business(try CreateVerificationsRequestBodyBusiness(from: decoder))
        case "individual":
            self = .individual(try CreateVerificationsRequestBodyIndividual(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .business(let data):
            try container.encode("business", forKey: .kind)
            try data.encode(to: encoder)
        case .individual(let data):
            try container.encode("individual", forKey: .kind)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case kind
    }
}