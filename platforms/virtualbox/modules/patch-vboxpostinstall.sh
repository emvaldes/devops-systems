--- ./default-vboxpostinstall.sh	2023-01-01 00:00:00
+++ ./custom-vboxpostinstall.sh	  2023-01-01 00:00:00
@@ -206,17 +206,6 @@
 log_command_in_target apt-get -y install build-essential
 log_command_in_target apt-get -y install linux-headers-$(uname -r)

-## emvaldes@hotmail.com
-log_command_in_target apt-get install curl --yes;
-log_command_in_target apt-get install git --yes;
-log_command_in_target apt-get install jq --yes;
-log_command_in_target apt-get install python-is-python3 --yes;
-
-## emvaldes@hotmail.com
-log_command_in_target apt-get install openssh-server --yes;
-log_command_in_target systemctl enable ssh  ## 2>/dev/null;
-log_command_in_target systemctl status ssh  ## 2>/dev/null;
-
 #
 # GAs
 #
@@ -229,9 +218,6 @@
 log_command_in_target /bin/bash -c "udevadm trigger"                 # (ditto)
 MY_IGNORE_EXITCODE=
 log_command_in_target usermod -a -G vboxsf "{{ service-account }}"
-
-## emvaldes@hotmail.com
-log_command_in_target usermod -a -G sudo "{{ service-account }}"


 #
