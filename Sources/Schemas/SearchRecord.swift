import Foundation

/// The record a result points to. Its fields depend on `object`, and every type shares basics like `title` and `image_url`.
public enum SearchRecord: Codable, Hashable, Sendable {
    case account(SearchRecordAccount)
    case affiliate(SearchRecordAffiliate)
    case member(SearchRecordMember)
    case membership(SearchRecordMembership)
    case payment(SearchRecordPayment)
    case promoCode(SearchRecordPromoCode)
    case resolutionCenterCase(SearchRecordResolutionCenterCase)
    case review(SearchRecordReview)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .object)
        switch discriminant {
        case "account":
            self = .account(try SearchRecordAccount(from: decoder))
        case "affiliate":
            self = .affiliate(try SearchRecordAffiliate(from: decoder))
        case "member":
            self = .member(try SearchRecordMember(from: decoder))
        case "membership":
            self = .membership(try SearchRecordMembership(from: decoder))
        case "payment":
            self = .payment(try SearchRecordPayment(from: decoder))
        case "promo_code":
            self = .promoCode(try SearchRecordPromoCode(from: decoder))
        case "resolution_center_case":
            self = .resolutionCenterCase(try SearchRecordResolutionCenterCase(from: decoder))
        case "review":
            self = .review(try SearchRecordReview(from: decoder))
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
        case .account(let data):
            try container.encode("account", forKey: .object)
            try data.encode(to: encoder)
        case .affiliate(let data):
            try container.encode("affiliate", forKey: .object)
            try data.encode(to: encoder)
        case .member(let data):
            try container.encode("member", forKey: .object)
            try data.encode(to: encoder)
        case .membership(let data):
            try container.encode("membership", forKey: .object)
            try data.encode(to: encoder)
        case .payment(let data):
            try container.encode("payment", forKey: .object)
            try data.encode(to: encoder)
        case .promoCode(let data):
            try container.encode("promo_code", forKey: .object)
            try data.encode(to: encoder)
        case .resolutionCenterCase(let data):
            try container.encode("resolution_center_case", forKey: .object)
            try data.encode(to: encoder)
        case .review(let data):
            try container.encode("review", forKey: .object)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case object
    }
}