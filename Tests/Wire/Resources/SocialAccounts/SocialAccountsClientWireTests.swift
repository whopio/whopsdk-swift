import Foundation
import Testing
import WhopSDK

@Suite("SocialAccountsClient Wire Tests") struct SocialAccountsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "error": "You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again.",
                      "external_id": "1234567891",
                      "id": "sacc_xxxxxxxxxxxxxx",
                      "name": "Shine Time Auto Detailing",
                      "parent_social_account": {
                        "external_id": "555111",
                        "id": "sacc_xxxxxxxxxxxxxx",
                        "name": "Shine Time Auto Detailing",
                        "platform": "x",
                        "profile_picture_url": "https://shinetime.example/logo.png",
                        "username": "shinetimedetailing",
                        "verified": true
                      },
                      "platform": "x",
                      "profile_picture_url": "https://shinetime.example/logo.png",
                      "scopes": [
                        "advertise"
                      ],
                      "url": "https://instagram.com/shinetimedetail",
                      "username": "shinetimedetail",
                      "verified": true
                    }
                  ],
                  "page_info": {
                    "end_cursor": "WyJjdXJzb3IiLDFd",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd"
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListSocialAccountsResponse(
            data: [
                SocialAccount(
                    error: Nullable<String>.value("You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again."),
                    externalId: Nullable<String>.value("1234567891"),
                    id: "sacc_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Shine Time Auto Detailing"),
                    parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                        externalId: Nullable<String>.value("555111"),
                        id: "sacc_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Shine Time Auto Detailing"),
                        platform: SocialAccountParentPlatform.x,
                        profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                        username: Nullable<String>.value("shinetimedetailing"),
                        verified: true
                    )),
                    platform: SocialAccountPlatform.x,
                    profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                    scopes: [
                        "advertise"
                    ],
                    url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
                    username: Nullable<String>.value("shinetimedetail"),
                    verified: true
                )
            ],
            pageInfo: ListSocialAccountsResponsePageInfo(
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.socialAccounts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "error": "You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again.",
                  "external_id": "1234567891",
                  "id": "sacc_xxxxxxxxxxxxxx",
                  "name": "Shine Time Auto Detailing",
                  "parent_social_account": {
                    "external_id": "555111",
                    "id": "sacc_xxxxxxxxxxxxxx",
                    "name": "Shine Time Auto Detailing",
                    "platform": "x",
                    "profile_picture_url": "https://shinetime.example/logo.png",
                    "username": "shinetimedetailing",
                    "verified": true
                  },
                  "platform": "x",
                  "profile_picture_url": "https://shinetime.example/logo.png",
                  "scopes": [
                    "advertise"
                  ],
                  "url": "https://instagram.com/shinetimedetail",
                  "username": "shinetimedetail",
                  "verified": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SocialAccount(
            error: Nullable<String>.value("You don't have permission to share this account. Ask an admin of its Meta Business Portfolio to grant you full control, then share it again."),
            externalId: Nullable<String>.value("1234567891"),
            id: "sacc_xxxxxxxxxxxxxx",
            name: Nullable<String>.value("Shine Time Auto Detailing"),
            parentSocialAccount: Nullable<SocialAccountParent>.value(SocialAccountParent(
                externalId: Nullable<String>.value("555111"),
                id: "sacc_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Shine Time Auto Detailing"),
                platform: SocialAccountParentPlatform.x,
                profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
                username: Nullable<String>.value("shinetimedetailing"),
                verified: true
            )),
            platform: SocialAccountPlatform.x,
            profilePictureUrl: Nullable<String>.value("https://shinetime.example/logo.png"),
            scopes: [
                "advertise"
            ],
            url: Nullable<String>.value("https://instagram.com/shinetimedetail"),
            username: Nullable<String>.value("shinetimedetail"),
            verified: true
        )
        let response = try await client.socialAccounts.create(
            request: .init(platform: .facebook),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func connect1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "authorize_url": "https://www.facebook.com/v25.0/dialog/oauth"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ConnectSocialAccountsResponse(
            authorizeUrl: "https://www.facebook.com/v25.0/dialog/oauth"
        )
        let response = try await client.socialAccounts.connect(
            request: .init(platform: .metaBusiness),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "deleted": true,
                  "id": "sacc_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteSocialAccountsResponse(
            deleted: true,
            id: "sacc_xxxxxxxxxxxxxx"
        )
        let response = try await client.socialAccounts.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func leadForms1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "completion": {
                        "button_text": "See our work",
                        "description": "We book coatings two days out, so pick a slot when we ring.",
                        "headline": "Thanks — we will call you today",
                        "url": "https://shinetime.example/gallery"
                      },
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "disclaimer": {
                        "body": "Ceramic coating requires the vehicle for two days.",
                        "checkboxes": [
                          {
                            "checked_by_default": false,
                            "key": "consent_1",
                            "required": true,
                            "text": "I agree"
                          }
                        ],
                        "title": "Before you submit"
                      },
                      "form_type": "more_volume",
                      "id": "24839",
                      "intro": {
                        "description": "Tell us about your vehicle and we will send a fixed price.",
                        "headline": "Get a ceramic coating quote"
                      },
                      "locale": "en_US",
                      "name": "Ceramic coating quote requests",
                      "privacy_policy_link_text": "Shine Time privacy policy",
                      "privacy_policy_url": "https://shinetime.example/privacy",
                      "question_labels": [
                        "Email"
                      ],
                      "questions": [
                        {
                          "format": "multiple_choice",
                          "label": "What vehicle are we detailing?",
                          "options": [
                            {
                              "key": "ceramic_coating",
                              "logic": {
                                "action": "go_to_question",
                                "target_end_page_index": 0,
                                "target_question_index": 3
                              },
                              "value": "Ceramic coating"
                            }
                          ],
                          "type": "custom"
                        }
                      ]
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = LeadFormsSocialAccountsResponse(
            data: [
                SocialAccountLeadForm(
                    completion: Nullable<AdLeadFormCompletion>.value(AdLeadFormCompletion(
                        buttonText: Nullable<String>.value("See our work"),
                        description: Nullable<String>.value("We book coatings two days out, so pick a slot when we ring."),
                        headline: Nullable<String>.value("Thanks — we will call you today"),
                        url: Nullable<String>.value("https://shinetime.example/gallery")
                    )),
                    createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    disclaimer: Nullable<AdLeadFormDisclaimer>.value(AdLeadFormDisclaimer(
                        body: Nullable<String>.value("Ceramic coating requires the vehicle for two days."),
                        checkboxes: [
                            AdLeadFormDisclaimerCheckbox(
                                checkedByDefault: Nullable<Bool>.value(false),
                                key: Nullable<String>.value("consent_1"),
                                required: Nullable<Bool>.value(true),
                                text: "I agree"
                            )
                        ],
                        title: Nullable<String>.value("Before you submit")
                    )),
                    formType: SocialAccountLeadFormFormType.moreVolume,
                    id: "24839",
                    intro: Nullable<AdLeadFormIntro>.value(AdLeadFormIntro(
                        description: Nullable<String>.value("Tell us about your vehicle and we will send a fixed price."),
                        headline: Nullable<String>.value("Get a ceramic coating quote")
                    )),
                    locale: Nullable<String>.value("en_US"),
                    name: Nullable<String>.value("Ceramic coating quote requests"),
                    privacyPolicyLinkText: Nullable<String>.value("Shine Time privacy policy"),
                    privacyPolicyUrl: Nullable<String>.value("https://shinetime.example/privacy"),
                    questionLabels: [
                        "Email"
                    ],
                    questions: [
                        AdLeadFormQuestion(
                            format: Optional("multiple_choice"),
                            label: Optional("What vehicle are we detailing?"),
                            options: Optional([
                                AdLeadFormQuestionOption(
                                    key: Optional(Nullable<String>.value("ceramic_coating")),
                                    logic: Optional(AdLeadFormOptionLogic(
                                        action: AdLeadFormOptionLogicAction.goToQuestion,
                                        targetEndPageIndex: Optional(0),
                                        targetQuestionIndex: Optional(3)
                                    )),
                                    value: "Ceramic coating"
                                )
                            ]),
                            type: "custom"
                        )
                    ]
                )
            ]
        )
        let response = try await client.socialAccounts.leadForms(
            id: "id",
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func posts1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "call_to_action": "learn_more",
                      "destination_url": "https://shinetime.example/book",
                      "embed_url": "https://www.facebook.com/plugins/post.php",
                      "id": "media_1",
                      "media_url": "https://shinetime.example/ceramic-coating-reel.mp4",
                      "restrictions": [
                        "lead_form_ineligible"
                      ],
                      "thumbnail_url": "https://shinetime.example/ceramic-coating-poster.jpg"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "MTI=",
                    "has_next_page": true
                  }
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = PostsSocialAccountsResponse(
            data: [
                SocialAccountPost(
                    callToAction: Nullable<SocialAccountPostCallToAction>.value(SocialAccountPostCallToAction.learnMore),
                    destinationUrl: Nullable<String>.value("https://shinetime.example/book"),
                    embedUrl: Nullable<String>.value("https://www.facebook.com/plugins/post.php"),
                    id: "media_1",
                    mediaUrl: Nullable<String>.value("https://shinetime.example/ceramic-coating-reel.mp4"),
                    restrictions: [
                        SocialAccountPostRestrictionsItem.leadFormIneligible
                    ],
                    thumbnailUrl: Nullable<String>.value("https://shinetime.example/ceramic-coating-poster.jpg")
                )
            ],
            pageInfo: PostsSocialAccountsResponsePageInfo(
                endCursor: Nullable<String>.value("MTI="),
                hasNextPage: true
            )
        )
        let response = try await client.socialAccounts.posts(
            id: "id",
            accountId: "account_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}