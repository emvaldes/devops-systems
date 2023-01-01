# devops-systems : ubuntu
DevOps Tools - Systems Auto-Configuration : Ubuntu

**Data Source**: A log file is generated that contains the output of all the ***apt show $package*** command.
</br>

```shell
Package: git
Version: 1:2.34.1-1ubuntu1.5
Priority: optional
Section: vcs
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Jonathan Nieder <jrnieder@gmail.com>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 18.8 MB
Provides: git-completion, git-core
Depends: libc6 (>= 2.34), libcurl3-gnutls (>= 7.56.1), libexpat1 (>= 2.0.1), ...
Recommends: ca-certificates, patch, less, ssh-client
Suggests: gettext-base, git-daemon-run | git-daemon-sysvinit, git-doc, ...
Breaks: bash-completion (<< 1:1.90-1), cogito (<= 0.18.2+), dgit (<< 5.1~), ...
Homepage: https://git-scm.com/
Task: cloud-image, ubuntu-wsl, server, ubuntu-server-raspi, kubuntu-desktop, ...
Download-Size: 3,132 kB
APT-Manual-Installed: yes
APT-Sources: http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages
Description: fast, scalable, distributed revision control system
...
```

**Description**: Executing the **packages.shell** script generates these JSON objects.

```shell
$ packages.shell | tee packages.log ;
```

**Description**: This generates the following JSON output:

```json
[
  {
      "Package": "git",
      "Version": "1:2.34.1-1ubuntu1.5",
      "Priority": "optional",
      "Section": "vcs",
      "Origin": "Ubuntu",
      "Original-Maintainer": "Jonathan Nieder <jrnieder@gmail.com>",
      "Installed-Size": "18.8 MB",
      "Provides": [
          "git-completion",
          "git-core"
      ],
      "Depends": [
          "libc6 (>= 2.34)",
          "libcurl3-gnutls (>= 7.56.1)",
          "libexpat1 (>= 2.0.1)",
          "libpcre2-8-0 (>= 10.34)",
          "zlib1g (>= 1:1.2.0)",
          "perl",
          "liberror-perl",
          "git-man (>> 1:2.34.1)",
          "git-man (<< 1:2.34.1-.)"
      ],
      "Recommends": [
          "ca-certificates",
          "patch",
          "less",
          "ssh-client"
      ],
      "Suggests": [
          "gettext-base",
          "git-daemon-run | git-daemon-sysvinit",
          "git-doc",
          "git-email",
          "git-gui",
          "gitk",
          "gitweb",
          "git-cvs",
          "git-mediawiki",
          "git-svn"
      ],
      "Breaks": [
          "bash-completion (<< 1:1.90-1)",
          "cogito (<= 0.18.2+)",
          "dgit (<< 5.1~)",
          "git-buildpackage (<< 0.6.5)",
          "git-el (<< 1:2.32.0~rc2-1~)",
          "gitosis (<< 0.2+20090917-7)",
          "gitpkg (<< 0.15)",
          "guilt (<< 0.33)",
          "openssh-client (<< 1:6.8)",
          "stgit (<< 0.15)",
          "stgit-contrib (<< 0.15)"
      ],
      "Homepage": "https://git-scm.com/",
      "Task": [
          "cloud-image",
          "ubuntu-wsl",
          "server",
          "ubuntu-server-raspi",
          "kubuntu-desktop",
          "lubuntu-desktop",
          "ubuntustudio-desktop-core",
          "ubuntustudio-desktop"
      ],
      "Download-Size": "3,132 kB",
      "APT-Manual-Installed": "yes",
      "APT-Sources": "http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages",
      "Apropos": [
          "Git (3pm)            - Perl interface to the Git version control system",
          "gh-auth-setup-git (1) - Configure git to use GitHub CLI as a credential helper",
          "gh-pr-checkout (1)   - Check out a pull request in git",
          "git (1)              - the stupid content tracker",
          "git-commit-graph (1) - Write and verify Git commit-graph files",
          "git-daemon (1)       - A really simple server for Git repositories",
          "git-fast-export (1)  - Git data exporter",
          "git-fast-import (1)  - Backend for fast Git data importers",
          "git-for-each-repo (1) - Run a Git command on a list of repositories",
          "git-get-tar-commit-id (1) - Extract commit ID from an archive created using git-archive",
          "git-help (1)         - Display help information about Git",
          "git-http-backend (1) - Server side implementation of Git over HTTP",
          "git-http-fetch (1)   - Download from a remote Git repository via HTTP",
          "git-init (1)         - Create an empty Git repository or reinitialize an existing one",
          "git-init-db (1)      - Creates an empty Git repository",
          "git-maintenance (1)  - Run tasks to optimize Git repository data",
          "git-merge-one-file (1) - The standard helper program to use with git-merge-index",
          "git-mergetool--lib (1) - Common Git merge tool shell scriptlets",
          "git-send-pack (1)    - Push objects over Git protocol to another repository",
          "git-sh-i18n (1)      - Git's i18n setup code for shell scripts",
          "git-sh-i18n--envsubst (1) - Git's own envsubst(1) for i18n fallbacks",
          "git-sh-setup (1)     - Common Git shell script setup code",
          "git-shell (1)        - Restricted login shell for Git-only SSH access",
          "git-shortlog (1)     - Summarize 'git log' output",
          "git-upload-archive (1) - Send archive back to git-archive",
          "git-upload-pack (1)  - Send objects packed back to git-fetch-pack",
          "git-var (1)          - Show a Git logical variable",
          "git-verify-pack (1)  - Validate packed Git archive files",
          "git-version (1)      - Display version information about Git",
          "git-web--browse (1)  - Git helper script to launch a web browser",
          "gitcli (7)           - Git command-line interface and conventions",
          "gitcore-tutorial (7) - A Git core tutorial for developers",
          "gitcredentials (7)   - Providing usernames and passwords to Git",
          "gitcvs-migration (7) - Git for CVS users",
          "giteveryday (7)      - A useful minimum set of commands for Everyday Git",
          "gitfaq (7)           - Frequently asked questions about using Git",
          "gitglossary (7)      - A Git Glossary",
          "githooks (5)         - Hooks used by Git",
          "gitnamespaces (7)    - Git namespaces",
          "gitrepository-layout (5) - Git Repository Layout",
          "gitrevisions (7)     - Specifying revisions and ranges for Git",
          "gittutorial (7)      - A tutorial introduction to Git",
          "gittutorial-2 (7)    - A tutorial introduction to Git: part two",
          "gitweb (1)           - Git web interface (web frontend to Git repositories)",
          "gitweb.conf (5)      - Gitweb (Git web interface) configuration file",
          "gitworkflows (7)     - An overview of recommended workflows with Git"
      ],
      "Listing": [
          "git/jammy-updates,jammy-security,now 1:2.34.1-1ubuntu1.5 amd64 [installed]",
          "git/jammy-updates,jammy-security 1:2.34.1-1ubuntu1.5 i386"
      ],
      "Timestamp": {
          "date": "2022-12-30",
          "time": "12:27:29"
      }
  }
]
```

**Description**: The final outcome is a REPORT file:

```shell
ansible -> 2.10.7+merged+base+2.10.8+dfsg-1
apt-file -> 3.2.2
aptitude -> 0.8.13-3ubuntu1
arp-scan -> 1.9.7-2
autoconf -> 2.71-2
bat -> 0.19.0-1ubuntu0.1
bmon -> 1:4.0-8
build-essential -> 12.9ubuntu3
bwctl-client -> 1.5.4+dfsg1-1build1
bwctl-server -> 1.5.4+dfsg1-1build1
cloc -> 1.90-1
code -> 1.74.2-1671533413
coreutils -> 8.32-4.1ubuntu1
curl -> 7.81.0-1ubuntu1.6
dos2unix -> 7.4.2-2
ethtool -> 1:5.16-1
fping -> 5.1-1
gh -> 2.4.0+dfsg1-2
git -> 1:2.34.1-1ubuntu1.5
gnupg -> 2.2.27-3ubuntu2.1
golang -> 2:1.18~0ubuntu2
grepcidr -> 2.0-2
hping3 -> 3.a2.ds2-10
htop -> 3.0.5-7build2
ifstat -> 1.1-8.2
iftop -> 1.0~pre4-7
ipcalc -> 0.42-2
iperf3 -> 3.9-1build1
iproute2 -> 5.15.0-1ubuntu2
iptraf-ng -> 1:1.2.1-1build2
jq -> 1.6-2.1ubuntu3
libssl-dev -> 3.0.2-0ubuntu1.7
lynx -> 2.9.0dev.10-1
mc -> 3:4.8.27-1
mtr -> 0.95-1
netcat -> 1.218-4ubuntu1
net-tools -> 1.60+git20181103.0eebece-1ubuntu5
ngrep -> 1.47+ds1-5
nikto -> 1:2.1.5-3.1
nload -> 0.7.4-2build3
nmap -> 7.91+dfsg1+really7.80+dfsg1-2build1
nodejs -> 12.22.9~dfsg-1ubuntu3
npm -> 8.5.1~ds-1
openssh-server -> 1:8.9p1-3
parallel -> 20210822+ds-2
pgpdump -> 0.34-1
procps -> 2:3.3.17-6ubuntu2
psmisc -> 23.4-2build3
python3-venv -> 3.10.6-1~22.04
screen -> 4.9.0-1
sipcalc -> 1.1.6-1
socat -> 1.7.4.1-3ubuntu4
speedometer -> 2.8-3
speedtest-cli -> 2.1.3-2
stress -> 1.0.5-1
sysvinit-utils -> 3.01-1ubuntu1
telnet -> 0.17-44build1
tftpd-hpa -> 5.2+20150808-1.2build2
tree -> 2.0.2-1
unzip -> 6.0-26ubuntu3.1
vim -> 2:8.2.3995-1ubuntu2.1
virtualenv -> 20.13.0+ds-2
wget -> 1.21.2-2ubuntu1
wireshark -> 3.6.2-2
zenity -> 3.42.1-0ubuntu1
zip -> 3.0-12build2
```
