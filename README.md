# Install

Follow the instruction to install [s3fs-fuse](https://github.com/s3fs-fuse/s3fs-fuse).

```
sudo apt-get install s3fs
```

# Mount at startup

You can edit `/etc/fstab` and add a line

```
mybucket /path/to/mountpoint fuse.s3fs _netdev,allow_other,use_path_request_style,url=https://url.to.s3/ 0 0
```

to mount an S3 bucket at startup. But this only works if your internet connection is ready _before_ `systemd` mounts the targets in `/etc/fstab`. Your wifi connection will not yet be available causing the automount to fail. The `mount-s3-drives.sh` script waits until the internet connection becomes available and then mounts the S3 buckets using the `s3fs` command.

# Mount multiple shared drives

You can mount multiple S3 buckets in two steps:

1. Edit the `drives.csv` file to add drive labels and drive ids.
2. Run `setup-gdrives.sh`.

The script copies `buckets.csv` and `mount-s3-drives.sh` to `~/.aws` and adds `mount-s3-drives.desktop` to `~/.config/autostart/` to mount the S3 buckets at startup.

# Unmount

To unmount the filesystem, issue this command:

```
fusermount -u mountpoint
```