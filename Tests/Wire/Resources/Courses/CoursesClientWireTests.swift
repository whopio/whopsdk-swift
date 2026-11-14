import Foundation
import Testing
import WhopSDK

@Suite("CoursesClient Wire Tests") struct CoursesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "certificate_after_completion_enabled": true,
                      "chapters_count": 42,
                      "completed_lessons_count": 42,
                      "cover_image": "https://assets.whop.com/images/course-cover.jpg",
                      "created_at": "2023-12-01T05:00:00Z",
                      "description": "Learn advanced trading strategies from industry experts.",
                      "id": "cors_xxxxxxxxxxxxx",
                      "language": "en",
                      "latest_lesson_created_at": "2023-12-01T05:00:00Z",
                      "lesson_unlock_days": [
                        42
                      ],
                      "order": "123.45",
                      "require_completing_lessons_in_order": true,
                      "resume_lesson": {
                        "id": "lesn_xxxxxxxxxxxxx"
                      },
                      "started_at": "2023-12-01T05:00:00Z",
                      "tagline": "Master the fundamentals in 30 days",
                      "thumbnail": {
                        "content_type": "image/jpeg",
                        "filename": "document.pdf",
                        "id": "id",
                        "optimized_url": "https://media.whop.com/abc123/optimized.jpg",
                        "source_url": "https://media.whop.com/abc123/original.jpg"
                      },
                      "title": "Introduction to Technical Analysis",
                      "total_duration_seconds": 42,
                      "total_lessons_count": 42,
                      "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = ListCoursesResponse(
            data: [
                CourseListItem(
                    certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
                    chaptersCount: 42,
                    completedLessonsCount: 42,
                    coverImage: Nullable<String>.value("https://assets.whop.com/images/course-cover.jpg"),
                    createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("Learn advanced trading strategies from industry experts."),
                    id: "cors_xxxxxxxxxxxxx",
                    language: Languages.en,
                    latestLessonCreatedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    lessonUnlockDays: [
                        42
                    ],
                    order: "123.45",
                    requireCompletingLessonsInOrder: true,
                    resumeLesson: Nullable<CourseListItemResumeLesson>.value(CourseListItemResumeLesson(
                        id: "lesn_xxxxxxxxxxxxx"
                    )),
                    startedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
                    tagline: Nullable<String>.value("Master the fundamentals in 30 days"),
                    thumbnail: Nullable<CourseListItemThumbnail>.value(CourseListItemThumbnail(
                        contentType: Nullable<String>.value("image/jpeg"),
                        filename: Nullable<String>.value("document.pdf"),
                        id: "id",
                        optimizedUrl: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg"),
                        sourceUrl: Nullable<String>.value("https://media.whop.com/abc123/original.jpg")
                    )),
                    title: Nullable<String>.value("Introduction to Technical Analysis"),
                    totalDurationSeconds: 42,
                    totalLessonsCount: 42,
                    updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
                    visibility: CourseVisibilities.visible
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.courses.list(
            first: 42,
            last: 42,
            experienceId: "exp_xxxxxxxxxxxxxx",
            accountId: "biz_xxxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
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
                      "certificate_after_completion_enabled": true,
                      "chapters_count": 1,
                      "completed_lessons_count": 1,
                      "cover_image": "cover_image",
                      "created_at": "2024-01-15T09:30:00Z",
                      "description": "description",
                      "id": "id",
                      "language": "en",
                      "latest_lesson_created_at": "2024-01-15T09:30:00Z",
                      "lesson_unlock_days": [
                        1,
                        1
                      ],
                      "order": "order",
                      "require_completing_lessons_in_order": true,
                      "resume_lesson": {
                        "id": "id"
                      },
                      "started_at": "2024-01-15T09:30:00Z",
                      "tagline": "tagline",
                      "thumbnail": {
                        "content_type": "content_type",
                        "filename": "filename",
                        "id": "id",
                        "optimized_url": "optimized_url",
                        "source_url": "source_url"
                      },
                      "title": "title",
                      "total_duration_seconds": 1,
                      "total_lessons_count": 1,
                      "updated_at": "2024-01-15T09:30:00Z",
                      "visibility": "visible"
                    },
                    {
                      "certificate_after_completion_enabled": true,
                      "chapters_count": 1,
                      "completed_lessons_count": 1,
                      "cover_image": "cover_image",
                      "created_at": "2024-01-15T09:30:00Z",
                      "description": "description",
                      "id": "id",
                      "language": "en",
                      "latest_lesson_created_at": "2024-01-15T09:30:00Z",
                      "lesson_unlock_days": [
                        1,
                        1
                      ],
                      "order": "order",
                      "require_completing_lessons_in_order": true,
                      "resume_lesson": {
                        "id": "id"
                      },
                      "started_at": "2024-01-15T09:30:00Z",
                      "tagline": "tagline",
                      "thumbnail": {
                        "content_type": "content_type",
                        "filename": "filename",
                        "id": "id",
                        "optimized_url": "optimized_url",
                        "source_url": "source_url"
                      },
                      "title": "title",
                      "total_duration_seconds": 1,
                      "total_lessons_count": 1,
                      "updated_at": "2024-01-15T09:30:00Z",
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
        let expectedResponse = ListCoursesResponse(
            data: [
                CourseListItem(
                    certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
                    chaptersCount: 1,
                    completedLessonsCount: 1,
                    coverImage: Nullable<String>.value("cover_image"),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("description"),
                    id: "id",
                    language: Languages.en,
                    latestLessonCreatedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    lessonUnlockDays: [
                        1,
                        1
                    ],
                    order: "order",
                    requireCompletingLessonsInOrder: true,
                    resumeLesson: Nullable<CourseListItemResumeLesson>.value(CourseListItemResumeLesson(
                        id: "id"
                    )),
                    startedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    tagline: Nullable<String>.value("tagline"),
                    thumbnail: Nullable<CourseListItemThumbnail>.value(CourseListItemThumbnail(
                        contentType: Nullable<String>.value("content_type"),
                        filename: Nullable<String>.value("filename"),
                        id: "id",
                        optimizedUrl: Nullable<String>.value("optimized_url"),
                        sourceUrl: Nullable<String>.value("source_url")
                    )),
                    title: Nullable<String>.value("title"),
                    totalDurationSeconds: 1,
                    totalLessonsCount: 1,
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    visibility: CourseVisibilities.visible
                ),
                CourseListItem(
                    certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
                    chaptersCount: 1,
                    completedLessonsCount: 1,
                    coverImage: Nullable<String>.value("cover_image"),
                    createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    description: Nullable<String>.value("description"),
                    id: "id",
                    language: Languages.en,
                    latestLessonCreatedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    lessonUnlockDays: [
                        1,
                        1
                    ],
                    order: "order",
                    requireCompletingLessonsInOrder: true,
                    resumeLesson: Nullable<CourseListItemResumeLesson>.value(CourseListItemResumeLesson(
                        id: "id"
                    )),
                    startedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    tagline: Nullable<String>.value("tagline"),
                    thumbnail: Nullable<CourseListItemThumbnail>.value(CourseListItemThumbnail(
                        contentType: Nullable<String>.value("content_type"),
                        filename: Nullable<String>.value("filename"),
                        id: "id",
                        optimizedUrl: Nullable<String>.value("optimized_url"),
                        sourceUrl: Nullable<String>.value("source_url")
                    )),
                    title: Nullable<String>.value("title"),
                    totalDurationSeconds: 1,
                    totalLessonsCount: 1,
                    updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    visibility: CourseVisibilities.visible
                )
            ],
            pageInfo: PageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.courses.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "certificate_after_completion_enabled": true,
                  "chapters": [
                    {
                      "id": "chap_xxxxxxxxxxxxx",
                      "lessons": [
                        {
                          "id": "lesn_xxxxxxxxxxxxx",
                          "lesson_type": "text",
                          "order": 42,
                          "thumbnail": {
                            "url": "https://media.whop.com/abc123/optimized.jpg"
                          },
                          "title": "Understanding Candlestick Patterns",
                          "video_asset": {
                            "duration_seconds": 42,
                            "signed_playback_id": null,
                            "signed_thumbnail_playback_token": null
                          }
                        }
                      ],
                      "order": 42,
                      "title": "Getting Started"
                    }
                  ],
                  "chapters_count": 42,
                  "completed_lessons_count": 42,
                  "cover_image": "https://assets.whop.com/images/course-cover.jpg",
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Learn advanced trading strategies from industry experts.",
                  "id": "cors_xxxxxxxxxxxxx",
                  "language": "en",
                  "latest_lesson_created_at": "2023-12-01T05:00:00Z",
                  "lesson_unlock_days": [
                    42
                  ],
                  "order": "123.45",
                  "require_completing_lessons_in_order": true,
                  "resume_lesson": {
                    "id": "lesn_xxxxxxxxxxxxx"
                  },
                  "started_at": "2023-12-01T05:00:00Z",
                  "tagline": "Master the fundamentals in 30 days",
                  "thumbnail": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "optimized_url": "https://media.whop.com/abc123/optimized.jpg",
                    "source_url": "https://media.whop.com/abc123/original.jpg"
                  },
                  "title": "Introduction to Technical Analysis",
                  "total_duration_seconds": 42,
                  "total_lessons_count": 42,
                  "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = Course(
            certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
            chapters: [
                CourseChaptersItem(
                    id: "chap_xxxxxxxxxxxxx",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "lesn_xxxxxxxxxxxxx",
                            lessonType: LessonTypes.text,
                            order: 42,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                            )),
                            title: "Understanding Candlestick Patterns",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(42),
                                signedPlaybackId: .null,
                                signedThumbnailPlaybackToken: .null
                            ))
                        )
                    ],
                    order: 42,
                    title: "Getting Started"
                )
            ],
            chaptersCount: 42,
            completedLessonsCount: 42,
            coverImage: Nullable<String>.value("https://assets.whop.com/images/course-cover.jpg"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Learn advanced trading strategies from industry experts."),
            id: "cors_xxxxxxxxxxxxx",
            language: Languages.en,
            latestLessonCreatedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            lessonUnlockDays: [
                42
            ],
            order: "123.45",
            requireCompletingLessonsInOrder: true,
            resumeLesson: Nullable<CourseResumeLesson>.value(CourseResumeLesson(
                id: "lesn_xxxxxxxxxxxxx"
            )),
            startedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            tagline: Nullable<String>.value("Master the fundamentals in 30 days"),
            thumbnail: Nullable<CourseThumbnail>.value(CourseThumbnail(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                optimizedUrl: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg"),
                sourceUrl: Nullable<String>.value("https://media.whop.com/abc123/original.jpg")
            )),
            title: Nullable<String>.value("Introduction to Technical Analysis"),
            totalDurationSeconds: 42,
            totalLessonsCount: 42,
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            visibility: CourseVisibilities.visible
        )
        let response = try await client.courses.create(
            request: .init(
                experienceId: "exp_xxxxxxxxxxxxxx",
                title: "title"
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
                  "certificate_after_completion_enabled": true,
                  "chapters": [
                    {
                      "id": "id",
                      "lessons": [
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        },
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        }
                      ],
                      "order": 1,
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "lessons": [
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        },
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        }
                      ],
                      "order": 1,
                      "title": "title"
                    }
                  ],
                  "chapters_count": 1,
                  "completed_lessons_count": 1,
                  "cover_image": "cover_image",
                  "created_at": "2024-01-15T09:30:00Z",
                  "description": "description",
                  "id": "id",
                  "language": "en",
                  "latest_lesson_created_at": "2024-01-15T09:30:00Z",
                  "lesson_unlock_days": [
                    1,
                    1
                  ],
                  "order": "order",
                  "require_completing_lessons_in_order": true,
                  "resume_lesson": {
                    "id": "id"
                  },
                  "started_at": "2024-01-15T09:30:00Z",
                  "tagline": "tagline",
                  "thumbnail": {
                    "content_type": "content_type",
                    "filename": "filename",
                    "id": "id",
                    "optimized_url": "optimized_url",
                    "source_url": "source_url"
                  },
                  "title": "title",
                  "total_duration_seconds": 1,
                  "total_lessons_count": 1,
                  "updated_at": "2024-01-15T09:30:00Z",
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
        let expectedResponse = Course(
            certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
            chapters: [
                CourseChaptersItem(
                    id: "id",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        ),
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        )
                    ],
                    order: 1,
                    title: "title"
                ),
                CourseChaptersItem(
                    id: "id",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        ),
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        )
                    ],
                    order: 1,
                    title: "title"
                )
            ],
            chaptersCount: 1,
            completedLessonsCount: 1,
            coverImage: Nullable<String>.value("cover_image"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            description: Nullable<String>.value("description"),
            id: "id",
            language: Languages.en,
            latestLessonCreatedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            lessonUnlockDays: [
                1,
                1
            ],
            order: "order",
            requireCompletingLessonsInOrder: true,
            resumeLesson: Nullable<CourseResumeLesson>.value(CourseResumeLesson(
                id: "id"
            )),
            startedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            tagline: Nullable<String>.value("tagline"),
            thumbnail: Nullable<CourseThumbnail>.value(CourseThumbnail(
                contentType: Nullable<String>.value("content_type"),
                filename: Nullable<String>.value("filename"),
                id: "id",
                optimizedUrl: Nullable<String>.value("optimized_url"),
                sourceUrl: Nullable<String>.value("source_url")
            )),
            title: Nullable<String>.value("title"),
            totalDurationSeconds: 1,
            totalLessonsCount: 1,
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            visibility: CourseVisibilities.visible
        )
        let response = try await client.courses.create(
            request: .init(
                experienceId: "experience_id",
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
                  "certificate_after_completion_enabled": true,
                  "chapters": [
                    {
                      "id": "chap_xxxxxxxxxxxxx",
                      "lessons": [
                        {
                          "id": "lesn_xxxxxxxxxxxxx",
                          "lesson_type": "text",
                          "order": 42,
                          "thumbnail": {
                            "url": "https://media.whop.com/abc123/optimized.jpg"
                          },
                          "title": "Understanding Candlestick Patterns",
                          "video_asset": {
                            "duration_seconds": 42,
                            "signed_playback_id": null,
                            "signed_thumbnail_playback_token": null
                          }
                        }
                      ],
                      "order": 42,
                      "title": "Getting Started"
                    }
                  ],
                  "chapters_count": 42,
                  "completed_lessons_count": 42,
                  "cover_image": "https://assets.whop.com/images/course-cover.jpg",
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Learn advanced trading strategies from industry experts.",
                  "id": "cors_xxxxxxxxxxxxx",
                  "language": "en",
                  "latest_lesson_created_at": "2023-12-01T05:00:00Z",
                  "lesson_unlock_days": [
                    42
                  ],
                  "order": "123.45",
                  "require_completing_lessons_in_order": true,
                  "resume_lesson": {
                    "id": "lesn_xxxxxxxxxxxxx"
                  },
                  "started_at": "2023-12-01T05:00:00Z",
                  "tagline": "Master the fundamentals in 30 days",
                  "thumbnail": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "optimized_url": "https://media.whop.com/abc123/optimized.jpg",
                    "source_url": "https://media.whop.com/abc123/original.jpg"
                  },
                  "title": "Introduction to Technical Analysis",
                  "total_duration_seconds": 42,
                  "total_lessons_count": 42,
                  "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = Course(
            certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
            chapters: [
                CourseChaptersItem(
                    id: "chap_xxxxxxxxxxxxx",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "lesn_xxxxxxxxxxxxx",
                            lessonType: LessonTypes.text,
                            order: 42,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                            )),
                            title: "Understanding Candlestick Patterns",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(42),
                                signedPlaybackId: .null,
                                signedThumbnailPlaybackToken: .null
                            ))
                        )
                    ],
                    order: 42,
                    title: "Getting Started"
                )
            ],
            chaptersCount: 42,
            completedLessonsCount: 42,
            coverImage: Nullable<String>.value("https://assets.whop.com/images/course-cover.jpg"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Learn advanced trading strategies from industry experts."),
            id: "cors_xxxxxxxxxxxxx",
            language: Languages.en,
            latestLessonCreatedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            lessonUnlockDays: [
                42
            ],
            order: "123.45",
            requireCompletingLessonsInOrder: true,
            resumeLesson: Nullable<CourseResumeLesson>.value(CourseResumeLesson(
                id: "lesn_xxxxxxxxxxxxx"
            )),
            startedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            tagline: Nullable<String>.value("Master the fundamentals in 30 days"),
            thumbnail: Nullable<CourseThumbnail>.value(CourseThumbnail(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                optimizedUrl: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg"),
                sourceUrl: Nullable<String>.value("https://media.whop.com/abc123/original.jpg")
            )),
            title: Nullable<String>.value("Introduction to Technical Analysis"),
            totalDurationSeconds: 42,
            totalLessonsCount: 42,
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            visibility: CourseVisibilities.visible
        )
        let response = try await client.courses.retrieve(
            id: "cors_xxxxxxxxxxxxx",
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
                  "certificate_after_completion_enabled": true,
                  "chapters": [
                    {
                      "id": "id",
                      "lessons": [
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        },
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        }
                      ],
                      "order": 1,
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "lessons": [
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        },
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        }
                      ],
                      "order": 1,
                      "title": "title"
                    }
                  ],
                  "chapters_count": 1,
                  "completed_lessons_count": 1,
                  "cover_image": "cover_image",
                  "created_at": "2024-01-15T09:30:00Z",
                  "description": "description",
                  "id": "id",
                  "language": "en",
                  "latest_lesson_created_at": "2024-01-15T09:30:00Z",
                  "lesson_unlock_days": [
                    1,
                    1
                  ],
                  "order": "order",
                  "require_completing_lessons_in_order": true,
                  "resume_lesson": {
                    "id": "id"
                  },
                  "started_at": "2024-01-15T09:30:00Z",
                  "tagline": "tagline",
                  "thumbnail": {
                    "content_type": "content_type",
                    "filename": "filename",
                    "id": "id",
                    "optimized_url": "optimized_url",
                    "source_url": "source_url"
                  },
                  "title": "title",
                  "total_duration_seconds": 1,
                  "total_lessons_count": 1,
                  "updated_at": "2024-01-15T09:30:00Z",
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
        let expectedResponse = Course(
            certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
            chapters: [
                CourseChaptersItem(
                    id: "id",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        ),
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        )
                    ],
                    order: 1,
                    title: "title"
                ),
                CourseChaptersItem(
                    id: "id",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        ),
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        )
                    ],
                    order: 1,
                    title: "title"
                )
            ],
            chaptersCount: 1,
            completedLessonsCount: 1,
            coverImage: Nullable<String>.value("cover_image"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            description: Nullable<String>.value("description"),
            id: "id",
            language: Languages.en,
            latestLessonCreatedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            lessonUnlockDays: [
                1,
                1
            ],
            order: "order",
            requireCompletingLessonsInOrder: true,
            resumeLesson: Nullable<CourseResumeLesson>.value(CourseResumeLesson(
                id: "id"
            )),
            startedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            tagline: Nullable<String>.value("tagline"),
            thumbnail: Nullable<CourseThumbnail>.value(CourseThumbnail(
                contentType: Nullable<String>.value("content_type"),
                filename: Nullable<String>.value("filename"),
                id: "id",
                optimizedUrl: Nullable<String>.value("optimized_url"),
                sourceUrl: Nullable<String>.value("source_url")
            )),
            title: Nullable<String>.value("title"),
            totalDurationSeconds: 1,
            totalLessonsCount: 1,
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            visibility: CourseVisibilities.visible
        )
        let response = try await client.courses.retrieve(
            id: "id",
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
        let response = try await client.courses.delete(
            id: "cors_xxxxxxxxxxxxx",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
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
        let response = try await client.courses.delete(
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
                  "certificate_after_completion_enabled": true,
                  "chapters": [
                    {
                      "id": "chap_xxxxxxxxxxxxx",
                      "lessons": [
                        {
                          "id": "lesn_xxxxxxxxxxxxx",
                          "lesson_type": "text",
                          "order": 42,
                          "thumbnail": {
                            "url": "https://media.whop.com/abc123/optimized.jpg"
                          },
                          "title": "Understanding Candlestick Patterns",
                          "video_asset": {
                            "duration_seconds": 42,
                            "signed_playback_id": null,
                            "signed_thumbnail_playback_token": null
                          }
                        }
                      ],
                      "order": 42,
                      "title": "Getting Started"
                    }
                  ],
                  "chapters_count": 42,
                  "completed_lessons_count": 42,
                  "cover_image": "https://assets.whop.com/images/course-cover.jpg",
                  "created_at": "2023-12-01T05:00:00Z",
                  "description": "Learn advanced trading strategies from industry experts.",
                  "id": "cors_xxxxxxxxxxxxx",
                  "language": "en",
                  "latest_lesson_created_at": "2023-12-01T05:00:00Z",
                  "lesson_unlock_days": [
                    42
                  ],
                  "order": "123.45",
                  "require_completing_lessons_in_order": true,
                  "resume_lesson": {
                    "id": "lesn_xxxxxxxxxxxxx"
                  },
                  "started_at": "2023-12-01T05:00:00Z",
                  "tagline": "Master the fundamentals in 30 days",
                  "thumbnail": {
                    "content_type": "image/jpeg",
                    "filename": "document.pdf",
                    "id": "id",
                    "optimized_url": "https://media.whop.com/abc123/optimized.jpg",
                    "source_url": "https://media.whop.com/abc123/original.jpg"
                  },
                  "title": "Introduction to Technical Analysis",
                  "total_duration_seconds": 42,
                  "total_lessons_count": 42,
                  "updated_at": "2023-12-01T05:00:00Z",
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
        let expectedResponse = Course(
            certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
            chapters: [
                CourseChaptersItem(
                    id: "chap_xxxxxxxxxxxxx",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "lesn_xxxxxxxxxxxxx",
                            lessonType: LessonTypes.text,
                            order: 42,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg")
                            )),
                            title: "Understanding Candlestick Patterns",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(42),
                                signedPlaybackId: .null,
                                signedThumbnailPlaybackToken: .null
                            ))
                        )
                    ],
                    order: 42,
                    title: "Getting Started"
                )
            ],
            chaptersCount: 42,
            completedLessonsCount: 42,
            coverImage: Nullable<String>.value("https://assets.whop.com/images/course-cover.jpg"),
            createdAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            description: Nullable<String>.value("Learn advanced trading strategies from industry experts."),
            id: "cors_xxxxxxxxxxxxx",
            language: Languages.en,
            latestLessonCreatedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            lessonUnlockDays: [
                42
            ],
            order: "123.45",
            requireCompletingLessonsInOrder: true,
            resumeLesson: Nullable<CourseResumeLesson>.value(CourseResumeLesson(
                id: "lesn_xxxxxxxxxxxxx"
            )),
            startedAt: Nullable<Date>.value(try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)),
            tagline: Nullable<String>.value("Master the fundamentals in 30 days"),
            thumbnail: Nullable<CourseThumbnail>.value(CourseThumbnail(
                contentType: Nullable<String>.value("image/jpeg"),
                filename: Nullable<String>.value("document.pdf"),
                id: "id",
                optimizedUrl: Nullable<String>.value("https://media.whop.com/abc123/optimized.jpg"),
                sourceUrl: Nullable<String>.value("https://media.whop.com/abc123/original.jpg")
            )),
            title: Nullable<String>.value("Introduction to Technical Analysis"),
            totalDurationSeconds: 42,
            totalLessonsCount: 42,
            updatedAt: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
            visibility: CourseVisibilities.visible
        )
        let response = try await client.courses.update(
            id: "cors_xxxxxxxxxxxxx",
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
                  "certificate_after_completion_enabled": true,
                  "chapters": [
                    {
                      "id": "id",
                      "lessons": [
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        },
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        }
                      ],
                      "order": 1,
                      "title": "title"
                    },
                    {
                      "id": "id",
                      "lessons": [
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        },
                        {
                          "id": "id",
                          "lesson_type": "text",
                          "order": 1,
                          "thumbnail": {
                            "url": "url"
                          },
                          "title": "title",
                          "video_asset": {
                            "duration_seconds": 1,
                            "signed_playback_id": "signed_playback_id",
                            "signed_thumbnail_playback_token": "signed_thumbnail_playback_token"
                          }
                        }
                      ],
                      "order": 1,
                      "title": "title"
                    }
                  ],
                  "chapters_count": 1,
                  "completed_lessons_count": 1,
                  "cover_image": "cover_image",
                  "created_at": "2024-01-15T09:30:00Z",
                  "description": "description",
                  "id": "id",
                  "language": "en",
                  "latest_lesson_created_at": "2024-01-15T09:30:00Z",
                  "lesson_unlock_days": [
                    1,
                    1
                  ],
                  "order": "order",
                  "require_completing_lessons_in_order": true,
                  "resume_lesson": {
                    "id": "id"
                  },
                  "started_at": "2024-01-15T09:30:00Z",
                  "tagline": "tagline",
                  "thumbnail": {
                    "content_type": "content_type",
                    "filename": "filename",
                    "id": "id",
                    "optimized_url": "optimized_url",
                    "source_url": "source_url"
                  },
                  "title": "title",
                  "total_duration_seconds": 1,
                  "total_lessons_count": 1,
                  "updated_at": "2024-01-15T09:30:00Z",
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
        let expectedResponse = Course(
            certificateAfterCompletionEnabled: Nullable<Bool>.value(true),
            chapters: [
                CourseChaptersItem(
                    id: "id",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        ),
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        )
                    ],
                    order: 1,
                    title: "title"
                ),
                CourseChaptersItem(
                    id: "id",
                    lessons: [
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        ),
                        CourseChaptersItemLessonsItem(
                            id: "id",
                            lessonType: LessonTypes.text,
                            order: 1,
                            thumbnail: Nullable<CourseChaptersItemLessonsItemThumbnail>.value(CourseChaptersItemLessonsItemThumbnail(
                                url: Nullable<String>.value("url")
                            )),
                            title: "title",
                            videoAsset: Nullable<CourseChaptersItemLessonsItemVideoAsset>.value(CourseChaptersItemLessonsItemVideoAsset(
                                durationSeconds: Nullable<Int>.value(1),
                                signedPlaybackId: Nullable<String>.value("signed_playback_id"),
                                signedThumbnailPlaybackToken: Nullable<String>.value("signed_thumbnail_playback_token")
                            ))
                        )
                    ],
                    order: 1,
                    title: "title"
                )
            ],
            chaptersCount: 1,
            completedLessonsCount: 1,
            coverImage: Nullable<String>.value("cover_image"),
            createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            description: Nullable<String>.value("description"),
            id: "id",
            language: Languages.en,
            latestLessonCreatedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            lessonUnlockDays: [
                1,
                1
            ],
            order: "order",
            requireCompletingLessonsInOrder: true,
            resumeLesson: Nullable<CourseResumeLesson>.value(CourseResumeLesson(
                id: "id"
            )),
            startedAt: Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
            tagline: Nullable<String>.value("tagline"),
            thumbnail: Nullable<CourseThumbnail>.value(CourseThumbnail(
                contentType: Nullable<String>.value("content_type"),
                filename: Nullable<String>.value("filename"),
                id: "id",
                optimizedUrl: Nullable<String>.value("optimized_url"),
                sourceUrl: Nullable<String>.value("source_url")
            )),
            title: Nullable<String>.value("title"),
            totalDurationSeconds: 1,
            totalLessonsCount: 1,
            updatedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
            visibility: CourseVisibilities.visible
        )
        let response = try await client.courses.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}