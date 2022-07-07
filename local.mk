clean-files += Makefile.config

GLOBAL_CXXFLAGS += -Wno-deprecated-declarations -fsanitize=undefined
GLOBAL_LDFLAGS += -fsanitize=undefined

$(foreach i, config.h $(wildcard src/lib*/*.hh), \
  $(eval $(call install-file-in, $(i), $(includedir)/nix, 0644)))

$(GCH): src/libutil/util.hh config.h

GCH_CXXFLAGS = -I src/libutil
