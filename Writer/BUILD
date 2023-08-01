load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_ios//rules:framework.bzl", "apple_framework")

apple_framework(
    name = "Writer",
    srcs = glob(["*.swift"]),
    link_dynamic = False,
    module_name = "Writer",
    visibility = ["//visibility:public"],
)
