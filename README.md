Generate Etherlab patchset Git
===============================

This script builds automatically a GIT repository that holds
- IgH EtherCAT Master
- uecasm-etherlab-patches


## Requirements

- a Linux computer with mercurial and git tools.

## How does it work?

It follows the instructions
https://sourceforge.net/u/uecasm/etherlab-patches/ci/default/tree/

- It downloads the Mercurial repository for IgH EtherCAT Master
- Then it downloads and applies the Mercurial patchset
- then it converts the Mercurial repository to a Git repository


## How to use?

Just run
```
bash generate_etherlab_patchset_git.sh
```

## Quality control

This script has been tested on Debian 10 but it should work on any recent Linux distribution.
