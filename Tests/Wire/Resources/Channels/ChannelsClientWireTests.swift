import Foundation
import Testing
import WhopSDK

@Suite("ChannelsClient Wire Tests") struct ChannelsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "account_id": "account_id",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "deleted_at": "deleted_at",
                      "experience_id": "experience_id",
                      "icon": {
                        "blurhash": null,
                        "content_type": "application/pdf",
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "duration_seconds": null,
                        "filename": "evidence.pdf",
                        "height": null,
                        "id": "file_xxxxxxxxxxxxxx",
                        "multipart_chunk_size": 5242880,
                        "multipart_upload_id": "upload-id",
                        "multipart_upload_urls": [
                          {
                            "part_number": 1,
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                          }
                        ],
                        "object": "file",
                        "removed_by_moderation": false,
                        "size": 9670,
                        "upload_headers": {
                          "key": "value"
                        },
                        "upload_status": "pending",
                        "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "visibility": "public",
                        "waveform_url": null,
                        "width": null
                      },
                      "id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                      "kind": "private",
                      "last_message": {
                        "attachments": [
                          {
                            "blurhash": null,
                            "content_type": "application/pdf",
                            "created_at": "2026-01-01T12:00:00.000Z",
                            "duration_seconds": null,
                            "filename": "evidence.pdf",
                            "height": null,
                            "id": "file_xxxxxxxxxxxxxx",
                            "multipart_chunk_size": 5242880,
                            "multipart_upload_id": "upload-id",
                            "multipart_upload_urls": [
                              {
                                "part_number": 1,
                                "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                              }
                            ],
                            "object": "file",
                            "removed_by_moderation": false,
                            "size": 9670,
                            "upload_headers": {
                              "key": "value"
                            },
                            "upload_status": "pending",
                            "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                            "visibility": "public",
                            "waveform_url": null,
                            "width": null
                          }
                        ],
                        "author": {
                          "id": "user_xxxxxxxxxxxxxx",
                          "name": "Dana Whitfield",
                          "profile_picture": {
                            "url": "https://ui-avatars.com/api/"
                          },
                          "username": "danawhitfield"
                        },
                        "author_is_team_member": false,
                        "author_user_id": "user_xxxxxxxxxxxxxx",
                        "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                        "content": "Content 1",
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "custom_author": {
                          "display_name": null,
                          "profile_picture": {
                            "blurhash": null,
                            "content_type": "application/pdf",
                            "created_at": "2026-01-01T12:00:00.000Z",
                            "duration_seconds": null,
                            "filename": "evidence.pdf",
                            "height": null,
                            "id": "file_xxxxxxxxxxxxxx",
                            "multipart_chunk_size": 5242880,
                            "multipart_upload_id": "upload-id",
                            "multipart_upload_urls": [
                              {
                                "part_number": 1,
                                "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                              }
                            ],
                            "object": "file",
                            "removed_by_moderation": false,
                            "size": 9670,
                            "upload_headers": {
                              "key": "value"
                            },
                            "upload_status": "pending",
                            "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                            "visibility": "public",
                            "waveform_url": null,
                            "width": null
                          }
                        },
                        "deleted_at": null,
                        "edited": false,
                        "embeds": [
                          {
                            "color": null,
                            "description": null,
                            "fields": [
                              {
                                "inline": true,
                                "name": "name",
                                "value": "value"
                              }
                            ],
                            "footer": null,
                            "image": null,
                            "thumbnail": null,
                            "timestamp_at": null,
                            "title": null,
                            "url": null
                          }
                        ],
                        "gifs": [
                          {
                            "height": 1,
                            "original_url": "original_url",
                            "preview_url": "preview_url",
                            "slug": "slug",
                            "title": "title",
                            "url": "url",
                            "width": 1
                          }
                        ],
                        "id": "post_xxxxxxxxxxxxxxxxxxxxxx",
                        "link_previews": [
                          {
                            "description": null,
                            "favicon_url": null,
                            "footer": null,
                            "image_url": null,
                            "processing": true,
                            "title": null,
                            "url": "url"
                          }
                        ],
                        "mentioned_user_ids": [
                          "mentioned_user_ids"
                        ],
                        "message_type": "regular",
                        "pinned": false,
                        "plain_content": "Content 1",
                        "poll": {
                          "options": [
                            {
                              "id": "1",
                              "text": "A",
                              "vote_count": 0,
                              "voted": false
                            }
                          ]
                        },
                        "reaction_counts": [
                          {
                            "kind": "like",
                            "reacted": true,
                            "total_score": 1,
                            "user_count": 1,
                            "value": "❤️"
                          }
                        ],
                        "replying_to_message_id": null,
                        "replying_to_user_id": null,
                        "updated_at": "2026-01-01T12:00:00.000Z",
                        "view_count": null
                      },
                      "last_message_at": "2026-01-01T12:00:00.000Z",
                      "last_message_id": "post_xxxxxxxxxxxxxxxxxxxxxx",
                      "members": [
                        {
                          "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                          "created_at": "2026-01-01T12:00:00.000Z",
                          "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                          "inbox_status": null,
                          "last_viewed_at": "2026-01-01T12:00:00.000Z",
                          "notification_preference": null,
                          "pinned_position": null,
                          "unread": false,
                          "updated_at": "2026-01-01T12:00:00.000Z",
                          "user": {
                            "id": "user_xxxxxxxxxxxxxx",
                            "name": "Dana Whitfield",
                            "profile_picture": {
                              "url": "https://ui-avatars.com/api/"
                            },
                            "username": "danawhitfield"
                          },
                          "user_id": "user_xxxxxxxxxxxxxx"
                        }
                      ],
                      "membership": {
                        "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                        "created_at": "2026-01-01T12:00:00.000Z",
                        "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "inbox_status": null,
                        "last_viewed_at": "2026-01-01T12:00:00.000Z",
                        "notification_preference": null,
                        "pinned_position": null,
                        "unread": false,
                        "updated_at": "2026-01-01T12:00:00.000Z",
                        "user": {
                          "id": "user_xxxxxxxxxxxxxx",
                          "name": "Dana Whitfield",
                          "profile_picture": {
                            "url": "https://ui-avatars.com/api/"
                          },
                          "username": "danawhitfield"
                        },
                        "user_id": "user_xxxxxxxxxxxxxx"
                      },
                      "moderation": {
                        "ban_media": true,
                        "ban_urls": true,
                        "banned_words": null,
                        "user_posts_cooldown_seconds": null,
                        "who_can_post": "everyone",
                        "who_can_react": "everyone"
                      },
                      "name": "name",
                      "notifications_enabled": true,
                      "support": {
                        "awaiting_reply": false,
                        "customer_user_id": "user_xxxxxxxxxxxxxx",
                        "last_message_by": null,
                        "resolved_at": "2026-01-01T12:00:00.000Z",
                        "status": "unresolved"
                      },
                      "synchronized_at": "2026-01-01T12:00:00.000Z",
                      "updated_at": "2026-01-01T12:00:00.000Z"
                    }
                  ],
                  "page_info": {
                    "end_cursor": "end_cursor",
                    "has_next_page": false,
                    "has_previous_page": false,
                    "start_cursor": "WyJjdXJzb3IiLDFd",
                    "total_count": 1,
                    "total_count_capped": true
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
        let expectedResponse = ListChannelsResponse(
            data: [
                ChannelListItem(
                    accountId: Nullable<String>.value("account_id"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    deletedAt: Nullable<String>.value("deleted_at"),
                    experienceId: Nullable<String>.value("experience_id"),
                    icon: Nullable<File>.value(File(
                        blurhash: .null,
                        contentType: Nullable<String>.value("application/pdf"),
                        createdAt: "2026-01-01T12:00:00.000Z",
                        durationSeconds: .null,
                        filename: Nullable<String>.value("evidence.pdf"),
                        height: .null,
                        id: "file_xxxxxxxxxxxxxx",
                        multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                        multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                        multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                            FileMultipartUrl(
                                partNumber: 1,
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                            )
                        ])),
                        object: "file",
                        removedByModeration: false,
                        size: Nullable<Int>.value(9670),
                        uploadHeaders: Optional([
                            "key": JSONValue.string("value")
                        ]),
                        uploadStatus: FileUploadStatus.pending,
                        uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                        url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        visibility: FileVisibility.public,
                        waveformUrl: .null,
                        width: .null
                    )),
                    id: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                    kind: ChannelListItemKind.private,
                    lastMessage: Optional(Nullable<ChatMessage>.value(ChatMessage(
                        attachments: [
                            File(
                                blurhash: .null,
                                contentType: Nullable<String>.value("application/pdf"),
                                createdAt: "2026-01-01T12:00:00.000Z",
                                durationSeconds: .null,
                                filename: Nullable<String>.value("evidence.pdf"),
                                height: .null,
                                id: "file_xxxxxxxxxxxxxx",
                                multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                                multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                    )
                                ])),
                                object: "file",
                                removedByModeration: false,
                                size: Nullable<Int>.value(9670),
                                uploadHeaders: Optional([
                                    "key": JSONValue.string("value")
                                ]),
                                uploadStatus: FileUploadStatus.pending,
                                uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                                visibility: FileVisibility.public,
                                waveformUrl: .null,
                                width: .null
                            )
                        ],
                        author: Nullable<UserSummary>.value(UserSummary(
                            id: "user_xxxxxxxxxxxxxx",
                            name: Nullable<String>.value("Dana Whitfield"),
                            profilePicture: UserProfilePicture(
                                url: "https://ui-avatars.com/api/"
                            ),
                            username: "danawhitfield"
                        )),
                        authorIsTeamMember: false,
                        authorUserId: Nullable<String>.value("user_xxxxxxxxxxxxxx"),
                        channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                        content: Nullable<String>.value("Content 1"),
                        createdAt: "2026-01-01T12:00:00.000Z",
                        customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                            displayName: .null,
                            profilePicture: Nullable<File>.value(File(
                                blurhash: .null,
                                contentType: Nullable<String>.value("application/pdf"),
                                createdAt: "2026-01-01T12:00:00.000Z",
                                durationSeconds: .null,
                                filename: Nullable<String>.value("evidence.pdf"),
                                height: .null,
                                id: "file_xxxxxxxxxxxxxx",
                                multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                                multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                    FileMultipartUrl(
                                        partNumber: 1,
                                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                                    )
                                ])),
                                object: "file",
                                removedByModeration: false,
                                size: Nullable<Int>.value(9670),
                                uploadHeaders: Optional([
                                    "key": JSONValue.string("value")
                                ]),
                                uploadStatus: FileUploadStatus.pending,
                                uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                                visibility: FileVisibility.public,
                                waveformUrl: .null,
                                width: .null
                            ))
                        )),
                        deletedAt: .null,
                        edited: false,
                        embeds: [
                            Embed(
                                color: .null,
                                description: .null,
                                fields: [
                                    EmbedField(
                                        inline: true,
                                        name: "name",
                                        value: "value"
                                    )
                                ],
                                footer: .null,
                                image: .null,
                                thumbnail: .null,
                                timestampAt: .null,
                                title: .null,
                                url: .null
                            )
                        ],
                        gifs: [
                            Gif(
                                height: 1,
                                originalUrl: "original_url",
                                previewUrl: "preview_url",
                                slug: "slug",
                                title: "title",
                                url: "url",
                                width: 1
                            )
                        ],
                        id: "post_xxxxxxxxxxxxxxxxxxxxxx",
                        linkPreviews: [
                            MessageLinkPreview(
                                description: .null,
                                faviconUrl: .null,
                                footer: .null,
                                imageUrl: .null,
                                processing: true,
                                title: .null,
                                url: "url"
                            )
                        ],
                        mentionedUserIds: [
                            "mentioned_user_ids"
                        ],
                        messageType: ChatMessageMessageType.regular,
                        pinned: false,
                        plainContent: Nullable<String>.value("Content 1"),
                        poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                            options: [
                                ChatMessagePollOption(
                                    id: "1",
                                    text: "A",
                                    voteCount: 0,
                                    voted: false
                                )
                            ]
                        )),
                        reactionCounts: [
                            MessageReactionCount(
                                kind: MessageReactionCountKind.like,
                                reacted: true,
                                totalScore: 1,
                                userCount: 1,
                                value: Nullable<String>.value("❤️")
                            )
                        ],
                        replyingToMessageId: .null,
                        replyingToUserId: .null,
                        updatedAt: "2026-01-01T12:00:00.000Z",
                        viewCount: .null
                    ))),
                    lastMessageAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                    lastMessageId: Nullable<String>.value("post_xxxxxxxxxxxxxxxxxxxxxx"),
                    members: Optional([
                        ChannelMember(
                            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                            inboxStatus: .null,
                            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                            notificationPreference: .null,
                            pinnedPosition: .null,
                            unread: Nullable<Bool>.value(false),
                            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                            user: UserSummary(
                                id: "user_xxxxxxxxxxxxxx",
                                name: Nullable<String>.value("Dana Whitfield"),
                                profilePicture: UserProfilePicture(
                                    url: "https://ui-avatars.com/api/"
                                ),
                                username: "danawhitfield"
                            ),
                            userId: "user_xxxxxxxxxxxxxx"
                        )
                    ]),
                    membership: Nullable<ChannelMember>.value(ChannelMember(
                        channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                        createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        inboxStatus: .null,
                        lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        notificationPreference: .null,
                        pinnedPosition: .null,
                        unread: Nullable<Bool>.value(false),
                        updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        user: UserSummary(
                            id: "user_xxxxxxxxxxxxxx",
                            name: Nullable<String>.value("Dana Whitfield"),
                            profilePicture: UserProfilePicture(
                                url: "https://ui-avatars.com/api/"
                            ),
                            username: "danawhitfield"
                        ),
                        userId: "user_xxxxxxxxxxxxxx"
                    )),
                    moderation: Nullable<ChannelModeration>.value(ChannelModeration(
                        banMedia: true,
                        banUrls: true,
                        bannedWords: .null,
                        userPostsCooldownSeconds: .null,
                        whoCanPost: ChannelModerationWhoCanPost.everyone,
                        whoCanReact: ChannelModerationWhoCanReact.everyone
                    )),
                    name: Nullable<String>.value("name"),
                    notificationsEnabled: true,
                    support: Nullable<ChannelSupportState>.value(ChannelSupportState(
                        awaitingReply: false,
                        customerUserId: "user_xxxxxxxxxxxxxx",
                        lastMessageBy: .null,
                        resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                        status: ChannelSupportStateStatus.unresolved
                    )),
                    synchronizedAt: Optional("2026-01-01T12:00:00.000Z"),
                    updatedAt: "2026-01-01T12:00:00.000Z"
                )
            ],
            pageInfo: ListChannelsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd"),
                totalCount: Nullable<Int>.value(1),
                totalCountCapped: true
            )
        )
        let response = try await client.channels.list(
            kind: [
                .private
            ],
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "experience_id": "experience_id",
                  "icon": {
                    "blurhash": "blurhash",
                    "content_type": "application/pdf",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "duration_seconds": 1.1,
                    "filename": "evidence.pdf",
                    "height": 1,
                    "id": "file_xxxxxxxxxxxxxx",
                    "multipart_chunk_size": 5242880,
                    "multipart_upload_id": "upload-id",
                    "multipart_upload_urls": [
                      {
                        "part_number": 1,
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                      }
                    ],
                    "object": "file",
                    "removed_by_moderation": false,
                    "size": 9670,
                    "upload_headers": {
                      "key": "value"
                    },
                    "upload_status": "pending",
                    "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "visibility": "public",
                    "waveform_url": "waveform_url",
                    "width": 1
                  },
                  "id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "kind": "private",
                  "last_message_at": "2026-01-01T12:00:00.000Z",
                  "last_message_id": "post_xxxxxxxxxxxxxxxxxxxxxx",
                  "membership": {
                    "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "inbox_status": "requested",
                    "last_viewed_at": "2026-01-01T12:00:00.000Z",
                    "notification_preference": "all",
                    "pinned_position": 1,
                    "unread": false,
                    "updated_at": "2026-01-01T12:00:00.000Z",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "user_id": "user_xxxxxxxxxxxxxx"
                  },
                  "moderation": {
                    "ban_media": true,
                    "ban_urls": true,
                    "banned_words": [
                      "banned_words"
                    ],
                    "user_posts_cooldown_seconds": 1,
                    "who_can_post": "everyone",
                    "who_can_react": "everyone"
                  },
                  "name": "Renamed",
                  "notifications_enabled": true,
                  "support": {
                    "awaiting_reply": false,
                    "customer_user_id": "user_xxxxxxxxxxxxxx",
                    "last_message_by": "customer",
                    "resolved_at": "2026-01-01T12:00:00.000Z",
                    "status": "unresolved"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Channel(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            experienceId: Nullable<String>.value("experience_id"),
            icon: Nullable<File>.value(File(
                blurhash: Nullable<String>.value("blurhash"),
                contentType: Nullable<String>.value("application/pdf"),
                createdAt: "2026-01-01T12:00:00.000Z",
                durationSeconds: Nullable<Double>.value(1.1),
                filename: Nullable<String>.value("evidence.pdf"),
                height: Nullable<Int>.value(1),
                id: "file_xxxxxxxxxxxxxx",
                multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                    FileMultipartUrl(
                        partNumber: 1,
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    )
                ])),
                object: "file",
                removedByModeration: false,
                size: Nullable<Int>.value(9670),
                uploadHeaders: Optional([
                    "key": JSONValue.string("value")
                ]),
                uploadStatus: FileUploadStatus.pending,
                uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                visibility: FileVisibility.public,
                waveformUrl: Nullable<String>.value("waveform_url"),
                width: Nullable<Int>.value(1)
            )),
            id: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            kind: ChannelKind.private,
            lastMessageAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastMessageId: Nullable<String>.value("post_xxxxxxxxxxxxxxxxxxxxxx"),
            membership: Nullable<ChannelMember>.value(ChannelMember(
                channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                pinnedPosition: Nullable<Int>.value(1),
                unread: Nullable<Bool>.value(false),
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                user: UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                ),
                userId: "user_xxxxxxxxxxxxxx"
            )),
            moderation: Nullable<ChannelModeration>.value(ChannelModeration(
                banMedia: true,
                banUrls: true,
                bannedWords: Nullable<[String]>.value([
                    "banned_words"
                ]),
                userPostsCooldownSeconds: Nullable<Int>.value(1),
                whoCanPost: ChannelModerationWhoCanPost.everyone,
                whoCanReact: ChannelModerationWhoCanReact.everyone
            )),
            name: Nullable<String>.value("Renamed"),
            notificationsEnabled: true,
            support: Nullable<ChannelSupportState>.value(ChannelSupportState(
                awaitingReply: false,
                customerUserId: "user_xxxxxxxxxxxxxx",
                lastMessageBy: Nullable<ChannelSupportStateLastMessageBy>.value(ChannelSupportStateLastMessageBy.customer),
                resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                status: ChannelSupportStateStatus.unresolved
            )),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.channels.create(
            request: .init(kind: .private),
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "experience_id": "experience_id",
                  "icon": {
                    "blurhash": "blurhash",
                    "content_type": "application/pdf",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "duration_seconds": 1.1,
                    "filename": "evidence.pdf",
                    "height": 1,
                    "id": "file_xxxxxxxxxxxxxx",
                    "multipart_chunk_size": 5242880,
                    "multipart_upload_id": "upload-id",
                    "multipart_upload_urls": [
                      {
                        "part_number": 1,
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                      }
                    ],
                    "object": "file",
                    "removed_by_moderation": false,
                    "size": 9670,
                    "upload_headers": {
                      "key": "value"
                    },
                    "upload_status": "pending",
                    "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "visibility": "public",
                    "waveform_url": "waveform_url",
                    "width": 1
                  },
                  "id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "kind": "private",
                  "last_message_at": "2026-01-01T12:00:00.000Z",
                  "last_message_id": "post_xxxxxxxxxxxxxxxxxxxxxx",
                  "membership": {
                    "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "inbox_status": "requested",
                    "last_viewed_at": "2026-01-01T12:00:00.000Z",
                    "notification_preference": "all",
                    "pinned_position": 1,
                    "unread": false,
                    "updated_at": "2026-01-01T12:00:00.000Z",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "user_id": "user_xxxxxxxxxxxxxx"
                  },
                  "moderation": {
                    "ban_media": true,
                    "ban_urls": true,
                    "banned_words": [
                      "banned_words"
                    ],
                    "user_posts_cooldown_seconds": 1,
                    "who_can_post": "everyone",
                    "who_can_react": "everyone"
                  },
                  "name": "Renamed",
                  "notifications_enabled": true,
                  "support": {
                    "awaiting_reply": false,
                    "customer_user_id": "user_xxxxxxxxxxxxxx",
                    "last_message_by": "customer",
                    "resolved_at": "2026-01-01T12:00:00.000Z",
                    "status": "unresolved"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Channel(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            experienceId: Nullable<String>.value("experience_id"),
            icon: Nullable<File>.value(File(
                blurhash: Nullable<String>.value("blurhash"),
                contentType: Nullable<String>.value("application/pdf"),
                createdAt: "2026-01-01T12:00:00.000Z",
                durationSeconds: Nullable<Double>.value(1.1),
                filename: Nullable<String>.value("evidence.pdf"),
                height: Nullable<Int>.value(1),
                id: "file_xxxxxxxxxxxxxx",
                multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                    FileMultipartUrl(
                        partNumber: 1,
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    )
                ])),
                object: "file",
                removedByModeration: false,
                size: Nullable<Int>.value(9670),
                uploadHeaders: Optional([
                    "key": JSONValue.string("value")
                ]),
                uploadStatus: FileUploadStatus.pending,
                uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                visibility: FileVisibility.public,
                waveformUrl: Nullable<String>.value("waveform_url"),
                width: Nullable<Int>.value(1)
            )),
            id: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            kind: ChannelKind.private,
            lastMessageAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastMessageId: Nullable<String>.value("post_xxxxxxxxxxxxxxxxxxxxxx"),
            membership: Nullable<ChannelMember>.value(ChannelMember(
                channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                pinnedPosition: Nullable<Int>.value(1),
                unread: Nullable<Bool>.value(false),
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                user: UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                ),
                userId: "user_xxxxxxxxxxxxxx"
            )),
            moderation: Nullable<ChannelModeration>.value(ChannelModeration(
                banMedia: true,
                banUrls: true,
                bannedWords: Nullable<[String]>.value([
                    "banned_words"
                ]),
                userPostsCooldownSeconds: Nullable<Int>.value(1),
                whoCanPost: ChannelModerationWhoCanPost.everyone,
                whoCanReact: ChannelModerationWhoCanReact.everyone
            )),
            name: Nullable<String>.value("Renamed"),
            notificationsEnabled: true,
            support: Nullable<ChannelSupportState>.value(ChannelSupportState(
                awaitingReply: false,
                customerUserId: "user_xxxxxxxxxxxxxx",
                lastMessageBy: Nullable<ChannelSupportStateLastMessageBy>.value(ChannelSupportStateLastMessageBy.customer),
                resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                status: ChannelSupportStateStatus.unresolved
            )),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.channels.retrieve(
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
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "experience_id": "experience_id",
                  "icon": {
                    "blurhash": "blurhash",
                    "content_type": "application/pdf",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "duration_seconds": 1.1,
                    "filename": "evidence.pdf",
                    "height": 1,
                    "id": "file_xxxxxxxxxxxxxx",
                    "multipart_chunk_size": 5242880,
                    "multipart_upload_id": "upload-id",
                    "multipart_upload_urls": [
                      {
                        "part_number": 1,
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                      }
                    ],
                    "object": "file",
                    "removed_by_moderation": false,
                    "size": 9670,
                    "upload_headers": {
                      "key": "value"
                    },
                    "upload_status": "pending",
                    "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "visibility": "public",
                    "waveform_url": "waveform_url",
                    "width": 1
                  },
                  "id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "kind": "private",
                  "last_message_at": "2026-01-01T12:00:00.000Z",
                  "last_message_id": "post_xxxxxxxxxxxxxxxxxxxxxx",
                  "membership": {
                    "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "inbox_status": "requested",
                    "last_viewed_at": "2026-01-01T12:00:00.000Z",
                    "notification_preference": "all",
                    "pinned_position": 1,
                    "unread": false,
                    "updated_at": "2026-01-01T12:00:00.000Z",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "user_id": "user_xxxxxxxxxxxxxx"
                  },
                  "moderation": {
                    "ban_media": true,
                    "ban_urls": true,
                    "banned_words": [
                      "banned_words"
                    ],
                    "user_posts_cooldown_seconds": 1,
                    "who_can_post": "everyone",
                    "who_can_react": "everyone"
                  },
                  "name": "Renamed",
                  "notifications_enabled": true,
                  "support": {
                    "awaiting_reply": false,
                    "customer_user_id": "user_xxxxxxxxxxxxxx",
                    "last_message_by": "customer",
                    "resolved_at": "2026-01-01T12:00:00.000Z",
                    "status": "unresolved"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Channel(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            experienceId: Nullable<String>.value("experience_id"),
            icon: Nullable<File>.value(File(
                blurhash: Nullable<String>.value("blurhash"),
                contentType: Nullable<String>.value("application/pdf"),
                createdAt: "2026-01-01T12:00:00.000Z",
                durationSeconds: Nullable<Double>.value(1.1),
                filename: Nullable<String>.value("evidence.pdf"),
                height: Nullable<Int>.value(1),
                id: "file_xxxxxxxxxxxxxx",
                multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                    FileMultipartUrl(
                        partNumber: 1,
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    )
                ])),
                object: "file",
                removedByModeration: false,
                size: Nullable<Int>.value(9670),
                uploadHeaders: Optional([
                    "key": JSONValue.string("value")
                ]),
                uploadStatus: FileUploadStatus.pending,
                uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                visibility: FileVisibility.public,
                waveformUrl: Nullable<String>.value("waveform_url"),
                width: Nullable<Int>.value(1)
            )),
            id: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            kind: ChannelKind.private,
            lastMessageAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastMessageId: Nullable<String>.value("post_xxxxxxxxxxxxxxxxxxxxxx"),
            membership: Nullable<ChannelMember>.value(ChannelMember(
                channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                pinnedPosition: Nullable<Int>.value(1),
                unread: Nullable<Bool>.value(false),
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                user: UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                ),
                userId: "user_xxxxxxxxxxxxxx"
            )),
            moderation: Nullable<ChannelModeration>.value(ChannelModeration(
                banMedia: true,
                banUrls: true,
                bannedWords: Nullable<[String]>.value([
                    "banned_words"
                ]),
                userPostsCooldownSeconds: Nullable<Int>.value(1),
                whoCanPost: ChannelModerationWhoCanPost.everyone,
                whoCanReact: ChannelModerationWhoCanReact.everyone
            )),
            name: Nullable<String>.value("Renamed"),
            notificationsEnabled: true,
            support: Nullable<ChannelSupportState>.value(ChannelSupportState(
                awaitingReply: false,
                customerUserId: "user_xxxxxxxxxxxxxx",
                lastMessageBy: Nullable<ChannelSupportStateLastMessageBy>.value(ChannelSupportStateLastMessageBy.customer),
                resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                status: ChannelSupportStateStatus.unresolved
            )),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.channels.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func accept1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "inbox_status": "requested",
                  "last_viewed_at": "2026-01-01T12:00:00.000Z",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(false),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.channels.accept(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func hide1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "inbox_status": "requested",
                  "last_viewed_at": "2026-01-01T12:00:00.000Z",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(false),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.channels.hide(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func markRead1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "inbox_status": "requested",
                  "last_viewed_at": "2026-01-01T12:00:00.000Z",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(false),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.channels.markRead(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func markUnread1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "inbox_status": "requested",
                  "last_viewed_at": "2026-01-01T12:00:00.000Z",
                  "notification_preference": "all",
                  "pinned_position": 1,
                  "unread": false,
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "user": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "user_id": "user_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChannelMember(
            channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
            lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
            pinnedPosition: Nullable<Int>.value(1),
            unread: Nullable<Bool>.value(false),
            updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            user: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.channels.markUnread(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func reopen1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "experience_id": "experience_id",
                  "icon": {
                    "blurhash": "blurhash",
                    "content_type": "application/pdf",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "duration_seconds": 1.1,
                    "filename": "evidence.pdf",
                    "height": 1,
                    "id": "file_xxxxxxxxxxxxxx",
                    "multipart_chunk_size": 5242880,
                    "multipart_upload_id": "upload-id",
                    "multipart_upload_urls": [
                      {
                        "part_number": 1,
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                      }
                    ],
                    "object": "file",
                    "removed_by_moderation": false,
                    "size": 9670,
                    "upload_headers": {
                      "key": "value"
                    },
                    "upload_status": "pending",
                    "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "visibility": "public",
                    "waveform_url": "waveform_url",
                    "width": 1
                  },
                  "id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "kind": "private",
                  "last_message_at": "2026-01-01T12:00:00.000Z",
                  "last_message_id": "post_xxxxxxxxxxxxxxxxxxxxxx",
                  "membership": {
                    "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "inbox_status": "requested",
                    "last_viewed_at": "2026-01-01T12:00:00.000Z",
                    "notification_preference": "all",
                    "pinned_position": 1,
                    "unread": false,
                    "updated_at": "2026-01-01T12:00:00.000Z",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "user_id": "user_xxxxxxxxxxxxxx"
                  },
                  "moderation": {
                    "ban_media": true,
                    "ban_urls": true,
                    "banned_words": [
                      "banned_words"
                    ],
                    "user_posts_cooldown_seconds": 1,
                    "who_can_post": "everyone",
                    "who_can_react": "everyone"
                  },
                  "name": "Renamed",
                  "notifications_enabled": true,
                  "support": {
                    "awaiting_reply": false,
                    "customer_user_id": "user_xxxxxxxxxxxxxx",
                    "last_message_by": "customer",
                    "resolved_at": "2026-01-01T12:00:00.000Z",
                    "status": "unresolved"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Channel(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            experienceId: Nullable<String>.value("experience_id"),
            icon: Nullable<File>.value(File(
                blurhash: Nullable<String>.value("blurhash"),
                contentType: Nullable<String>.value("application/pdf"),
                createdAt: "2026-01-01T12:00:00.000Z",
                durationSeconds: Nullable<Double>.value(1.1),
                filename: Nullable<String>.value("evidence.pdf"),
                height: Nullable<Int>.value(1),
                id: "file_xxxxxxxxxxxxxx",
                multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                    FileMultipartUrl(
                        partNumber: 1,
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    )
                ])),
                object: "file",
                removedByModeration: false,
                size: Nullable<Int>.value(9670),
                uploadHeaders: Optional([
                    "key": JSONValue.string("value")
                ]),
                uploadStatus: FileUploadStatus.pending,
                uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                visibility: FileVisibility.public,
                waveformUrl: Nullable<String>.value("waveform_url"),
                width: Nullable<Int>.value(1)
            )),
            id: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            kind: ChannelKind.private,
            lastMessageAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastMessageId: Nullable<String>.value("post_xxxxxxxxxxxxxxxxxxxxxx"),
            membership: Nullable<ChannelMember>.value(ChannelMember(
                channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                pinnedPosition: Nullable<Int>.value(1),
                unread: Nullable<Bool>.value(false),
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                user: UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                ),
                userId: "user_xxxxxxxxxxxxxx"
            )),
            moderation: Nullable<ChannelModeration>.value(ChannelModeration(
                banMedia: true,
                banUrls: true,
                bannedWords: Nullable<[String]>.value([
                    "banned_words"
                ]),
                userPostsCooldownSeconds: Nullable<Int>.value(1),
                whoCanPost: ChannelModerationWhoCanPost.everyone,
                whoCanReact: ChannelModerationWhoCanReact.everyone
            )),
            name: Nullable<String>.value("Renamed"),
            notificationsEnabled: true,
            support: Nullable<ChannelSupportState>.value(ChannelSupportState(
                awaitingReply: false,
                customerUserId: "user_xxxxxxxxxxxxxx",
                lastMessageBy: Nullable<ChannelSupportStateLastMessageBy>.value(ChannelSupportStateLastMessageBy.customer),
                resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                status: ChannelSupportStateStatus.unresolved
            )),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.channels.reopen(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resolve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "deleted_at": "deleted_at",
                  "experience_id": "experience_id",
                  "icon": {
                    "blurhash": "blurhash",
                    "content_type": "application/pdf",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "duration_seconds": 1.1,
                    "filename": "evidence.pdf",
                    "height": 1,
                    "id": "file_xxxxxxxxxxxxxx",
                    "multipart_chunk_size": 5242880,
                    "multipart_upload_id": "upload-id",
                    "multipart_upload_urls": [
                      {
                        "part_number": 1,
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                      }
                    ],
                    "object": "file",
                    "removed_by_moderation": false,
                    "size": 9670,
                    "upload_headers": {
                      "key": "value"
                    },
                    "upload_status": "pending",
                    "upload_url": "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf",
                    "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "visibility": "public",
                    "waveform_url": "waveform_url",
                    "width": 1
                  },
                  "id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                  "kind": "private",
                  "last_message_at": "2026-01-01T12:00:00.000Z",
                  "last_message_id": "post_xxxxxxxxxxxxxxxxxxxxxx",
                  "membership": {
                    "channel_id": "feed_xxxxxxxxxxxxxxxxxxxxxx",
                    "created_at": "2026-01-01T12:00:00.000Z",
                    "id": "memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "inbox_status": "requested",
                    "last_viewed_at": "2026-01-01T12:00:00.000Z",
                    "notification_preference": "all",
                    "pinned_position": 1,
                    "unread": false,
                    "updated_at": "2026-01-01T12:00:00.000Z",
                    "user": {
                      "id": "user_xxxxxxxxxxxxxx",
                      "name": "Dana Whitfield",
                      "profile_picture": {
                        "url": "https://ui-avatars.com/api/"
                      },
                      "username": "danawhitfield"
                    },
                    "user_id": "user_xxxxxxxxxxxxxx"
                  },
                  "moderation": {
                    "ban_media": true,
                    "ban_urls": true,
                    "banned_words": [
                      "banned_words"
                    ],
                    "user_posts_cooldown_seconds": 1,
                    "who_can_post": "everyone",
                    "who_can_react": "everyone"
                  },
                  "name": "Renamed",
                  "notifications_enabled": true,
                  "support": {
                    "awaiting_reply": false,
                    "customer_user_id": "user_xxxxxxxxxxxxxx",
                    "last_message_by": "customer",
                    "resolved_at": "2026-01-01T12:00:00.000Z",
                    "status": "unresolved"
                  },
                  "updated_at": "2026-01-01T12:00:00.000Z"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Channel(
            accountId: Nullable<String>.value("biz_xxxxxxxxxxxxxx"),
            createdAt: "2026-01-01T12:00:00.000Z",
            deletedAt: Nullable<String>.value("deleted_at"),
            experienceId: Nullable<String>.value("experience_id"),
            icon: Nullable<File>.value(File(
                blurhash: Nullable<String>.value("blurhash"),
                contentType: Nullable<String>.value("application/pdf"),
                createdAt: "2026-01-01T12:00:00.000Z",
                durationSeconds: Nullable<Double>.value(1.1),
                filename: Nullable<String>.value("evidence.pdf"),
                height: Nullable<Int>.value(1),
                id: "file_xxxxxxxxxxxxxx",
                multipartChunkSize: Optional(Nullable<Int>.value(5242880)),
                multipartUploadId: Optional(Nullable<String>.value("upload-id")),
                multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                    FileMultipartUrl(
                        partNumber: 1,
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf"
                    )
                ])),
                object: "file",
                removedByModeration: false,
                size: Nullable<Int>.value(9670),
                uploadHeaders: Optional([
                    "key": JSONValue.string("value")
                ]),
                uploadStatus: FileUploadStatus.pending,
                uploadUrl: Optional(Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/application.pdf")),
                url: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                visibility: FileVisibility.public,
                waveformUrl: Nullable<String>.value("waveform_url"),
                width: Nullable<Int>.value(1)
            )),
            id: "feed_xxxxxxxxxxxxxxxxxxxxxx",
            kind: ChannelKind.private,
            lastMessageAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
            lastMessageId: Nullable<String>.value("post_xxxxxxxxxxxxxxxxxxxxxx"),
            membership: Nullable<ChannelMember>.value(ChannelMember(
                channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                createdAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                id: Nullable<String>.value("memb_1_xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                inboxStatus: Nullable<ChannelMemberInboxStatus>.value(ChannelMemberInboxStatus.requested),
                lastViewedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                notificationPreference: Nullable<ChannelMemberNotificationPreference>.value(ChannelMemberNotificationPreference.all),
                pinnedPosition: Nullable<Int>.value(1),
                unread: Nullable<Bool>.value(false),
                updatedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                user: UserSummary(
                    id: "user_xxxxxxxxxxxxxx",
                    name: Nullable<String>.value("Dana Whitfield"),
                    profilePicture: UserProfilePicture(
                        url: "https://ui-avatars.com/api/"
                    ),
                    username: "danawhitfield"
                ),
                userId: "user_xxxxxxxxxxxxxx"
            )),
            moderation: Nullable<ChannelModeration>.value(ChannelModeration(
                banMedia: true,
                banUrls: true,
                bannedWords: Nullable<[String]>.value([
                    "banned_words"
                ]),
                userPostsCooldownSeconds: Nullable<Int>.value(1),
                whoCanPost: ChannelModerationWhoCanPost.everyone,
                whoCanReact: ChannelModerationWhoCanReact.everyone
            )),
            name: Nullable<String>.value("Renamed"),
            notificationsEnabled: true,
            support: Nullable<ChannelSupportState>.value(ChannelSupportState(
                awaitingReply: false,
                customerUserId: "user_xxxxxxxxxxxxxx",
                lastMessageBy: Nullable<ChannelSupportStateLastMessageBy>.value(ChannelSupportStateLastMessageBy.customer),
                resolvedAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                status: ChannelSupportStateStatus.unresolved
            )),
            updatedAt: "2026-01-01T12:00:00.000Z"
        )
        let response = try await client.channels.resolve(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}