**[English](CHANGELOG.md)** | **[繁體中文](CHANGELOG.zh-TW.md)** | **[简体中文](CHANGELOG.zh-CN.md)** | **[日本語](CHANGELOG.ja.md)**

# Changelog

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed
- revert display mount to XDG_RUNTIME_DIR:rw
- use tmpfs for XDG_RUNTIME_DIR + Wayland socket mount

## [v2.0.0] - 2026-03-28

### Added
- migrate from docker_setup_helper to template
- add Wayland display support for X11/Wayland dual compatibility

### Changed
- remove docker_setup_helper subtree and local CI workflows

## [v1.6.2] - 2026-03-25

### Added
- add docker_setup_helper version check in CI (#6)

## [v1.6.1] - 2026-03-25

### Fixed
- update README test counts and subtree version (#5)

## [v1.6.0] - 2026-03-25

### Added
- auto-detect language from system LANG env var (#4)

### Changed
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from ea8a994..4e7b249

## [v1.5.2] - 2026-03-25

### Fixed
- update README directory structure, test counts, and release archive (#3)

## [v1.5.1] - 2026-03-24

### Added
- add --lang flag and i18n to build/run/exec/stop scripts (#2)

## [v1.5.0] - 2026-03-24

### Added
- add subtree usage docs and i18n update (#1)
- add config symlink to docker_setup_helper/src/config

### Changed
- move smoke/ to test/smoke/
- move READMEs to doc/, entrypoint.sh to script/

## [v1.4.0] - 2026-03-20

### Changed
- test: add script_help.bats for shell script -h/--help tests

## [v1.3.1] - 2026-03-19

### Added
- add stop.sh for stopping background containers

## [v1.3.0] - 2026-03-19

### Added
- auto down before up -d, remove stop.sh
- add stop.sh to clean up background containers

### Changed
- exec.sh use -t flag for target, args as command

## [v1.2.1] - 2026-03-19

### Changed
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from 3c969ca..e29f35a
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from 3bafb77..3c969ca
- remove lint-worker.yaml, lint runs in Dockerfile test stage

## [v1.2.0] - 2026-03-19

### Added
- add ShellCheck + Hadolint to Dockerfile test stage

## [v1.1.1] - 2026-03-18

- Maintenance release

## [v1.1.0] - 2026-03-18

### Added
- always regenerate .env on build/run, add --no-env flag

### Changed
- add .hadolint.yaml to ignore inapplicable rules
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from ad9e7f8..3bafb77
- add ShellCheck and Hadolint static analysis

## [v1.0.0] - 2026-03-18

### Added
- add -h/--help support to all interactive scripts

### Changed
- promote Smoke Tests to ## section, unify README structure
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from f80a781..ad9e7f8
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from 2c15ade..f80a781
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from 6924234..2c15ade
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from 05c341f..6924234
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from f08786a..05c341f
- update docker_setup_helper subtree
- Squashed 'docker_setup_helper/' changes from 6f75fb6..f08786a
- Add detach mode to run.sh and rewrite exec.sh
- Squashed 'docker_setup_helper/' changes from 6e8811b..6f75fb6
- Update docker_setup_helper: IMAGE_NAME fallback to .env.example

### Fixed
- release-worker.yaml archive list and exec.sh bugs

