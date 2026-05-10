# Create the qemu group and user
[group("virtualization")]
setup-virt-manager:
    @# Create the group if it doesn't exist
    getent group qemu > /dev/null || sudo groupadd -r qemu
    @# Create the user if it doesn't exist, assigning it to qemu group with no home dir
    getent passwd qemu > /dev/null || sudo useradd -r -g qemu -d / -s /usr/sbin/nologin -c "QEMU user" qemu
    @echo "User and group 'qemu' have been verified/created."
