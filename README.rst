treesum
=======

A command-line utility for calculating the checksum of a directory and its
contents.

``treesum`` iterates through the following file types of the given directory:

* Regular files
* Sub-directories
* Symlinks

For each item, ``treesum`` computes a checkum. It then sorts the checksums
and then computes another checksum against the total list.

When it's done, ``treesum`` outputs a SHA1 hash that represents the contents
of the directory.

Because the checksum operation on directories and symlinks is somewhat of an
undefined operation, ``treesum`` takes the following approach:

* For directories, the utility checks the owner's name, the owning group's
  name, the mode, the SELinux context, and the directory name. If any of 
  these changes, the resulting checksum changes.
* For symlinks, the utility checks the same metadata as directories. In 
  addition, it validates the dereferenced target of the link.

Configuration
-------------

Several environment variables are available to allow you to tweak the
operation of ``treesum``:

* ``TREESUM_WORKERS``: The number of worker processes to launch when gathering
  file statistics (e.g. calls to ``stat``, ``sha1sum``). Defaults to ``10``.
* ``TREESUM_PER_WORKER``: The number of arguments to pass to each worker process.
  Defaults to ``3``. You should be careful setting this too high. Systems have a
  default bytesize limit to the size of a command-line argument (typically ``128KiB``
  or ``131072`` bytes). If you exceed this limit, the arguments will get truncated,
  which will cause the resulting checksum to be garbage (and every time you run it,
  you'll likely get a different value). If you're paranoid, set this to ``1`` (although
  even this doesn't guarantee you won't get a garbage checksum, but it should protect
  you in most cases).
