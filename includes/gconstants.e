namespace gconstants


include std\filesys.e

global constant PathApps = current_dir() & "\\Apps"
global constant PathAdb = current_dir() & "\\adb"

global sequence urls = {
    {"adb.exe", "https://onedrive.live.com/download?cid=ACCF3D9CC4D98213&resid=ACCF3D9CC4D98213%21134366&authkey=ABnyXRA2z9Ok4pU"},
    {"AdbWinApi.dll", "https://onedrive.live.com/download?cid=ACCF3D9CC4D98213&resid=ACCF3D9CC4D98213%21134364&authkey=AFZfpAbxfiHxK7M"},
    {"AdbWinUsbApi.dll", "https://onedrive.live.com/download?cid=ACCF3D9CC4D98213&resid=ACCF3D9CC4D98213%21134365&authkey=APMzYeJOhY12mfw"},
    {"fastboot.exe", "https://onedrive.live.com/download?cid=ACCF3D9CC4D98213&resid=ACCF3D9CC4D98213%21134367&authkey=AKxliwJ_AvdcpKQ"}
}
