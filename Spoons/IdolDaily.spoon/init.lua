--[[
Author: Loghder Loghder@qq.com
Date: 2024-02-13 00:35:48
LastEditors: Loghder loghder@qq.com
LastEditTime: 2024-02-13 06:53:11
FilePath: /.hammerspoon/Spoons/BingDaily.spoon/init.lua
Description:

Copyright (c) 2024 by ${git_name_email}, All Rights Reserved.
--]]
--- === IdolDaily ===
---
--- Use Idol daily picture as your wallpaper, automatically.

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "IdolDaily"
obj.version = "1.0"
obj.author = "Loghder <Loghder@qq.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

local function bingRequest()
    hs.shortcuts.run("设置本地壁纸")
end

local function iDolDaily(eventType)
    if (eventType == hs.caffeinate.watcher.screensDidSleep) then
        hs.shortcuts.run("设置本地壁纸")
    end
end
function obj:init()
    if obj.timer == nil then
        obj.timer = hs.timer.doEvery(3 * 60 * 60, function() bingRequest() end)
        obj.timer:setNextTrigger(5)
    else
        obj.timer:start()
    end
    local watcher = hs.caffeinate.watcher.new(iDolDaily)
    watcher:start()
end

return obj
