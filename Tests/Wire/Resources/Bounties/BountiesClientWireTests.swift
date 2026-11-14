import Foundation
import Testing
import WhopSDK

@Suite("BountiesClient Wire Tests") struct BountiesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "accepted_deliverable_types": [
                        "content_url"
                      ],
                      "accepted_submissions_count": 0,
                      "accepted_submissions_limit": 1,
                      "accepted_submissions_per_user_limit": 1,
                      "affiliate_share_amount": 2.1,
                      "allowed_country_codes": [
                        "US"
                      ],
                      "budget_amount": 15,
                      "business_goal_type": "clipping",
                      "cancel_requested_at": "2026-01-01T12:00:00.000Z",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "currency": "usd",
                      "description": "Bounty Description",
                      "discussion_experience_id": "discussion_experience_id",
                      "discussion_feed_id": "discussion_feed_id",
                      "discussion_post_id": "discussion_post_id",
                      "experience_id": "exp_xxxxxxxxxxxxxx",
                      "funding_account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "title": "Acme Bookkeeping"
                      },
                      "gross_paid_out_amount": 0,
                      "gross_reward_amount": 15,
                      "hosting_account": {
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-auto-detailing",
                        "title": "Shine Time Auto Detailing"
                      },
                      "id": "bnty_xxxxxxxxxxxxxx",
                      "min_total_verified_duration_seconds": 1,
                      "net_reward_amount": 10.5,
                      "poster": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "scheduled_frequency": "once",
                      "scheduled_publish_at": "2026-01-01T12:00:00.000Z",
                      "spots_remaining": 1,
                      "status": "scheduled",
                      "submissions_closed_at": "2026-01-01T12:00:00.000Z",
                      "title": "Photograph the storefront",
                      "unresolved_submissions_count": 1,
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "viewer_accepted_submissions_count": 0
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
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
        let expectedResponse = ListBountiesResponse(
            data: [
                BountyListItem(
                    acceptedDeliverableTypes: [
                        BountyListItemAcceptedDeliverableTypesItem.contentUrl
                    ],
                    acceptedSubmissionsCount: 0,
                    acceptedSubmissionsLimit: 1,
                    acceptedSubmissionsPerUserLimit: 1,
                    affiliateShareAmount: 2.1,
                    allowedCountryCodes: [
                        "US"
                    ],
                    budgetAmount: 15,
                    businessGoalType: Nullable<BountyListItemBusinessGoalType>.value(BountyListItemBusinessGoalType.clipping),
                    cancelRequestedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    currency: "usd",
                    description: "Bounty Description",
                    discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
                    discussionFeedId: Nullable<String>.value("discussion_feed_id"),
                    discussionPostId: Nullable<String>.value("discussion_post_id"),
                    experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
                    fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                        id: "biz_xxxxxxxxxxxxxx",
                        title: "Acme Bookkeeping"
                    )),
                    grossPaidOutAmount: 0,
                    grossRewardAmount: 15,
                    hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-auto-detailing",
                        title: "Shine Time Auto Detailing"
                    )),
                    id: "bnty_xxxxxxxxxxxxxx",
                    minTotalVerifiedDurationSeconds: Nullable<Int>.value(1),
                    netRewardAmount: 10.5,
                    poster: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ),
                    scheduledFrequency: Nullable<BountyListItemScheduledFrequency>.value(BountyListItemScheduledFrequency.once),
                    scheduledPublishAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    spotsRemaining: 1,
                    status: BountyListItemStatus.scheduled,
                    submissionsClosedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    title: "Photograph the storefront",
                    unresolvedSubmissionsCount: 1,
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    viewerAcceptedSubmissionsCount: 0
                )
            ],
            pageInfo: ListBountiesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.bounties.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "accepted_deliverable_types": [
                        "content_url",
                        "content_url"
                      ],
                      "accepted_submissions_count": 1,
                      "accepted_submissions_limit": 1,
                      "accepted_submissions_per_user_limit": 1,
                      "affiliate_share_amount": 1.1,
                      "allowed_country_codes": [
                        "allowed_country_codes",
                        "allowed_country_codes"
                      ],
                      "budget_amount": 1.1,
                      "business_goal_type": "clipping",
                      "cancel_requested_at": "cancel_requested_at",
                      "created_at": "created_at",
                      "currency": "currency",
                      "description": "description",
                      "discussion_experience_id": "discussion_experience_id",
                      "discussion_feed_id": "discussion_feed_id",
                      "discussion_post_id": "discussion_post_id",
                      "experience_id": "experience_id",
                      "funding_account": {
                        "id": "id",
                        "title": "title"
                      },
                      "gross_paid_out_amount": 1.1,
                      "gross_reward_amount": 1.1,
                      "hosting_account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "id": "id",
                      "min_total_verified_duration_seconds": 1,
                      "net_reward_amount": 1.1,
                      "poster": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "scheduled_frequency": "once",
                      "scheduled_publish_at": "scheduled_publish_at",
                      "spots_remaining": 1,
                      "status": "scheduled",
                      "submissions_closed_at": "submissions_closed_at",
                      "title": "title",
                      "unresolved_submissions_count": 1,
                      "updated_at": "updated_at",
                      "viewer_accepted_submissions_count": 1
                    },
                    {
                      "accepted_deliverable_types": [
                        "content_url",
                        "content_url"
                      ],
                      "accepted_submissions_count": 1,
                      "accepted_submissions_limit": 1,
                      "accepted_submissions_per_user_limit": 1,
                      "affiliate_share_amount": 1.1,
                      "allowed_country_codes": [
                        "allowed_country_codes",
                        "allowed_country_codes"
                      ],
                      "budget_amount": 1.1,
                      "business_goal_type": "clipping",
                      "cancel_requested_at": "cancel_requested_at",
                      "created_at": "created_at",
                      "currency": "currency",
                      "description": "description",
                      "discussion_experience_id": "discussion_experience_id",
                      "discussion_feed_id": "discussion_feed_id",
                      "discussion_post_id": "discussion_post_id",
                      "experience_id": "experience_id",
                      "funding_account": {
                        "id": "id",
                        "title": "title"
                      },
                      "gross_paid_out_amount": 1.1,
                      "gross_reward_amount": 1.1,
                      "hosting_account": {
                        "id": "id",
                        "logo_url": "logo_url",
                        "route": "route",
                        "title": "title"
                      },
                      "id": "id",
                      "min_total_verified_duration_seconds": 1,
                      "net_reward_amount": 1.1,
                      "poster": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "scheduled_frequency": "once",
                      "scheduled_publish_at": "scheduled_publish_at",
                      "spots_remaining": 1,
                      "status": "scheduled",
                      "submissions_closed_at": "submissions_closed_at",
                      "title": "title",
                      "unresolved_submissions_count": 1,
                      "updated_at": "updated_at",
                      "viewer_accepted_submissions_count": 1
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": true,
                    "has_previous_page": true,
                    "start_cursor": "start_cursor"
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
        let expectedResponse = ListBountiesResponse(
            data: [
                BountyListItem(
                    acceptedDeliverableTypes: [
                        BountyListItemAcceptedDeliverableTypesItem.contentUrl,
                        BountyListItemAcceptedDeliverableTypesItem.contentUrl
                    ],
                    acceptedSubmissionsCount: 1,
                    acceptedSubmissionsLimit: 1,
                    acceptedSubmissionsPerUserLimit: 1,
                    affiliateShareAmount: 1.1,
                    allowedCountryCodes: [
                        "allowed_country_codes",
                        "allowed_country_codes"
                    ],
                    budgetAmount: 1.1,
                    businessGoalType: Nullable<BountyListItemBusinessGoalType>.value(BountyListItemBusinessGoalType.clipping),
                    cancelRequestedAt: Nullable<String>.value("cancel_requested_at"),
                    createdAt: "created_at",
                    currency: "currency",
                    description: "description",
                    discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
                    discussionFeedId: Nullable<String>.value("discussion_feed_id"),
                    discussionPostId: Nullable<String>.value("discussion_post_id"),
                    experienceId: Nullable<String>.value("experience_id"),
                    fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    grossPaidOutAmount: 1.1,
                    grossRewardAmount: 1.1,
                    hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    id: "id",
                    minTotalVerifiedDurationSeconds: Nullable<Int>.value(1),
                    netRewardAmount: 1.1,
                    poster: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    scheduledFrequency: Nullable<BountyListItemScheduledFrequency>.value(BountyListItemScheduledFrequency.once),
                    scheduledPublishAt: Nullable<String>.value("scheduled_publish_at"),
                    spotsRemaining: 1,
                    status: BountyListItemStatus.scheduled,
                    submissionsClosedAt: Nullable<String>.value("submissions_closed_at"),
                    title: "title",
                    unresolvedSubmissionsCount: 1,
                    updatedAt: "updated_at",
                    viewerAcceptedSubmissionsCount: 1
                ),
                BountyListItem(
                    acceptedDeliverableTypes: [
                        BountyListItemAcceptedDeliverableTypesItem.contentUrl,
                        BountyListItemAcceptedDeliverableTypesItem.contentUrl
                    ],
                    acceptedSubmissionsCount: 1,
                    acceptedSubmissionsLimit: 1,
                    acceptedSubmissionsPerUserLimit: 1,
                    affiliateShareAmount: 1.1,
                    allowedCountryCodes: [
                        "allowed_country_codes",
                        "allowed_country_codes"
                    ],
                    budgetAmount: 1.1,
                    businessGoalType: Nullable<BountyListItemBusinessGoalType>.value(BountyListItemBusinessGoalType.clipping),
                    cancelRequestedAt: Nullable<String>.value("cancel_requested_at"),
                    createdAt: "created_at",
                    currency: "currency",
                    description: "description",
                    discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
                    discussionFeedId: Nullable<String>.value("discussion_feed_id"),
                    discussionPostId: Nullable<String>.value("discussion_post_id"),
                    experienceId: Nullable<String>.value("experience_id"),
                    fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                        id: "id",
                        title: "title"
                    )),
                    grossPaidOutAmount: 1.1,
                    grossRewardAmount: 1.1,
                    hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                        id: "id",
                        logoUrl: Nullable<String>.value("logo_url"),
                        route: "route",
                        title: "title"
                    )),
                    id: "id",
                    minTotalVerifiedDurationSeconds: Nullable<Int>.value(1),
                    netRewardAmount: 1.1,
                    poster: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    scheduledFrequency: Nullable<BountyListItemScheduledFrequency>.value(BountyListItemScheduledFrequency.once),
                    scheduledPublishAt: Nullable<String>.value("scheduled_publish_at"),
                    spotsRemaining: 1,
                    status: BountyListItemStatus.scheduled,
                    submissionsClosedAt: Nullable<String>.value("submissions_closed_at"),
                    title: "title",
                    unresolvedSubmissionsCount: 1,
                    updatedAt: "updated_at",
                    viewerAcceptedSubmissionsCount: 1
                )
            ],
            pageInfo: ListBountiesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.bounties.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url"
                  ],
                  "accepted_submissions_count": 0,
                  "accepted_submissions_limit": 3,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
                  "awaiting_review_submissions_count": 0,
                  "budget_amount": 120,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "2026-01-01T12:00:00.000Z",
                  "capture_spec": {
                    "filename_pattern": "Country_City_Site_Station_Operator",
                    "imu": {
                      "device_motion_units": "ua=m/s²,gv=g,r=rad/s,q=unit",
                      "magnetometer_units": "µT",
                      "min_rate_hz": 90,
                      "target_rate_hz": 100,
                      "warmup_min_rate_hz": 45,
                      "warmup_ns": 3000000000
                    },
                    "manifest_schema_version": 2,
                    "min_clip_duration_seconds": 120,
                    "min_total_verified_duration_seconds": 14400,
                    "required_metadata_fields": [
                      "country"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 50,
                      "bitrate_floor_mbps": 4,
                      "bitrate_target_mbps": 12,
                      "camera_lens": "ultra_wide",
                      "codecs": [
                        "h264"
                      ],
                      "embed_camera_metadata": false,
                      "fps": 30,
                      "frame_gap_tolerance_ms": 1000,
                      "height": 1080,
                      "min_fov_degrees": 130,
                      "orientation": "landscapeRight",
                      "preferred_fov_degrees": 140,
                      "stabilization_mode": "off",
                      "stabilization_required": false,
                      "width": 1920
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "denied_submissions_count": 0,
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
                  "min_total_verified_duration_seconds": 14400,
                  "net_reward_amount": 28,
                  "poster": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "2026-01-01T12:00:00.000Z",
                  "spots_remaining": 3,
                  "status": "scheduled",
                  "submissions_closed_at": "2026-01-01T12:00:00.000Z",
                  "title": "Record interior detailing passes",
                  "unresolved_submissions_count": 0,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewer_accepted_submissions_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 0,
            acceptedSubmissionsLimit: 3,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
            awaitingReviewSubmissionsCount: 0,
            budgetAmount: 120,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "Country_City_Site_Station_Operator",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "ua=m/s²,gv=g,r=rad/s,q=unit",
                    magnetometerUnits: "µT",
                    minRateHz: 90,
                    targetRateHz: 100,
                    warmupMinRateHz: 45,
                    warmupNs: 3000000000
                ),
                manifestSchemaVersion: 2,
                minClipDurationSeconds: 120,
                minTotalVerifiedDurationSeconds: 14400,
                requiredMetadataFields: [
                    "country"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 50,
                    bitrateFloorMbps: 4,
                    bitrateTargetMbps: 12,
                    cameraLens: "ultra_wide",
                    codecs: [
                        "h264"
                    ],
                    embedCameraMetadata: false,
                    fps: 30,
                    frameGapToleranceMs: 1000,
                    height: 1080,
                    minFovDegrees: 130,
                    orientation: "landscapeRight",
                    preferredFovDegrees: 140,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: false,
                    width: 1920
                )
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 0,
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(14400),
            netRewardAmount: 28,
            poster: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            spotsRemaining: 3,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            title: "Record interior detailing passes",
            unresolvedSubmissionsCount: 0,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewerAcceptedSubmissionsCount: 0
        )
        let response = try await client.bounties.create(
            request: .init(
                description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                grossRewardAmount: 40,
                title: "Record interior detailing passes"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url",
                    "content_url"
                  ],
                  "accepted_submissions_count": 1,
                  "accepted_submissions_limit": 1,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    },
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 1.1,
                  "allowed_country_codes": [
                    "allowed_country_codes",
                    "allowed_country_codes"
                  ],
                  "awaiting_review_submissions_count": 1,
                  "budget_amount": 1.1,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "cancel_requested_at",
                  "capture_spec": {
                    "filename_pattern": "filename_pattern",
                    "imu": {
                      "device_motion_units": "device_motion_units",
                      "magnetometer_units": "magnetometer_units",
                      "min_rate_hz": 1.1,
                      "target_rate_hz": 1,
                      "warmup_min_rate_hz": 1.1,
                      "warmup_ns": 1
                    },
                    "manifest_schema_version": 1,
                    "min_clip_duration_seconds": 1,
                    "min_total_verified_duration_seconds": 1,
                    "required_metadata_fields": [
                      "required_metadata_fields",
                      "required_metadata_fields"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 1,
                      "bitrate_floor_mbps": 1,
                      "bitrate_target_mbps": 1,
                      "camera_lens": "camera_lens",
                      "codecs": [
                        "codecs",
                        "codecs"
                      ],
                      "embed_camera_metadata": true,
                      "fps": 1,
                      "frame_gap_tolerance_ms": 1,
                      "height": 1,
                      "min_fov_degrees": 1,
                      "orientation": "orientation",
                      "preferred_fov_degrees": 1,
                      "stabilization_mode": "off",
                      "stabilization_required": true,
                      "width": 1
                    }
                  },
                  "created_at": "created_at",
                  "currency": "usd",
                  "denied_submissions_count": 1,
                  "description": "description",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "experience_id",
                  "funding_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "gross_paid_out_amount": 1.1,
                  "gross_reward_amount": 1.1,
                  "hosting_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "id": "id",
                  "min_total_verified_duration_seconds": 1,
                  "net_reward_amount": 1.1,
                  "poster": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "scheduled_publish_at",
                  "spots_remaining": 1,
                  "status": "scheduled",
                  "submissions_closed_at": "submissions_closed_at",
                  "title": "title",
                  "unresolved_submissions_count": 1,
                  "updated_at": "updated_at",
                  "viewer_accepted_submissions_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl,
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 1,
            acceptedSubmissionsLimit: 1,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                ),
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 1.1,
            allowedCountryCodes: [
                "allowed_country_codes",
                "allowed_country_codes"
            ],
            awaitingReviewSubmissionsCount: 1,
            budgetAmount: 1.1,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("cancel_requested_at"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "filename_pattern",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "device_motion_units",
                    magnetometerUnits: "magnetometer_units",
                    minRateHz: 1.1,
                    targetRateHz: 1,
                    warmupMinRateHz: 1.1,
                    warmupNs: 1
                ),
                manifestSchemaVersion: 1,
                minClipDurationSeconds: 1,
                minTotalVerifiedDurationSeconds: 1,
                requiredMetadataFields: [
                    "required_metadata_fields",
                    "required_metadata_fields"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 1,
                    bitrateFloorMbps: 1,
                    bitrateTargetMbps: 1,
                    cameraLens: "camera_lens",
                    codecs: [
                        "codecs",
                        "codecs"
                    ],
                    embedCameraMetadata: true,
                    fps: 1,
                    frameGapToleranceMs: 1,
                    height: 1,
                    minFovDegrees: 1,
                    orientation: "orientation",
                    preferredFovDegrees: 1,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: true,
                    width: 1
                )
            )),
            createdAt: "created_at",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 1,
            description: "description",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("experience_id"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            grossPaidOutAmount: 1.1,
            grossRewardAmount: 1.1,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            id: "id",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(1),
            netRewardAmount: 1.1,
            poster: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("scheduled_publish_at"),
            spotsRemaining: 1,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("submissions_closed_at"),
            title: "title",
            unresolvedSubmissionsCount: 1,
            updatedAt: "updated_at",
            viewerAcceptedSubmissionsCount: 1
        )
        let response = try await client.bounties.create(
            request: .init(
                description: "description",
                grossRewardAmount: 1.1,
                title: "title"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url"
                  ],
                  "accepted_submissions_count": 0,
                  "accepted_submissions_limit": 3,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
                  "awaiting_review_submissions_count": 0,
                  "budget_amount": 120,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "2026-01-01T12:00:00.000Z",
                  "capture_spec": {
                    "filename_pattern": "Country_City_Site_Station_Operator",
                    "imu": {
                      "device_motion_units": "ua=m/s²,gv=g,r=rad/s,q=unit",
                      "magnetometer_units": "µT",
                      "min_rate_hz": 90,
                      "target_rate_hz": 100,
                      "warmup_min_rate_hz": 45,
                      "warmup_ns": 3000000000
                    },
                    "manifest_schema_version": 2,
                    "min_clip_duration_seconds": 120,
                    "min_total_verified_duration_seconds": 14400,
                    "required_metadata_fields": [
                      "country"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 50,
                      "bitrate_floor_mbps": 4,
                      "bitrate_target_mbps": 12,
                      "camera_lens": "ultra_wide",
                      "codecs": [
                        "h264"
                      ],
                      "embed_camera_metadata": false,
                      "fps": 30,
                      "frame_gap_tolerance_ms": 1000,
                      "height": 1080,
                      "min_fov_degrees": 130,
                      "orientation": "landscapeRight",
                      "preferred_fov_degrees": 140,
                      "stabilization_mode": "off",
                      "stabilization_required": false,
                      "width": 1920
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "denied_submissions_count": 0,
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
                  "min_total_verified_duration_seconds": 14400,
                  "net_reward_amount": 28,
                  "poster": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "2026-01-01T12:00:00.000Z",
                  "spots_remaining": 3,
                  "status": "scheduled",
                  "submissions_closed_at": "2026-01-01T12:00:00.000Z",
                  "title": "Record interior detailing passes",
                  "unresolved_submissions_count": 0,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewer_accepted_submissions_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 0,
            acceptedSubmissionsLimit: 3,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
            awaitingReviewSubmissionsCount: 0,
            budgetAmount: 120,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "Country_City_Site_Station_Operator",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "ua=m/s²,gv=g,r=rad/s,q=unit",
                    magnetometerUnits: "µT",
                    minRateHz: 90,
                    targetRateHz: 100,
                    warmupMinRateHz: 45,
                    warmupNs: 3000000000
                ),
                manifestSchemaVersion: 2,
                minClipDurationSeconds: 120,
                minTotalVerifiedDurationSeconds: 14400,
                requiredMetadataFields: [
                    "country"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 50,
                    bitrateFloorMbps: 4,
                    bitrateTargetMbps: 12,
                    cameraLens: "ultra_wide",
                    codecs: [
                        "h264"
                    ],
                    embedCameraMetadata: false,
                    fps: 30,
                    frameGapToleranceMs: 1000,
                    height: 1080,
                    minFovDegrees: 130,
                    orientation: "landscapeRight",
                    preferredFovDegrees: 140,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: false,
                    width: 1920
                )
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 0,
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(14400),
            netRewardAmount: 28,
            poster: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            spotsRemaining: 3,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            title: "Record interior detailing passes",
            unresolvedSubmissionsCount: 0,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewerAcceptedSubmissionsCount: 0
        )
        let response = try await client.bounties.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url",
                    "content_url"
                  ],
                  "accepted_submissions_count": 1,
                  "accepted_submissions_limit": 1,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    },
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 1.1,
                  "allowed_country_codes": [
                    "allowed_country_codes",
                    "allowed_country_codes"
                  ],
                  "awaiting_review_submissions_count": 1,
                  "budget_amount": 1.1,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "cancel_requested_at",
                  "capture_spec": {
                    "filename_pattern": "filename_pattern",
                    "imu": {
                      "device_motion_units": "device_motion_units",
                      "magnetometer_units": "magnetometer_units",
                      "min_rate_hz": 1.1,
                      "target_rate_hz": 1,
                      "warmup_min_rate_hz": 1.1,
                      "warmup_ns": 1
                    },
                    "manifest_schema_version": 1,
                    "min_clip_duration_seconds": 1,
                    "min_total_verified_duration_seconds": 1,
                    "required_metadata_fields": [
                      "required_metadata_fields",
                      "required_metadata_fields"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 1,
                      "bitrate_floor_mbps": 1,
                      "bitrate_target_mbps": 1,
                      "camera_lens": "camera_lens",
                      "codecs": [
                        "codecs",
                        "codecs"
                      ],
                      "embed_camera_metadata": true,
                      "fps": 1,
                      "frame_gap_tolerance_ms": 1,
                      "height": 1,
                      "min_fov_degrees": 1,
                      "orientation": "orientation",
                      "preferred_fov_degrees": 1,
                      "stabilization_mode": "off",
                      "stabilization_required": true,
                      "width": 1
                    }
                  },
                  "created_at": "created_at",
                  "currency": "usd",
                  "denied_submissions_count": 1,
                  "description": "description",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "experience_id",
                  "funding_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "gross_paid_out_amount": 1.1,
                  "gross_reward_amount": 1.1,
                  "hosting_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "id": "id",
                  "min_total_verified_duration_seconds": 1,
                  "net_reward_amount": 1.1,
                  "poster": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "scheduled_publish_at",
                  "spots_remaining": 1,
                  "status": "scheduled",
                  "submissions_closed_at": "submissions_closed_at",
                  "title": "title",
                  "unresolved_submissions_count": 1,
                  "updated_at": "updated_at",
                  "viewer_accepted_submissions_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl,
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 1,
            acceptedSubmissionsLimit: 1,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                ),
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 1.1,
            allowedCountryCodes: [
                "allowed_country_codes",
                "allowed_country_codes"
            ],
            awaitingReviewSubmissionsCount: 1,
            budgetAmount: 1.1,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("cancel_requested_at"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "filename_pattern",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "device_motion_units",
                    magnetometerUnits: "magnetometer_units",
                    minRateHz: 1.1,
                    targetRateHz: 1,
                    warmupMinRateHz: 1.1,
                    warmupNs: 1
                ),
                manifestSchemaVersion: 1,
                minClipDurationSeconds: 1,
                minTotalVerifiedDurationSeconds: 1,
                requiredMetadataFields: [
                    "required_metadata_fields",
                    "required_metadata_fields"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 1,
                    bitrateFloorMbps: 1,
                    bitrateTargetMbps: 1,
                    cameraLens: "camera_lens",
                    codecs: [
                        "codecs",
                        "codecs"
                    ],
                    embedCameraMetadata: true,
                    fps: 1,
                    frameGapToleranceMs: 1,
                    height: 1,
                    minFovDegrees: 1,
                    orientation: "orientation",
                    preferredFovDegrees: 1,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: true,
                    width: 1
                )
            )),
            createdAt: "created_at",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 1,
            description: "description",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("experience_id"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            grossPaidOutAmount: 1.1,
            grossRewardAmount: 1.1,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            id: "id",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(1),
            netRewardAmount: 1.1,
            poster: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("scheduled_publish_at"),
            spotsRemaining: 1,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("submissions_closed_at"),
            title: "title",
            unresolvedSubmissionsCount: 1,
            updatedAt: "updated_at",
            viewerAcceptedSubmissionsCount: 1
        )
        let response = try await client.bounties.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url"
                  ],
                  "accepted_submissions_count": 0,
                  "accepted_submissions_limit": 3,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
                  "awaiting_review_submissions_count": 0,
                  "budget_amount": 120,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "2026-01-01T12:00:00.000Z",
                  "capture_spec": {
                    "filename_pattern": "Country_City_Site_Station_Operator",
                    "imu": {
                      "device_motion_units": "ua=m/s²,gv=g,r=rad/s,q=unit",
                      "magnetometer_units": "µT",
                      "min_rate_hz": 90,
                      "target_rate_hz": 100,
                      "warmup_min_rate_hz": 45,
                      "warmup_ns": 3000000000
                    },
                    "manifest_schema_version": 2,
                    "min_clip_duration_seconds": 120,
                    "min_total_verified_duration_seconds": 14400,
                    "required_metadata_fields": [
                      "country"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 50,
                      "bitrate_floor_mbps": 4,
                      "bitrate_target_mbps": 12,
                      "camera_lens": "ultra_wide",
                      "codecs": [
                        "h264"
                      ],
                      "embed_camera_metadata": false,
                      "fps": 30,
                      "frame_gap_tolerance_ms": 1000,
                      "height": 1080,
                      "min_fov_degrees": 130,
                      "orientation": "landscapeRight",
                      "preferred_fov_degrees": 140,
                      "stabilization_mode": "off",
                      "stabilization_required": false,
                      "width": 1920
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "denied_submissions_count": 0,
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
                  "min_total_verified_duration_seconds": 14400,
                  "net_reward_amount": 28,
                  "poster": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "2026-01-01T12:00:00.000Z",
                  "spots_remaining": 3,
                  "status": "scheduled",
                  "submissions_closed_at": "2026-01-01T12:00:00.000Z",
                  "title": "Record interior detailing passes",
                  "unresolved_submissions_count": 0,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewer_accepted_submissions_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 0,
            acceptedSubmissionsLimit: 3,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
            awaitingReviewSubmissionsCount: 0,
            budgetAmount: 120,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "Country_City_Site_Station_Operator",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "ua=m/s²,gv=g,r=rad/s,q=unit",
                    magnetometerUnits: "µT",
                    minRateHz: 90,
                    targetRateHz: 100,
                    warmupMinRateHz: 45,
                    warmupNs: 3000000000
                ),
                manifestSchemaVersion: 2,
                minClipDurationSeconds: 120,
                minTotalVerifiedDurationSeconds: 14400,
                requiredMetadataFields: [
                    "country"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 50,
                    bitrateFloorMbps: 4,
                    bitrateTargetMbps: 12,
                    cameraLens: "ultra_wide",
                    codecs: [
                        "h264"
                    ],
                    embedCameraMetadata: false,
                    fps: 30,
                    frameGapToleranceMs: 1000,
                    height: 1080,
                    minFovDegrees: 130,
                    orientation: "landscapeRight",
                    preferredFovDegrees: 140,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: false,
                    width: 1920
                )
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 0,
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(14400),
            netRewardAmount: 28,
            poster: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            spotsRemaining: 3,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            title: "Record interior detailing passes",
            unresolvedSubmissionsCount: 0,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewerAcceptedSubmissionsCount: 0
        )
        let response = try await client.bounties.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url",
                    "content_url"
                  ],
                  "accepted_submissions_count": 1,
                  "accepted_submissions_limit": 1,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    },
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 1.1,
                  "allowed_country_codes": [
                    "allowed_country_codes",
                    "allowed_country_codes"
                  ],
                  "awaiting_review_submissions_count": 1,
                  "budget_amount": 1.1,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "cancel_requested_at",
                  "capture_spec": {
                    "filename_pattern": "filename_pattern",
                    "imu": {
                      "device_motion_units": "device_motion_units",
                      "magnetometer_units": "magnetometer_units",
                      "min_rate_hz": 1.1,
                      "target_rate_hz": 1,
                      "warmup_min_rate_hz": 1.1,
                      "warmup_ns": 1
                    },
                    "manifest_schema_version": 1,
                    "min_clip_duration_seconds": 1,
                    "min_total_verified_duration_seconds": 1,
                    "required_metadata_fields": [
                      "required_metadata_fields",
                      "required_metadata_fields"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 1,
                      "bitrate_floor_mbps": 1,
                      "bitrate_target_mbps": 1,
                      "camera_lens": "camera_lens",
                      "codecs": [
                        "codecs",
                        "codecs"
                      ],
                      "embed_camera_metadata": true,
                      "fps": 1,
                      "frame_gap_tolerance_ms": 1,
                      "height": 1,
                      "min_fov_degrees": 1,
                      "orientation": "orientation",
                      "preferred_fov_degrees": 1,
                      "stabilization_mode": "off",
                      "stabilization_required": true,
                      "width": 1
                    }
                  },
                  "created_at": "created_at",
                  "currency": "usd",
                  "denied_submissions_count": 1,
                  "description": "description",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "experience_id",
                  "funding_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "gross_paid_out_amount": 1.1,
                  "gross_reward_amount": 1.1,
                  "hosting_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "id": "id",
                  "min_total_verified_duration_seconds": 1,
                  "net_reward_amount": 1.1,
                  "poster": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "scheduled_publish_at",
                  "spots_remaining": 1,
                  "status": "scheduled",
                  "submissions_closed_at": "submissions_closed_at",
                  "title": "title",
                  "unresolved_submissions_count": 1,
                  "updated_at": "updated_at",
                  "viewer_accepted_submissions_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl,
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 1,
            acceptedSubmissionsLimit: 1,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                ),
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 1.1,
            allowedCountryCodes: [
                "allowed_country_codes",
                "allowed_country_codes"
            ],
            awaitingReviewSubmissionsCount: 1,
            budgetAmount: 1.1,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("cancel_requested_at"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "filename_pattern",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "device_motion_units",
                    magnetometerUnits: "magnetometer_units",
                    minRateHz: 1.1,
                    targetRateHz: 1,
                    warmupMinRateHz: 1.1,
                    warmupNs: 1
                ),
                manifestSchemaVersion: 1,
                minClipDurationSeconds: 1,
                minTotalVerifiedDurationSeconds: 1,
                requiredMetadataFields: [
                    "required_metadata_fields",
                    "required_metadata_fields"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 1,
                    bitrateFloorMbps: 1,
                    bitrateTargetMbps: 1,
                    cameraLens: "camera_lens",
                    codecs: [
                        "codecs",
                        "codecs"
                    ],
                    embedCameraMetadata: true,
                    fps: 1,
                    frameGapToleranceMs: 1,
                    height: 1,
                    minFovDegrees: 1,
                    orientation: "orientation",
                    preferredFovDegrees: 1,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: true,
                    width: 1
                )
            )),
            createdAt: "created_at",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 1,
            description: "description",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("experience_id"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            grossPaidOutAmount: 1.1,
            grossRewardAmount: 1.1,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            id: "id",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(1),
            netRewardAmount: 1.1,
            poster: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("scheduled_publish_at"),
            spotsRemaining: 1,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("submissions_closed_at"),
            title: "title",
            unresolvedSubmissionsCount: 1,
            updatedAt: "updated_at",
            viewerAcceptedSubmissionsCount: 1
        )
        let response = try await client.bounties.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url"
                  ],
                  "accepted_submissions_count": 0,
                  "accepted_submissions_limit": 3,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
                  "awaiting_review_submissions_count": 0,
                  "budget_amount": 120,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "2026-01-01T12:00:00.000Z",
                  "capture_spec": {
                    "filename_pattern": "Country_City_Site_Station_Operator",
                    "imu": {
                      "device_motion_units": "ua=m/s²,gv=g,r=rad/s,q=unit",
                      "magnetometer_units": "µT",
                      "min_rate_hz": 90,
                      "target_rate_hz": 100,
                      "warmup_min_rate_hz": 45,
                      "warmup_ns": 3000000000
                    },
                    "manifest_schema_version": 2,
                    "min_clip_duration_seconds": 120,
                    "min_total_verified_duration_seconds": 14400,
                    "required_metadata_fields": [
                      "country"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 50,
                      "bitrate_floor_mbps": 4,
                      "bitrate_target_mbps": 12,
                      "camera_lens": "ultra_wide",
                      "codecs": [
                        "h264"
                      ],
                      "embed_camera_metadata": false,
                      "fps": 30,
                      "frame_gap_tolerance_ms": 1000,
                      "height": 1080,
                      "min_fov_degrees": 130,
                      "orientation": "landscapeRight",
                      "preferred_fov_degrees": 140,
                      "stabilization_mode": "off",
                      "stabilization_required": false,
                      "width": 1920
                    }
                  },
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "denied_submissions_count": 0,
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Acme Bookkeeping"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
                  "min_total_verified_duration_seconds": 14400,
                  "net_reward_amount": 28,
                  "poster": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "2026-01-01T12:00:00.000Z",
                  "spots_remaining": 3,
                  "status": "scheduled",
                  "submissions_closed_at": "2026-01-01T12:00:00.000Z",
                  "title": "Record interior detailing passes",
                  "unresolved_submissions_count": 0,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "viewer_accepted_submissions_count": 0
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 0,
            acceptedSubmissionsLimit: 3,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
            awaitingReviewSubmissionsCount: 0,
            budgetAmount: 120,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "Country_City_Site_Station_Operator",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "ua=m/s²,gv=g,r=rad/s,q=unit",
                    magnetometerUnits: "µT",
                    minRateHz: 90,
                    targetRateHz: 100,
                    warmupMinRateHz: 45,
                    warmupNs: 3000000000
                ),
                manifestSchemaVersion: 2,
                minClipDurationSeconds: 120,
                minTotalVerifiedDurationSeconds: 14400,
                requiredMetadataFields: [
                    "country"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 50,
                    bitrateFloorMbps: 4,
                    bitrateTargetMbps: 12,
                    cameraLens: "ultra_wide",
                    codecs: [
                        "h264"
                    ],
                    embedCameraMetadata: false,
                    fps: 30,
                    frameGapToleranceMs: 1000,
                    height: 1080,
                    minFovDegrees: 130,
                    orientation: "landscapeRight",
                    preferredFovDegrees: 140,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: false,
                    width: 1920
                )
            )),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 0,
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Acme Bookkeeping"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(14400),
            netRewardAmount: 28,
            poster: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            spotsRemaining: 3,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            title: "Record interior detailing passes",
            unresolvedSubmissionsCount: 0,
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewerAcceptedSubmissionsCount: 0
        )
        let response = try await client.bounties.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "accepted_deliverable_types": [
                    "content_url",
                    "content_url"
                  ],
                  "accepted_submissions_count": 1,
                  "accepted_submissions_limit": 1,
                  "accepted_submissions_per_user_limit": 1,
                  "active_proof_livestream_feeds": [
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    },
                    {
                      "host": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "id": "id",
                      "title": "title"
                    }
                  ],
                  "affiliate_share_amount": 1.1,
                  "allowed_country_codes": [
                    "allowed_country_codes",
                    "allowed_country_codes"
                  ],
                  "awaiting_review_submissions_count": 1,
                  "budget_amount": 1.1,
                  "business_goal_type": "clipping",
                  "cancel_requested_at": "cancel_requested_at",
                  "capture_spec": {
                    "filename_pattern": "filename_pattern",
                    "imu": {
                      "device_motion_units": "device_motion_units",
                      "magnetometer_units": "magnetometer_units",
                      "min_rate_hz": 1.1,
                      "target_rate_hz": 1,
                      "warmup_min_rate_hz": 1.1,
                      "warmup_ns": 1
                    },
                    "manifest_schema_version": 1,
                    "min_clip_duration_seconds": 1,
                    "min_total_verified_duration_seconds": 1,
                    "required_metadata_fields": [
                      "required_metadata_fields",
                      "required_metadata_fields"
                    ],
                    "single_continuous_take": true,
                    "video": {
                      "bitrate_ceiling_mbps": 1,
                      "bitrate_floor_mbps": 1,
                      "bitrate_target_mbps": 1,
                      "camera_lens": "camera_lens",
                      "codecs": [
                        "codecs",
                        "codecs"
                      ],
                      "embed_camera_metadata": true,
                      "fps": 1,
                      "frame_gap_tolerance_ms": 1,
                      "height": 1,
                      "min_fov_degrees": 1,
                      "orientation": "orientation",
                      "preferred_fov_degrees": 1,
                      "stabilization_mode": "off",
                      "stabilization_required": true,
                      "width": 1
                    }
                  },
                  "created_at": "created_at",
                  "currency": "usd",
                  "denied_submissions_count": 1,
                  "description": "description",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "experience_id",
                  "funding_account": {
                    "id": "id",
                    "title": "title"
                  },
                  "gross_paid_out_amount": 1.1,
                  "gross_reward_amount": 1.1,
                  "hosting_account": {
                    "id": "id",
                    "logo_url": "logo_url",
                    "route": "route",
                    "title": "title"
                  },
                  "id": "id",
                  "min_total_verified_duration_seconds": 1,
                  "net_reward_amount": 1.1,
                  "poster": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "scheduled_frequency": "once",
                  "scheduled_publish_at": "scheduled_publish_at",
                  "spots_remaining": 1,
                  "status": "scheduled",
                  "submissions_closed_at": "submissions_closed_at",
                  "title": "title",
                  "unresolved_submissions_count": 1,
                  "updated_at": "updated_at",
                  "viewer_accepted_submissions_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Bounty(
            acceptedDeliverableTypes: [
                BountyAcceptedDeliverableTypesItem.contentUrl,
                BountyAcceptedDeliverableTypesItem.contentUrl
            ],
            acceptedSubmissionsCount: 1,
            acceptedSubmissionsLimit: 1,
            acceptedSubmissionsPerUserLimit: 1,
            activeProofLivestreamFeeds: [
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                ),
                BountyActiveLivestreamFeed(
                    host: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    id: "id",
                    title: "title"
                )
            ],
            affiliateShareAmount: 1.1,
            allowedCountryCodes: [
                "allowed_country_codes",
                "allowed_country_codes"
            ],
            awaitingReviewSubmissionsCount: 1,
            budgetAmount: 1.1,
            businessGoalType: Nullable<BountyBusinessGoalType>.value(BountyBusinessGoalType.clipping),
            cancelRequestedAt: Nullable<String>.value("cancel_requested_at"),
            captureSpec: Nullable<CaptureSpec>.value(CaptureSpec(
                filenamePattern: "filename_pattern",
                imu: CaptureSpecImu(
                    deviceMotionUnits: "device_motion_units",
                    magnetometerUnits: "magnetometer_units",
                    minRateHz: 1.1,
                    targetRateHz: 1,
                    warmupMinRateHz: 1.1,
                    warmupNs: 1
                ),
                manifestSchemaVersion: 1,
                minClipDurationSeconds: 1,
                minTotalVerifiedDurationSeconds: 1,
                requiredMetadataFields: [
                    "required_metadata_fields",
                    "required_metadata_fields"
                ],
                singleContinuousTake: true,
                video: CaptureSpecVideo(
                    bitrateCeilingMbps: 1,
                    bitrateFloorMbps: 1,
                    bitrateTargetMbps: 1,
                    cameraLens: "camera_lens",
                    codecs: [
                        "codecs",
                        "codecs"
                    ],
                    embedCameraMetadata: true,
                    fps: 1,
                    frameGapToleranceMs: 1,
                    height: 1,
                    minFovDegrees: 1,
                    orientation: "orientation",
                    preferredFovDegrees: 1,
                    stabilizationMode: CaptureSpecVideoStabilizationMode.off,
                    stabilizationRequired: true,
                    width: 1
                )
            )),
            createdAt: "created_at",
            currency: BountyCurrency.usd,
            deniedSubmissionsCount: 1,
            description: "description",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("experience_id"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "id",
                title: "title"
            )),
            grossPaidOutAmount: 1.1,
            grossRewardAmount: 1.1,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "id",
                logoUrl: Nullable<String>.value("logo_url"),
                route: "route",
                title: "title"
            )),
            id: "id",
            minTotalVerifiedDurationSeconds: Nullable<Int>.value(1),
            netRewardAmount: 1.1,
            poster: UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            ),
            scheduledFrequency: Nullable<BountyScheduledFrequency>.value(BountyScheduledFrequency.once),
            scheduledPublishAt: Nullable<String>.value("scheduled_publish_at"),
            spotsRemaining: 1,
            status: BountyStatus.scheduled,
            submissionsClosedAt: Nullable<String>.value("submissions_closed_at"),
            title: "title",
            unresolvedSubmissionsCount: 1,
            updatedAt: "updated_at",
            viewerAcceptedSubmissionsCount: 1
        )
        let response = try await client.bounties.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}