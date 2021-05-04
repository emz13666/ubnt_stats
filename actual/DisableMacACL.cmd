@ECHO OFF
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to SMOTROVAYA (10.70.120.15):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.120.15:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.120.15 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to QVARZITNAYA (10.70.120.16):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.120.16:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.120.16 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to PS_9_Rocket (10.70.120.17):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.120.17:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.120.17 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to GBM (10.70.120.18):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.120.18:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.120.18 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to Peregruzka_11 (10.70.120.19):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.120.19:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.120.19 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to SMOTR_2 (10.70.120.22):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.120.22:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.120.22 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to 9_ps_v2 (10.70.120.25):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.120.25:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.120.25 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to BVU_GARAGE_Bullet (10.70.24.220):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.24.220:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.24.220 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
ECHO ---------------------------------------------------
ECHO Disabling MAC ACL to BVU_GARAGE_Bullet2 (10.70.24.241):
ECHO ---------------------------------------------------
"C:\Program Files (x86)\Putty\pscp.exe" -batch -scp -pw unrfce20 mac_off.txt admin@10.70.24.241:/tmp/mac_off.txt
"C:\Program Files (x86)\Putty\plink.exe" -batch -pw unrfce20 admin@10.70.24.241 "cat /tmp/system.cfg | grep -v mac_acl > /tmp/systemnomacacl.tmp;cat /tmp/mac_off.txt >> /tmp/systemnomacacl.tmp;mv /tmp/systemnomacacl.tmp /tmp/system.cfg;cfgmtd -w -p /etc/;/usr/etc/rc.d/rc.softrestart save"
@ECHO.
pause
del /Q /F %0
