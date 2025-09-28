##############################################################
# AESD-ASSIGNMENTS (A5)
##############################################################

# Pin to the A3 commit that passed native tests
AESD_ASSIGNMENTS_SITE        = git@github.com:cu-ecen-aeld/assignment-3-kaif-shahid-shaikh.git
AESD_ASSIGNMENTS_SITE_METHOD = git

AESD_ASSIGNMENTS_VERSION = $(shell git ls-remote $(AESD_ASSIGNMENTS_SITE) master | cut -f1)
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server clean
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS

    $(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
    $(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))


