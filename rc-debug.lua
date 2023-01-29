-------------------------------------------
-- @author https://github.com/Kasper24
-- @copyright 2021-2022 Kasper24
-------------------------------------------

local helpers = require("helpers")
local capi = { awesome = awesome}

local path = helpers.filesystem.get_awesome_config_dir("")
local watcher = helpers.inotify:watch(path,
{
	helpers.inotify.Events.modify
})

watcher:connect_signal("event", function(_, __, __)
	capi.awesome.restart()
end)

require("rc")