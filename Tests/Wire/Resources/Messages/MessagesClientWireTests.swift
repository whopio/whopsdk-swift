import Foundation
import Testing
import WhopSDK

@Suite("MessagesClient Wire Tests") struct MessagesClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
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
                      "deleted_at": "deleted_at",
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
                      "replying_to_message_id": "replying_to_message_id",
                      "replying_to_user_id": "replying_to_user_id",
                      "updated_at": "2026-01-01T12:00:00.000Z",
                      "view_count": 1
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
        let expectedResponse = ListMessagesResponse(
            data: [
                ChatMessage(
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
                    deletedAt: Nullable<String>.value("deleted_at"),
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
                    replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
                    replyingToUserId: Nullable<String>.value("replying_to_user_id"),
                    updatedAt: "2026-01-01T12:00:00.000Z",
                    viewCount: Nullable<Int>.value(1)
                )
            ],
            pageInfo: ListMessagesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.messages.list(
            channelId: "channel_id",
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
                      "attachments": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [
                            {
                              "part_number": 1,
                              "url": "url"
                            },
                            {
                              "part_number": 1,
                              "url": "url"
                            }
                          ],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [
                            {
                              "part_number": 1,
                              "url": "url"
                            },
                            {
                              "part_number": 1,
                              "url": "url"
                            }
                          ],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "author": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "author_is_team_member": true,
                      "author_user_id": "author_user_id",
                      "channel_id": "channel_id",
                      "content": "content",
                      "created_at": "created_at",
                      "custom_author": {
                        "display_name": "display_name",
                        "profile_picture": {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      },
                      "deleted_at": "deleted_at",
                      "edited": true,
                      "embeds": [
                        {
                          "color": 1,
                          "description": "description",
                          "fields": [
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            },
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            }
                          ],
                          "footer": {
                            "icon": {
                              "blurhash": "blurhash",
                              "height": 1,
                              "url": "url",
                              "width": 1
                            },
                            "text": "text"
                          },
                          "image": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "thumbnail": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "timestamp_at": "timestamp_at",
                          "title": "title",
                          "url": "url"
                        },
                        {
                          "color": 1,
                          "description": "description",
                          "fields": [
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            },
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            }
                          ],
                          "footer": {
                            "icon": {
                              "blurhash": "blurhash",
                              "height": 1,
                              "url": "url",
                              "width": 1
                            },
                            "text": "text"
                          },
                          "image": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "thumbnail": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "timestamp_at": "timestamp_at",
                          "title": "title",
                          "url": "url"
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
                        },
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
                      "id": "id",
                      "link_previews": [
                        {
                          "description": "description",
                          "favicon_url": "favicon_url",
                          "footer": {
                            "description": "description",
                            "icon_url": "icon_url",
                            "title": "title"
                          },
                          "image_url": "image_url",
                          "processing": true,
                          "title": "title",
                          "url": "url"
                        },
                        {
                          "description": "description",
                          "favicon_url": "favicon_url",
                          "footer": {
                            "description": "description",
                            "icon_url": "icon_url",
                            "title": "title"
                          },
                          "image_url": "image_url",
                          "processing": true,
                          "title": "title",
                          "url": "url"
                        }
                      ],
                      "mentioned_user_ids": [
                        "mentioned_user_ids",
                        "mentioned_user_ids"
                      ],
                      "message_type": "regular",
                      "pinned": true,
                      "plain_content": "plain_content",
                      "poll": {
                        "options": [
                          {
                            "id": "id",
                            "text": "text",
                            "vote_count": 1,
                            "voted": true
                          },
                          {
                            "id": "id",
                            "text": "text",
                            "vote_count": 1,
                            "voted": true
                          }
                        ]
                      },
                      "reaction_counts": [
                        {
                          "kind": "like",
                          "reacted": true,
                          "total_score": 1,
                          "user_count": 1,
                          "value": "value"
                        },
                        {
                          "kind": "like",
                          "reacted": true,
                          "total_score": 1,
                          "user_count": 1,
                          "value": "value"
                        }
                      ],
                      "replying_to_message_id": "replying_to_message_id",
                      "replying_to_user_id": "replying_to_user_id",
                      "updated_at": "updated_at",
                      "view_count": 1
                    },
                    {
                      "attachments": [
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [
                            {
                              "part_number": 1,
                              "url": "url"
                            },
                            {
                              "part_number": 1,
                              "url": "url"
                            }
                          ],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        },
                        {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [
                            {
                              "part_number": 1,
                              "url": "url"
                            },
                            {
                              "part_number": 1,
                              "url": "url"
                            }
                          ],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      ],
                      "author": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "author_is_team_member": true,
                      "author_user_id": "author_user_id",
                      "channel_id": "channel_id",
                      "content": "content",
                      "created_at": "created_at",
                      "custom_author": {
                        "display_name": "display_name",
                        "profile_picture": {
                          "blurhash": "blurhash",
                          "content_type": "content_type",
                          "created_at": "created_at",
                          "duration_seconds": 1.1,
                          "filename": "filename",
                          "height": 1,
                          "id": "id",
                          "multipart_chunk_size": 1,
                          "multipart_upload_id": "multipart_upload_id",
                          "multipart_upload_urls": [],
                          "object": "object",
                          "removed_by_moderation": true,
                          "size": 1,
                          "upload_headers": {
                            "upload_headers": {
                              "key": "value"
                            }
                          },
                          "upload_status": "pending",
                          "upload_url": "upload_url",
                          "url": "url",
                          "visibility": "public",
                          "waveform_url": "waveform_url",
                          "width": 1
                        }
                      },
                      "deleted_at": "deleted_at",
                      "edited": true,
                      "embeds": [
                        {
                          "color": 1,
                          "description": "description",
                          "fields": [
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            },
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            }
                          ],
                          "footer": {
                            "icon": {
                              "blurhash": "blurhash",
                              "height": 1,
                              "url": "url",
                              "width": 1
                            },
                            "text": "text"
                          },
                          "image": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "thumbnail": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "timestamp_at": "timestamp_at",
                          "title": "title",
                          "url": "url"
                        },
                        {
                          "color": 1,
                          "description": "description",
                          "fields": [
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            },
                            {
                              "inline": true,
                              "name": "name",
                              "value": "value"
                            }
                          ],
                          "footer": {
                            "icon": {
                              "blurhash": "blurhash",
                              "height": 1,
                              "url": "url",
                              "width": 1
                            },
                            "text": "text"
                          },
                          "image": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "thumbnail": {
                            "blurhash": "blurhash",
                            "height": 1,
                            "url": "url",
                            "width": 1
                          },
                          "timestamp_at": "timestamp_at",
                          "title": "title",
                          "url": "url"
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
                        },
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
                      "id": "id",
                      "link_previews": [
                        {
                          "description": "description",
                          "favicon_url": "favicon_url",
                          "footer": {
                            "description": "description",
                            "icon_url": "icon_url",
                            "title": "title"
                          },
                          "image_url": "image_url",
                          "processing": true,
                          "title": "title",
                          "url": "url"
                        },
                        {
                          "description": "description",
                          "favicon_url": "favicon_url",
                          "footer": {
                            "description": "description",
                            "icon_url": "icon_url",
                            "title": "title"
                          },
                          "image_url": "image_url",
                          "processing": true,
                          "title": "title",
                          "url": "url"
                        }
                      ],
                      "mentioned_user_ids": [
                        "mentioned_user_ids",
                        "mentioned_user_ids"
                      ],
                      "message_type": "regular",
                      "pinned": true,
                      "plain_content": "plain_content",
                      "poll": {
                        "options": [
                          {
                            "id": "id",
                            "text": "text",
                            "vote_count": 1,
                            "voted": true
                          },
                          {
                            "id": "id",
                            "text": "text",
                            "vote_count": 1,
                            "voted": true
                          }
                        ]
                      },
                      "reaction_counts": [
                        {
                          "kind": "like",
                          "reacted": true,
                          "total_score": 1,
                          "user_count": 1,
                          "value": "value"
                        },
                        {
                          "kind": "like",
                          "reacted": true,
                          "total_score": 1,
                          "user_count": 1,
                          "value": "value"
                        }
                      ],
                      "replying_to_message_id": "replying_to_message_id",
                      "replying_to_user_id": "replying_to_user_id",
                      "updated_at": "updated_at",
                      "view_count": 1
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
        let expectedResponse = ListMessagesResponse(
            data: [
                ChatMessage(
                    attachments: [
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                ),
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                )
                            ])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                ),
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                )
                            ])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ],
                    author: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    authorIsTeamMember: true,
                    authorUserId: Nullable<String>.value("author_user_id"),
                    channelId: "channel_id",
                    content: Nullable<String>.value("content"),
                    createdAt: "created_at",
                    customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                        displayName: Nullable<String>.value("display_name"),
                        profilePicture: Nullable<File>.value(File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ))
                    )),
                    deletedAt: Nullable<String>.value("deleted_at"),
                    edited: true,
                    embeds: [
                        Embed(
                            color: Nullable<Int>.value(1),
                            description: Nullable<String>.value("description"),
                            fields: [
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                ),
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                )
                            ],
                            footer: Nullable<EmbedFooter>.value(EmbedFooter(
                                icon: Nullable<EmbedImage>.value(EmbedImage(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    height: Nullable<Int>.value(1),
                                    url: "url",
                                    width: Nullable<Int>.value(1)
                                )),
                                text: "text"
                            )),
                            image: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            timestampAt: Nullable<String>.value("timestamp_at"),
                            title: Nullable<String>.value("title"),
                            url: Nullable<String>.value("url")
                        ),
                        Embed(
                            color: Nullable<Int>.value(1),
                            description: Nullable<String>.value("description"),
                            fields: [
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                ),
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                )
                            ],
                            footer: Nullable<EmbedFooter>.value(EmbedFooter(
                                icon: Nullable<EmbedImage>.value(EmbedImage(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    height: Nullable<Int>.value(1),
                                    url: "url",
                                    width: Nullable<Int>.value(1)
                                )),
                                text: "text"
                            )),
                            image: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            timestampAt: Nullable<String>.value("timestamp_at"),
                            title: Nullable<String>.value("title"),
                            url: Nullable<String>.value("url")
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
                        ),
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
                    id: "id",
                    linkPreviews: [
                        MessageLinkPreview(
                            description: Nullable<String>.value("description"),
                            faviconUrl: Nullable<String>.value("favicon_url"),
                            footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                                description: Nullable<String>.value("description"),
                                iconUrl: "icon_url",
                                title: "title"
                            )),
                            imageUrl: Nullable<String>.value("image_url"),
                            processing: true,
                            title: Nullable<String>.value("title"),
                            url: "url"
                        ),
                        MessageLinkPreview(
                            description: Nullable<String>.value("description"),
                            faviconUrl: Nullable<String>.value("favicon_url"),
                            footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                                description: Nullable<String>.value("description"),
                                iconUrl: "icon_url",
                                title: "title"
                            )),
                            imageUrl: Nullable<String>.value("image_url"),
                            processing: true,
                            title: Nullable<String>.value("title"),
                            url: "url"
                        )
                    ],
                    mentionedUserIds: [
                        "mentioned_user_ids",
                        "mentioned_user_ids"
                    ],
                    messageType: ChatMessageMessageType.regular,
                    pinned: true,
                    plainContent: Nullable<String>.value("plain_content"),
                    poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                        options: [
                            ChatMessagePollOption(
                                id: "id",
                                text: "text",
                                voteCount: 1,
                                voted: true
                            ),
                            ChatMessagePollOption(
                                id: "id",
                                text: "text",
                                voteCount: 1,
                                voted: true
                            )
                        ]
                    )),
                    reactionCounts: [
                        MessageReactionCount(
                            kind: MessageReactionCountKind.like,
                            reacted: true,
                            totalScore: 1,
                            userCount: 1,
                            value: Nullable<String>.value("value")
                        ),
                        MessageReactionCount(
                            kind: MessageReactionCountKind.like,
                            reacted: true,
                            totalScore: 1,
                            userCount: 1,
                            value: Nullable<String>.value("value")
                        )
                    ],
                    replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
                    replyingToUserId: Nullable<String>.value("replying_to_user_id"),
                    updatedAt: "updated_at",
                    viewCount: Nullable<Int>.value(1)
                ),
                ChatMessage(
                    attachments: [
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                ),
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                )
                            ])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ),
                        File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                ),
                                FileMultipartUrl(
                                    partNumber: 1,
                                    url: "url"
                                )
                            ])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        )
                    ],
                    author: Nullable<UserSummary>.value(UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    )),
                    authorIsTeamMember: true,
                    authorUserId: Nullable<String>.value("author_user_id"),
                    channelId: "channel_id",
                    content: Nullable<String>.value("content"),
                    createdAt: "created_at",
                    customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                        displayName: Nullable<String>.value("display_name"),
                        profilePicture: Nullable<File>.value(File(
                            blurhash: Nullable<String>.value("blurhash"),
                            contentType: Nullable<String>.value("content_type"),
                            createdAt: "created_at",
                            durationSeconds: Nullable<Double>.value(1.1),
                            filename: Nullable<String>.value("filename"),
                            height: Nullable<Int>.value(1),
                            id: "id",
                            multipartChunkSize: Optional(Nullable<Int>.value(1)),
                            multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                            multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([])),
                            object: "object",
                            removedByModeration: true,
                            size: Nullable<Int>.value(1),
                            uploadHeaders: Optional([
                                "upload_headers": JSONValue.object(
                                    [
                                        "key": JSONValue.string("value")
                                    ]
                                )
                            ]),
                            uploadStatus: FileUploadStatus.pending,
                            uploadUrl: Optional(Nullable<String>.value("upload_url")),
                            url: Nullable<String>.value("url"),
                            visibility: FileVisibility.public,
                            waveformUrl: Nullable<String>.value("waveform_url"),
                            width: Nullable<Int>.value(1)
                        ))
                    )),
                    deletedAt: Nullable<String>.value("deleted_at"),
                    edited: true,
                    embeds: [
                        Embed(
                            color: Nullable<Int>.value(1),
                            description: Nullable<String>.value("description"),
                            fields: [
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                ),
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                )
                            ],
                            footer: Nullable<EmbedFooter>.value(EmbedFooter(
                                icon: Nullable<EmbedImage>.value(EmbedImage(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    height: Nullable<Int>.value(1),
                                    url: "url",
                                    width: Nullable<Int>.value(1)
                                )),
                                text: "text"
                            )),
                            image: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            timestampAt: Nullable<String>.value("timestamp_at"),
                            title: Nullable<String>.value("title"),
                            url: Nullable<String>.value("url")
                        ),
                        Embed(
                            color: Nullable<Int>.value(1),
                            description: Nullable<String>.value("description"),
                            fields: [
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                ),
                                EmbedField(
                                    inline: true,
                                    name: "name",
                                    value: "value"
                                )
                            ],
                            footer: Nullable<EmbedFooter>.value(EmbedFooter(
                                icon: Nullable<EmbedImage>.value(EmbedImage(
                                    blurhash: Nullable<String>.value("blurhash"),
                                    height: Nullable<Int>.value(1),
                                    url: "url",
                                    width: Nullable<Int>.value(1)
                                )),
                                text: "text"
                            )),
                            image: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                                blurhash: Nullable<String>.value("blurhash"),
                                height: Nullable<Int>.value(1),
                                url: "url",
                                width: Nullable<Int>.value(1)
                            )),
                            timestampAt: Nullable<String>.value("timestamp_at"),
                            title: Nullable<String>.value("title"),
                            url: Nullable<String>.value("url")
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
                        ),
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
                    id: "id",
                    linkPreviews: [
                        MessageLinkPreview(
                            description: Nullable<String>.value("description"),
                            faviconUrl: Nullable<String>.value("favicon_url"),
                            footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                                description: Nullable<String>.value("description"),
                                iconUrl: "icon_url",
                                title: "title"
                            )),
                            imageUrl: Nullable<String>.value("image_url"),
                            processing: true,
                            title: Nullable<String>.value("title"),
                            url: "url"
                        ),
                        MessageLinkPreview(
                            description: Nullable<String>.value("description"),
                            faviconUrl: Nullable<String>.value("favicon_url"),
                            footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                                description: Nullable<String>.value("description"),
                                iconUrl: "icon_url",
                                title: "title"
                            )),
                            imageUrl: Nullable<String>.value("image_url"),
                            processing: true,
                            title: Nullable<String>.value("title"),
                            url: "url"
                        )
                    ],
                    mentionedUserIds: [
                        "mentioned_user_ids",
                        "mentioned_user_ids"
                    ],
                    messageType: ChatMessageMessageType.regular,
                    pinned: true,
                    plainContent: Nullable<String>.value("plain_content"),
                    poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                        options: [
                            ChatMessagePollOption(
                                id: "id",
                                text: "text",
                                voteCount: 1,
                                voted: true
                            ),
                            ChatMessagePollOption(
                                id: "id",
                                text: "text",
                                voteCount: 1,
                                voted: true
                            )
                        ]
                    )),
                    reactionCounts: [
                        MessageReactionCount(
                            kind: MessageReactionCountKind.like,
                            reacted: true,
                            totalScore: 1,
                            userCount: 1,
                            value: Nullable<String>.value("value")
                        ),
                        MessageReactionCount(
                            kind: MessageReactionCountKind.like,
                            reacted: true,
                            totalScore: 1,
                            userCount: 1,
                            value: Nullable<String>.value("value")
                        )
                    ],
                    replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
                    replyingToUserId: Nullable<String>.value("replying_to_user_id"),
                    updatedAt: "updated_at",
                    viewCount: Nullable<Int>.value(1)
                )
            ],
            pageInfo: ListMessagesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.messages.list(
            channelId: "channel_id",
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
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.create(
            request: .init(
                channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
                content: "New **message**"
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
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.create(
            request: .init(
                channelId: "channel_id",
                content: "content"
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
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.retrieve(
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
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.retrieve(
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
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.update(
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
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pin1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.pin(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pin2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.pin(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func react1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.react(
            id: "id",
            request: .init(emoji: "❤️"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func react2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.react(
            id: "id",
            request: .init(emoji: "emoji"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listReactions1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "emoji": "👍",
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
        let expectedResponse = ListReactionsMessagesResponse(
            data: [
                ChatReaction(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    emoji: "👍",
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
            ],
            pageInfo: ListReactionsMessagesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.messages.listReactions(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listReactions2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "created_at",
                      "emoji": "emoji",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_id": "user_id"
                    },
                    {
                      "created_at": "created_at",
                      "emoji": "emoji",
                      "user": {
                        "id": "id",
                        "name": "name",
                        "profile_picture": {
                          "url": "url"
                        },
                        "username": "username"
                      },
                      "user_id": "user_id"
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
        let expectedResponse = ListReactionsMessagesResponse(
            data: [
                ChatReaction(
                    createdAt: "created_at",
                    emoji: "emoji",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    userId: "user_id"
                ),
                ChatReaction(
                    createdAt: "created_at",
                    emoji: "emoji",
                    user: UserSummary(
                        id: "id",
                        name: Nullable<String>.value("name"),
                        profilePicture: UserProfilePicture(
                            url: "url"
                        ),
                        username: "username"
                    ),
                    userId: "user_id"
                )
            ],
            pageInfo: ListReactionsMessagesResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: true,
                hasPreviousPage: true,
                startCursor: Nullable<String>.value("start_cursor")
            )
        )
        let response = try await client.messages.listReactions(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unpin1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.unpin(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unpin2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.unpin(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unreact1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.unreact(
            id: "id",
            request: .init(emoji: "❤️"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func unreact2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.unreact(
            id: "id",
            request: .init(emoji: "emoji"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func vote1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
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
                    "display_name": "display_name",
                    "profile_picture": {
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
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": false,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": null,
                        "text": "text"
                      },
                      "image": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "thumbnail": {
                        "blurhash": null,
                        "height": null,
                        "url": "url",
                        "width": null
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": null,
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
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
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "2026-01-01T12:00:00.000Z",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
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
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
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
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: false,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: .null,
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: .null,
                        height: .null,
                        url: "url",
                        width: .null
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: .null,
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
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
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "2026-01-01T12:00:00.000Z",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.vote(
            id: "id",
            request: .init(pollOptionId: "2"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func vote2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "attachments": [
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    },
                    {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  ],
                  "author": {
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "url"
                    },
                    "username": "username"
                  },
                  "author_is_team_member": true,
                  "author_user_id": "author_user_id",
                  "channel_id": "channel_id",
                  "content": "content",
                  "created_at": "created_at",
                  "custom_author": {
                    "display_name": "display_name",
                    "profile_picture": {
                      "blurhash": "blurhash",
                      "content_type": "content_type",
                      "created_at": "created_at",
                      "duration_seconds": 1.1,
                      "filename": "filename",
                      "height": 1,
                      "id": "id",
                      "multipart_chunk_size": 1,
                      "multipart_upload_id": "multipart_upload_id",
                      "multipart_upload_urls": [
                        {
                          "part_number": 1,
                          "url": "url"
                        },
                        {
                          "part_number": 1,
                          "url": "url"
                        }
                      ],
                      "object": "object",
                      "removed_by_moderation": true,
                      "size": 1,
                      "upload_headers": {
                        "upload_headers": {
                          "key": "value"
                        }
                      },
                      "upload_status": "pending",
                      "upload_url": "upload_url",
                      "url": "url",
                      "visibility": "public",
                      "waveform_url": "waveform_url",
                      "width": 1
                    }
                  },
                  "deleted_at": "deleted_at",
                  "edited": true,
                  "embeds": [
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "color": 1,
                      "description": "description",
                      "fields": [
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        },
                        {
                          "inline": true,
                          "name": "name",
                          "value": "value"
                        }
                      ],
                      "footer": {
                        "icon": {
                          "blurhash": "blurhash",
                          "height": 1,
                          "url": "url",
                          "width": 1
                        },
                        "text": "text"
                      },
                      "image": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "thumbnail": {
                        "blurhash": "blurhash",
                        "height": 1,
                        "url": "url",
                        "width": 1
                      },
                      "timestamp_at": "timestamp_at",
                      "title": "title",
                      "url": "url"
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
                    },
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
                  "id": "id",
                  "link_previews": [
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    },
                    {
                      "description": "description",
                      "favicon_url": "favicon_url",
                      "footer": {
                        "description": "description",
                        "icon_url": "icon_url",
                        "title": "title"
                      },
                      "image_url": "image_url",
                      "processing": true,
                      "title": "title",
                      "url": "url"
                    }
                  ],
                  "mentioned_user_ids": [
                    "mentioned_user_ids",
                    "mentioned_user_ids"
                  ],
                  "message_type": "regular",
                  "pinned": true,
                  "plain_content": "plain_content",
                  "poll": {
                    "options": [
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      },
                      {
                        "id": "id",
                        "text": "text",
                        "vote_count": 1,
                        "voted": true
                      }
                    ]
                  },
                  "reaction_counts": [
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    },
                    {
                      "kind": "like",
                      "reacted": true,
                      "total_score": 1,
                      "user_count": 1,
                      "value": "value"
                    }
                  ],
                  "replying_to_message_id": "replying_to_message_id",
                  "replying_to_user_id": "replying_to_user_id",
                  "updated_at": "updated_at",
                  "view_count": 1
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatMessage(
            attachments: [
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ),
                File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                )
            ],
            author: Nullable<UserSummary>.value(UserSummary(
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "url"
                ),
                username: "username"
            )),
            authorIsTeamMember: true,
            authorUserId: Nullable<String>.value("author_user_id"),
            channelId: "channel_id",
            content: Nullable<String>.value("content"),
            createdAt: "created_at",
            customAuthor: Nullable<MessageCustomAuthor>.value(MessageCustomAuthor(
                displayName: Nullable<String>.value("display_name"),
                profilePicture: Nullable<File>.value(File(
                    blurhash: Nullable<String>.value("blurhash"),
                    contentType: Nullable<String>.value("content_type"),
                    createdAt: "created_at",
                    durationSeconds: Nullable<Double>.value(1.1),
                    filename: Nullable<String>.value("filename"),
                    height: Nullable<Int>.value(1),
                    id: "id",
                    multipartChunkSize: Optional(Nullable<Int>.value(1)),
                    multipartUploadId: Optional(Nullable<String>.value("multipart_upload_id")),
                    multipartUploadUrls: Optional(Nullable<[FileMultipartUrl]>.value([
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        ),
                        FileMultipartUrl(
                            partNumber: 1,
                            url: "url"
                        )
                    ])),
                    object: "object",
                    removedByModeration: true,
                    size: Nullable<Int>.value(1),
                    uploadHeaders: Optional([
                        "upload_headers": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]),
                    uploadStatus: FileUploadStatus.pending,
                    uploadUrl: Optional(Nullable<String>.value("upload_url")),
                    url: Nullable<String>.value("url"),
                    visibility: FileVisibility.public,
                    waveformUrl: Nullable<String>.value("waveform_url"),
                    width: Nullable<Int>.value(1)
                ))
            )),
            deletedAt: Nullable<String>.value("deleted_at"),
            edited: true,
            embeds: [
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
                ),
                Embed(
                    color: Nullable<Int>.value(1),
                    description: Nullable<String>.value("description"),
                    fields: [
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        ),
                        EmbedField(
                            inline: true,
                            name: "name",
                            value: "value"
                        )
                    ],
                    footer: Nullable<EmbedFooter>.value(EmbedFooter(
                        icon: Nullable<EmbedImage>.value(EmbedImage(
                            blurhash: Nullable<String>.value("blurhash"),
                            height: Nullable<Int>.value(1),
                            url: "url",
                            width: Nullable<Int>.value(1)
                        )),
                        text: "text"
                    )),
                    image: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    thumbnail: Nullable<EmbedImage>.value(EmbedImage(
                        blurhash: Nullable<String>.value("blurhash"),
                        height: Nullable<Int>.value(1),
                        url: "url",
                        width: Nullable<Int>.value(1)
                    )),
                    timestampAt: Nullable<String>.value("timestamp_at"),
                    title: Nullable<String>.value("title"),
                    url: Nullable<String>.value("url")
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
                ),
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
            id: "id",
            linkPreviews: [
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                ),
                MessageLinkPreview(
                    description: Nullable<String>.value("description"),
                    faviconUrl: Nullable<String>.value("favicon_url"),
                    footer: Nullable<MessageLinkFooter>.value(MessageLinkFooter(
                        description: Nullable<String>.value("description"),
                        iconUrl: "icon_url",
                        title: "title"
                    )),
                    imageUrl: Nullable<String>.value("image_url"),
                    processing: true,
                    title: Nullable<String>.value("title"),
                    url: "url"
                )
            ],
            mentionedUserIds: [
                "mentioned_user_ids",
                "mentioned_user_ids"
            ],
            messageType: ChatMessageMessageType.regular,
            pinned: true,
            plainContent: Nullable<String>.value("plain_content"),
            poll: Nullable<ChatMessagePoll>.value(ChatMessagePoll(
                options: [
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    ),
                    ChatMessagePollOption(
                        id: "id",
                        text: "text",
                        voteCount: 1,
                        voted: true
                    )
                ]
            )),
            reactionCounts: [
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                ),
                MessageReactionCount(
                    kind: MessageReactionCountKind.like,
                    reacted: true,
                    totalScore: 1,
                    userCount: 1,
                    value: Nullable<String>.value("value")
                )
            ],
            replyingToMessageId: Nullable<String>.value("replying_to_message_id"),
            replyingToUserId: Nullable<String>.value("replying_to_user_id"),
            updatedAt: "updated_at",
            viewCount: Nullable<Int>.value(1)
        )
        let response = try await client.messages.vote(
            id: "id",
            request: .init(pollOptionId: "poll_option_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}