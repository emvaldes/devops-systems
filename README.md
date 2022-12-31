# devops-systems
DevOps Tools - Systems Auto-Configuration

Note: For all the mor*n python-lovers, there is always another way to do something.
Enjoy the power and beature if regular expressions. This is no longer a dirty hack:
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
    headers+=("^Depends: ");
    headers+=("^Homepage: ");
    headers+=("^Download-Size: ");
    headers+=("^APT-Manual-Installed: ");
    headers+=("^APT-Sources: ");
    ## Store output into 'packages' string.
    packages="$(
        sed -e 's|"||g' ${input_file} \
        | egrep "$(echo -n ${headers[@]} | tr ' ' '|')" \
        | sed -e 's|^\(Package\)\(: \)\(.*\)$|____ "\1"\2"\3" |g' \
              -e 's|^\(Version\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Priority\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Section\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Origin\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Original-Maintainer\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Installed-Size\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Depends\)\(: \)\(.*\)$| "\1"\2[ "\3" ]|g' \
              -e 's|, |", "|g' \
              -e 's|^\(Homepage\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(Download-Size\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(APT-Manual-Installed\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
              -e 's|^\(APT-Sources\)\(: \)\(.*\)$| "\1"\2"\3" |g' \
        | tr '\n' ',' \
        | sed -e 's|" ,____ "Package": "|" }, { "Package": "|g' \
              -e 's|____ "Package": |[ { "Package": |' \
              -e 's|^\(.*"\)\( ,\)$|\1 } ]|'
      )"; \
    ## Processing and formatting the collected output into a JSON file.
    echo -e "\n${packages}" | python -m json.tool | tee ${output_file} ;
    return 0;
  };

$ export2json --input-file=./packages.log ;
```
