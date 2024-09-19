local installed = script.Installed
local http = game.HttpService
local packages = "https://github.com/Lua-Software/Roblox-Package-Manager/raw/main/packages.json"
local pjson = {}

http.HttpEnabled = true -- Required for RPM to work
pjson = http:JSONDecode(http:GetAsync(packages))

local main = pjson.packages

return {
	import = function(package)
		if installed:FindFirstChild(package) then
			if main[package].version ~= installed[package].version.Value and not installed[package]:FindFirstChild("url") then
				warn(package.." has a new update: "..package.."@"..main[package].Version.." (Current: "..package.."@"..installed[package].version.Value..")")
			end
			return require(installed[package].Package)
		else
			error(package.." doesn't exist in your Package Library.")
		end
	end,
	install = function(package)
		if main[package] ~= nil then
			local ModuleSource = http:GetAsync(main[package].get)
			local Package = Instance.new("Folder", installed)
			Package.Name = package
			local _version = Instance.new("StringValue", Package)
			_version.Name = "version"
			_version.Value = main[package].version
			local _module = Instance.new("ModuleScript", Package)
			_module.Name = "Package"
			_module.Source = ModuleSource
			return print("Installed "..package.."@".._version.Value.." in RPM.")
		else
			return error("Package doesn't exist.")
		end
	end,
	install_from_url = function(package, _version, url)
		local success, err = pcall(function()
			local ModuleSource = http:GetAsync(url)
			local Package = Instance.new("Folder", installed)
			Package.Name = package
			local _version = Instance.new("StringValue", Package)
			_version.Name = "version"
			_version.Value = _version
			local _module = Instance.new("ModuleScript", Package)
			_module.Name = "Package"
			_module.Source = ModuleSource
			local _isUrl = Instance.new("StringValue", Package)
			_isUrl.Name = "url"
			return print("Installed "..package.."@".._version.Value.." in RPM.")
		end)
		
		if err then
			error("Url doesn't exist or something went wrong.")
		else
			print("Successfully added package.")
		end
	end,
	uninstall = function(package)
		if installed:FindFirstChild(package) then
			installed[package]:Destroy()
			print("Removed package.")
		else
			error("No package found.")
		end
	end
}
