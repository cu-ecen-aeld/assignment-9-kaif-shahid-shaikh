##############################################################
# AESD-ASSIGNMENTS (A5)
##############################################################

# Build the server from your Assignment 3+ repo.
# NOTE: This repo MUST contain a top-level "server/" directory.
# Uses SSH URL as required by the grader.

AESD_ASSIGNMENTS_VERSION = HEAD

# Optional local override for development:
#   export AESD_ASSIGNMENTS_OVERRIDE_SRCDIR=~/assignment-3-kaif-shahid-shaikh
ifeq ($(strip $(AESD_ASSIGNMENTS_OVERRIDE_SRCDIR)),)
  AESD_ASSIGNMENTS_SITE        = git@github.com:cu-ecen-aeld/assignment-3-kaif-shahid-shaikh.git
  AESD_ASSIGNMENTS_SITE_METHOD = git
else
  AESD_ASSIGNMENTS_SITE        = $(AESD_ASSIGNMENTS_OVERRIDE_SRCDIR)
  AESD_ASSIGNMENTS_SITE_METHOD = local
endif

# If your repo has submodules, uncomment this:
# AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/server clean
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/server CROSS_COMPILE="$(TARGET_CROSS)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
