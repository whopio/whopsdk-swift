import Foundation
import Testing
import WhopSDK

@Suite("AccountsClient Wire Tests") struct AccountsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "ads_spend_usd": 0,
                      "balances": [
                        {
                          "balance": "1500.0",
                          "breakdown": {
                            "available": "1500.0",
                            "finishing_settlement": "0",
                            "in_transit": "0",
                            "pending": "0",
                            "pending_settlements": [
                              {
                                "amount": "0.0",
                                "date": "2026-01-01"
                              }
                            ],
                            "reserve": "0"
                          },
                          "icon_url": "https://assets.whop.com/tokens/usdt.png",
                          "name": "Tether USD",
                          "price_usd": 1,
                          "symbol": "USDT",
                          "value_usd": "1500.00"
                        }
                      ],
                      "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "business_address": {
                        "city": "Austin",
                        "country": "US",
                        "line1": "4180 Burnet Rd",
                        "line2": "Suite 2",
                        "postal_code": "78756",
                        "state": "TX"
                      },
                      "business_name": "Shine Time Auto Detailing, LLC",
                      "business_type": "software",
                      "can_transfer_pending_balance_to_children": false,
                      "cancellation_policy": {
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
                      "capabilities": {
                        "accept_bank_payments": "active",
                        "accept_bnpl_payments": "active",
                        "accept_card_payments": "active",
                        "bank_deposit": "active",
                        "card_deposit": "active",
                        "card_issuing": "active",
                        "crypto_deposit": "active",
                        "crypto_payout": "active",
                        "instant_payout": "active",
                        "run_ads": "active",
                        "standard_payout": "active",
                        "transfer": "active"
                      },
                      "cards": {
                        "kind": null,
                        "status": "approved"
                      },
                      "collect_vat_id": false,
                      "company_formation": {
                        "documents": [
                          {
                            "id": "file_xxxxxxxxxxxxxx",
                            "name": "Articles of Organization",
                            "type": "articles_of_organization",
                            "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                          }
                        ],
                        "ein_registered": false,
                        "legal_name": "Shine Time Auto Detailing, LLC",
                        "signatures": {
                          "form8821": {
                            "expires_at": "2026-01-01T12:00:00.000Z",
                            "status": "pending",
                            "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                          },
                          "ss4": {
                            "expires_at": "2026-01-01T12:00:00.000Z",
                            "status": "pending",
                            "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                          }
                        },
                        "state_registered": true
                      },
                      "country": "us",
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "customers_l30d": 1,
                      "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                      "direct_reports_count": 0,
                      "dispute_fighter_enabled": false,
                      "economic_intelligence": false,
                      "email": "marcus@shinetime.example",
                      "eula": {
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
                      "external_id": "connected_account_123",
                      "financing": {
                        "application_id": "inrq_xxxxxxxxxxxxxx",
                        "status": "requires_collection"
                      },
                      "funds_release_at": "funds_release_at",
                      "home_preferences": [
                        "hide_member_count"
                      ],
                      "id": "biz_xxxxxxxxxxxxxx",
                      "industry_type": "trading",
                      "invoice_prefix": "INV",
                      "level": {
                        "account_level": 0,
                        "applied_level": 1,
                        "boosted": true,
                        "levels": [
                          {
                            "level": 0,
                            "minimum_spend": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "processing_rate_percentage": 2.7,
                            "regional_rates": [
                              {
                                "processing_rate_percentage": 1.7,
                                "region": "us_and_canada"
                              }
                            ]
                          }
                        ],
                        "monthly_ads_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "monthly_card_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "monthly_qualifying_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "monthly_trading_volume": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "points": 41000,
                        "points_by_source": {
                          "ads": 0,
                          "cards": 40000,
                          "partners": 0,
                          "trading": 1000
                        },
                        "points_to_next": 59000,
                        "resets_at": "2026-01-01T12:00:00.000Z"
                      },
                      "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "metadata": {
                        "external_id": "connected_account_123"
                      },
                      "onboarding_type": "platform",
                      "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                      "opengraph_image_variant": "white",
                      "orchestration_enabled": true,
                      "other_business_description": "other_business_description",
                      "other_industry_description": "other_industry_description",
                      "owner": {
                        "id": "user_xxxxxxxxxxxxxx",
                        "name": "Dana Whitfield",
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "username": "danawhitfield"
                      },
                      "parent_account": {
                        "fees": {
                          "crypto_swap_markup": {
                            "fixed_fee_usd": 0,
                            "percentage_fee": 3
                          },
                          "transfer_markup": {
                            "fixed_fee_usd": 0,
                            "percentage_fee": 0
                          }
                        },
                        "id": "biz_xxxxxxxxxxxxxx",
                        "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "route": "shine-time-holdings",
                        "title": "Shine Time Holdings"
                      },
                      "partner": {
                        "email": null,
                        "id": "id",
                        "name": null,
                        "profile_picture": {
                          "url": "https://ui-avatars.com/api/"
                        },
                        "referring_account": {
                          "id": "biz_xxxxxxxxxxxxxx",
                          "title": "Acme Bookkeeping"
                        },
                        "username": "username",
                        "whop_partner_verified_at": null
                      },
                      "payment_controls": {
                        "dispute_alert_auto_refund": {
                          "locked": false,
                          "threshold_usd": 500
                        },
                        "dispute_alert_fee_usd": 29,
                        "enforce_3ds": false,
                        "financing_disabled": false,
                        "high_risk_processing_fee_percentage": 0,
                        "payment_method_warnings": [
                          {
                            "key": "value"
                          }
                        ],
                        "pending_auto_topup_fee_percentage": 2,
                        "pending_balance_delay_days": 0,
                        "reserve": {
                          "hold_period_days": 14,
                          "percentage": 15
                        },
                        "resolution_center_auto_refund": {
                          "card_threshold_usd": 50,
                          "financing_threshold_usd": 25,
                          "locked": false,
                          "paypal_threshold_usd": 40
                        },
                        "restricted_payment_methods": [
                          "card_visa"
                        ],
                        "undated_pending_reason": null,
                        "withdrawal_schedule": {
                          "day": null,
                          "frequency": "manual",
                          "next_payout_date": null
                        }
                      },
                      "payment_method_configuration": {
                        "disabled": [
                          "card"
                        ],
                        "enabled": [
                          "card"
                        ],
                        "include_platform_defaults": true
                      },
                      "platform_credits": [
                        {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      ],
                      "privacy_policy": {
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
                      "product_tax_code": {
                        "id": "ptc_xxxxxxxxxxxxxx",
                        "name": "General - Digital Goods",
                        "product_type": "digital"
                      },
                      "recommended_actions": [
                        {
                          "action": "theme_business",
                          "blocked_capabilities": [
                            "blocked_capabilities"
                          ],
                          "cta": "cta",
                          "cta_label": "cta_label",
                          "description": "description",
                          "icon_url": null,
                          "impact_score": null,
                          "reasoning": null,
                          "status": "optional",
                          "title": "title"
                        }
                      ],
                      "require_2fa": false,
                      "required_actions": [
                        {
                          "action": "deposit_funds",
                          "blocked_capabilities": [
                            "standard_payout"
                          ],
                          "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                          "cta_label": "Verify now",
                          "description": "Complete verification to withdraw your earnings.",
                          "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                          "status": "required",
                          "title": "Complete your identity verification"
                        }
                      ],
                      "return_policy": {
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
                      "rewards": [
                        {
                          "id": "id",
                          "qualification_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "qualification_progress": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "qualification_type": "sales",
                          "reward_amount": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "status": "in_progress"
                        }
                      ],
                      "route": "biz_xxxxxxxxxxxxxx",
                      "send_customer_emails": false,
                      "shipping_policy": {
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
                      "show_joined_whops": true,
                      "show_reviews_dtc": true,
                      "show_user_directory": true,
                      "social_links": [
                        {
                          "id": "social_1",
                          "title": "@shinetimedetail",
                          "url": "https://instagram.com/shinetimedetail",
                          "website": "x"
                        }
                      ],
                      "status": "active",
                      "status_reason": "Suspended - Fraudulent activity",
                      "store_page_config": {
                        "accent_color": null,
                        "layout": null,
                        "profile_variant": null,
                        "whop_affiliate_link": true
                      },
                      "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                      "tax_collection_enabled_states": [
                        "TX"
                      ],
                      "tax_identifiers": [
                        {
                          "id": "txid_xxxxxxxxxxxxxx",
                          "tax_id_type": "ad_nrt",
                          "tax_id_value": "DE123456789"
                        }
                      ],
                      "tax_remitted_by": "whop",
                      "tax_type": "inclusive",
                      "terms_of_service": {
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
                      "three_ds_level": "mandate_challenge",
                      "title": "Shine Time Auto Detailing",
                      "total_earned_usd": 0,
                      "total_usd": "50.00",
                      "trading": {
                        "account_id": null,
                        "hyperliquid": {
                          "address": "address",
                          "depositable": null,
                          "margin_summary": {
                            "account_value": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "total_margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "total_position_notional": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "withdrawable": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            }
                          },
                          "positions": [
                            {
                              "entry_price": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "hyperliquid": {
                                "cumulative_funding": {
                                  "all_time": {
                                    "amount": "-1234.56",
                                    "currency": "usd",
                                    "decimals": 2,
                                    "display_decimals": 2
                                  },
                                  "since_change": {
                                    "amount": "-1234.56",
                                    "currency": "usd",
                                    "decimals": 2,
                                    "display_decimals": 2
                                  },
                                  "since_open": {
                                    "amount": "-1234.56",
                                    "currency": "usd",
                                    "decimals": 2,
                                    "display_decimals": 2
                                  }
                                },
                                "leverage": {
                                  "type": "cross",
                                  "value": 1
                                },
                                "liquidation_price": {
                                  "amount": "-1234.56",
                                  "currency": "usd",
                                  "decimals": 2,
                                  "display_decimals": 2
                                },
                                "margin_used": {
                                  "amount": "-1234.56",
                                  "currency": "usd",
                                  "decimals": 2,
                                  "display_decimals": 2
                                },
                                "return_on_equity": "return_on_equity"
                              },
                              "id": "id",
                              "market": "market",
                              "object": "trading_position",
                              "position_value": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "side": "long",
                              "size": "size",
                              "unrealized_pnl": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            }
                          ],
                          "websocket_subscriptions": [
                            {
                              "channel": "clearinghouse_state",
                              "message": "message"
                            }
                          ],
                          "websocket_url": "websocket_url"
                        },
                        "id": "id",
                        "object": "trading_account",
                        "provider": "hyperliquid",
                        "spot": {
                          "holdings": [
                            {
                              "average_entry_price": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "cost_basis": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "market": "market",
                              "realized_pnl": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "unrealized_pnl": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "unrealized_pnl_percentage": null
                            }
                          ]
                        },
                        "user_id": null
                      },
                      "use_logo_as_opengraph_image_fallback": false,
                      "verification": {
                        "business": null,
                        "individual": null
                      },
                      "volume_l30d_usd": 0,
                      "volume_usd": 1.1,
                      "wallet": {
                        "address": "0xabc123",
                        "id": "cwal_xxxxxxxxxxxxxx",
                        "network": "solana"
                      },
                      "website": "https://shinetimedetail.com",
                      "whop_partner_enabled_at": "whop_partner_enabled_at"
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
        let expectedResponse = ListAccountsResponse(
            data: [
                Account(
                    adsSpendUsd: Nullable<Double>.value(0),
                    balances: [
                        AccountBalanceToken(
                            balance: "1500.0",
                            breakdown: AccountBalanceBreakdown(
                                available: "1500.0",
                                finishingSettlement: "0",
                                inTransit: "0",
                                pending: "0",
                                pendingSettlements: [
                                    AccountBalanceSettlement(
                                        amount: "0.0",
                                        date: "2026-01-01"
                                    )
                                ],
                                reserve: "0"
                            ),
                            iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                            name: "Tether USD",
                            priceUsd: Nullable<Double>.value(1),
                            symbol: "USDT",
                            valueUsd: Nullable<String>.value("1500.00")
                        )
                    ],
                    bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    businessAddress: Nullable<[String: JSONValue]>.value([
                        "city": JSONValue.string("Austin"), 
                        "country": JSONValue.string("US"), 
                        "line1": JSONValue.string("4180 Burnet Rd"), 
                        "line2": JSONValue.string("Suite 2"), 
                        "postal_code": JSONValue.string("78756"), 
                        "state": JSONValue.string("TX")
                    ]),
                    businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
                    businessType: Nullable<String>.value("software"),
                    canTransferPendingBalanceToChildren: false,
                    cancellationPolicy: Nullable<File>.value(File(
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
                    capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                        acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                        acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                        acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                        bankDeposit: AccountCapabilitiesBankDeposit.active,
                        cardDeposit: AccountCapabilitiesCardDeposit.active,
                        cardIssuing: AccountCapabilitiesCardIssuing.active,
                        cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                        cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                        instantPayout: AccountCapabilitiesInstantPayout.active,
                        runAds: AccountCapabilitiesRunAds.active,
                        standardPayout: AccountCapabilitiesStandardPayout.active,
                        transfer: AccountCapabilitiesTransfer.active
                    )),
                    cards: Nullable<AccountCards>.value(AccountCards(
                        kind: .null,
                        status: AccountCardsStatus.approved
                    )),
                    collectVatId: false,
                    companyFormation: AccountCompanyFormation(
                        documents: Optional([
                            AccountCompanyFormationDocument(
                                id: "file_xxxxxxxxxxxxxx",
                                name: "Articles of Organization",
                                type: "articles_of_organization",
                                url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                            )
                        ]),
                        einRegistered: Optional(false),
                        legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                        signatures: Optional(AccountCompanyFormationSignatures(
                            form8821: Optional(AccountCompanyFormationSignatureRequest(
                                expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                                status: AccountCompanyFormationSignatureRequestStatus.pending,
                                url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                            )),
                            ss4: Optional(AccountCompanyFormationSignatureRequest(
                                expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                                status: AccountCompanyFormationSignatureRequestStatus.pending,
                                url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                            ))
                        )),
                        stateRegistered: Optional(true)
                    ),
                    country: Nullable<String>.value("us"),
                    createdAt: "2026-01-01T12:00:00.000Z",
                    customersL30D: Nullable<Int>.value(1),
                    description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
                    directReportsCount: Optional(0),
                    disputeFighterEnabled: false,
                    economicIntelligence: false,
                    email: Nullable<String>.value("marcus@shinetime.example"),
                    eula: Nullable<File>.value(File(
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
                    externalId: Nullable<String>.value("connected_account_123"),
                    financing: Nullable<AccountFinancing>.value(AccountFinancing(
                        applicationId: "inrq_xxxxxxxxxxxxxx",
                        status: AccountFinancingStatus.requiresCollection
                    )),
                    fundsReleaseAt: Nullable<String>.value("funds_release_at"),
                    homePreferences: [
                        AccountHomePreferencesItem.hideMemberCount
                    ],
                    id: "biz_xxxxxxxxxxxxxx",
                    industryType: Nullable<String>.value("trading"),
                    invoicePrefix: Nullable<String>.value("INV"),
                    level: Nullable<AccountLevel>.value(AccountLevel(
                        accountLevel: 0,
                        appliedLevel: 1,
                        boosted: true,
                        levels: [
                            AccountProcessingOfferLevel(
                                level: 0,
                                minimumSpend: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                processingRatePercentage: 2.7,
                                regionalRates: [
                                    AccountProcessingOfferRegionalRate(
                                        processingRatePercentage: 1.7,
                                        region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                                    )
                                ]
                            )
                        ],
                        monthlyAdsSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        monthlyCardSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        monthlyQualifyingSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        monthlyTradingVolume: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        points: 41000,
                        pointsBySource: OwnerLevelPoints(
                            ads: 0,
                            cards: 40000,
                            partners: 0,
                            trading: 1000
                        ),
                        pointsToNext: Nullable<Int>.value(59000),
                        resetsAt: "2026-01-01T12:00:00.000Z"
                    )),
                    logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    metadata: [
                        "external_id": JSONValue.string("connected_account_123")
                    ],
                    onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
                    opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                    opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
                    orchestrationEnabled: true,
                    otherBusinessDescription: Nullable<String>.value("other_business_description"),
                    otherIndustryDescription: Nullable<String>.value("other_industry_description"),
                    owner: UserSummary(
                        id: "user_xxxxxxxxxxxxxx",
                        name: Nullable<String>.value("Dana Whitfield"),
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        username: "danawhitfield"
                    ),
                    parentAccount: Nullable<AccountParent>.value(AccountParent(
                        fees: Optional([
                            "crypto_swap_markup": AccountParentFeesValue(
                                fixedFeeUsd: 0,
                                percentageFee: 3
                            ), 
                            "transfer_markup": AccountParentFeesValue(
                                fixedFeeUsd: 0,
                                percentageFee: 0
                            )
                        ]),
                        id: "biz_xxxxxxxxxxxxxx",
                        logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                        route: "shine-time-holdings",
                        title: "Shine Time Holdings"
                    )),
                    partner: Optional(Nullable<AccountPartner>.value(AccountPartner(
                        email: .null,
                        id: "id",
                        name: .null,
                        profilePicture: UserProfilePicture(
                            url: "https://ui-avatars.com/api/"
                        ),
                        referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                            id: "biz_xxxxxxxxxxxxxx",
                            title: "Acme Bookkeeping"
                        )),
                        username: "username",
                        whopPartnerVerifiedAt: .null
                    ))),
                    paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                        disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                            locked: false,
                            thresholdUsd: Nullable<Double>.value(500)
                        ),
                        disputeAlertFeeUsd: Nullable<Double>.value(29),
                        enforce3Ds: false,
                        financingDisabled: false,
                        highRiskProcessingFeePercentage: 0,
                        paymentMethodWarnings: [
                            [
                                "key": JSONValue.string("value")
                            ]
                        ],
                        pendingAutoTopupFeePercentage: 2,
                        pendingBalanceDelayDays: 0,
                        reserve: AccountReserveControl(
                            holdPeriodDays: 14,
                            percentage: Nullable<Double>.value(15)
                        ),
                        resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                            cardThresholdUsd: Nullable<Double>.value(50),
                            financingThresholdUsd: Nullable<Double>.value(25),
                            locked: false,
                            paypalThresholdUsd: Nullable<Double>.value(40)
                        ),
                        restrictedPaymentMethods: [
                            AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                        ],
                        undatedPendingReason: .null,
                        withdrawalSchedule: AccountWithdrawalScheduleControl(
                            day: .null,
                            frequency: AccountWithdrawalScheduleControlFrequency.manual,
                            nextPayoutDate: .null
                        )
                    )),
                    paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                        disabled: [
                            "card"
                        ],
                        enabled: [
                            "card"
                        ],
                        includePlatformDefaults: true
                    )),
                    platformCredits: [
                        Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    ],
                    privacyPolicy: Nullable<File>.value(File(
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
                    productTaxCode: Nullable<[String: JSONValue]>.value([
                        "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                        "name": JSONValue.string("General - Digital Goods"), 
                        "product_type": JSONValue.string("digital")
                    ]),
                    recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                        AccountRecommendedAction(
                            action: AccountRecommendedActionAction.themeBusiness,
                            blockedCapabilities: [
                                "blocked_capabilities"
                            ],
                            cta: "cta",
                            ctaLabel: "cta_label",
                            description: "description",
                            iconUrl: .null,
                            impactScore: .null,
                            reasoning: .null,
                            status: AccountRecommendedActionStatus.optional,
                            title: "title"
                        )
                    ]),
                    require2Fa: false,
                    requiredActions: Nullable<[AccountRequiredAction]>.value([
                        AccountRequiredAction(
                            action: AccountRequiredActionAction.depositFunds,
                            blockedCapabilities: [
                                "standard_payout"
                            ],
                            cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                            ctaLabel: "Verify now",
                            description: "Complete verification to withdraw your earnings.",
                            iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                            status: AccountRequiredActionStatus.required,
                            title: "Complete your identity verification"
                        )
                    ]),
                    returnPolicy: Nullable<File>.value(File(
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
                    rewards: Optional([
                        AccountPartnerReward(
                            id: "id",
                            qualificationAmount: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            qualificationProgress: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            qualificationType: AccountPartnerRewardQualificationType.sales,
                            rewardAmount: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            status: AccountPartnerRewardStatus.inProgress
                        )
                    ]),
                    route: "biz_xxxxxxxxxxxxxx",
                    sendCustomerEmails: false,
                    shippingPolicy: Nullable<File>.value(File(
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
                    showJoinedWhops: true,
                    showReviewsDtc: true,
                    showUserDirectory: true,
                    socialLinks: [
                        AccountSocialLink(
                            id: "social_1",
                            title: Nullable<String>.value("@shinetimedetail"),
                            url: "https://instagram.com/shinetimedetail",
                            website: AccountSocialLinkWebsite.x
                        )
                    ],
                    status: Nullable<String>.value("active"),
                    statusReason: Nullable<String>.value("Suspended - Fraudulent activity"),
                    storePageConfig: AccountStorePageConfig(
                        accentColor: .null,
                        layout: .null,
                        profileVariant: .null,
                        whopAffiliateLink: true
                    ),
                    targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
                    taxCollectionEnabledStates: [
                        "TX"
                    ],
                    taxIdentifiers: [
                        AccountTaxIdentifier(
                            id: "txid_xxxxxxxxxxxxxx",
                            taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                            taxIdValue: "DE123456789"
                        )
                    ],
                    taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
                    taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
                    termsOfService: Nullable<File>.value(File(
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
                    threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
                    title: "Shine Time Auto Detailing",
                    totalEarnedUsd: Nullable<Double>.value(0),
                    totalUsd: Nullable<String>.value("50.00"),
                    trading: Nullable<TradingAccount>.value(TradingAccount(
                        accountId: .null,
                        hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                            address: "address",
                            depositable: .null,
                            marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                                accountValue: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                totalMarginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                totalPositionNotional: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                withdrawable: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )
                            )),
                            positions: Nullable<[TradingPosition]>.value([
                                TradingPosition(
                                    entryPrice: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                        cumulativeFunding: TradingCumulativeFunding(
                                            allTime: Nullable<Money>.value(Money(
                                                amount: "-1234.56",
                                                currency: "usd",
                                                decimals: 2,
                                                displayDecimals: 2
                                            )),
                                            sinceChange: Nullable<Money>.value(Money(
                                                amount: "-1234.56",
                                                currency: "usd",
                                                decimals: 2,
                                                displayDecimals: 2
                                            )),
                                            sinceOpen: Nullable<Money>.value(Money(
                                                amount: "-1234.56",
                                                currency: "usd",
                                                decimals: 2,
                                                displayDecimals: 2
                                            ))
                                        ),
                                        leverage: TradingPositionLeverage(
                                            type: TradingPositionLeverageType.cross,
                                            value: 1
                                        ),
                                        liquidationPrice: Nullable<Money>.value(Money(
                                            amount: "-1234.56",
                                            currency: "usd",
                                            decimals: 2,
                                            displayDecimals: 2
                                        )),
                                        marginUsed: Money(
                                            amount: "-1234.56",
                                            currency: "usd",
                                            decimals: 2,
                                            displayDecimals: 2
                                        ),
                                        returnOnEquity: "return_on_equity"
                                    )),
                                    id: "id",
                                    market: "market",
                                    object: TradingPositionObject.tradingPosition,
                                    positionValue: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    side: TradingPositionSide.long,
                                    size: "size",
                                    unrealizedPnl: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )
                                )
                            ]),
                            websocketSubscriptions: [
                                TradingWebsocketSubscription(
                                    channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                                    message: "message"
                                )
                            ],
                            websocketUrl: "websocket_url"
                        )),
                        id: "id",
                        object: TradingAccountObject.tradingAccount,
                        provider: TradingAccountProvider.hyperliquid,
                        spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                            holdings: [
                                TradingSpotHolding(
                                    averageEntryPrice: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    costBasis: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    market: "market",
                                    realizedPnl: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    unrealizedPnl: Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ),
                                    unrealizedPnlPercentage: .null
                                )
                            ]
                        )),
                        userId: .null
                    )),
                    useLogoAsOpengraphImageFallback: false,
                    verification: [
                        "business": JSONValue.value, 
                        "individual": JSONValue.value
                    ],
                    volumeL30DUsd: Nullable<Double>.value(0),
                    volumeUsd: Nullable<Double>.value(1.1),
                    wallet: Nullable<AccountWallet>.value(AccountWallet(
                        address: "0xabc123",
                        id: "cwal_xxxxxxxxxxxxxx",
                        network: AccountWalletNetwork.solana
                    )),
                    website: Nullable<String>.value("https://shinetimedetail.com"),
                    whopPartnerEnabledAt: Optional(Nullable<String>.value("whop_partner_enabled_at"))
                )
            ],
            pageInfo: ListAccountsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.accounts.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ads_spend_usd": 0,
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "software",
                  "can_transfer_pending_balance_to_children": false,
                  "cancellation_policy": {
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
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": false,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customers_l30d": 1,
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "direct_reports_count": 0,
                  "dispute_fighter_enabled": false,
                  "economic_intelligence": false,
                  "email": "marcus@shinetime.example",
                  "eula": {
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
                  "external_id": "connected_account_123",
                  "financing": {
                    "application_id": "inrq_xxxxxxxxxxxxxx",
                    "status": "requires_collection"
                  },
                  "funds_release_at": "funds_release_at",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_type": "trading",
                  "invoice_prefix": "INV",
                  "level": {
                    "account_level": 0,
                    "applied_level": 1,
                    "boosted": true,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "connected_account_123"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "orchestration_enabled": true,
                  "other_business_description": "other_business_description",
                  "other_industry_description": "other_industry_description",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "partner": {
                    "email": "email",
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "referring_account": {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Acme Bookkeeping"
                    },
                    "username": "username",
                    "whop_partner_verified_at": "whop_partner_verified_at"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "payment_method_warnings": [
                      {
                        "key": "value"
                      }
                    ],
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ],
                    "undated_pending_reason": "kyc_incomplete",
                    "withdrawal_schedule": {
                      "day": 1,
                      "frequency": "manual",
                      "next_payout_date": "next_payout_date"
                    }
                  },
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "platform_credits": [
                    {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  ],
                  "privacy_policy": {
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
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "blocked_capabilities"
                      ],
                      "cta": "cta",
                      "cta_label": "cta_label",
                      "description": "description",
                      "icon_url": "icon_url",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "title"
                    }
                  ],
                  "require_2fa": false,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "return_policy": {
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
                  "rewards": [
                    {
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_progress": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_type": "sales",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "status": "in_progress"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "shipping_policy": {
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
                  "show_joined_whops": true,
                  "show_reviews_dtc": true,
                  "show_user_directory": true,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "status": "active",
                  "status_reason": "Suspended - Fraudulent activity",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "terms_of_service": {
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
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "use_logo_as_opengraph_image_fallback": false,
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "volume_l30d_usd": 0,
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
                  },
                  "website": "https://shinetimedetail.com",
                  "whop_partner_enabled_at": "whop_partner_enabled_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Account(
            adsSpendUsd: Nullable<Double>.value(0),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<String>.value("software"),
            canTransferPendingBalanceToChildren: false,
            cancellationPolicy: Nullable<File>.value(File(
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
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: false,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customersL30D: Nullable<Int>.value(1),
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            directReportsCount: Optional(0),
            disputeFighterEnabled: false,
            economicIntelligence: false,
            email: Nullable<String>.value("marcus@shinetime.example"),
            eula: Nullable<File>.value(File(
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
            externalId: Nullable<String>.value("connected_account_123"),
            financing: Nullable<AccountFinancing>.value(AccountFinancing(
                applicationId: "inrq_xxxxxxxxxxxxxx",
                status: AccountFinancingStatus.requiresCollection
            )),
            fundsReleaseAt: Nullable<String>.value("funds_release_at"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryType: Nullable<String>.value("trading"),
            invoicePrefix: Nullable<String>.value("INV"),
            level: Nullable<AccountLevel>.value(AccountLevel(
                accountLevel: 0,
                appliedLevel: 1,
                boosted: true,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("connected_account_123")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            orchestrationEnabled: true,
            otherBusinessDescription: Nullable<String>.value("other_business_description"),
            otherIndustryDescription: Nullable<String>.value("other_industry_description"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            partner: Optional(Nullable<AccountPartner>.value(AccountPartner(
                email: Nullable<String>.value("email"),
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Acme Bookkeeping"
                )),
                username: "username",
                whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
            ))),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                paymentMethodWarnings: [
                    [
                        "key": JSONValue.string("value")
                    ]
                ],
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ],
                undatedPendingReason: Nullable<AccountPaymentControlsUndatedPendingReason>.value(AccountPaymentControlsUndatedPendingReason.kycIncomplete),
                withdrawalSchedule: AccountWithdrawalScheduleControl(
                    day: Nullable<Int>.value(1),
                    frequency: AccountWithdrawalScheduleControlFrequency.manual,
                    nextPayoutDate: Nullable<String>.value("next_payout_date")
                )
            )),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            platformCredits: [
                Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )
            ],
            privacyPolicy: Nullable<File>.value(File(
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
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities"
                    ],
                    cta: "cta",
                    ctaLabel: "cta_label",
                    description: "description",
                    iconUrl: Nullable<String>.value("icon_url"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: AccountRecommendedActionStatus.optional,
                    title: "title"
                )
            ]),
            require2Fa: false,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            returnPolicy: Nullable<File>.value(File(
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
            rewards: Optional([
                AccountPartnerReward(
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationProgress: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationType: AccountPartnerRewardQualificationType.sales,
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    status: AccountPartnerRewardStatus.inProgress
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            shippingPolicy: Nullable<File>.value(File(
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
            showJoinedWhops: true,
            showReviewsDtc: true,
            showUserDirectory: true,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Suspended - Fraudulent activity"),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            termsOfService: Nullable<File>.value(File(
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
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            useLogoAsOpengraphImageFallback: false,
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            volumeL30DUsd: Nullable<Double>.value(0),
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            )),
            website: Nullable<String>.value("https://shinetimedetail.com"),
            whopPartnerEnabledAt: Optional(Nullable<String>.value("whop_partner_enabled_at"))
        )
        let response = try await client.accounts.create(
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func me1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ads_spend_usd": 0,
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "software",
                  "can_transfer_pending_balance_to_children": false,
                  "cancellation_policy": {
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
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": false,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customers_l30d": 1,
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "direct_reports_count": 0,
                  "dispute_fighter_enabled": false,
                  "economic_intelligence": false,
                  "email": "marcus@shinetime.example",
                  "eula": {
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
                  "external_id": "connected_account_123",
                  "financing": {
                    "application_id": "inrq_xxxxxxxxxxxxxx",
                    "status": "requires_collection"
                  },
                  "funds_release_at": "funds_release_at",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_type": "trading",
                  "invoice_prefix": "INV",
                  "level": {
                    "account_level": 0,
                    "applied_level": 1,
                    "boosted": true,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "connected_account_123"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "orchestration_enabled": true,
                  "other_business_description": "other_business_description",
                  "other_industry_description": "other_industry_description",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "partner": {
                    "email": "email",
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "referring_account": {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Acme Bookkeeping"
                    },
                    "username": "username",
                    "whop_partner_verified_at": "whop_partner_verified_at"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "payment_method_warnings": [
                      {
                        "key": "value"
                      }
                    ],
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ],
                    "undated_pending_reason": "kyc_incomplete",
                    "withdrawal_schedule": {
                      "day": 1,
                      "frequency": "manual",
                      "next_payout_date": "next_payout_date"
                    }
                  },
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "platform_credits": [
                    {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  ],
                  "privacy_policy": {
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
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "blocked_capabilities"
                      ],
                      "cta": "cta",
                      "cta_label": "cta_label",
                      "description": "description",
                      "icon_url": "icon_url",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "title"
                    }
                  ],
                  "require_2fa": false,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "return_policy": {
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
                  "rewards": [
                    {
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_progress": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_type": "sales",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "status": "in_progress"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "shipping_policy": {
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
                  "show_joined_whops": true,
                  "show_reviews_dtc": true,
                  "show_user_directory": true,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "status": "active",
                  "status_reason": "Suspended - Fraudulent activity",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "terms_of_service": {
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
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "use_logo_as_opengraph_image_fallback": false,
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "volume_l30d_usd": 0,
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
                  },
                  "website": "https://shinetimedetail.com",
                  "whop_partner_enabled_at": "whop_partner_enabled_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Account(
            adsSpendUsd: Nullable<Double>.value(0),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<String>.value("software"),
            canTransferPendingBalanceToChildren: false,
            cancellationPolicy: Nullable<File>.value(File(
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
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: false,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customersL30D: Nullable<Int>.value(1),
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            directReportsCount: Optional(0),
            disputeFighterEnabled: false,
            economicIntelligence: false,
            email: Nullable<String>.value("marcus@shinetime.example"),
            eula: Nullable<File>.value(File(
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
            externalId: Nullable<String>.value("connected_account_123"),
            financing: Nullable<AccountFinancing>.value(AccountFinancing(
                applicationId: "inrq_xxxxxxxxxxxxxx",
                status: AccountFinancingStatus.requiresCollection
            )),
            fundsReleaseAt: Nullable<String>.value("funds_release_at"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryType: Nullable<String>.value("trading"),
            invoicePrefix: Nullable<String>.value("INV"),
            level: Nullable<AccountLevel>.value(AccountLevel(
                accountLevel: 0,
                appliedLevel: 1,
                boosted: true,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("connected_account_123")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            orchestrationEnabled: true,
            otherBusinessDescription: Nullable<String>.value("other_business_description"),
            otherIndustryDescription: Nullable<String>.value("other_industry_description"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            partner: Optional(Nullable<AccountPartner>.value(AccountPartner(
                email: Nullable<String>.value("email"),
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Acme Bookkeeping"
                )),
                username: "username",
                whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
            ))),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                paymentMethodWarnings: [
                    [
                        "key": JSONValue.string("value")
                    ]
                ],
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ],
                undatedPendingReason: Nullable<AccountPaymentControlsUndatedPendingReason>.value(AccountPaymentControlsUndatedPendingReason.kycIncomplete),
                withdrawalSchedule: AccountWithdrawalScheduleControl(
                    day: Nullable<Int>.value(1),
                    frequency: AccountWithdrawalScheduleControlFrequency.manual,
                    nextPayoutDate: Nullable<String>.value("next_payout_date")
                )
            )),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            platformCredits: [
                Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )
            ],
            privacyPolicy: Nullable<File>.value(File(
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
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities"
                    ],
                    cta: "cta",
                    ctaLabel: "cta_label",
                    description: "description",
                    iconUrl: Nullable<String>.value("icon_url"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: AccountRecommendedActionStatus.optional,
                    title: "title"
                )
            ]),
            require2Fa: false,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            returnPolicy: Nullable<File>.value(File(
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
            rewards: Optional([
                AccountPartnerReward(
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationProgress: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationType: AccountPartnerRewardQualificationType.sales,
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    status: AccountPartnerRewardStatus.inProgress
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            shippingPolicy: Nullable<File>.value(File(
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
            showJoinedWhops: true,
            showReviewsDtc: true,
            showUserDirectory: true,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Suspended - Fraudulent activity"),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            termsOfService: Nullable<File>.value(File(
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
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            useLogoAsOpengraphImageFallback: false,
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            volumeL30DUsd: Nullable<Double>.value(0),
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            )),
            website: Nullable<String>.value("https://shinetimedetail.com"),
            whopPartnerEnabledAt: Optional(Nullable<String>.value("whop_partner_enabled_at"))
        )
        let response = try await client.accounts.me(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func search1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "created_at": "2026-01-01T12:00:00.000Z",
                      "id": "biz_xxxxxxxxxxxxxx",
                      "route": "biz_xxxxxxxxxxxxxx",
                      "title": "Shine Time Detailing"
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
        let expectedResponse = SearchAccountsResponse(
            data: [
                AccountSearchResult(
                    createdAt: "2026-01-01T12:00:00.000Z",
                    id: "biz_xxxxxxxxxxxxxx",
                    route: "biz_xxxxxxxxxxxxxx",
                    title: "Shine Time Detailing"
                )
            ],
            pageInfo: SearchAccountsResponsePageInfo(
                endCursor: Nullable<String>.value("end_cursor"),
                hasNextPage: false,
                hasPreviousPage: false,
                startCursor: Nullable<String>.value("WyJjdXJzb3IiLDFd")
            )
        )
        let response = try await client.accounts.search(
            query: "query",
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
                  "ads_spend_usd": 0,
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "software",
                  "can_transfer_pending_balance_to_children": false,
                  "cancellation_policy": {
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
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": false,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customers_l30d": 1,
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "direct_reports_count": 0,
                  "dispute_fighter_enabled": false,
                  "economic_intelligence": false,
                  "email": "marcus@shinetime.example",
                  "eula": {
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
                  "external_id": "connected_account_123",
                  "financing": {
                    "application_id": "inrq_xxxxxxxxxxxxxx",
                    "status": "requires_collection"
                  },
                  "funds_release_at": "funds_release_at",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_type": "trading",
                  "invoice_prefix": "INV",
                  "level": {
                    "account_level": 0,
                    "applied_level": 1,
                    "boosted": true,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "connected_account_123"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "orchestration_enabled": true,
                  "other_business_description": "other_business_description",
                  "other_industry_description": "other_industry_description",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "partner": {
                    "email": "email",
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "referring_account": {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Acme Bookkeeping"
                    },
                    "username": "username",
                    "whop_partner_verified_at": "whop_partner_verified_at"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "payment_method_warnings": [
                      {
                        "key": "value"
                      }
                    ],
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ],
                    "undated_pending_reason": "kyc_incomplete",
                    "withdrawal_schedule": {
                      "day": 1,
                      "frequency": "manual",
                      "next_payout_date": "next_payout_date"
                    }
                  },
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "platform_credits": [
                    {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  ],
                  "privacy_policy": {
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
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "blocked_capabilities"
                      ],
                      "cta": "cta",
                      "cta_label": "cta_label",
                      "description": "description",
                      "icon_url": "icon_url",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "title"
                    }
                  ],
                  "require_2fa": false,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "return_policy": {
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
                  "rewards": [
                    {
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_progress": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_type": "sales",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "status": "in_progress"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "shipping_policy": {
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
                  "show_joined_whops": true,
                  "show_reviews_dtc": true,
                  "show_user_directory": true,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "status": "active",
                  "status_reason": "Suspended - Fraudulent activity",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "terms_of_service": {
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
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "use_logo_as_opengraph_image_fallback": false,
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "volume_l30d_usd": 0,
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
                  },
                  "website": "https://shinetimedetail.com",
                  "whop_partner_enabled_at": "whop_partner_enabled_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Account(
            adsSpendUsd: Nullable<Double>.value(0),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<String>.value("software"),
            canTransferPendingBalanceToChildren: false,
            cancellationPolicy: Nullable<File>.value(File(
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
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: false,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customersL30D: Nullable<Int>.value(1),
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            directReportsCount: Optional(0),
            disputeFighterEnabled: false,
            economicIntelligence: false,
            email: Nullable<String>.value("marcus@shinetime.example"),
            eula: Nullable<File>.value(File(
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
            externalId: Nullable<String>.value("connected_account_123"),
            financing: Nullable<AccountFinancing>.value(AccountFinancing(
                applicationId: "inrq_xxxxxxxxxxxxxx",
                status: AccountFinancingStatus.requiresCollection
            )),
            fundsReleaseAt: Nullable<String>.value("funds_release_at"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryType: Nullable<String>.value("trading"),
            invoicePrefix: Nullable<String>.value("INV"),
            level: Nullable<AccountLevel>.value(AccountLevel(
                accountLevel: 0,
                appliedLevel: 1,
                boosted: true,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("connected_account_123")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            orchestrationEnabled: true,
            otherBusinessDescription: Nullable<String>.value("other_business_description"),
            otherIndustryDescription: Nullable<String>.value("other_industry_description"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            partner: Optional(Nullable<AccountPartner>.value(AccountPartner(
                email: Nullable<String>.value("email"),
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Acme Bookkeeping"
                )),
                username: "username",
                whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
            ))),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                paymentMethodWarnings: [
                    [
                        "key": JSONValue.string("value")
                    ]
                ],
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ],
                undatedPendingReason: Nullable<AccountPaymentControlsUndatedPendingReason>.value(AccountPaymentControlsUndatedPendingReason.kycIncomplete),
                withdrawalSchedule: AccountWithdrawalScheduleControl(
                    day: Nullable<Int>.value(1),
                    frequency: AccountWithdrawalScheduleControlFrequency.manual,
                    nextPayoutDate: Nullable<String>.value("next_payout_date")
                )
            )),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            platformCredits: [
                Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )
            ],
            privacyPolicy: Nullable<File>.value(File(
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
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities"
                    ],
                    cta: "cta",
                    ctaLabel: "cta_label",
                    description: "description",
                    iconUrl: Nullable<String>.value("icon_url"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: AccountRecommendedActionStatus.optional,
                    title: "title"
                )
            ]),
            require2Fa: false,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            returnPolicy: Nullable<File>.value(File(
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
            rewards: Optional([
                AccountPartnerReward(
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationProgress: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationType: AccountPartnerRewardQualificationType.sales,
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    status: AccountPartnerRewardStatus.inProgress
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            shippingPolicy: Nullable<File>.value(File(
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
            showJoinedWhops: true,
            showReviewsDtc: true,
            showUserDirectory: true,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Suspended - Fraudulent activity"),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            termsOfService: Nullable<File>.value(File(
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
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            useLogoAsOpengraphImageFallback: false,
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            volumeL30DUsd: Nullable<Double>.value(0),
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            )),
            website: Nullable<String>.value("https://shinetimedetail.com"),
            whopPartnerEnabledAt: Optional(Nullable<String>.value("whop_partner_enabled_at"))
        )
        let response = try await client.accounts.retrieve(
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
                {
                  "deleted": true,
                  "id": "biz_xxxxxxxxxxxxxx"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = DeleteAccountsResponse(
            deleted: true,
            id: "biz_xxxxxxxxxxxxxx"
        )
        let response = try await client.accounts.delete(
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
                  "ads_spend_usd": 0,
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "software",
                  "can_transfer_pending_balance_to_children": false,
                  "cancellation_policy": {
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
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": false,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customers_l30d": 1,
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "direct_reports_count": 0,
                  "dispute_fighter_enabled": false,
                  "economic_intelligence": false,
                  "email": "marcus@shinetime.example",
                  "eula": {
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
                  "external_id": "connected_account_123",
                  "financing": {
                    "application_id": "inrq_xxxxxxxxxxxxxx",
                    "status": "requires_collection"
                  },
                  "funds_release_at": "funds_release_at",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_type": "trading",
                  "invoice_prefix": "INV",
                  "level": {
                    "account_level": 0,
                    "applied_level": 1,
                    "boosted": true,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "connected_account_123"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "orchestration_enabled": true,
                  "other_business_description": "other_business_description",
                  "other_industry_description": "other_industry_description",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "partner": {
                    "email": "email",
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "referring_account": {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Acme Bookkeeping"
                    },
                    "username": "username",
                    "whop_partner_verified_at": "whop_partner_verified_at"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "payment_method_warnings": [
                      {
                        "key": "value"
                      }
                    ],
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ],
                    "undated_pending_reason": "kyc_incomplete",
                    "withdrawal_schedule": {
                      "day": 1,
                      "frequency": "manual",
                      "next_payout_date": "next_payout_date"
                    }
                  },
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "platform_credits": [
                    {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  ],
                  "privacy_policy": {
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
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "blocked_capabilities"
                      ],
                      "cta": "cta",
                      "cta_label": "cta_label",
                      "description": "description",
                      "icon_url": "icon_url",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "title"
                    }
                  ],
                  "require_2fa": false,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "return_policy": {
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
                  "rewards": [
                    {
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_progress": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_type": "sales",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "status": "in_progress"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "shipping_policy": {
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
                  "show_joined_whops": true,
                  "show_reviews_dtc": true,
                  "show_user_directory": true,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "status": "active",
                  "status_reason": "Suspended - Fraudulent activity",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "terms_of_service": {
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
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "use_logo_as_opengraph_image_fallback": false,
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "volume_l30d_usd": 0,
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
                  },
                  "website": "https://shinetimedetail.com",
                  "whop_partner_enabled_at": "whop_partner_enabled_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Account(
            adsSpendUsd: Nullable<Double>.value(0),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<String>.value("software"),
            canTransferPendingBalanceToChildren: false,
            cancellationPolicy: Nullable<File>.value(File(
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
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: false,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customersL30D: Nullable<Int>.value(1),
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            directReportsCount: Optional(0),
            disputeFighterEnabled: false,
            economicIntelligence: false,
            email: Nullable<String>.value("marcus@shinetime.example"),
            eula: Nullable<File>.value(File(
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
            externalId: Nullable<String>.value("connected_account_123"),
            financing: Nullable<AccountFinancing>.value(AccountFinancing(
                applicationId: "inrq_xxxxxxxxxxxxxx",
                status: AccountFinancingStatus.requiresCollection
            )),
            fundsReleaseAt: Nullable<String>.value("funds_release_at"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryType: Nullable<String>.value("trading"),
            invoicePrefix: Nullable<String>.value("INV"),
            level: Nullable<AccountLevel>.value(AccountLevel(
                accountLevel: 0,
                appliedLevel: 1,
                boosted: true,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("connected_account_123")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            orchestrationEnabled: true,
            otherBusinessDescription: Nullable<String>.value("other_business_description"),
            otherIndustryDescription: Nullable<String>.value("other_industry_description"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            partner: Optional(Nullable<AccountPartner>.value(AccountPartner(
                email: Nullable<String>.value("email"),
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Acme Bookkeeping"
                )),
                username: "username",
                whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
            ))),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                paymentMethodWarnings: [
                    [
                        "key": JSONValue.string("value")
                    ]
                ],
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ],
                undatedPendingReason: Nullable<AccountPaymentControlsUndatedPendingReason>.value(AccountPaymentControlsUndatedPendingReason.kycIncomplete),
                withdrawalSchedule: AccountWithdrawalScheduleControl(
                    day: Nullable<Int>.value(1),
                    frequency: AccountWithdrawalScheduleControlFrequency.manual,
                    nextPayoutDate: Nullable<String>.value("next_payout_date")
                )
            )),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            platformCredits: [
                Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )
            ],
            privacyPolicy: Nullable<File>.value(File(
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
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities"
                    ],
                    cta: "cta",
                    ctaLabel: "cta_label",
                    description: "description",
                    iconUrl: Nullable<String>.value("icon_url"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: AccountRecommendedActionStatus.optional,
                    title: "title"
                )
            ]),
            require2Fa: false,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            returnPolicy: Nullable<File>.value(File(
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
            rewards: Optional([
                AccountPartnerReward(
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationProgress: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationType: AccountPartnerRewardQualificationType.sales,
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    status: AccountPartnerRewardStatus.inProgress
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            shippingPolicy: Nullable<File>.value(File(
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
            showJoinedWhops: true,
            showReviewsDtc: true,
            showUserDirectory: true,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Suspended - Fraudulent activity"),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            termsOfService: Nullable<File>.value(File(
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
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            useLogoAsOpengraphImageFallback: false,
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            volumeL30DUsd: Nullable<Double>.value(0),
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            )),
            website: Nullable<String>.value("https://shinetimedetail.com"),
            whopPartnerEnabledAt: Optional(Nullable<String>.value("whop_partner_enabled_at"))
        )
        let response = try await client.accounts.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func formCompany1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "checkout_session_id": "ch_xxxxxxxxxxxxxx",
                  "checkout_url": "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
                  "currency": "usd",
                  "total": 40000
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = FormCompanyAccountsResponse(
            checkoutSessionId: "ch_xxxxxxxxxxxxxx",
            checkoutUrl: "https://whop.com/checkout/ch_xxxxxxxxxxxxxx/",
            currency: "usd",
            total: 40000
        )
        let response = try await client.accounts.formCompany(
            id: "id",
            request: .init(
                businessAddress: FormCompanyAccountsRequestBusinessAddress(
                    city: "Austin",
                    country: "US",
                    line1: "4180 Burnet Rd",
                    line2: "Suite 2",
                    postalCode: "78756",
                    state: "TX"
                ),
                businessName: "Shine Time Auto Detailing",
                businessPhone: "+15125550142",
                businessWebsite: "https://shinetime.example",
                entitySuffix: .llc,
                entityType: .llc,
                expediteEin: true,
                formationState: .wy,
                founders: [
                    FormCompanyAccountsRequestFoundersItem(
                        address: FormCompanyAccountsRequestFoundersItemAddress(
                            city: "Austin",
                            country: "US",
                            line1: "907 Ridgemont Dr",
                            line2: "Apt 4",
                            postalCode: "78704",
                            state: "TX"
                        ),
                        dateOfBirth: "1988-03-14",
                        email: "marcus@shinetime.example",
                        firstName: "Marcus",
                        isPrimary: true,
                        lastName: "Webb",
                        ownershipPercentage: 100,
                        phone: "+15125550142",
                        roles: [
                            .president
                        ],
                        ssn: "123-45-6789"
                    )
                ],
                shareStructure: FormCompanyAccountsRequestShareStructure(
                    numberOfShares: 123,
                    value: 123
                ),
                useRegisteredAgent: true
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retryAdsPayment1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "account_id": "biz_xxxxxxxxxxxxxx",
                  "queued": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = RetryAdsPaymentAccountsResponse(
            accountId: "biz_xxxxxxxxxxxxxx",
            queued: true
        )
        let response = try await client.accounts.retryAdsPayment(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func suspend1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ads_spend_usd": 0,
                  "balances": [
                    {
                      "balance": "1500.0",
                      "breakdown": {
                        "available": "1500.0",
                        "finishing_settlement": "0",
                        "in_transit": "0",
                        "pending": "0",
                        "pending_settlements": [
                          {
                            "amount": "0.0",
                            "date": "2026-01-01"
                          }
                        ],
                        "reserve": "0"
                      },
                      "icon_url": "https://assets.whop.com/tokens/usdt.png",
                      "name": "Tether USD",
                      "price_usd": 1,
                      "symbol": "USDT",
                      "value_usd": "1500.00"
                    }
                  ],
                  "banner_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "business_address": {
                    "city": "Austin",
                    "country": "US",
                    "line1": "4180 Burnet Rd",
                    "line2": "Suite 2",
                    "postal_code": "78756",
                    "state": "TX"
                  },
                  "business_name": "Shine Time Auto Detailing, LLC",
                  "business_type": "software",
                  "can_transfer_pending_balance_to_children": false,
                  "cancellation_policy": {
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
                  "capabilities": {
                    "accept_bank_payments": "active",
                    "accept_bnpl_payments": "active",
                    "accept_card_payments": "active",
                    "bank_deposit": "active",
                    "card_deposit": "active",
                    "card_issuing": "active",
                    "crypto_deposit": "active",
                    "crypto_payout": "active",
                    "instant_payout": "active",
                    "run_ads": "active",
                    "standard_payout": "active",
                    "transfer": "active"
                  },
                  "cards": {
                    "kind": "individual",
                    "status": "approved"
                  },
                  "collect_vat_id": false,
                  "company_formation": {
                    "documents": [
                      {
                        "id": "file_xxxxxxxxxxxxxx",
                        "name": "Articles of Organization",
                        "type": "articles_of_organization",
                        "url": "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                      }
                    ],
                    "ein_registered": false,
                    "legal_name": "Shine Time Auto Detailing, LLC",
                    "signatures": {
                      "form8821": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      },
                      "ss4": {
                        "expires_at": "2026-01-01T12:00:00.000Z",
                        "status": "pending",
                        "url": "https://sign.doola.com/shine-time-auto-detailing/form8821"
                      }
                    },
                    "state_registered": true,
                    "status": "draft"
                  },
                  "country": "us",
                  "created_at": "2026-01-01T12:00:00.000Z",
                  "customers_l30d": 1,
                  "description": "Mobile ceramic coating, paint correction, and interior detailing across the Austin metro.",
                  "direct_reports_count": 0,
                  "dispute_fighter_enabled": false,
                  "economic_intelligence": false,
                  "email": "marcus@shinetime.example",
                  "eula": {
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
                  "external_id": "connected_account_123",
                  "financing": {
                    "application_id": "inrq_xxxxxxxxxxxxxx",
                    "status": "requires_collection"
                  },
                  "funds_release_at": "funds_release_at",
                  "home_preferences": [
                    "hide_member_count"
                  ],
                  "id": "biz_xxxxxxxxxxxxxx",
                  "industry_type": "trading",
                  "invoice_prefix": "INV",
                  "level": {
                    "account_level": 0,
                    "applied_level": 1,
                    "boosted": true,
                    "levels": [
                      {
                        "level": 0,
                        "minimum_spend": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "processing_rate_percentage": 2.7,
                        "regional_rates": [
                          {
                            "processing_rate_percentage": 1.7,
                            "region": "us_and_canada"
                          }
                        ]
                      }
                    ],
                    "monthly_ads_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_card_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_qualifying_spend": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "monthly_trading_volume": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "points": 41000,
                    "points_by_source": {
                      "ads": 0,
                      "cards": 40000,
                      "partners": 0,
                      "trading": 1000
                    },
                    "points_to_next": 59000,
                    "resets_at": "2026-01-01T12:00:00.000Z"
                  },
                  "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "metadata": {
                    "external_id": "connected_account_123"
                  },
                  "onboarding_type": "platform",
                  "opengraph_image_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                  "opengraph_image_variant": "white",
                  "orchestration_enabled": true,
                  "other_business_description": "other_business_description",
                  "other_industry_description": "other_industry_description",
                  "owner": {
                    "id": "user_xxxxxxxxxxxxxx",
                    "name": "Dana Whitfield",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "username": "danawhitfield"
                  },
                  "parent_account": {
                    "fees": {
                      "crypto_swap_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 3
                      },
                      "transfer_markup": {
                        "fixed_fee_usd": 0,
                        "percentage_fee": 0
                      }
                    },
                    "id": "biz_xxxxxxxxxxxxxx",
                    "logo_url": "https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "route": "shine-time-holdings",
                    "title": "Shine Time Holdings"
                  },
                  "partner": {
                    "email": "email",
                    "id": "id",
                    "name": "name",
                    "profile_picture": {
                      "url": "https://ui-avatars.com/api/"
                    },
                    "referring_account": {
                      "id": "biz_xxxxxxxxxxxxxx",
                      "title": "Acme Bookkeeping"
                    },
                    "username": "username",
                    "whop_partner_verified_at": "whop_partner_verified_at"
                  },
                  "payment_controls": {
                    "dispute_alert_auto_refund": {
                      "locked": false,
                      "threshold_usd": 500
                    },
                    "dispute_alert_fee_usd": 29,
                    "enforce_3ds": false,
                    "financing_disabled": false,
                    "high_risk_processing_fee_percentage": 0,
                    "payment_method_warnings": [
                      {
                        "key": "value"
                      }
                    ],
                    "pending_auto_topup_fee_percentage": 2,
                    "pending_balance_delay_days": 0,
                    "reserve": {
                      "hold_period_days": 14,
                      "percentage": 15
                    },
                    "resolution_center_auto_refund": {
                      "card_threshold_usd": 50,
                      "financing_threshold_usd": 25,
                      "locked": false,
                      "paypal_threshold_usd": 40
                    },
                    "restricted_payment_methods": [
                      "card_visa"
                    ],
                    "undated_pending_reason": "kyc_incomplete",
                    "withdrawal_schedule": {
                      "day": 1,
                      "frequency": "manual",
                      "next_payout_date": "next_payout_date"
                    }
                  },
                  "payment_method_configuration": {
                    "disabled": [
                      "card"
                    ],
                    "enabled": [
                      "card"
                    ],
                    "include_platform_defaults": true
                  },
                  "platform_credits": [
                    {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    }
                  ],
                  "privacy_policy": {
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
                  "product_tax_code": {
                    "id": "ptc_xxxxxxxxxxxxxx",
                    "name": "General - Digital Goods",
                    "product_type": "digital"
                  },
                  "recommended_actions": [
                    {
                      "action": "theme_business",
                      "blocked_capabilities": [
                        "blocked_capabilities"
                      ],
                      "cta": "cta",
                      "cta_label": "cta_label",
                      "description": "description",
                      "icon_url": "icon_url",
                      "impact_score": 1,
                      "reasoning": "reasoning",
                      "status": "optional",
                      "title": "title"
                    }
                  ],
                  "require_2fa": false,
                  "required_actions": [
                    {
                      "action": "deposit_funds",
                      "blocked_capabilities": [
                        "standard_payout"
                      ],
                      "cta": "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/",
                      "cta_label": "Verify now",
                      "description": "Complete verification to withdraw your earnings.",
                      "icon_url": "https://whop.com/illustrations/orange/shield.svg",
                      "status": "required",
                      "title": "Complete your identity verification"
                    }
                  ],
                  "return_policy": {
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
                  "rewards": [
                    {
                      "id": "id",
                      "qualification_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_progress": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "qualification_type": "sales",
                      "reward_amount": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "status": "in_progress"
                    }
                  ],
                  "route": "biz_xxxxxxxxxxxxxx",
                  "send_customer_emails": false,
                  "shipping_policy": {
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
                  "show_joined_whops": true,
                  "show_reviews_dtc": true,
                  "show_user_directory": true,
                  "social_links": [
                    {
                      "id": "social_1",
                      "title": "@shinetimedetail",
                      "url": "https://instagram.com/shinetimedetail",
                      "website": "x"
                    }
                  ],
                  "status": "active",
                  "status_reason": "Suspended - Fraudulent activity",
                  "store_page_config": {
                    "accent_color": "ruby",
                    "layout": "featured",
                    "profile_variant": "personal",
                    "whop_affiliate_link": true
                  },
                  "target_audience": "Owners of new and enthusiast vehicles in Austin, TX",
                  "tax_collection_enabled_states": [
                    "TX"
                  ],
                  "tax_identifiers": [
                    {
                      "id": "txid_xxxxxxxxxxxxxx",
                      "tax_id_type": "ad_nrt",
                      "tax_id_value": "DE123456789"
                    }
                  ],
                  "tax_remitted_by": "whop",
                  "tax_type": "inclusive",
                  "terms_of_service": {
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
                  "three_ds_level": "mandate_challenge",
                  "title": "Shine Time Auto Detailing",
                  "total_earned_usd": 0,
                  "total_usd": "50.00",
                  "trading": {
                    "account_id": "account_id",
                    "hyperliquid": {
                      "address": "address",
                      "depositable": "depositable",
                      "margin_summary": {
                        "account_value": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_margin_used": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "total_position_notional": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "withdrawable": {
                          "amount": "-1234.56",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        }
                      },
                      "positions": [
                        {
                          "entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "hyperliquid": {
                            "cumulative_funding": {
                              "all_time": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_change": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              },
                              "since_open": {
                                "amount": "-1234.56",
                                "currency": "usd",
                                "decimals": 2,
                                "display_decimals": 2
                              }
                            },
                            "leverage": {
                              "type": "cross",
                              "value": 1
                            },
                            "liquidation_price": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "margin_used": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "return_on_equity": "return_on_equity"
                          },
                          "id": "id",
                          "market": "market",
                          "object": "trading_position",
                          "position_value": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "side": "long",
                          "size": "size",
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          }
                        }
                      ],
                      "websocket_subscriptions": [
                        {
                          "channel": "clearinghouse_state",
                          "message": "message"
                        }
                      ],
                      "websocket_url": "websocket_url"
                    },
                    "id": "id",
                    "object": "trading_account",
                    "provider": "hyperliquid",
                    "spot": {
                      "holdings": [
                        {
                          "average_entry_price": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "cost_basis": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "market": "market",
                          "realized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "unrealized_pnl_percentage": null
                        }
                      ]
                    },
                    "user_id": "user_id"
                  },
                  "use_logo_as_opengraph_image_fallback": false,
                  "verification": {
                    "business": null,
                    "individual": null
                  },
                  "volume_l30d_usd": 0,
                  "volume_usd": 1.1,
                  "wallet": {
                    "address": "0xabc123",
                    "id": "cwal_xxxxxxxxxxxxxx",
                    "network": "solana"
                  },
                  "website": "https://shinetimedetail.com",
                  "whop_partner_enabled_at": "whop_partner_enabled_at"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = Account(
            adsSpendUsd: Nullable<Double>.value(0),
            balances: [
                AccountBalanceToken(
                    balance: "1500.0",
                    breakdown: AccountBalanceBreakdown(
                        available: "1500.0",
                        finishingSettlement: "0",
                        inTransit: "0",
                        pending: "0",
                        pendingSettlements: [
                            AccountBalanceSettlement(
                                amount: "0.0",
                                date: "2026-01-01"
                            )
                        ],
                        reserve: "0"
                    ),
                    iconUrl: Nullable<String>.value("https://assets.whop.com/tokens/usdt.png"),
                    name: "Tether USD",
                    priceUsd: Nullable<Double>.value(1),
                    symbol: "USDT",
                    valueUsd: Nullable<String>.value("1500.00")
                )
            ],
            bannerImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            businessAddress: Nullable<[String: JSONValue]>.value([
                "city": JSONValue.string("Austin"), 
                "country": JSONValue.string("US"), 
                "line1": JSONValue.string("4180 Burnet Rd"), 
                "line2": JSONValue.string("Suite 2"), 
                "postal_code": JSONValue.string("78756"), 
                "state": JSONValue.string("TX")
            ]),
            businessName: Nullable<String>.value("Shine Time Auto Detailing, LLC"),
            businessType: Nullable<String>.value("software"),
            canTransferPendingBalanceToChildren: false,
            cancellationPolicy: Nullable<File>.value(File(
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
            capabilities: Nullable<AccountCapabilities>.value(AccountCapabilities(
                acceptBankPayments: AccountCapabilitiesAcceptBankPayments.active,
                acceptBnplPayments: AccountCapabilitiesAcceptBnplPayments.active,
                acceptCardPayments: AccountCapabilitiesAcceptCardPayments.active,
                bankDeposit: AccountCapabilitiesBankDeposit.active,
                cardDeposit: AccountCapabilitiesCardDeposit.active,
                cardIssuing: AccountCapabilitiesCardIssuing.active,
                cryptoDeposit: AccountCapabilitiesCryptoDeposit.active,
                cryptoPayout: AccountCapabilitiesCryptoPayout.active,
                instantPayout: AccountCapabilitiesInstantPayout.active,
                runAds: AccountCapabilitiesRunAds.active,
                standardPayout: AccountCapabilitiesStandardPayout.active,
                transfer: AccountCapabilitiesTransfer.active
            )),
            cards: Nullable<AccountCards>.value(AccountCards(
                kind: Nullable<AccountCardsKind>.value(AccountCardsKind.individual),
                status: AccountCardsStatus.approved
            )),
            collectVatId: false,
            companyFormation: AccountCompanyFormation(
                documents: Optional([
                    AccountCompanyFormationDocument(
                        id: "file_xxxxxxxxxxxxxx",
                        name: "Articles of Organization",
                        type: "articles_of_organization",
                        url: "https://whop-assets-example.s3.amazonaws.com/uploads/audio/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
                    )
                ]),
                einRegistered: Optional(false),
                legalName: Optional(Nullable<String>.value("Shine Time Auto Detailing, LLC")),
                signatures: Optional(AccountCompanyFormationSignatures(
                    form8821: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    )),
                    ss4: Optional(AccountCompanyFormationSignatureRequest(
                        expiresAt: Optional("2026-01-01T12:00:00.000Z"),
                        status: AccountCompanyFormationSignatureRequestStatus.pending,
                        url: Optional("https://sign.doola.com/shine-time-auto-detailing/form8821")
                    ))
                )),
                stateRegistered: Optional(true),
                status: Optional(AccountCompanyFormationStatus.draft)
            ),
            country: Nullable<String>.value("us"),
            createdAt: "2026-01-01T12:00:00.000Z",
            customersL30D: Nullable<Int>.value(1),
            description: Nullable<String>.value("Mobile ceramic coating, paint correction, and interior detailing across the Austin metro."),
            directReportsCount: Optional(0),
            disputeFighterEnabled: false,
            economicIntelligence: false,
            email: Nullable<String>.value("marcus@shinetime.example"),
            eula: Nullable<File>.value(File(
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
            externalId: Nullable<String>.value("connected_account_123"),
            financing: Nullable<AccountFinancing>.value(AccountFinancing(
                applicationId: "inrq_xxxxxxxxxxxxxx",
                status: AccountFinancingStatus.requiresCollection
            )),
            fundsReleaseAt: Nullable<String>.value("funds_release_at"),
            homePreferences: [
                AccountHomePreferencesItem.hideMemberCount
            ],
            id: "biz_xxxxxxxxxxxxxx",
            industryType: Nullable<String>.value("trading"),
            invoicePrefix: Nullable<String>.value("INV"),
            level: Nullable<AccountLevel>.value(AccountLevel(
                accountLevel: 0,
                appliedLevel: 1,
                boosted: true,
                levels: [
                    AccountProcessingOfferLevel(
                        level: 0,
                        minimumSpend: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        processingRatePercentage: 2.7,
                        regionalRates: [
                            AccountProcessingOfferRegionalRate(
                                processingRatePercentage: 1.7,
                                region: AccountProcessingOfferRegionalRateRegion.usAndCanada
                            )
                        ]
                    )
                ],
                monthlyAdsSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyCardSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyQualifyingSpend: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                monthlyTradingVolume: Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                ),
                points: 41000,
                pointsBySource: OwnerLevelPoints(
                    ads: 0,
                    cards: 40000,
                    partners: 0,
                    trading: 1000
                ),
                pointsToNext: Nullable<Int>.value(59000),
                resetsAt: "2026-01-01T12:00:00.000Z"
            )),
            logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            metadata: [
                "external_id": JSONValue.string("connected_account_123")
            ],
            onboardingType: Nullable<AccountOnboardingType>.value(AccountOnboardingType.platform),
            opengraphImageUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
            opengraphImageVariant: Nullable<AccountOpengraphImageVariant>.value(AccountOpengraphImageVariant.white),
            orchestrationEnabled: true,
            otherBusinessDescription: Nullable<String>.value("other_business_description"),
            otherIndustryDescription: Nullable<String>.value("other_industry_description"),
            owner: UserSummary(
                id: "user_xxxxxxxxxxxxxx",
                name: Nullable<String>.value("Dana Whitfield"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                username: "danawhitfield"
            ),
            parentAccount: Nullable<AccountParent>.value(AccountParent(
                fees: Optional([
                    "crypto_swap_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 3
                    ), 
                    "transfer_markup": AccountParentFeesValue(
                        fixedFeeUsd: 0,
                        percentageFee: 0
                    )
                ]),
                id: "biz_xxxxxxxxxxxxxx",
                logoUrl: Nullable<String>.value("https://whop-assets-example.s3.amazonaws.com/uploads/image/2026-01-01/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
                route: "shine-time-holdings",
                title: "Shine Time Holdings"
            )),
            partner: Optional(Nullable<AccountPartner>.value(AccountPartner(
                email: Nullable<String>.value("email"),
                id: "id",
                name: Nullable<String>.value("name"),
                profilePicture: UserProfilePicture(
                    url: "https://ui-avatars.com/api/"
                ),
                referringAccount: Nullable<AccountSummary>.value(AccountSummary(
                    id: "biz_xxxxxxxxxxxxxx",
                    title: "Acme Bookkeeping"
                )),
                username: "username",
                whopPartnerVerifiedAt: Nullable<String>.value("whop_partner_verified_at")
            ))),
            paymentControls: Nullable<AccountPaymentControls>.value(AccountPaymentControls(
                disputeAlertAutoRefund: AccountDisputeAlertAutoRefundControl(
                    locked: false,
                    thresholdUsd: Nullable<Double>.value(500)
                ),
                disputeAlertFeeUsd: Nullable<Double>.value(29),
                enforce3Ds: false,
                financingDisabled: false,
                highRiskProcessingFeePercentage: 0,
                paymentMethodWarnings: [
                    [
                        "key": JSONValue.string("value")
                    ]
                ],
                pendingAutoTopupFeePercentage: 2,
                pendingBalanceDelayDays: 0,
                reserve: AccountReserveControl(
                    holdPeriodDays: 14,
                    percentage: Nullable<Double>.value(15)
                ),
                resolutionCenterAutoRefund: AccountResolutionCenterAutoRefundControl(
                    cardThresholdUsd: Nullable<Double>.value(50),
                    financingThresholdUsd: Nullable<Double>.value(25),
                    locked: false,
                    paypalThresholdUsd: Nullable<Double>.value(40)
                ),
                restrictedPaymentMethods: [
                    AccountPaymentControlsRestrictedPaymentMethodsItem.cardVisa
                ],
                undatedPendingReason: Nullable<AccountPaymentControlsUndatedPendingReason>.value(AccountPaymentControlsUndatedPendingReason.kycIncomplete),
                withdrawalSchedule: AccountWithdrawalScheduleControl(
                    day: Nullable<Int>.value(1),
                    frequency: AccountWithdrawalScheduleControlFrequency.manual,
                    nextPayoutDate: Nullable<String>.value("next_payout_date")
                )
            )),
            paymentMethodConfiguration: Nullable<CheckoutSessionPaymentMethodConfiguration>.value(CheckoutSessionPaymentMethodConfiguration(
                disabled: [
                    "card"
                ],
                enabled: [
                    "card"
                ],
                includePlatformDefaults: true
            )),
            platformCredits: [
                Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )
            ],
            privacyPolicy: Nullable<File>.value(File(
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
            productTaxCode: Nullable<[String: JSONValue]>.value([
                "id": JSONValue.string("ptc_xxxxxxxxxxxxxx"), 
                "name": JSONValue.string("General - Digital Goods"), 
                "product_type": JSONValue.string("digital")
            ]),
            recommendedActions: Nullable<[AccountRecommendedAction]>.value([
                AccountRecommendedAction(
                    action: AccountRecommendedActionAction.themeBusiness,
                    blockedCapabilities: [
                        "blocked_capabilities"
                    ],
                    cta: "cta",
                    ctaLabel: "cta_label",
                    description: "description",
                    iconUrl: Nullable<String>.value("icon_url"),
                    impactScore: Nullable<Int>.value(1),
                    reasoning: Nullable<String>.value("reasoning"),
                    status: AccountRecommendedActionStatus.optional,
                    title: "title"
                )
            ]),
            require2Fa: false,
            requiredActions: Nullable<[AccountRequiredAction]>.value([
                AccountRequiredAction(
                    action: AccountRequiredActionAction.depositFunds,
                    blockedCapabilities: [
                        "standard_payout"
                    ],
                    cta: Nullable<String>.value("https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/balance/"),
                    ctaLabel: "Verify now",
                    description: "Complete verification to withdraw your earnings.",
                    iconUrl: Nullable<String>.value("https://whop.com/illustrations/orange/shield.svg"),
                    status: AccountRequiredActionStatus.required,
                    title: "Complete your identity verification"
                )
            ]),
            returnPolicy: Nullable<File>.value(File(
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
            rewards: Optional([
                AccountPartnerReward(
                    id: "id",
                    qualificationAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationProgress: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    qualificationType: AccountPartnerRewardQualificationType.sales,
                    rewardAmount: Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    ),
                    status: AccountPartnerRewardStatus.inProgress
                )
            ]),
            route: "biz_xxxxxxxxxxxxxx",
            sendCustomerEmails: false,
            shippingPolicy: Nullable<File>.value(File(
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
            showJoinedWhops: true,
            showReviewsDtc: true,
            showUserDirectory: true,
            socialLinks: [
                AccountSocialLink(
                    id: "social_1",
                    title: Nullable<String>.value("@shinetimedetail"),
                    url: "https://instagram.com/shinetimedetail",
                    website: AccountSocialLinkWebsite.x
                )
            ],
            status: Nullable<String>.value("active"),
            statusReason: Nullable<String>.value("Suspended - Fraudulent activity"),
            storePageConfig: AccountStorePageConfig(
                accentColor: Nullable<AccountStorePageConfigAccentColor>.value(AccountStorePageConfigAccentColor.ruby),
                layout: Nullable<AccountStorePageConfigLayout>.value(AccountStorePageConfigLayout.featured),
                profileVariant: Nullable<AccountStorePageConfigProfileVariant>.value(AccountStorePageConfigProfileVariant.personal),
                whopAffiliateLink: true
            ),
            targetAudience: Nullable<String>.value("Owners of new and enthusiast vehicles in Austin, TX"),
            taxCollectionEnabledStates: [
                "TX"
            ],
            taxIdentifiers: [
                AccountTaxIdentifier(
                    id: "txid_xxxxxxxxxxxxxx",
                    taxIdType: AccountTaxIdentifierTaxIdType.adNrt,
                    taxIdValue: "DE123456789"
                )
            ],
            taxRemittedBy: Nullable<AccountTaxRemittedBy>.value(AccountTaxRemittedBy.whop),
            taxType: Nullable<AccountTaxType>.value(AccountTaxType.inclusive),
            termsOfService: Nullable<File>.value(File(
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
            threeDsLevel: Nullable<AccountThreeDsLevel>.value(AccountThreeDsLevel.mandateChallenge),
            title: "Shine Time Auto Detailing",
            totalEarnedUsd: Nullable<Double>.value(0),
            totalUsd: Nullable<String>.value("50.00"),
            trading: Nullable<TradingAccount>.value(TradingAccount(
                accountId: Nullable<String>.value("account_id"),
                hyperliquid: Nullable<TradingHyperliquidAccount>.value(TradingHyperliquidAccount(
                    address: "address",
                    depositable: Nullable<String>.value("depositable"),
                    marginSummary: Nullable<TradingMarginSummary>.value(TradingMarginSummary(
                        accountValue: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalMarginUsed: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        totalPositionNotional: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        ),
                        withdrawable: Money(
                            amount: "-1234.56",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )
                    )),
                    positions: Nullable<[TradingPosition]>.value([
                        TradingPosition(
                            entryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            hyperliquid: Nullable<TradingHyperliquidPosition>.value(TradingHyperliquidPosition(
                                cumulativeFunding: TradingCumulativeFunding(
                                    allTime: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceChange: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    )),
                                    sinceOpen: Nullable<Money>.value(Money(
                                        amount: "-1234.56",
                                        currency: "usd",
                                        decimals: 2,
                                        displayDecimals: 2
                                    ))
                                ),
                                leverage: TradingPositionLeverage(
                                    type: TradingPositionLeverageType.cross,
                                    value: 1
                                ),
                                liquidationPrice: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                marginUsed: Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                ),
                                returnOnEquity: "return_on_equity"
                            )),
                            id: "id",
                            market: "market",
                            object: TradingPositionObject.tradingPosition,
                            positionValue: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            side: TradingPositionSide.long,
                            size: "size",
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )
                        )
                    ]),
                    websocketSubscriptions: [
                        TradingWebsocketSubscription(
                            channel: TradingWebsocketSubscriptionChannel.clearinghouseState,
                            message: "message"
                        )
                    ],
                    websocketUrl: "websocket_url"
                )),
                id: "id",
                object: TradingAccountObject.tradingAccount,
                provider: TradingAccountProvider.hyperliquid,
                spot: Nullable<TradingSpotAccount>.value(TradingSpotAccount(
                    holdings: [
                        TradingSpotHolding(
                            averageEntryPrice: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            costBasis: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            market: "market",
                            realizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnl: Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            ),
                            unrealizedPnlPercentage: .null
                        )
                    ]
                )),
                userId: Nullable<String>.value("user_id")
            )),
            useLogoAsOpengraphImageFallback: false,
            verification: [
                "business": JSONValue.value, 
                "individual": JSONValue.value
            ],
            volumeL30DUsd: Nullable<Double>.value(0),
            volumeUsd: Nullable<Double>.value(1.1),
            wallet: Nullable<AccountWallet>.value(AccountWallet(
                address: "0xabc123",
                id: "cwal_xxxxxxxxxxxxxx",
                network: AccountWalletNetwork.solana
            )),
            website: Nullable<String>.value("https://shinetimedetail.com"),
            whopPartnerEnabledAt: Optional(Nullable<String>.value("whop_partner_enabled_at"))
        )
        let response = try await client.accounts.suspend(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func transferOwnership1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = TransferOwnershipAccountsResponse(
            success: true
        )
        let response = try await client.accounts.transferOwnership(
            id: "id",
            request: .init(identifier: "marcus@shinetime.example"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}