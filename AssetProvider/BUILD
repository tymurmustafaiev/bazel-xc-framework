load("@build_bazel_rules_ios//rules:framework.bzl", "apple_framework")

apple_framework(
    name = "AssetProvider",
    srcs = glob(["*.swift"]),
    data = glob([
        "Resources/Assets.xcassets/**",
    ]),
    link_dynamic = False,
    module_name = "AssetProvider",
    platforms = {"ios": "13.0"},
    sdk_frameworks = [
        "UIKit",
    ],
    visibility = ["//visibility:public"],
)
