##############################################################
# AESD-ASSIGNMENTS
##############################################################
#CREDITS- CHATGPT AND INDUJA N for Helping me fix my AESD_ASSIGNMENTS_VERSION, i took the install target commands from CHATGPT and AESD__ASSIGNMENTS_VERSION lines from CHATGPT
#I was not using the latest version dynamically.

# Point to YOUR A3 repo over SSH (not https)
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignment-3-kaif-shahid-shaikh.git

# If your default branch is 'main'
AESD_ASSIGNMENTS_VERSION = $(shell git ls-remote $(AESD_ASSIGNMENTS_SITE) main | cut -f1)

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '#COMMIT VERSION NUMBER'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = '#GITHUB REPOSITORY LINK'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
