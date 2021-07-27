"""Dependency specific initialization."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def deps(repo_mapping = {}):
    rules_foreign_cc_dependencies()

    if "com_github_libuv" not in native.existing_rules():
        http_archive(
            name = "com_github_libuv",
            url = "https://github.com/libuv/libuv/archive/<commit>.tar.gz",
            sha256 = "<sha256-digest>",
            strip_prefix = "libuv-<commit>",
            repo_mapping = repo_mapping,
            build_file = "@com_github_3rdparty_bazel_rules_libuv//:BUILD.bazel",
        )



