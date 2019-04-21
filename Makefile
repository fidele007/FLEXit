TARGET = iphone:clang:latest:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FLEXit
FLEXit_FILES = FLEXitListener.m Tweak.xm $(wildcard Sources/*.m) $(wildcard Sources/*.mm)
FLEXit_CFLAGS = -fobjc-arc -w
FLEXit_LIBRARIES = sqlite3 z activator
FLEXit_FRAMEWORKS = CoreGraphics UIKit ImageIO QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
