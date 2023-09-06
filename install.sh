set -e

WORKDIR=/home/.aliendalvik_systemimg_patch
TMPWORKDIR="$WORKDIR/tmp"
SQUASHFS_ROOT="$TMPWORKDIR/squashfs-root"
SYSTEM_IMG=/opt/alien/system1.img

log() {
	printf '%s\n' "$1" > /dev/stderr
}

extract_image() {

	if [ ! -f "$orig_image" ]; then
		log "$orig_image not found"
		return 1
	fi
unsquashfs -dest "$SQUASHFS_ROOT/" "$SYSTEM_IMG"

}

install_patch() {
cp nexus.xml "$SQUASHFS_ROOT/system/etc/sysconfig/nexus.xml"
cat system.prop >> "$SQUASHFS_ROOT/system/system_ext/build.prop"
}

build_image() {
	cp "$SYSTEM_IMG" "$TMPWORKDIR/system.img.backup"
	mksquashfs "$SQUASHFS_ROOT" "$SYSTEM_IMG" -noappend -no-exports -no-duplicates -no-fragments
	rm "$TMPWORKDIR/system.img.backup"
#	rm -r "$SQUASHFS_ROOT"
}

set_traps() {
	# shellcheck disable=SC2064
	trap "$*" EXIT HUP INT QUIT PIPE TERM
}

cleanup() {
	if [ ! -f "$SYSTEM_IMG" ] && [ -f "$TMPWORKDIR/system.img.backup" ]; then
		mv "$TMPWORKDIR/system.img.backup" "$SYSTEM_IMG" || :
	fi
	umount "$MOUNT_ROOT" || :
	rm -r "$TMPWORKDIR" || :
	set_traps -
	exit 1
}

set_traps cleanup
#systemctl stop aliendalvik

mkdir -p "$WORKDIR"
mkdir -p "$TMPWORKDIR"

extract_image
log "image was extracted"
log "install patch"
install_patch
log "build image"
build_image
log "image was built"

#rmdir "$TMPWORKDIR"

set_traps -
exit 0