##############################################################
# AESD-ASSIGNMENTS (A5)
##############################################################

# Pin to the A3 commit that passed native tests
AESD_ASSIGNMENTS_VERSION = 9b925c7

# Fetch via SSH (required by grader)
AESD_ASSIGNMENTS_SITE        = git@github.com:cu-ecen-aeld/assignment-3-kaif-shahid-shaikh.git
AESD_ASSIGNMENTS_SITE_METHOD = git

# Build only the server subdirectory
AESD_ASSIGNMENTS_SUBDIR      = server

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -D -m 0755 $(@D)/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
