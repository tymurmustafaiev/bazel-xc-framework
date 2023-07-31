load("@build_bazel_rules_apple//apple/internal:xcframework_rules.bzl", "apple_static_xcframework")

apple_static_xcframework(
    name = "PerformerFramework",
    bundle_name = "PerformerSDK",
    ios = {
        "simulator": [
            "arm64",
            "x86_64",
        ],
        "device": [
            "arm64",
        ],
    },
    minimum_os_versions = {
        "ios": "13.0",
    },
    deps = [
        "//Performer:PerformerSDK",
    ],
)
