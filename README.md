# Roblox Package Manager
Packages for Roblox, making development easier.<br>
I wanna see if I can add IntelliSense for import, idk if its possible.<br>
<b>Warning:</b> these may say "RPM_BETA" but it's of course for development, so ignore it.
## Installing a Package
### Database Method
Do this in your command bar.
![image](https://github.com/user-attachments/assets/ad06f7cd-087b-4fb7-ab42-216af88f9322)
For this I will be installing the example package.
```lua
local RS = game:GetService("ReplicatedStorage")
local RPM = require(RS.RPM)
RPM.install("example")
```
![image](https://github.com/user-attachments/assets/a4ca8bf3-911f-4562-beb6-57a58147c544)
### Online Method
```lua
local RS = game:GetService("ReplicatedStorage")
local RPM = require(RS.RPM)
RPM.install_from_url("example", "1.0.0", "https://github.com/Lua-Software/Roblox-Package-Manager/raw/main/RPM-Official-Packages/Example.lua")
```
This won't ever be updated and remains untested, as we don't wanna support unsafe URL's.
## Using a Package
Lets use the example package!<br>
We have a import function without intellisense at the moment.<br>
This is for Runtime, in studio, not command bar. You only install with command bar.
```lua
local RS = game:GetService("ReplicatedStorage")
local RPM = require(RS.RPM)
local packages = {
  _1 = RPM.import("example")
}

packages._1.example()
```
![image](https://github.com/user-attachments/assets/a3ba5aa8-155a-416f-b7e8-7603172b0766)
## Removing a Package
I don't need to documentate this.
```lua
local RS = game:GetService("ReplicatedStorage")
local RPM = require(RS.RPM)
RPM.uninstall("example")
```
## Adding a Package to the Database
Create a pull request, take a look at the json file and see what you need to do!
## Installing RPM
Copy and paste RPM.lua as a ModuleScript in ReplicatedStorage named "RPM"
