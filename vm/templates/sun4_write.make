# Sun-$Revision: 30.2 $

# Creating patched write

write.o: /usr/lib/libc.a
	@lock_run _$@.lock " \
		echo Making write.o; \
		ar x /usr/lib/libc.a write.o; \
		${OBJ_PATCH} ${OSDEFS} write.o write WRITE; \
	"
