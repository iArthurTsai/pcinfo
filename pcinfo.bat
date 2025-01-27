@echo off
rem WMI類別完整分類

rem 將檔案儲存到腳本所在的目錄
cd /d %~dp0

rem 記錄開始時間
set starttime=%time%
echo Start Time: %date% %starttime% > pcinfo.txt

rem ## 1. 硬體和系統資訊

rem 主機板 (也稱為系統主機板) 管理
wmic BASEBOARD list full /format:hform > pcinfo.html

rem 基本輸入/輸出服務 (BIOS) 管理
wmic BIOS list full /format:hform >> pcinfo.html

rem CPU 管理
wmic CPU list full /format:hform >> pcinfo.html

rem SMBIOS 中的電腦系統產品資訊
wmic CSPRODUCT list full /format:hform >> pcinfo.html

rem 電腦系統管理
wmic COMPUTERSYSTEM list full /format:hform >> pcinfo.html

rem 桌面監視器管理
wmic DESKTOPMONITOR where Status='ok' list full /format:hform >> pcinfo.html
wmic DESKTOPMONITOR list full /format:hform >> pcinfo.html

rem 管理主機板 (系統主機板) 內建的通用介面卡裝置
wmic ONBOARDDEVICE list full /format:hform >> pcinfo.html

rem 實體系統內含管理
wmic SYSTEMENCLOSURE list full /format:hform >> pcinfo.html

rem 管理實體連線點，包括連接埠、插槽與周邊，以及專屬的連線點
wmic SYSTEMSLOT list full /format:hform >> pcinfo.html

rem 溫度感應器 (電子溫度計) 資料管理 0
rem wmic TEMPERATURE list full /format:hform >> pcinfo.html

rem 電壓感應器 (電子伏特計) 資料管理 0
rem wmic VOLTAGE list full /format:hform >> pcinfo.html

rem 不斷電供應系統 (UPS) 管理 0
rem wmic UPS list full /format:hform >> pcinfo.html

rem ## 2. 儲存和檔案系統

rem CD-ROM 管理
wmic CDROM list full /format:hform >> pcinfo.html

rem 實體磁碟機管理
wmic DISKDRIVE get BytesPerSector,Capabilities,CapabilityDescriptions,ConfigManagerUserConfig,Description,DeviceID,Index,InterfaceType,Manufacturer,MediaLoaded,MediaType,Model,Name,Partitions,PNPDeviceID,SCSIPort,Size,Status,SystemName,TotalCylinders,TotalHeads,TotalSectors,TotalTracks,TracksPerCylinder /format:hform >> pcinfo.html

rem 本機存放裝置管理
wmic LOGICALDISK get Caption,Compressed,Description,DeviceID,DriveType,FileSystem,FreeSpace,Name,QuotasDisabled,QuotasIncomplete,QuotasRebuilding,Size,SupportsDiskQuotas,SupportsFileBasedCompression,VolumeName,VolumeSerialNumber /format:hform >> pcinfo.html

rem 管理實體磁碟的分割區域
wmic PARTITION get BlockSize,Bootable,BootPartition,Description,DeviceID,DiskIndex,Index,Name,NumberOfBlocks,PrimaryPartition,Size,StartingOffset,Type /format:hform >> pcinfo.html

rem 本機存放磁碟區管理
wmic VOLUME list full /format:hform >> pcinfo.html

rem 磁帶機管理 0
rem wmic TAPEDRIVE list full /format:hform >> pcinfo.html

rem NTFS 磁碟區的磁碟空間使用量
wmic DISKQUOTA list full /format:hform >> pcinfo.html

rem 設定磁碟區上的磁碟配額資訊
wmic QUOTASETTING list full /format:hform >> pcinfo.html

rem 將磁碟配額設定與特定磁碟區關聯
wmic VOLUMEQUOTASETTING list full /format:hform >> pcinfo.html

rem 每個使用者存放磁碟區配額管理
wmic VOLUMEUSERQUOTA list full /format:hform >> pcinfo.html

rem 資料檔案管理
rem wmic DATAFILE list full /format:hform >> pcinfo.html stuck

rem 檔案系統目錄項目管理
rem wmic FSDIR list full /format:hform >> pcinfo.html stuck

rem 共用資源管理
wmic SHARE list full /format:hform >> pcinfo.html

rem ## 3. 記憶體和效能

rem 裝置記憶體位址管理
wmic DEVICEMEMORYADDRESS list full /format:hform >> pcinfo.html

rem 直接記憶體存取 (DMA) 通道管理
wmic DMACHANNEL list full /format:hform >> pcinfo.html

rem 插斷要求行 (IRQ) 管理
wmic IRQ list full /format:hform >> pcinfo.html

rem 快取記憶體管理
wmic MEMCACHE get Associativity,Availability,BlockSize,CacheSpeed,CacheType,Caption,CreationClassName,CurrentSRAM,Description,DeviceID,ErrorCorrectType,InstalledSize,Level,MaxCacheSize,Name,NumberOfBlocks,Purpose,Status,StatusInfo,SupportedSRAM,SystemCreationClassName,SystemName,WritePolicy /format:hform >> pcinfo.html

rem 記憶體晶片資訊
wmic MEMORYCHIP list full /format:hform >> pcinfo.html

rem 電腦系統的實體記憶體管理
wmic MEMPHYSICAL list full /format:hform >> pcinfo.html

rem 虛擬記憶體檔案交換管理
wmic PAGEFILE list full /format:hform >> pcinfo.html

rem 分頁檔設定管理 0
rem wmic PAGEFILESET list full /format:hform >> pcinfo.html

rem ## 4. 網路和連接

rem 網路用戶端管理
wmic NETCLIENT list full /format:hform >> pcinfo.html

rem 網路登入資訊 (特定使用者) 管理
wmic NETLOGIN list full /format:hform >> pcinfo.html

rem 通訊協定 (及其網路特性) 管理
wmic NETPROTOCOL list full /format:hform >> pcinfo.html

rem 使用中網路連線管理 0
wmic NETUSE list full /format:hform >> pcinfo.html

rem 網路介面控制器 (NIC) 管理
wmic NIC list full /format:hform >> pcinfo.html

rem 網路介面卡管理
wmic NICCONFIG list full /format:hform >> pcinfo.html

rem I/O 連接埠管理
wmic PORT list full /format:hform >> pcinfo.html

rem 實體連線連接埠管理
wmic PORTCONNECTOR get Description,ExternalReferenceDesignator,InternalReferenceDesignator,Name,PortType,Tag /format:hform >> pcinfo.html

rem ## 5. 作業系統和系統服務

rem 安裝的作業系統管理
wmic OS list brief /format:hform >> pcinfo.html

rem 開機設定管理
wmic BOOTCONFIG list full /format:hform >> pcinfo.html

rem 系統環境設定管理
wmic ENVIRONMENT where "name='temp'" get Description,Name,Status,SystemVariable,UserName,VariableValue /format:hform >> pcinfo.html
wmic ENVIRONMENT list full /format:hform >> pcinfo.html

rem 電腦系統登錄管理
wmic REGISTRY list full /format:hform >> pcinfo.html

rem 當作業系統失敗時從記憶體收集的資訊
wmic RECOVEROS list full /format:hform >> pcinfo.html

rem 服務應用程式管理
wmic SERVICE list full /format:hform >> pcinfo.html

rem 管理使用者登入電腦系統時自動執行的命令
wmic STARTUP list full /format:hform >> pcinfo.html

rem 管理基本服務的系統驅動程式
wmic SYSDRIVER list full /format:hform >> pcinfo.html

rem 時區資料管理
wmic TIMEZONE list full /format:hform >> pcinfo.html

rem WMI 服務操作參數管理
wmic WMISET list full /format:hform >> pcinfo.html

rem 查看OEM產品金鑰
wmic path softwareLicensingService get OA3xOriginalProductKey /format:hform >> pcinfo.html

rem ## 6. 使用者和安全

rem 使用者的桌面管理
wmic DESKTOP list full /format:hform >> pcinfo.html

rem 群組帳戶管理
wmic GROUP list full /format:hform >> pcinfo.html

rem 登入工作階段
wmic LOGON list full /format:hform >> pcinfo.html

rem NT 網域管理
wmic NTDOMAIN list full /format:hform >> pcinfo.html

rem 使用者帳戶管理
wmic USERACCOUNT list full /format:hform >> pcinfo.html

rem 系統帳戶管理
wmic SYSACCOUNT list full /format:hform >> pcinfo.html

rem ## 7. 處理程序和應用程序

rem DCOM 應用程式管理
wmic DCOMAPP get AppID,Description,Name /format:hform >> pcinfo.html

rem 處理程序管理
wmic PROCESS get CommandLine,CSName,Description,ExecutablePath,Name,OSName,WindowsVersion /format:hform >> pcinfo.html

rem 管理定義執行相依性的系統服務
wmic LOADORDER list full /format:hform >> pcinfo.html

rem 提供存取使用排程服務排定的工作 0
wmic JOB list full /format:hform >> pcinfo.html

rem 管理在系統上安裝的軟體產品元素
wmic SOFTWAREELEMENT get Description,IdentificationCode,InstallDate,Manufacturer,Name,Path,SoftwareElementID,Version /format:hform >> pcinfo.html

rem 管理 SoftwareElement 的軟體產品子集
wmic SOFTWAREFEATURE list full /format:hform >> pcinfo.html

rem ## 8. 印表機和列印

rem 印表機裝置管理
wmic PRINTER list full /format:hform >> pcinfo.html

rem 印表機裝置設定管理
wmic PRINTERCONFIG list full /format:hform >> pcinfo.html

rem 列印工作管理 0
wmic PRINTJOB list full /format:hform >> pcinfo.html

rem ## 9. 遠端桌面

rem 遠端桌面連線權限管理
wmic RDACCOUNT list full /format:hform >> pcinfo.html

rem 特定網路介面卡上的遠端桌面連線管理
wmic RDNIC list full /format:hform >> pcinfo.html

rem 特定遠端桌面連線的權限
wmic RDPERMISSIONS list full /format:hform >> pcinfo.html

rem 遠端開啟或關閉桌面接聽程式
wmic RDTOGGLE list full /format:hform >> pcinfo.html

rem ## 10. 系統監控和日誌

rem NT 事件記錄檔中的項目
rem wmic NTEVENT list full /format:hform >> pcinfo.html stuck

rem NT 事件記錄檔管理
wmic NTEVENTLOG list full /format:hform >> pcinfo.html

rem ## 11. 儲存管理

rem 陰影複製管理
wmic SHADOWCOPY list brief /format:hform >> pcinfo.html

rem 陰影複製存放區域管理
wmic SHADOWSTORAGE list full /format:hform >> pcinfo.html

rem ## 12. 其他

rem 存取本機系統上可用的別名
wmic ALIAS list full /format:hform >> pcinfo.html

rem IDE 控制器管理
wmic IDECONTROLLER list full /format:hform >> pcinfo.html

rem 安裝封裝工作管理
wmic PRODUCT list full /format:hform >> pcinfo.html

rem 快速檢修
wmic QFE list full /format:hform >> pcinfo.html

rem SCSI 控制器管理
wmic SCSICONTROLLER list full /format:hform >> pcinfo.html

rem 伺服器資訊管理
wmic SERVER list full /format:hform >> pcinfo.html

rem 音效裝置管理
wmic SOUNDDEV list full /format:hform >> pcinfo.html

rem 產生電池報告
powercfg /batteryreport /output battery-report.html

rem 產生能源效率診斷報告
powercfg /energy /output energy-report.html

rem 產生睡眠狀態報告
powercfg /sleepstudy /output sleepstudy-report.html

rem 產生效能監視報告（perfmon没有/output選項，會在預設目錄產生報告）
rem perfmon /report

rem 產生驅動程式報告
driverquery /v > driverquery-report.txt

rem 記錄結束時間
set endtime=%time%
echo End Time: %date% %endtime% >> pcinfo.txt

rem 計算開始時間的秒數
for /f "tokens=1-4 delims=:.," %%a in ("%starttime%") do (
    set /a "st=%%a*3600+%%b*60+%%c"
)

rem 計算結束時間的秒數
for /f "tokens=1-4 delims=:.," %%a in ("%endtime%") do (
    set /a "et=%%a*3600+%%b*60+%%c"
)

rem 檢查是否跨越午夜，跨越了午夜，調整結束時間
if %et% lss %st% (
    set /a "et=et+86400"
)

rem 計算執行時間
set /a duration=%et%-%st%

rem 將執行時間寫入到 pcinfo.txt
echo Execution Time: %duration% seconds >> pcinfo.txt

rem 參考資料：
rem wmic /?
rem https://ithelp.ithome.com.tw/questions/10192228
rem https://www.cnblogs.com/mobilecard/p/9351142.html
rem https://www.cnblogs.com/scotth/p/9434416.html
rem https://www.freedidi.com/13758.html


pcinfo.txt