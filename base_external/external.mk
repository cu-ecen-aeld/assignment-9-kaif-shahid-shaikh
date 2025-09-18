BR2_EXTERNAL_PROJECT_BASE_PATH := $(dir $(lastword $(MAKEFILE_LIST)))
include $(sort $(wildcard $(BR2_EXTERNAL_PROJECT_BASE_PATH)/package/*/*.mk))
