##############################################################
# LDD
##############################################################

LDD_SITE          = git@github.com:cu-ecen-aeld/assignment-7-kaif-shahid-shaikh.git
LDD_SITE_METHOD   = git
LDD_VERSION       = 379834d48f84c78bb3924d6ccaa026dd0a37dddd

# Build these subdirectories as kernel modules
LDD_MODULE_SUBDIRS = misc-modules scull

# Install helper scripts for our init script (paths used by S98lddmodules)
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_load   $(TARGET_DIR)/usr/local/bin/module_load
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/local/bin/module_unload
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_load           $(TARGET_DIR)/usr/local/bin/scull_load
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_unload         $(TARGET_DIR)/usr/local/bin/scull_unload
endef
$(eval $(kernel-module))
$(eval $(generic-package))
