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
