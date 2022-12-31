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
Depends: libc6 (>= 2.34), libcurl3-gnutls (>= 7.56.1), libexpat1 (>= 2.0.1), libpcre2-8-0 (>= 10.34), ...
Recommends: ca-certificates, patch, less, ssh-client
Suggests: gettext-base, git-daemon-run | git-daemon-sysvinit, git-doc, git-email, git-gui, gitk, gitweb, ...
Breaks: bash-completion (<< 1:1.90-1), cogito (<= 0.18.2+), dgit (<< 5.1~), git-buildpackage (<< 0.6.5), ...
Homepage: https://git-scm.com/
Task: cloud-image, ubuntu-wsl, server, ubuntu-server-raspi, kubuntu-desktop, lubuntu-desktop, ...
Download-Size: 3,132 kB
APT-Manual-Installed: yes
APT-Sources: http://us.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages
Description: fast, scalable, distributed revision control system
...
```

**Description**: The objective is to convert this **Line-based** output into a **JSON Object**.

```shell

function export2json() {
    oIFS="${IFS}";
    for xitem in "${@}"; do
      IFS='='; set `echo -e "${xitem}" | sed -e '1s|^\(-\)\{1,\}||'`
      [[ ${1#*\--} = "input-file" ]] && local input_file="${2}";
      [[ ${1#*\--} = "output-file" ]] && local output_file="${2}";
    done; IFS="${oIFS}";
    ## Define custom-parameter(s):
    [[ ${#input_file} -eq 0 ]] && {
        echo -e "\nWarning: Missing Input File! ";
        return 1;
      };
    [[ ${#output_file} -eq 0 ]] && local output_file="${input_file%\.*}.json";
    ## Collection of Search-Headers
    declare -a headers=();
    headers+=("^Package: ");
    headers+=("^Version: ");
    headers+=("^Priority: ");
    headers+=("^Section: ");
    headers+=("^Origin: ");
    headers+=("^Original-Maintainer: ");
    headers+=("^Installed-Size: ");
    headers+=("^Provides: ");
    headers+=("^Depends: ");
    headers+=("^Recommends: ");
    headers+=("^Suggests: ");
    headers+=("^Breaks: ");
    headers+=("^Homepage: ");
    headers+=("^Task: ");
    headers+=("^Download-Size: ");
    headers+=("^APT-Manual-Installed: ");
    headers+=("^APT-Sources: ");
    ## Store output into 'packages' string.
    packages="$(
        sed -e 's|"||g' ${input_file} \
        | egrep "$(echo -n ${headers[@]} | tr ' ' '|')" \
        | sed -e 's|^\(Package\)\(: \)\(.*\)$|* "\1"\2"\3" |g' \
              -e 's|^\(Version\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Priority\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Section\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Origin\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Original-Maintainer\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Installed-Size\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Provides\)\(: \)\(.*\)$| "\1"\2[ "\3" ]|g' \
              -e 's|^\(Depends\)\(: \)\(.*\)$| "\1"\2[ "\3" ]|g' \
              -e 's|^\(Recommends\)\(: \)\(.*\)$| "\1"\2[ "\3" ]|g' \
              -e 's|^\(Suggests\)\(: \)\(.*\)$| "\1"\2[ "\3" ]|g' \
              -e 's|^\(Breaks\)\(: \)\(.*\)$| "\1"\2[ "\3" ]|g' \
              -e 's|^\(Homepage\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Task\)\(: \)\(.*\)$| "\1"\2[ "\3" ]|g' \
              -e 's|^\(Download-Size\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(APT-Manual-Installed\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(APT-Sources\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|, |", "|g' \
        | tr '\n' ',' \
        | tr '*' '\n' \
        | sort -n \
        | tr '\n' '*' \
        | sed -e 's|" ,\* "Package": "|" }, { "Package": "|g' \
              -e 's|* "Package": |[ { "Package": |' \
              -e 's|^\(.*"\)\( ,\*\)$|\1 } ]|' \
      )"; \
    ## Processing and formatting the collected output into a JSON file.
    echo -e "\n${packages}" | python -m json.tool | tee ${output_file} ;
    return 0;
  };
```

**Description**: Executing the function with the ***packages.log*** as an input parameter.

```shell
$ export2json --input-file=./packages.log ;
```

**Description**: This generates the following JSON output:

```json
[
    {
        "Package": "ansible",
        "Version": "2.10.7+merged+base+2.10.8+dfsg-1",
        "Priority": "optional",
        "Section": "universe/admin",
        "Origin": "Ubuntu",
        "Original-Maintainer": "Lee Garrett <debian@rocketjump.eu>",
        "Installed-Size": "204 MB",
        "Depends": [
            "python3-cryptography",
            "python3-jinja2",
            "python3-packaging",
            "python3-yaml",
            "python3:any",
            "openssh-client | python3-paramiko (>= 2.6.0)",
            "python3-pycryptodome",
            "python3-distutils",
            "python3-dnspython",
            "python3-httplib2",
            "python3-netaddr"
        ],
        "Recommends": [
            "python3-argcomplete",
            "python3-jmespath",
            "python3-kerberos",
            "python3-libcloud",
            "python3-selinux",
            "python3-winrm",
            "python3-xmltodict"
        ],
        "Suggests": [
            "cowsay",
            "sshpass"
        ],
        "Breaks": [
            "ansible-base (<= 2.10.5+dfsg-2)"
        ],
        "Homepage": "https://www.ansible.com",
        "Download-Size": "17.5 MB",
        "APT-Manual-Installed": "yes",
        "APT-Sources": "http://us.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages"
    }
]
```
