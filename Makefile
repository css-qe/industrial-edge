BOOTSTRAP=1
ARGO_TARGET_NAMESPACE=manuela-ci

.PHONY: default
default: show

%:
	make -f common/Makefile $*

install: deploy
ifeq ($(BOOTSTRAP),1)
	make -f common/Makefile TARGET_NAMESPACE=$(ARGO_TARGET_NAMESPACE) argosecret
endif

secret:
	make -f common/Makefile TARGET_NAMESPACE=$(ARGO_TARGET_NAMESPACE) argosecret
