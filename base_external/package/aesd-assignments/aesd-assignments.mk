AESD_ASSIGNMENTS_VERSION = HEAD
AESD_ASSIGNMENTS_SITE = /home/kayf_06/assignment-1-kaif-shahid-shaikh
AESD_ASSIGNMENTS_SITE_METHOD = local

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/server clean
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/server CROSS_COMPILE="$(TARGET_CROSS)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
