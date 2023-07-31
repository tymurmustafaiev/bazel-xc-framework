load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "PerformerSDK",
    srcs = glob(["*.swift"]),
    module_name = "PerformerSDK",
    private_deps = [
        "//Interactor:InteractorSDK",
    ],
    visibility = ["//visibility:public"],
)
