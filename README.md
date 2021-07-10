# pvm-config-safer
This tool changes a parallels config file to safer one for security analysts.

Once this script started, config file(config.pvs) under the pvm file is backuped and overwritten.

```
$ ls /path/to/pvm/parallels_image.pvm
config.pvs  config.pvs_bk  parallels_image.hdd
```

# Usage
0. If you have a vmware image file, you should convert it to pvm format.
   - `$ /Applications/Parallels\ Desktop.app/Contents/MacOS/prl_convert /path/to/vmx/vmware_image.vmx  --dst=/path/to/dest/dir --reg=n`
1. Download a pvmconfigsafer.sh
2. Change the permission
   - `$ chmod +x pvmconfigsafer.sh`
3. Run the shellscript with the path of pvm file.
   - `$ ./pvmconfigsafer.sh /path/to/pvm/parallels_image.pvm`

# Details
This tools changes the following variables.

```
<?xml version="1.0" encoding="UTF-8"?>
<ParallelsVirtualMachine dyn_lists="VirtualAppliance 0" schemaVersion="1.0">
  ...
  <Settings dyn_lists="">
  ...
    <Tools dyn_lists="">
    ...
      <SharedFolders dyn_lists="">
        <HostSharing MapSharedFoldersOnLetters_patch="" dyn_lists="SharedFolder 0">
           <Enabled>1</Enabled>   -> 0
           <ShareAllMacDisks>0</ShareAllMacDisks>
           <ShareUserHomeDir>1</ShareUserHomeDir>  -> 0
           <MapSharedFoldersOnLetters>1</MapSharedFoldersOnLetters>
           <UserDefinedFoldersEnabled>1</UserDefinedFoldersEnabled>
           <SetExecBitForFiles>0</SetExecBitForFiles>
           <VirtualLinks>1</VirtualLinks>
           <EnableDos8dot3Names>1</EnableDos8dot3Names>
           <SharedShortcuts>1</SharedShortcuts>
           <SharedCloud>1</SharedCloud>  -> 0
        </HostSharing>
        <GuestSharing ShareRemovableDrives_patch="" dyn_lists="">
           <Enabled>1</Enabled>  -> 0
           <AutoMount>1</AutoMount>
           <AutoMountNetworkDrives>0</AutoMountNetworkDrives> 
           <EnableSpotlight>0</EnableSpotlight>
           <AutoMountCloudDrives>1</AutoMountCloudDrives>
           <ShareRemovableDrives>1</ShareRemovableDrives>
           <PortNumber>0</PortNumber>
           <AllowExec>0</AllowExec>
        </GuestSharing>
      </SharedFolders>

      <SharedProfile dyn_lists="">
        <Enabled>1</Enabled> -> 0
        <UseDesktop>1</UseDesktop>
        <UseDocuments>1</UseDocuments>
        <UsePictures>1</UsePictures>
        <UseMusic>1</UseMusic>
        <UseMovies>1</UseMovies>
        <UseDownloads>1</UseDownloads>
        <UseTrashBin>1</UseTrashBin>
      </SharedProfile>

      <SharedApplications dyn_lists="">
        <FromWinToMac>1</FromWinToMac>  -> 0
        <FromMacToWin>1</FromMacToWin>  -> 0
        <SmartSelect>1</SmartSelect>
        <AppInDock>2</AppInDock>
        <ShowWindowsAppInDock>0</ShowWindowsAppInDock>
        <ShowGuestNotifications>1</ShowGuestNotifications>
        <BounceDockIconWhenAppFlashes>1</BounceDockIconWhenAppFlashes>
        <WebApplications dyn_lists="">
           <WebBrowser>0</WebBrowser>
           <EmailClient>0</EmailClient>
           <FtpClient>0</FtpClient>
           <Newsgroups>0</Newsgroups>
           <Rss>0</Rss>
           <RemoteAccess>0</RemoteAccess>
        </WebApplications>
        <IconGroupingEnabled>1</IconGroupingEnabled>
        <DisableRecentDocs>0</DisableRecentDocs>
        <StoreInternetPasswordsInOSXKeychain>0</StoreInternetPasswordsInOSXKeychain>
      </SharedApplications>

      ...
      
      <AutoUpdate dyn_lists="">
        <Enabled>1</Enabled>  -> 0
      </AutoUpdate>
      ...

      <SharedVolumes dyn_lists="">
        <Enabled>1</Enabled> -> 0
        <UseExternalDisks>1</UseExternalDisks>
        <UseDVDs>1</UseDVDs>
        <UseConnectedServers>1</UseConnectedServers>
        <UseInversedDisks>0</UseInversedDisks>
      </SharedVolumes>
      ...
    </Tools>
    ...
    
    <SharedCamera Enabled_patch="" dyn_lists="">
      <Enabled>1</Enabled> -> 0
    </SharedCamera>
    ...

    <Hardware dyn_lists="~~~~">
    ...
      <NetworkAdapter id="0" AdapterType_patch="1" dyn_lists="NetAddress DnsIPAddress SearchDomain">
        <Index>0</Index>
        <Enabled>1</Enabled> -> 0
        <Connected>1</Connected> -> 0
        <EmulatedType>1</EmulatedType>
        <SystemName>eth0</SystemName>
        <UserFriendlyName>eth0</UserFriendlyName>
        <Remote>0</Remote>
        ...
      </NetworkAdapter>
      ...
    </Hardware>
```

