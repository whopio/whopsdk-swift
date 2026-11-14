import Foundation

/// What the buyer must do to finish. `type` picks the shape and each type carries only its own `data`, so switching on `type` gives you exactly that step's payload.
public enum PaymentNextAction: Codable, Hashable, Sendable {
    case awaitConfirmation(PaymentNextActionAwaitConfirmation)
    case collectCardPresent(PaymentNextActionCollectCardPresent)
    case displayInstructions(PaymentNextActionDisplayInstructions)
    case redirect(PaymentNextActionRedirect)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "await_confirmation":
            self = .awaitConfirmation(try PaymentNextActionAwaitConfirmation(from: decoder))
        case "collect_card_present":
            self = .collectCardPresent(try PaymentNextActionCollectCardPresent(from: decoder))
        case "display_instructions":
            self = .displayInstructions(try PaymentNextActionDisplayInstructions(from: decoder))
        case "redirect":
            self = .redirect(try PaymentNextActionRedirect(from: decoder))
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
        case .awaitConfirmation(let data):
            try container.encode("await_confirmation", forKey: .type)
            try data.encode(to: encoder)
        case .collectCardPresent(let data):
            try container.encode("collect_card_present", forKey: .type)
            try data.encode(to: encoder)
        case .displayInstructions(let data):
            try container.encode("display_instructions", forKey: .type)
            try data.encode(to: encoder)
        case .redirect(let data):
            try container.encode("redirect", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}