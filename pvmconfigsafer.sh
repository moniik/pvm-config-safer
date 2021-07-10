#!/bin/bash

if [ $# -ne 1 ]; then
  echo "[-] Please set a pvm path" 1>&2
  exit 1
fi

PVM_PATH=$1
echo "[+] pvm path -> ${PVM_PATH}"

CONFIG_PATH="${PVM_PATH}/config.pvs"
echo "[+] pvm config path -> ${CONFIG_PATH}"

echo "[+] Create a backup"
cp ${CONFIG_PATH} "${CONFIG_PATH}_bk"

echo "[+] Change the pvm settings"
xmllint --shell ${CONFIG_PATH} << EOF
cd /ParallelsVirtualMachine/Settings/Tools/SharedFolders/HostSharing/Enabled
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedFolders/HostSharing/ShareAllMacDisks
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedFolders/HostSharing/ShareUserHomeDir
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedFolders/HostSharing/SharedCloud
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedFolders/GuestSharing/Enabled
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedProfile/Enabled
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedApplications/FromWinToMac
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedApplications/FromMacToWin
set 0
cd /ParallelsVirtualMachine/Settings/Tools/SharedVolumes/Enabled
set 0
cd /ParallelsVirtualMachine/Settings/Tools/AutoUpdate/Enabled
set 0
cd /ParallelsVirtualMachine/Settings/SharedCamera/Enabled
set 0
cd /ParallelsVirtualMachine/Hardware/NetworkAdapter/Enabled
set 0
cd /ParallelsVirtualMachine/Hardware/NetworkAdapter/Connected
set 0
save
EOF

echo 
echo "[+] Done."
