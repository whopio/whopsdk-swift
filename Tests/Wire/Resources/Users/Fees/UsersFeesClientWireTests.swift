import Foundation
import Testing
import WhopSDK

@Suite("UsersFeesClient Wire Tests") struct UsersFeesClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "bank_deposit": {
                    "adjustable": true,
                    "category": "payments",
                    "default": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "ends_at": "2026-01-01T12:00:00.000Z",
                    "fixed": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "maximum": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "minimum": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "percentage": 2.4,
                    "region": "usa",
                    "regions": {
                      "ar": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "au": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      },
                      "br": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 8
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 30
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 0
                        },
                        "percentage": 8,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 8
                        },
                        "source": "default"
                      },
                      "ca": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.4
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      },
                      "cl": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "co": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "do": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.7
                        },
                        "percentage": 4.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "source": "default"
                      },
                      "eu": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.5,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.6
                        },
                        "source": "custom"
                      },
                      "mx": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "pe": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.7
                        },
                        "percentage": 4.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "source": "default"
                      },
                      "sv": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.7
                        },
                        "percentage": 3.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.9
                        },
                        "source": "default"
                      },
                      "uk": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      }
                    },
                    "reset": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "source": "default",
                    "unadjustable_reason": "not_permitted"
                  },
                  "payouts": {
                    "bank_wire": {
                      "adjustable": false,
                      "category": "payouts",
                      "default": {
                        "fixed": {
                          "amount": "30.00",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": null
                      },
                      "ends_at": null,
                      "fixed": {
                        "amount": "30.00",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "maximum": null,
                      "minimum": null,
                      "percentage": null,
                      "region": null,
                      "regions": {
                        "key": {
                          "default": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "fixed": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "maximum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "minimum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "percentage": null,
                          "reset": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "source": null
                        }
                      },
                      "reset": {
                        "fixed": {
                          "amount": "30.00",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": null
                      },
                      "source": "default",
                      "unadjustable_reason": "not_permitted"
                    },
                    "crypto": {
                      "adjustable": false,
                      "category": "payouts",
                      "default": {
                        "fixed": null,
                        "percentage": 0
                      },
                      "ends_at": null,
                      "fixed": null,
                      "maximum": null,
                      "minimum": null,
                      "percentage": 0,
                      "region": null,
                      "regions": {
                        "key": {
                          "default": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "fixed": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "maximum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "minimum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "percentage": null,
                          "reset": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "source": null
                        }
                      },
                      "reset": {
                        "fixed": null,
                        "percentage": 0
                      },
                      "source": "default",
                      "unadjustable_reason": "not_permitted"
                    },
                    "digital_wallet": {
                      "adjustable": false,
                      "category": "payouts",
                      "default": {
                        "fixed": {
                          "amount": "0.00",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": 0
                      },
                      "ends_at": null,
                      "fixed": {
                        "amount": "0.00",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "maximum": null,
                      "minimum": null,
                      "percentage": 0,
                      "region": null,
                      "regions": {
                        "key": {
                          "default": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "fixed": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "maximum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "minimum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "percentage": null,
                          "reset": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "source": null
                        }
                      },
                      "reset": {
                        "fixed": {
                          "amount": "0.00",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": 0
                      },
                      "source": "default",
                      "unadjustable_reason": "not_permitted"
                    },
                    "next_day_bank": {
                      "adjustable": false,
                      "category": "payouts",
                      "default": {
                        "fixed": {
                          "amount": "2.50",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": null
                      },
                      "ends_at": null,
                      "fixed": {
                        "amount": "2.50",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "maximum": null,
                      "minimum": null,
                      "percentage": null,
                      "region": null,
                      "regions": {
                        "key": {
                          "default": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "fixed": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "maximum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "minimum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "percentage": null,
                          "reset": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "source": null
                        }
                      },
                      "reset": {
                        "fixed": {
                          "amount": "2.50",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": null
                      },
                      "source": "default",
                      "unadjustable_reason": "not_permitted"
                    },
                    "rtp": {
                      "adjustable": false,
                      "category": "payouts",
                      "default": {
                        "fixed": {
                          "amount": "0.00",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": 0
                      },
                      "ends_at": null,
                      "fixed": {
                        "amount": "0.00",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "maximum": null,
                      "minimum": null,
                      "percentage": 0,
                      "region": null,
                      "regions": {
                        "key": {
                          "default": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "fixed": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "maximum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "minimum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "percentage": null,
                          "reset": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "source": null
                        }
                      },
                      "reset": {
                        "fixed": {
                          "amount": "0.00",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": 0
                      },
                      "source": "default",
                      "unadjustable_reason": "not_permitted"
                    },
                    "same_day_bank": {
                      "adjustable": false,
                      "category": "payouts",
                      "default": {
                        "fixed": {
                          "amount": "2.50",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": null
                      },
                      "ends_at": null,
                      "fixed": {
                        "amount": "2.50",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "maximum": null,
                      "minimum": null,
                      "percentage": null,
                      "region": null,
                      "regions": {
                        "key": {
                          "default": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "fixed": {
                            "amount": "-1234.56",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "maximum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "minimum": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "percentage": null,
                          "reset": {
                            "fixed": {
                              "amount": "-1234.56",
                              "currency": "usd",
                              "decimals": 2,
                              "display_decimals": 2
                            },
                            "percentage": 0
                          },
                          "source": null
                        }
                      },
                      "reset": {
                        "fixed": {
                          "amount": "2.50",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "percentage": null
                      },
                      "source": "default",
                      "unadjustable_reason": "not_permitted"
                    }
                  },
                  "pending_auto_topup": {
                    "adjustable": true,
                    "category": "payments",
                    "default": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "ends_at": "2026-01-01T12:00:00.000Z",
                    "fixed": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "maximum": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "minimum": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "percentage": 2.4,
                    "region": "usa",
                    "regions": {
                      "ar": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "au": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      },
                      "br": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 8
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 30
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 0
                        },
                        "percentage": 8,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 8
                        },
                        "source": "default"
                      },
                      "ca": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.4
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      },
                      "cl": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "co": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "do": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.7
                        },
                        "percentage": 4.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "source": "default"
                      },
                      "eu": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.5,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.6
                        },
                        "source": "custom"
                      },
                      "mx": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "pe": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.7
                        },
                        "percentage": 4.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "source": "default"
                      },
                      "sv": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.7
                        },
                        "percentage": 3.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.9
                        },
                        "source": "default"
                      },
                      "uk": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      }
                    },
                    "reset": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "source": "default",
                    "unadjustable_reason": "not_permitted"
                  },
                  "transfers": {
                    "adjustable": true,
                    "category": "payments",
                    "default": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "ends_at": "2026-01-01T12:00:00.000Z",
                    "fixed": {
                      "amount": "-1234.56",
                      "currency": "usd",
                      "decimals": 2,
                      "display_decimals": 2
                    },
                    "maximum": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "minimum": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "percentage": 2.4,
                    "region": "usa",
                    "regions": {
                      "ar": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "au": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      },
                      "br": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 8
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 30
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 0
                        },
                        "percentage": 8,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 8
                        },
                        "source": "default"
                      },
                      "ca": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.4
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      },
                      "cl": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "co": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "do": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.7
                        },
                        "percentage": 4.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "source": "default"
                      },
                      "eu": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.5,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.6
                        },
                        "source": "custom"
                      },
                      "mx": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "percentage": 2.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.9
                        },
                        "source": "default"
                      },
                      "pe": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.7
                        },
                        "percentage": 4.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 4.9
                        },
                        "source": "default"
                      },
                      "sv": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.9
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.7
                        },
                        "percentage": 3.9,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 3.9
                        },
                        "source": "default"
                      },
                      "uk": {
                        "default": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "fixed": {
                          "amount": "0.30",
                          "currency": "usd",
                          "decimals": 2,
                          "display_decimals": 2
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "1.00",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 10
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 1.5
                        },
                        "percentage": 2.7,
                        "reset": {
                          "fixed": {
                            "amount": "0.30",
                            "currency": "usd",
                            "decimals": 2,
                            "display_decimals": 2
                          },
                          "percentage": 2.7
                        },
                        "source": "default"
                      }
                    },
                    "reset": {
                      "fixed": {
                        "amount": "-1234.56",
                        "currency": "usd",
                        "decimals": 2,
                        "display_decimals": 2
                      },
                      "percentage": 0
                    },
                    "source": "default",
                    "unadjustable_reason": "not_permitted"
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
        let expectedResponse = UserFees(
            bankDeposit: AccountFee(
                adjustable: true,
                category: AccountFeeCategory.payments,
                default: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                ),
                endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                fixed: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                )),
                minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                )),
                percentage: Nullable<Double>.value(2.4),
                region: Nullable<AccountFeeRegion>.value(AccountFeeRegion.usa),
                regions: [
                    "ar": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "au": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "br": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(8)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(30)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(0)
                        )),
                        percentage: Nullable<Double>.value(8),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(8)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "ca": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.4)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "cl": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "co": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "do": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.7)
                        )),
                        percentage: Nullable<Double>.value(4.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "eu": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.5),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.6)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.custom)
                    ), 
                    "mx": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "pe": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.7)
                        )),
                        percentage: Nullable<Double>.value(4.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "sv": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.7)
                        )),
                        percentage: Nullable<Double>.value(3.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "uk": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    )
                ],
                reset: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                ),
                source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
            ),
            payouts: [
                "bank_wire": AccountFee(
                    adjustable: false,
                    category: AccountFeeCategory.payouts,
                    default: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "30.00",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: .null
                    ),
                    endsAt: .null,
                    fixed: Nullable<Money>.value(Money(
                        amount: "30.00",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    maximum: .null,
                    minimum: .null,
                    percentage: .null,
                    region: .null,
                    regions: [
                        "key": AccountFeeRegionalRate(
                            default: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            fixed: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            percentage: .null,
                            reset: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            source: .null
                        )
                    ],
                    reset: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "30.00",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: .null
                    ),
                    source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                    unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
                ), 
                "crypto": AccountFee(
                    adjustable: false,
                    category: AccountFeeCategory.payouts,
                    default: AccountFeeRate(
                        fixed: .null,
                        percentage: Nullable<Double>.value(0)
                    ),
                    endsAt: .null,
                    fixed: .null,
                    maximum: .null,
                    minimum: .null,
                    percentage: Nullable<Double>.value(0),
                    region: .null,
                    regions: [
                        "key": AccountFeeRegionalRate(
                            default: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            fixed: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            percentage: .null,
                            reset: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            source: .null
                        )
                    ],
                    reset: AccountFeeRate(
                        fixed: .null,
                        percentage: Nullable<Double>.value(0)
                    ),
                    source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                    unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
                ), 
                "digital_wallet": AccountFee(
                    adjustable: false,
                    category: AccountFeeCategory.payouts,
                    default: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.00",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: Nullable<Double>.value(0)
                    ),
                    endsAt: .null,
                    fixed: Nullable<Money>.value(Money(
                        amount: "0.00",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    maximum: .null,
                    minimum: .null,
                    percentage: Nullable<Double>.value(0),
                    region: .null,
                    regions: [
                        "key": AccountFeeRegionalRate(
                            default: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            fixed: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            percentage: .null,
                            reset: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            source: .null
                        )
                    ],
                    reset: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.00",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: Nullable<Double>.value(0)
                    ),
                    source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                    unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
                ), 
                "next_day_bank": AccountFee(
                    adjustable: false,
                    category: AccountFeeCategory.payouts,
                    default: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "2.50",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: .null
                    ),
                    endsAt: .null,
                    fixed: Nullable<Money>.value(Money(
                        amount: "2.50",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    maximum: .null,
                    minimum: .null,
                    percentage: .null,
                    region: .null,
                    regions: [
                        "key": AccountFeeRegionalRate(
                            default: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            fixed: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            percentage: .null,
                            reset: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            source: .null
                        )
                    ],
                    reset: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "2.50",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: .null
                    ),
                    source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                    unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
                ), 
                "rtp": AccountFee(
                    adjustable: false,
                    category: AccountFeeCategory.payouts,
                    default: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.00",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: Nullable<Double>.value(0)
                    ),
                    endsAt: .null,
                    fixed: Nullable<Money>.value(Money(
                        amount: "0.00",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    maximum: .null,
                    minimum: .null,
                    percentage: Nullable<Double>.value(0),
                    region: .null,
                    regions: [
                        "key": AccountFeeRegionalRate(
                            default: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            fixed: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            percentage: .null,
                            reset: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            source: .null
                        )
                    ],
                    reset: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.00",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: Nullable<Double>.value(0)
                    ),
                    source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                    unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
                ), 
                "same_day_bank": AccountFee(
                    adjustable: false,
                    category: AccountFeeCategory.payouts,
                    default: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "2.50",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: .null
                    ),
                    endsAt: .null,
                    fixed: Nullable<Money>.value(Money(
                        amount: "2.50",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    maximum: .null,
                    minimum: .null,
                    percentage: .null,
                    region: .null,
                    regions: [
                        "key": AccountFeeRegionalRate(
                            default: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            fixed: Nullable<Money>.value(Money(
                                amount: "-1234.56",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            )),
                            percentage: .null,
                            reset: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "-1234.56",
                                    currency: "usd",
                                    decimals: 2,
                                    displayDecimals: 2
                                )),
                                percentage: Nullable<Double>.value(0)
                            ),
                            source: .null
                        )
                    ],
                    reset: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "2.50",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        percentage: .null
                    ),
                    source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                    unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
                )
            ],
            pendingAutoTopup: AccountFee(
                adjustable: true,
                category: AccountFeeCategory.payments,
                default: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                ),
                endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                fixed: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                )),
                minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                )),
                percentage: Nullable<Double>.value(2.4),
                region: Nullable<AccountFeeRegion>.value(AccountFeeRegion.usa),
                regions: [
                    "ar": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "au": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "br": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(8)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(30)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(0)
                        )),
                        percentage: Nullable<Double>.value(8),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(8)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "ca": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.4)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "cl": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "co": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "do": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.7)
                        )),
                        percentage: Nullable<Double>.value(4.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "eu": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.5),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.6)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.custom)
                    ), 
                    "mx": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "pe": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.7)
                        )),
                        percentage: Nullable<Double>.value(4.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "sv": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.7)
                        )),
                        percentage: Nullable<Double>.value(3.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "uk": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    )
                ],
                reset: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                ),
                source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
            ),
            transfers: AccountFee(
                adjustable: true,
                category: AccountFeeCategory.payments,
                default: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                ),
                endsAt: Nullable<String>.value("2026-01-01T12:00:00.000Z"),
                fixed: Nullable<Money>.value(Money(
                    amount: "-1234.56",
                    currency: "usd",
                    decimals: 2,
                    displayDecimals: 2
                )),
                maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                )),
                minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                )),
                percentage: Nullable<Double>.value(2.4),
                region: Nullable<AccountFeeRegion>.value(AccountFeeRegion.usa),
                regions: [
                    "ar": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "au": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "br": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(8)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(30)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(0)
                        )),
                        percentage: Nullable<Double>.value(8),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(8)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "ca": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.4)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "cl": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "co": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "do": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.7)
                        )),
                        percentage: Nullable<Double>.value(4.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "eu": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.5),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.6)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.custom)
                    ), 
                    "mx": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        )),
                        percentage: Nullable<Double>.value(2.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "pe": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.7)
                        )),
                        percentage: Nullable<Double>.value(4.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(4.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "sv": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.9)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.7)
                        )),
                        percentage: Nullable<Double>.value(3.9),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(3.9)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    ), 
                    "uk": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "0.30",
                            currency: "usd",
                            decimals: 2,
                            displayDecimals: 2
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "1.00",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(10)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(1.5)
                        )),
                        percentage: Nullable<Double>.value(2.7),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "0.30",
                                currency: "usd",
                                decimals: 2,
                                displayDecimals: 2
                            )),
                            percentage: Nullable<Double>.value(2.7)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    )
                ],
                reset: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "-1234.56",
                        currency: "usd",
                        decimals: 2,
                        displayDecimals: 2
                    )),
                    percentage: Nullable<Double>.value(0)
                ),
                source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
            ),
            userId: "user_xxxxxxxxxxxxxx"
        )
        let response = try await client.users.fees.retrieve(
            userId: "user_id",
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
                  "bank_deposit": {
                    "adjustable": true,
                    "category": "payments",
                    "default": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "ends_at": "ends_at",
                    "fixed": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "maximum": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "minimum": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "percentage": 1.1,
                    "region": "usa",
                    "regions": {
                      "regions": {
                        "default": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "percentage": 1.1,
                        "reset": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "source": "default"
                      }
                    },
                    "reset": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "source": "default",
                    "unadjustable_reason": "not_permitted"
                  },
                  "payouts": {
                    "payouts": {
                      "adjustable": true,
                      "category": "payments",
                      "default": {
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "percentage": 1.1
                      },
                      "ends_at": "ends_at",
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "maximum": {
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "percentage": 1.1
                      },
                      "minimum": {
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "percentage": 1.1
                      },
                      "percentage": 1.1,
                      "region": "usa",
                      "regions": {
                        "regions": {
                          "default": {
                            "fixed": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "percentage": 1.1
                          },
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "maximum": {
                            "fixed": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "percentage": 1.1
                          },
                          "minimum": {
                            "fixed": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "percentage": 1.1
                          },
                          "percentage": 1.1,
                          "reset": {
                            "fixed": {
                              "amount": "amount",
                              "currency": "currency",
                              "decimals": 1,
                              "display_decimals": 1
                            },
                            "percentage": 1.1
                          },
                          "source": "default"
                        }
                      },
                      "reset": {
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "percentage": 1.1
                      },
                      "source": "default",
                      "unadjustable_reason": "not_permitted"
                    }
                  },
                  "pending_auto_topup": {
                    "adjustable": true,
                    "category": "payments",
                    "default": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "ends_at": "ends_at",
                    "fixed": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "maximum": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "minimum": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "percentage": 1.1,
                    "region": "usa",
                    "regions": {
                      "regions": {
                        "default": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "percentage": 1.1,
                        "reset": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "source": "default"
                      }
                    },
                    "reset": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "source": "default",
                    "unadjustable_reason": "not_permitted"
                  },
                  "transfers": {
                    "adjustable": true,
                    "category": "payments",
                    "default": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "ends_at": "ends_at",
                    "fixed": {
                      "amount": "amount",
                      "currency": "currency",
                      "decimals": 1,
                      "display_decimals": 1
                    },
                    "maximum": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "minimum": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "percentage": 1.1,
                    "region": "usa",
                    "regions": {
                      "regions": {
                        "default": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "fixed": {
                          "amount": "amount",
                          "currency": "currency",
                          "decimals": 1,
                          "display_decimals": 1
                        },
                        "maximum": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "minimum": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "percentage": 1.1,
                        "reset": {
                          "fixed": {
                            "amount": "amount",
                            "currency": "currency",
                            "decimals": 1,
                            "display_decimals": 1
                          },
                          "percentage": 1.1
                        },
                        "source": "default"
                      }
                    },
                    "reset": {
                      "fixed": {
                        "amount": "amount",
                        "currency": "currency",
                        "decimals": 1,
                        "display_decimals": 1
                      },
                      "percentage": 1.1
                    },
                    "source": "default",
                    "unadjustable_reason": "not_permitted"
                  },
                  "user_id": "user_id"
                }
                """#.utf8
            )
        )
        let client = Whop(
            baseURL: "https://api.fern.com",
            token: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = UserFees(
            bankDeposit: AccountFee(
                adjustable: true,
                category: AccountFeeCategory.payments,
                default: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                ),
                endsAt: Nullable<String>.value("ends_at"),
                fixed: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                )),
                minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                )),
                percentage: Nullable<Double>.value(1.1),
                region: Nullable<AccountFeeRegion>.value(AccountFeeRegion.usa),
                regions: [
                    "regions": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        )),
                        percentage: Nullable<Double>.value(1.1),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    )
                ],
                reset: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                ),
                source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
            ),
            payouts: [
                "payouts": AccountFee(
                    adjustable: true,
                    category: AccountFeeCategory.payments,
                    default: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        percentage: Nullable<Double>.value(1.1)
                    ),
                    endsAt: Nullable<String>.value("ends_at"),
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        percentage: Nullable<Double>.value(1.1)
                    )),
                    minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        percentage: Nullable<Double>.value(1.1)
                    )),
                    percentage: Nullable<Double>.value(1.1),
                    region: Nullable<AccountFeeRegion>.value(AccountFeeRegion.usa),
                    regions: [
                        "regions": AccountFeeRegionalRate(
                            default: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                )),
                                percentage: Nullable<Double>.value(1.1)
                            ),
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                )),
                                percentage: Nullable<Double>.value(1.1)
                            )),
                            minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                )),
                                percentage: Nullable<Double>.value(1.1)
                            )),
                            percentage: Nullable<Double>.value(1.1),
                            reset: AccountFeeRate(
                                fixed: Nullable<Money>.value(Money(
                                    amount: "amount",
                                    currency: "currency",
                                    decimals: 1,
                                    displayDecimals: 1
                                )),
                                percentage: Nullable<Double>.value(1.1)
                            ),
                            source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                        )
                    ],
                    reset: AccountFeeRate(
                        fixed: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        percentage: Nullable<Double>.value(1.1)
                    ),
                    source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                    unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
                )
            ],
            pendingAutoTopup: AccountFee(
                adjustable: true,
                category: AccountFeeCategory.payments,
                default: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                ),
                endsAt: Nullable<String>.value("ends_at"),
                fixed: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                )),
                minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                )),
                percentage: Nullable<Double>.value(1.1),
                region: Nullable<AccountFeeRegion>.value(AccountFeeRegion.usa),
                regions: [
                    "regions": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        )),
                        percentage: Nullable<Double>.value(1.1),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    )
                ],
                reset: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                ),
                source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
            ),
            transfers: AccountFee(
                adjustable: true,
                category: AccountFeeCategory.payments,
                default: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                ),
                endsAt: Nullable<String>.value("ends_at"),
                fixed: Nullable<Money>.value(Money(
                    amount: "amount",
                    currency: "currency",
                    decimals: 1,
                    displayDecimals: 1
                )),
                maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                )),
                minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                )),
                percentage: Nullable<Double>.value(1.1),
                region: Nullable<AccountFeeRegion>.value(AccountFeeRegion.usa),
                regions: [
                    "regions": AccountFeeRegionalRate(
                        default: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        ),
                        fixed: Nullable<Money>.value(Money(
                            amount: "amount",
                            currency: "currency",
                            decimals: 1,
                            displayDecimals: 1
                        )),
                        maximum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        )),
                        minimum: Nullable<AccountFeeRate>.value(AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        )),
                        percentage: Nullable<Double>.value(1.1),
                        reset: AccountFeeRate(
                            fixed: Nullable<Money>.value(Money(
                                amount: "amount",
                                currency: "currency",
                                decimals: 1,
                                displayDecimals: 1
                            )),
                            percentage: Nullable<Double>.value(1.1)
                        ),
                        source: Nullable<AccountFeeRegionalRateSource>.value(AccountFeeRegionalRateSource.default)
                    )
                ],
                reset: AccountFeeRate(
                    fixed: Nullable<Money>.value(Money(
                        amount: "amount",
                        currency: "currency",
                        decimals: 1,
                        displayDecimals: 1
                    )),
                    percentage: Nullable<Double>.value(1.1)
                ),
                source: Nullable<AccountFeeSource>.value(AccountFeeSource.default),
                unadjustableReason: Nullable<AccountFeeUnadjustableReason>.value(AccountFeeUnadjustableReason.notPermitted)
            ),
            userId: "user_id"
        )
        let response = try await client.users.fees.retrieve(
            userId: "user_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}