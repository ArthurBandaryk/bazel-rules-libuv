"""Adds repostories/archives."""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repos(external = True, repo_mapping = {}):
    if "rules_foreign_cc" not in native.existing_rules():
        http_archive(
            name = "rules_foreign_cc",
            url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.2.0.tar.gz",
            sha256 = "d54742ffbdc6924f222d2179f0e10e911c5c659c4ae74158e9fe827aad862ac6",
            strip_prefix = "rules_foreign_cc-0.2.0",
            repo_mapping = repo_mapping,
        )

    if external and "com_github_3rdparty_bazel_rules_libuv" not in native.existing_rules():
        git_repository(
            name = "com_github_3rdparty_bazel_rules_libuv",
            #remote = "https://github.com/3rdparty/bazel-rules-libuv",
            remote = "https://github.com/ArthurBandaryk/bazel-rules-libuv",
            commit = "6411a9dbc82ccabb96ec9871df4a5dace306c5b2",
            #commit = "ab0723132f0020f8e642bd4952e1d6ada09198d8",
            # shallow_since = "1620093785 -0700",
            repo_mapping = repo_mapping,
        )

