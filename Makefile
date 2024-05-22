export PATH := $(shell pwd)/submodules/flutter/bin:$(PATH)
# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
THIS_FILE := $(lastword $(MAKEFILE_LIST))

FLAVOR = ""
ENV_FILE = ""
ANDROID_APP_TYPE = ""

build-runner:
	dart run build_runner build --delete-conflicting-outputs
build-runner-watch:
	dart run build_runner watch --delete-conflicting-outputs

splashscreen:
	dart run flutter_native_splash:create --path flutter_native_splash.yaml