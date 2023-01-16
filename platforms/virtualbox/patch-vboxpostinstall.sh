--- ./default-vboxpostinstall.sh	2023-01-06 22:42:02
+++ ./custom-vboxpostinstall.sh	2023-01-06 22:43:43
@@ -206,6 +206,10 @@
 log_command_in_target apt-get -y install build-essential
 log_command_in_target apt-get -y install linux-headers-$(uname -r)

+## emvaldes@hotmail.com
+log_command_in_target apt-get -y install openssh-server
+log_command_in_target systemctl enable ssh
+log_command_in_target systemctl status ssh

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
