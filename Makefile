include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = siriactivator
siriactivator_FILES = Tweak.xm
siriactivator_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
