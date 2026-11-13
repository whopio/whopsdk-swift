import Foundation
import Testing
import WhopSDK

@Suite("SubmissionsClient Wire Tests") struct SubmissionsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "bounty_id": "bnty_xxxxxxxxxxxxxx",
                      "claimed_at": "2026-01-01T12:00:00.000Z",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "denial_reason": "The wheels were never shown in the finished clip.",
                      "id": "btys_xxxxxxxxxxxxxx",
                      "latest_proof_livestream_feed": {
                        "ended_at": "2026-01-01T12:00:00.000Z",
                        "id": "lfeed_1",
                        "recording_status": null,
                        "recording_url": "https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "started_at": "2026-01-01T12:00:00.000Z",
                        "thumbnail_url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg",
                        "title": "Untitled Livestream"
                      },
                      "resolved_at": "2026-01-01T12:00:00.000Z",
                      "status": "submitted",
                      "submitted_at": "2026-01-01T12:00:00.000Z",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "worker": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      }
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
        let expectedResponse = ListSubmissionsResponse(
            data: [
                PublicBountySubmission(
                    bountyId: "bnty_xxxxxxxxxxxxxx",
                    claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    denialReason: Nullable<String>.value("The wheels were never shown in the finished clip."),
                    id: "btys_xxxxxxxxxxxxxx",
                    latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                        endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        id: "lfeed_1",
                        recordingStatus: .null,
                        recordingUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        thumbnailUrl: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg"),
                        title: "Untitled Livestream"
                    )),
                    resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    status: PublicBountySubmissionStatus.submitted,
                    submittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    worker: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    )
                )
            ],
            pageInfo: ListSubmissionsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.bounties.submissions.list(
            bountyId: "bounty_id",
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
                  "bounty_id": "bnty_xxxxxxxxxxxxxx",
                  "claimed_at": "2026-01-01T12:00:00.000Z",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "denial_reason": "The wheels were never shown in the finished clip.",
                  "id": "btys_xxxxxxxxxxxxxx",
                  "latest_proof_livestream_feed": {
                    "ended_at": "2026-01-01T12:00:00.000Z",
                    "id": "lfeed_1",
                    "recording_status": "recording",
                    "recording_url": "https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "started_at": "2026-01-01T12:00:00.000Z",
                    "thumbnail_url": "https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg",
                    "title": "Untitled Livestream"
                  },
                  "resolved_at": "2026-01-01T12:00:00.000Z",
                  "status": "submitted",
                  "submitted_at": "2026-01-01T12:00:00.000Z",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "worker": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
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
        let expectedResponse = PublicBountySubmission(
            bountyId: "bnty_xxxxxxxxxxxxxx",
            claimedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            createdAt: "2026-01-01T12:00:00.000Z",
            denialReason: Nullable<String>.value("The wheels were never shown in the finished clip."),
            id: "btys_xxxxxxxxxxxxxx",
            latestProofLivestreamFeed: Nullable<BountySubmissionLivestreamFeed>.value(BountySubmissionLivestreamFeed(
                endedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: "lfeed_1",
                recordingStatus: Nullable<BountySubmissionLivestreamFeedRecordingStatus>.value(BountySubmissionLivestreamFeedRecordingStatus.recording),
                recordingUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/video/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                startedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                thumbnailUrl: Nullable<String>.value("https://img.whop.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/resize:fit/width:1000/height:500/plain/https://cdn.whop.com/livestreams/paint-correction-proof-cover.jpg"),
                title: "Untitled Livestream"
            )),
            resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            status: PublicBountySubmissionStatus.submitted,
            submittedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            worker: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            )
        )
        let response = try await client.bounties.submissions.retrieve(
            bountyId: "bounty_id",
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}