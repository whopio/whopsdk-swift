import Foundation
import Testing
import WhopSDK

@Suite("CourseLessonsClient Wire Tests") struct CourseLessonsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "content": "In this lesson, we will cover the basics of technical analysis...",
                      "created_at": "2023-12-01T05:00:00Z",
                      "days_from_course_start_until_unlock": 42,
                      "embed_id": "dQw4w9WgXcQ",
                      "embed_type": "youtube",
                      "id": "lesn_xxxxxxxxxxxxx",
                      "lesson_type": "text",
                      "order": 42,
                      "thumbnail": {
                        "url": "https://media.whop.com/abc123/optimized.jpg"
                      },
                      "title": "Understanding Candlestick Patterns",
                      "visibility": "visible"
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
        let expectedResponse = ListCourseLessonsResponse(
            data: [
                CourseLessonListItem(
                    content: Nullable<String>.value("In this lesson, we will cover the basics of technical analysis..."),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    daysFromCourseStartUntilUnlock: Nullable<Int>.value(42),
                    embedId: Nullable<String>.value("dQw4w9WgXcQ"),
                    embedType: Nullable<EmbedTypes>.value(EmbedTypes.youtube),
                    id: "lesn_xxxxxxxxxxxxx",
                    lessonType: LessonTypes.text,
                    order: 42,
                    thumbnail: Nullable<CourseLessonListItemThumbnail>.value(CourseLessonListItemThumbnail(
                        url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                    )),
                    title: "Understanding Candlestick Patterns",
                    visibility: LessonVisibilities.visible
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.courseLessons.list(
            first: 42,
            last: 42,
            courseId: "cors_xxxxxxxxxxxxx",
            chapterId: "chap_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "assessment_questions": [
                    {
                      "correct_answer": "correct_answer",
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "crsaq_xxxxxxxxxxxx",
                      "image": {
                        "content_type": "image/jpeg",
                        "filename": "document.pdf",
                        "id": "id",
                        "url": "https://media.whop.com/abc123/optimized.jpg"
                      },
                      "options": [
                        {
                          "id": "crsaqo_xxxxxxxxxxx",
                          "is_correct": null,
                          "option_text": "option_text",
                          "order": 42
                        }
                      ],
                      "order": 42,
                      "question_text": "question_text",
                      "question_type": "short_answer"
                    }
                  ],
                  "attachments": [
                    {
                      "content_type": "image/jpeg",
                      "filename": "document.pdf",
                      "id": "id",
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    }
                  ],
                  "content": "In this lesson, we will cover the basics of technical analysis...",
                  "created_at": "2023-12-01T05:00:00Z",
                  "days_from_course_start_until_unlock": 42,
                  "embed_id": "dQw4w9WgXcQ",
                  "embed_type": "youtube",
                  "id": "lesn_xxxxxxxxxxxxx",
                  "lesson_type": "text",
                  "main_pdf": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "order": 42,
                  "thumbnail": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "title": "Understanding Candlestick Patterns",
                  "video_asset": {
                    "asset_id": "asset_id",
                    "audio_only": true,
                    "created_at": "2023-12-01T05:00:00Z",
                    "duration_seconds": 42,
                    "finished_uploading_at": "2023-12-01T05:00:00Z",
                    "id": "mux_xxxxxxxxxxxxxx",
                    "playback_id": "playback_id",
                    "signed_playback_id": "signed_playback_id",
                    "signed_storyboard_playback_token": "signed_storyboard_playback_token",
                    "signed_thumbnail_playback_token": "signed_thumbnail_playback_token",
                    "signed_video_playback_token": "signed_video_playback_token",
                    "status": "uploading",
                    "updated_at": "2023-12-01T05:00:00Z"
                  },
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CourseLesson(
            assessmentQuestions: [
                CourseLessonAssessmentQuestionsItem(
                    correctAnswer: Nullable<String>.value("correct_answer"),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "crsaq_xxxxxxxxxxxx",
                    image: Nullable<CourseLessonAssessmentQuestionsItemImage>.value(CourseLessonAssessmentQuestionsItemImage(
                        contentType: Nullable<String>.value("image/jpeg"),
                        filename: Nullable<String>.value("document.pdf"),
                        id: "id",
                        url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                    )),
                    options: [
                        CourseLessonAssessmentQuestionsItemOptionsItem(
                            id: "crsaqo_xxxxxxxxxxx",
                            isCorrect: .null,
                            optionText: "option_text",
                            order: 42
                        )
                    ],
                    order: 42,
                    questionText: "question_text",
                    questionType: CoursesAssessmentQuestionTypes.shortAnswer
                )
            ],
            attachments: [
                CourseLessonAttachmentsItem(
                    contentType: Nullable<String>.value("image/jpeg"),
                    filename: Nullable<String>.value("document.pdf"),
                    id: "id",
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )
            ],
            content: Nullable<String>.value("In this lesson, we will cover the basics of technical analysis..."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            daysFromCourseStartUntilUnlock: Nullable<Int>.value(42),
            embedId: Nullable<String>.value("dQw4w9WgXcQ"),
            embedType: Nullable<EmbedTypes>.value(EmbedTypes.youtube),
            id: "lesn_xxxxxxxxxxxxx",
            lessonType: LessonTypes.text,
            mainPdf: Nullable<CourseLessonMainPdf>.value(CourseLessonMainPdf(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            order: 42,
            thumbnail: Nullable<CourseLessonThumbnail>.value(CourseLessonThumbnail(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            title: "Understanding Candlestick Patterns",
            videoAsset: Nullable<CourseLessonVideoAsset>.value(CourseLessonVideoAsset(
                assetId: Nullable<String>.value("asset_id"),
                audioOnly: true,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                durationSeconds: Nullable<Int>.value(42),
                finishedUploadingAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                id: "mux_xxxxxxxxxxxxxx",
                playbackId: Nullable<String>.value("playback_id"),
                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                signedStoryboardPlaybackToken: Nullable<String>.value("signed_storyboard_playback_token"),
                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token"),
                signedVideoPlaybackToken: Nullable<String>.value("signed_video_playback_token"),
                status: MuxAssetStatuses.uploading,
                updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
            )),
            visibility: LessonVisibilities.visible
        )
        let response = try await client.courseLessons.create(
            request: .init(
                chapterId: "chap_xxxxxxxxxxxxx",
                lessonType: .text
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
                  "assessment_questions": [
                    {
                      "correct_answer": "correct_answer",
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "crsaq_xxxxxxxxxxxx",
                      "image": {
                        "content_type": "image/jpeg",
                        "filename": "document.pdf",
                        "id": "id",
                        "url": "https://media.whop.com/abc123/optimized.jpg"
                      },
                      "options": [
                        {
                          "id": "crsaqo_xxxxxxxxxxx",
                          "is_correct": null,
                          "option_text": "option_text",
                          "order": 42
                        }
                      ],
                      "order": 42,
                      "question_text": "question_text",
                      "question_type": "short_answer"
                    }
                  ],
                  "attachments": [
                    {
                      "content_type": "image/jpeg",
                      "filename": "document.pdf",
                      "id": "id",
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    }
                  ],
                  "content": "In this lesson, we will cover the basics of technical analysis...",
                  "created_at": "2023-12-01T05:00:00Z",
                  "days_from_course_start_until_unlock": 42,
                  "embed_id": "dQw4w9WgXcQ",
                  "embed_type": "youtube",
                  "id": "lesn_xxxxxxxxxxxxx",
                  "lesson_type": "text",
                  "main_pdf": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "order": 42,
                  "thumbnail": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "title": "Understanding Candlestick Patterns",
                  "video_asset": {
                    "asset_id": "asset_id",
                    "audio_only": true,
                    "created_at": "2023-12-01T05:00:00Z",
                    "duration_seconds": 42,
                    "finished_uploading_at": "2023-12-01T05:00:00Z",
                    "id": "mux_xxxxxxxxxxxxxx",
                    "playback_id": "playback_id",
                    "signed_playback_id": "signed_playback_id",
                    "signed_storyboard_playback_token": "signed_storyboard_playback_token",
                    "signed_thumbnail_playback_token": "signed_thumbnail_playback_token",
                    "signed_video_playback_token": "signed_video_playback_token",
                    "status": "uploading",
                    "updated_at": "2023-12-01T05:00:00Z"
                  },
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CourseLesson(
            assessmentQuestions: [
                CourseLessonAssessmentQuestionsItem(
                    correctAnswer: Nullable<String>.value("correct_answer"),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "crsaq_xxxxxxxxxxxx",
                    image: Nullable<CourseLessonAssessmentQuestionsItemImage>.value(CourseLessonAssessmentQuestionsItemImage(
                        contentType: Nullable<String>.value("image/jpeg"),
                        filename: Nullable<String>.value("document.pdf"),
                        id: "id",
                        url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                    )),
                    options: [
                        CourseLessonAssessmentQuestionsItemOptionsItem(
                            id: "crsaqo_xxxxxxxxxxx",
                            isCorrect: .null,
                            optionText: "option_text",
                            order: 42
                        )
                    ],
                    order: 42,
                    questionText: "question_text",
                    questionType: CoursesAssessmentQuestionTypes.shortAnswer
                )
            ],
            attachments: [
                CourseLessonAttachmentsItem(
                    contentType: Nullable<String>.value("image/jpeg"),
                    filename: Nullable<String>.value("document.pdf"),
                    id: "id",
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )
            ],
            content: Nullable<String>.value("In this lesson, we will cover the basics of technical analysis..."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            daysFromCourseStartUntilUnlock: Nullable<Int>.value(42),
            embedId: Nullable<String>.value("dQw4w9WgXcQ"),
            embedType: Nullable<EmbedTypes>.value(EmbedTypes.youtube),
            id: "lesn_xxxxxxxxxxxxx",
            lessonType: LessonTypes.text,
            mainPdf: Nullable<CourseLessonMainPdf>.value(CourseLessonMainPdf(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            order: 42,
            thumbnail: Nullable<CourseLessonThumbnail>.value(CourseLessonThumbnail(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            title: "Understanding Candlestick Patterns",
            videoAsset: Nullable<CourseLessonVideoAsset>.value(CourseLessonVideoAsset(
                assetId: Nullable<String>.value("asset_id"),
                audioOnly: true,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                durationSeconds: Nullable<Int>.value(42),
                finishedUploadingAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                id: "mux_xxxxxxxxxxxxxx",
                playbackId: Nullable<String>.value("playback_id"),
                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                signedStoryboardPlaybackToken: Nullable<String>.value("signed_storyboard_playback_token"),
                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token"),
                signedVideoPlaybackToken: Nullable<String>.value("signed_video_playback_token"),
                status: MuxAssetStatuses.uploading,
                updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
            )),
            visibility: LessonVisibilities.visible
        )
        let response = try await client.courseLessons.retrieve(
            id: "lesn_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.courseLessons.delete(
            id: "lesn_xxxxxxxxxxxxx",
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
                  "assessment_questions": [
                    {
                      "correct_answer": "correct_answer",
                      "created_at": "2023-12-01T05:00:00Z",
                      "id": "crsaq_xxxxxxxxxxxx",
                      "image": {
                        "content_type": "image/jpeg",
                        "filename": "document.pdf",
                        "id": "id",
                        "url": "https://media.whop.com/abc123/optimized.jpg"
                      },
                      "options": [
                        {
                          "id": "crsaqo_xxxxxxxxxxx",
                          "is_correct": null,
                          "option_text": "option_text",
                          "order": 42
                        }
                      ],
                      "order": 42,
                      "question_text": "question_text",
                      "question_type": "short_answer"
                    }
                  ],
                  "attachments": [
                    {
                      "content_type": "image/jpeg",
                      "filename": "document.pdf",
                      "id": "id",
                      "url": "https://media.whop.com/abc123/optimized.jpg"
                    }
                  ],
                  "content": "In this lesson, we will cover the basics of technical analysis...",
                  "created_at": "2023-12-01T05:00:00Z",
                  "days_from_course_start_until_unlock": 42,
                  "embed_id": "dQw4w9WgXcQ",
                  "embed_type": "youtube",
                  "id": "lesn_xxxxxxxxxxxxx",
                  "lesson_type": "text",
                  "main_pdf": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "order": 42,
                  "thumbnail": {
                    "url": "https://media.whop.com/abc123/optimized.jpg"
                  },
                  "title": "Understanding Candlestick Patterns",
                  "video_asset": {
                    "asset_id": "asset_id",
                    "audio_only": true,
                    "created_at": "2023-12-01T05:00:00Z",
                    "duration_seconds": 42,
                    "finished_uploading_at": "2023-12-01T05:00:00Z",
                    "id": "mux_xxxxxxxxxxxxxx",
                    "playback_id": "playback_id",
                    "signed_playback_id": "signed_playback_id",
                    "signed_storyboard_playback_token": "signed_storyboard_playback_token",
                    "signed_thumbnail_playback_token": "signed_thumbnail_playback_token",
                    "signed_video_playback_token": "signed_video_playback_token",
                    "status": "uploading",
                    "updated_at": "2023-12-01T05:00:00Z"
                  },
                  "visibility": "visible"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = CourseLesson(
            assessmentQuestions: [
                CourseLessonAssessmentQuestionsItem(
                    correctAnswer: Nullable<String>.value("correct_answer"),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    id: "crsaq_xxxxxxxxxxxx",
                    image: Nullable<CourseLessonAssessmentQuestionsItemImage>.value(CourseLessonAssessmentQuestionsItemImage(
                        contentType: Nullable<String>.value("image/jpeg"),
                        filename: Nullable<String>.value("document.pdf"),
                        id: "id",
                        url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                    )),
                    options: [
                        CourseLessonAssessmentQuestionsItemOptionsItem(
                            id: "crsaqo_xxxxxxxxxxx",
                            isCorrect: .null,
                            optionText: "option_text",
                            order: 42
                        )
                    ],
                    order: 42,
                    questionText: "question_text",
                    questionType: CoursesAssessmentQuestionTypes.shortAnswer
                )
            ],
            attachments: [
                CourseLessonAttachmentsItem(
                    contentType: Nullable<String>.value("image/jpeg"),
                    filename: Nullable<String>.value("document.pdf"),
                    id: "id",
                    url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                )
            ],
            content: Nullable<String>.value("In this lesson, we will cover the basics of technical analysis..."),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            daysFromCourseStartUntilUnlock: Nullable<Int>.value(42),
            embedId: Nullable<String>.value("dQw4w9WgXcQ"),
            embedType: Nullable<EmbedTypes>.value(EmbedTypes.youtube),
            id: "lesn_xxxxxxxxxxxxx",
            lessonType: LessonTypes.text,
            mainPdf: Nullable<CourseLessonMainPdf>.value(CourseLessonMainPdf(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            order: 42,
            thumbnail: Nullable<CourseLessonThumbnail>.value(CourseLessonThumbnail(
                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
            )),
            title: "Understanding Candlestick Patterns",
            videoAsset: Nullable<CourseLessonVideoAsset>.value(CourseLessonVideoAsset(
                assetId: Nullable<String>.value("asset_id"),
                audioOnly: true,
                createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                durationSeconds: Nullable<Int>.value(42),
                finishedUploadingAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                id: "mux_xxxxxxxxxxxxxx",
                playbackId: Nullable<String>.value("playback_id"),
                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                signedStoryboardPlaybackToken: Nullable<String>.value("signed_storyboard_playback_token"),
                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token"),
                signedVideoPlaybackToken: Nullable<String>.value("signed_video_playback_token"),
                status: MuxAssetStatuses.uploading,
                updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
            )),
            visibility: LessonVisibilities.visible
        )
        let response = try await client.courseLessons.update(
            id: "lesn_xxxxxxxxxxxxx",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func markAsCompleted1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.courseLessons.markAsCompleted(
            lessonId: "lesson_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func start1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                true
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = true
        let response = try await client.courseLessons.start(
            lessonId: "lesson_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func submitAssessment1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "created_at": "2023-12-01T05:00:00Z",
                  "id": "crsar_xxxxxxxxxxxx",
                  "lesson": {
                    "id": "lesn_xxxxxxxxxxxxx",
                    "title": "Understanding Candlestick Patterns"
                  },
                  "result_correct": 42,
                  "result_grade": 6.9,
                  "result_graded_questions": {
                    "key": "value"
                  },
                  "result_passing_grade": true,
                  "result_question_count": 42,
                  "score_percent": 6.9,
                  "updated_at": "2023-12-01T05:00:00Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxx",
                    "name": "John Doe",
                    "username": "johndoe42"
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
        let expectedResponse = SubmitAssessmentCourseLessonsResponse(
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            id: "crsar_xxxxxxxxxxxx",
            lesson: SubmitAssessmentCourseLessonsResponseLesson(
                id: "lesn_xxxxxxxxxxxxx",
                title: "Understanding Candlestick Patterns"
            ),
            resultCorrect: 42,
            resultGrade: 6.9,
            resultGradedQuestions: [
                "key": JSONValue.string("value")
            ],
            resultPassingGrade: true,
            resultQuestionCount: 42,
            scorePercent: 6.9,
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            user: SubmitAssessmentCourseLessonsResponseUser(
                id: "user_xxxxxxxxxxxxx",
                name: Nullable<String>.value("John Doe"),
                username: "johndoe42"
            )
        )
        let response = try await client.courseLessons.submitAssessment(
            lessonId: "lesson_id",
            request: .init(answers: [
                SubmitAssessmentCourseLessonsRequestAnswersItem(
                    questionId: "question_id"
                )
            ]),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}