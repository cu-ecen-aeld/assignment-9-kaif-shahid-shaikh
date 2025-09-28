##############################################################
# AESD-ASSIGNMENTS
##############################################################

AESD_ASSIGNMENTS_VERSION = HEAD

# Default: fetch via git over SSH (required by grader)
AESD_ASSIGNMENTS_SITE        = git@github.com:cu-ecen-aeld/assignment-3-kaif-shahid-shaikh.git
AESD_ASSIGNMENTS_SITE_METHOD = git
# Enable this only if your repo actually uses submodules
# AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Optional local override for your VM (never set in CI unless you export it)
# ifeq ($(strip $(AESD_ASSIGNMENTS_OVERRIDE_SRCDIR)),)
#   AESD_ASSIGNMENTS_SITE        = git@github.com:cu-ecen-aeld/assignments-3-and-later-kaif-shahid-shaikh.git
#   AESD_ASSIGNMENTS_SITE_METHOD = git
# else
#   AESD_ASSIGNMENTS_SITE        = $(AESD_ASSIGNMENTS_OVERRIDE_SRCDIR)
#   AESD_ASSIGNMENTS_SITE_METHOD = local
# endif

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/finder-app clean
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/finder-app CROSS_COMPILE="$(TARGET_CROSS)"
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/server clean
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/server CROSS_COMPILE="$(TARGET_CROSS)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))

