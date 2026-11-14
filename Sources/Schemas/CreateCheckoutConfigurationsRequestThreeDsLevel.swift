import Foundation

/// 3D Secure behavior for supported on-session card payments. `mandate_challenge` requires a 3DS challenge before payment processing; `mandate_if_required` mandates a challenge only when the payment processor requires it; `frictionless_if_required` uses the regular frictionless 3DS flow. Payments of $1,000 or more use `mandate_if_required` unless `mandate_challenge` is selected. Risk and authentication recovery requirements can override the preference. Applies in setup mode; `null` uses frictionless 3DS. Payment mode uses the variant policy.
public enum CreateCheckoutConfigurationsRequestThreeDsLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case mandateChallenge = "mandate_challenge"
    case mandateIfRequired = "mandate_if_required"
    case frictionlessIfRequired = "frictionless_if_required"
}