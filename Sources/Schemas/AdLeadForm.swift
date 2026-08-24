import Foundation

public struct AdLeadForm: Codable, Hashable, Sendable {
    /// Screen shown after the form is submitted. `null` when the form uses the default.
    public let completion: Nullable<AdLeadFormCompletion>
    /// Custom consent disclaimer shown before submission. `null` when the form has none.
    public let disclaimer: Nullable<AdLeadFormDisclaimer>
    /// `more_volume` is quickest to submit; `higher_intent` adds a confirmation step before submission.
    public let formType: AdLeadFormFormType
    /// Intro screen shown before the questions. `null` when the form has none.
    public let intro: Nullable<AdLeadFormIntro>
    /// Internal name of the form.
    public let name: Nullable<String>
    /// Whether the phone number must be verified by SMS before submitting.
    public let phoneVerification: Bool
    /// Your privacy policy, linked from the form. `null` when unset.
    public let privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>
    public let questions: [AdLeadFormQuestion]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completion: Nullable<AdLeadFormCompletion>,
        disclaimer: Nullable<AdLeadFormDisclaimer>,
        formType: AdLeadFormFormType,
        intro: Nullable<AdLeadFormIntro>,
        name: Nullable<String>,
        phoneVerification: Bool,
        privacyPolicy: Nullable<AdLeadFormPrivacyPolicy>,
        questions: [AdLeadFormQuestion],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completion = completion
        self.disclaimer = disclaimer
        self.formType = formType
        self.intro = intro
        self.name = name
        self.phoneVerification = phoneVerification
        self.privacyPolicy = privacyPolicy
        self.questions = questions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completion = try container.decode(Nullable<AdLeadFormCompletion>.self, forKey: .completion)
        self.disclaimer = try container.decode(Nullable<AdLeadFormDisclaimer>.self, forKey: .disclaimer)
        self.formType = try container.decode(AdLeadFormFormType.self, forKey: .formType)
        self.intro = try container.decode(Nullable<AdLeadFormIntro>.self, forKey: .intro)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.phoneVerification = try container.decode(Bool.self, forKey: .phoneVerification)
        self.privacyPolicy = try container.decode(Nullable<AdLeadFormPrivacyPolicy>.self, forKey: .privacyPolicy)
        self.questions = try container.decode([AdLeadFormQuestion].self, forKey: .questions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.completion, forKey: .completion)
        try container.encode(self.disclaimer, forKey: .disclaimer)
        try container.encode(self.formType, forKey: .formType)
        try container.encode(self.intro, forKey: .intro)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.phoneVerification, forKey: .phoneVerification)
        try container.encode(self.privacyPolicy, forKey: .privacyPolicy)
        try container.encode(self.questions, forKey: .questions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completion
        case disclaimer
        case formType = "form_type"
        case intro
        case name
        case phoneVerification = "phone_verification"
        case privacyPolicy = "privacy_policy"
        case questions
    }
}