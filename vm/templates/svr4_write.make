# Sun-$Revision: 30.2 $

# Creating patched write

write.o: /usr/lib/libc.a
ifeq (${HOST_ARCH},${TARGET_ARCH})
	@lock_run _$@.lock " \
		echo Making write.o; \
		ar x /usr/lib/libc.a write.o; \
		${OBJ_PATCH} ${OSDEFS} write.o      _write      _WRITE; \
		${OBJ_PATCH} ${OSDEFS} write.o _libc_write _LIBC_WRITE; \
	"
endif
