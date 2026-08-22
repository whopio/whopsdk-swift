import Foundation

public struct SocialAccountLeadForm: Codable, Hashable, Sendable {
    /// Screen shown after the form is submitted. `null` when the form has none.
    public let completion: Nullable<AdLeadFormCompletion>
    /// When the form was created, as an ISO 8601 timestamp.
    public let createdAt: Nullable<String>
    /// Custom consent disclaimer shown before submission. `null` when the form has none.
    public let disclaimer: Nullable<AdLeadFormDisclaimer>
    /// `more_volume` is quickest to submit; `higher_intent` adds a confirmation step before submission.
    public let formType: SocialAccountLeadFormFormType
    /// The ad platform's identifier for the form. Use it as lead_gen_form_id on an ad to reuse the form.
    public let id: String
    /// Intro screen shown before the questions. `null` when the form has none.
    public let intro: Nullable<AdLeadFormIntro>
    /// Language the form is shown in, such as en_US.
    public let locale: Nullable<String>
    /// Advertiser-facing form name.
    public let name: Nullable<String>
    /// Custom link text for the privacy policy. `null` when the default is used.
    public let privacyPolicyLinkText: Nullable<String>
    /// Privacy policy URL configured on the form.
    public let privacyPolicyUrl: Nullable<String>
    public let questionLabels: [String]
    public let questions: [AdLeadFormQuestion]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completion: Nullable<AdLeadFormCompletion>,
        createdAt: Nullable<String>,
        disclaimer: Nullable<AdLeadFormDisclaimer>,
        formType: SocialAccountLeadFormFormType,
        id: String,
        intro: Nullable<AdLeadFormIntro>,
        locale: Nullable<String>,
        name: Nullable<String>,
        privacyPolicyLinkText: Nullable<String>,
        privacyPolicyUrl: Nullable<String>,
        questionLabels: [String],
        questions: [AdLeadFormQuestion],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completion = completion
        self.createdAt = createdAt
        self.disclaimer = disclaimer
        self.formType = formType
        self.id = id
        self.intro = intro
        self.locale = locale
        self.name = name
        self.privacyPolicyLinkText = privacyPolicyLinkText
        self.privacyPolicyUrl = privacyPolicyUrl
        self.questionLabels = questionLabels
        self.questions = questions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completion = try container.decode(Nullable<AdLeadFormCompletion>.self, forKey: .completion)
        self.createdAt = try container.decode(Nullable<String>.self, forKey: .createdAt)
        self.disclaimer = try container.decode(Nullable<AdLeadFormDisclaimer>.self, forKey: .disclaimer)
        self.formType = try container.decode(SocialAccountLeadFormFormType.self, forKey: .formType)
        self.id = try container.decode(String.self, forKey: .id)
        self.intro = try container.decode(Nullable<AdLeadFormIntro>.self, forKey: .intro)
        self.locale = try container.decode(Nullable<String>.self, forKey: .locale)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.privacyPolicyLinkText = try container.decode(Nullable<String>.self, forKey: .privacyPolicyLinkText)
        self.privacyPolicyUrl = try container.decode(Nullable<String>.self, forKey: .privacyPolicyUrl)
        self.questionLabels = try container.decode([String].self, forKey: .questionLabels)
        self.questions = try container.decode([AdLeadFormQuestion].self, forKey: .questions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.completion, forKey: .completion)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.disclaimer, forKey: .disclaimer)
        try container.encode(self.formType, forKey: .formType)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.intro, forKey: .intro)
        try container.encode(self.locale, forKey: .locale)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.privacyPolicyLinkText, forKey: .privacyPolicyLinkText)
        try container.encode(self.privacyPolicyUrl, forKey: .privacyPolicyUrl)
        try container.encode(self.questionLabels, forKey: .questionLabels)
        try container.encode(self.questions, forKey: .questions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completion
        case createdAt = "created_at"
        case disclaimer
        case formType = "form_type"
        case id
        case intro
        case locale
        case name
        case privacyPolicyLinkText = "privacy_policy_link_text"
        case privacyPolicyUrl = "privacy_policy_url"
        case questionLabels = "question_labels"
        case questions
    }
}