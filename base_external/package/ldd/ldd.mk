##############################################################
# LDD
##############################################################

# Your fork of the ldd3 repo (SSH form)
LDD_SITE          = git@github.com:cu-ecen-aeld/assignment-7-kaif-shahid-shaikh.git
# Commit seen in your earlier build logs
LDD_VERSION       = 5c3cae6ddc96b8645dfa6f6bc4ddbba08aae8789
LDD_SITE_METHOD   = git

# Build these subdirectories as kernel modules
LDD_MODULE_SUBDIRS = misc-modules scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# Install helper scripts to match your init script paths (/usr/local/bin)
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_load   $(TARGET_DIR)/usr/local/bin/module_load
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/local/bin/module_unload
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_load           $(TARGET_DIR)/usr/local/bin/scull_load
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_unload         $(TARGET_DIR)/usr/local/bin/scull_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
