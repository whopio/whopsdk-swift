import Foundation
import Testing
import WhopSDK

@Suite("MediaClient Wire Tests") struct MediaClientWireTests {
    @Test func generate1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "amount_charged": 2.5,
                  "completed_at": "2026-01-01T12:00:00.000Z",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "error_message": "The generation provider rejected the prompt. The charge was refunded.",
                  "file": {
                    "id": "file_xxxxxxxxxxxxxx",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "generation": {
                    "duration_seconds": 5,
                    "prompt": "A 9:16 product showcase of a cordless power scrubber",
                    "reference_media": [
                      "file_xxxxxxxxxxxxxx"
                    ],
                    "resolution": "480p"
                  },
                  "id": "media_xxxxxxxxxxxxxx",
                  "media_type": "video",
                  "source": "generated",
                  "status": "processing"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = MediaAsset(
            amountCharged: Nullable<Double>.value(2.5),
            completedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            errorMessage: Nullable<String>.value("The generation provider rejected the prompt. The charge was refunded."),
            file: Nullable<MediaAssetFile>.value(MediaAssetFile(
                id: "file_xxxxxxxxxxxxxx",
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            generation: MediaAssetGeneration(
                durationSeconds: Nullable<Double>.value(5),
                prompt: "A 9:16 product showcase of a cordless power scrubber",
                referenceMedia: [
                    "file_xxxxxxxxxxxxxx"
                ],
                resolution: Nullable<MediaAssetGenerationResolution>.value(MediaAssetGenerationResolution.fourHundredEightyP)
            ),
            id: "media_xxxxxxxxxxxxxx",
            mediaType: MediaAssetMediaType.video,
            source: MediaAssetSource.generated,
            status: MediaAssetStatus.processing
        )
        let response = try await client.media.generate(
            request: .init(
                prompt: "A 9:16 product showcase of a cordless power scrubber",
                type: .video
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
                  "amount_charged": 2.5,
                  "completed_at": "2026-01-01T12:00:00.000Z",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "currency": "usd",
                  "error_message": "The generation provider rejected the prompt. The charge was refunded.",
                  "file": {
                    "id": "file_xxxxxxxxxxxxxx",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                  },
                  "generation": {
                    "duration_seconds": 5,
                    "prompt": "A 9:16 product showcase of a cordless power scrubber",
                    "reference_media": [
                      "file_xxxxxxxxxxxxxx"
                    ],
                    "resolution": "480p"
                  },
                  "id": "media_xxxxxxxxxxxxxx",
                  "media_type": "video",
                  "source": "generated",
                  "status": "processing"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = MediaAsset(
            amountCharged: Nullable<Double>.value(2.5),
            completedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            createdAt: "2026-01-01T12:00:00.000Z",
            currency: "usd",
            errorMessage: Nullable<String>.value("The generation provider rejected the prompt. The charge was refunded."),
            file: Nullable<MediaAssetFile>.value(MediaAssetFile(
                id: "file_xxxxxxxxxxxxxx",
                url: "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            )),
            generation: MediaAssetGeneration(
                durationSeconds: Nullable<Double>.value(5),
                prompt: "A 9:16 product showcase of a cordless power scrubber",
                referenceMedia: [
                    "file_xxxxxxxxxxxxxx"
                ],
                resolution: Nullable<MediaAssetGenerationResolution>.value(MediaAssetGenerationResolution.fourHundredEightyP)
            ),
            id: "media_xxxxxxxxxxxxxx",
            mediaType: MediaAssetMediaType.video,
            source: MediaAssetSource.generated,
            status: MediaAssetStatus.processing
        )
        let response = try await client.media.retrieve(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}