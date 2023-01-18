--- ./default-vboxpostinstall.sh	2023-01-06 22:42:02
+++ ./custom-vboxpostinstall.sh	2023-01-06 22:43:43
@@ -206,6 +206,10 @@
 log_command_in_target apt-get install build-essential --yes
 log_command_in_target apt-get install linux-headers-$(uname -r) --yes

+## emvaldes@hotmail.com
+log_command_in_target apt-get install openssh-server --yes;
+log_command_in_target systemctl enable ssh  ## 2>/dev/null;
+log_command_in_target systemctl status ssh  2>/dev/null;

 #
 # GAs
@@ -220,7 +224,8 @@
 MY_IGNORE_EXITCODE=
 log_command_in_target usermod -a -G vboxsf "{{ service-account }}"

-
+## emvaldes@hotmail.com
+log_command_in_target usermod -a -G sudo "{{ service-account }}"

 #
 # Test Execution Service.
