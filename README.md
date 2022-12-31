# devops-systems
DevOps Tools - Systems Auto-Configuration

Note: This is a very dirty hack:
```shell
packages="$(
    echo -en "[ {"; egrep "Package: |Version: |Priority: |Section: " ./packages.log \
    | sed -e 's|Package|* "Package|g' \
          -e 's|* "Package| "Package|1' \
          -e 's|Version|, "Version|g' \
          -e 's|Priority|, "Priority|g' \
          -e 's|Section|, "Section|g' \
          -e 's|: |": "|g' \
    | tr '*' '{' | tr '\n' '"' \
    | sed -e 's|{| }, {|g' \
          -e 's|" "Package|" }, { "Package|g' \
    ; echo -e " } ]"
  )";

echo -e "${packages}" | python -m json.tool ;
```
