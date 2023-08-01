load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_ios//rules:framework.bzl", "apple_framework")

# Mixed framework with both objc and swift code
apple_framework(
    name = "Reader",
    srcs = glob(
        [
            "*.swift",
            "*.m",
            "*.h",
        ],
    ),
    link_dynamic = False,
    module_name = "Reader",
    visibility = ["//visibility:public"],
)
