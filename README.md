# devops-systems
DevOps Tools - Systems Auto-Configuration

Note: For all the mor*n python-lovers, there is always another way to do something.
Enjoy the power and beature if regular expressions. This is no longer a dirty hack:
```shell
packages="$(
    sed -e 's|"||g' ./packages.log \
    | egrep "^Package: |^Version: |^Priority: |^Section: |^Origin: |^Original-Maintainer: |^Installed-Size: |^Depends: |^Homepage: |^Download-Size: |^APT-Manual-Installed: |^APT-Sources: " \
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
echo -e "\n${packages}" | python -m json.tool | tee ./packages.json ;
```
