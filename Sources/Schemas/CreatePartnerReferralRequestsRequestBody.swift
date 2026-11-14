import Foundation

public enum CreatePartnerReferralRequestsRequestBody: Codable, Hashable, Sendable {
    case createPartnerReferralRequestsRequestBodyAccountId(CreatePartnerReferralRequestsRequestBodyAccountId)
    case createPartnerReferralRequestsRequestBodyAccountUrl(CreatePartnerReferralRequestsRequestBodyAccountUrl)
    case createPartnerReferralRequestsRequestBodyTargetUserId(CreatePartnerReferralRequestsRequestBodyTargetUserId)
    case createPartnerReferralRequestsRequestBodyTargetUsername(CreatePartnerReferralRequestsRequestBodyTargetUsername)
    case createPartnerReferralRequestsRequestBodyTargetEmail(CreatePartnerReferralRequestsRequestBodyTargetEmail)
    /// Create your own referral link with an optional custom code and redemption limit. Without configuration, returns your oldest saved link for the selected team membership, or your personal context when `authorized_user_id` is omitted, creating a random code when none exists.
    case createPartnerReferralRequestsRequestBodyCode(CreatePartnerReferralRequestsRequestBodyCode)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CreatePartnerReferralRequestsRequestBodyAccountId.self) {
            self = .createPartnerReferralRequestsRequestBodyAccountId(value)
        } else if let value = try? container.decode(CreatePartnerReferralRequestsRequestBodyAccountUrl.self) {
            self = .createPartnerReferralRequestsRequestBodyAccountUrl(value)
        } else if let value = try? container.decode(CreatePartnerReferralRequestsRequestBodyTargetUserId.self) {
            self = .createPartnerReferralRequestsRequestBodyTargetUserId(value)
        } else if let value = try? container.decode(CreatePartnerReferralRequestsRequestBodyTargetUsername.self) {
            self = .createPartnerReferralRequestsRequestBodyTargetUsername(value)
        } else if let value = try? container.decode(CreatePartnerReferralRequestsRequestBodyTargetEmail.self) {
            self = .createPartnerReferralRequestsRequestBodyTargetEmail(value)
        } else if let value = try? container.decode(CreatePartnerReferralRequestsRequestBodyCode.self) {
            self = .createPartnerReferralRequestsRequestBodyCode(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .createPartnerReferralRequestsRequestBodyAccountId(let value):
            try container.encode(value)
        case .createPartnerReferralRequestsRequestBodyAccountUrl(let value):
            try container.encode(value)
        case .createPartnerReferralRequestsRequestBodyTargetUserId(let value):
            try container.encode(value)
        case .createPartnerReferralRequestsRequestBodyTargetUsername(let value):
            try container.encode(value)
        case .createPartnerReferralRequestsRequestBodyTargetEmail(let value):
            try container.encode(value)
        case .createPartnerReferralRequestsRequestBodyCode(let value):
            try container.encode(value)
        }
    }
}