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
                        "title": "Shine Time Auto Detailing"
                      },
                      "gross_paid_out_amount": 0,
                      "gross_reward_amount": 15,
                      "id": "bnty_xxxxxxxxxxxxxx",
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
                        title: "Shine Time Auto Detailing"
                    )),
                    grossPaidOutAmount: 0,
                    grossRewardAmount: 15,
                    id: "bnty_xxxxxxxxxxxxxx",
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
                endCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
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
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
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
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
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
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
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
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Shine Time Auto Detailing"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
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
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
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
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
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
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
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
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Shine Time Auto Detailing"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
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
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
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
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
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
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
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
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Shine Time Auto Detailing"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
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
                  "affiliate_share_amount": 5.6,
                  "allowed_country_codes": [
                    "US"
                  ],
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
                  "description": "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
                  "discussion_experience_id": "discussion_experience_id",
                  "discussion_feed_id": "discussion_feed_id",
                  "discussion_post_id": "discussion_post_id",
                  "experience_id": "exp_xxxxxxxxxxxxxx",
                  "funding_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "title": "Shine Time Auto Detailing"
                  },
                  "gross_paid_out_amount": 0,
                  "gross_reward_amount": 40,
                  "hosting_account": {
                    "id": "biz_xxxxxxxxxxxxxx",
                    "route": "shine-time-auto-detailing",
                    "title": "Shine Time Auto Detailing"
                  },
                  "id": "bnty_xxxxxxxxxxxxxx",
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
            affiliateShareAmount: 5.6,
            allowedCountryCodes: [
                "US"
            ],
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
            description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
            discussionExperienceId: Nullable<String>.value("discussion_experience_id"),
            discussionFeedId: Nullable<String>.value("discussion_feed_id"),
            discussionPostId: Nullable<String>.value("discussion_post_id"),
            experienceId: Nullable<String>.value("exp_xxxxxxxxxxxxxx"),
            fundingAccount: Nullable<AccountSummary>.value(AccountSummary(
                id: "biz_xxxxxxxxxxxxxx",
                title: "Shine Time Auto Detailing"
            )),
            grossPaidOutAmount: 0,
            grossRewardAmount: 40,
            hostingAccount: Nullable<StorefrontAccount>.value(StorefrontAccount(
                id: "biz_xxxxxxxxxxxxxx",
                route: "shine-time-auto-detailing",
                title: "Shine Time Auto Detailing"
            )),
            id: "bnty_xxxxxxxxxxxxxx",
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
}