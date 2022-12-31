# devops-systems
DevOps Tools - Systems Auto-Configuration

Note: This is a very dirty hack:
```shell
packages="$(
    egrep "Package: |Version: |Priority: |Section: " ./packages.log \
    | sed -e 's|Package|*"Package|g' \
          -e 's|Version|, "Version|g' \
          -e 's|Priority|, "Priority|g' \
          -e 's|Section|, "Section|g' \
          -e 's|: |": "|g' \
    | tr '\n' '"' \
    | sed -e 's|{| }, {|g' -e 's|" "Package|" }, { "Package|g' \
    | tr '*' '\n' | sort -n | tr '\n' '*' \
    | sed -e 's|*| }, { |g' \
          -e 's|^ }, {|\[ {|' \
          -e 's| \}, { $| } ]|'
  )";
echo -e "${packages}" | python -m json.tool | tee ./packages.json ;
```
