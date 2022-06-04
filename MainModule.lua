--[[


BloxPlayer V3 (Test Build)

--> GOAL: fix common errors for no premium members for a better experience

--> OTHERS: refined functions w/ a custom B-Player UI library to fix common issues with accesablility
--> Deducated modules and working album covers

-->NEW FEATURES<-- 
[+] progress bar
[developer] B-Player modules with important globals such as BLOXPLAYER_LOADED and BLOXPLAYER_SUPPORTED
[+] full github repository with documentation 
[+] playlist managment
[+] spotify settings
[*] more to come
]]

-- MAIN MODULE (backend)

-- this should help fix all the common errors and crashing coming from bad keys & request coming too fast

local bloxPlayer = {}
bloxPlayer.__index = bloxPlayer
local REQUEST_FUNC

if syn then REQUEST_FUNC = syn.request elseif http then REQUEST_FUNC  = http.request elseif KRNL_LOADED then REQUEST_FUNC = request else REQUEST_FUNC = request end


local BPUI = nil --> TODO
getgenv().response = nil

bloxPlayer.OKAY = true
bloxPlayer.Loaded = false
bloxPlayer.suported = false
bloxPlayer.BETA = false -- this is only for script ware users
spotify = {Last_Status_Code = "", Last_Status_Message = ""}


bloxPlayer.RegisteredKey = nil

local HttpService = game:GetService("HttpService")


bloxPlayer.checkKey = function(key)
    getgenv().response = REQUEST_FUNC({
        Url = "https://api.spotify.com/v1/me/player/currently-playing",
        Headers = {
            ["Content-Type"] = "application/json" ,
			["Authorization"] = "Bearer "..key
        }


    })

    if getgenv().response.StatusCode == 401 then
        spotify.Last_Status_Code = getgenv().response.StatusCode
        spotify.Last_Status_Message = getgenv().response.StatusMessage
        return false
    else
        spotify.Last_Status_Code = getgenv().response.StatusCode
        spotify.Last_Status_Message = getgenv().response.StatusMessage
        return true
    end
end



function bloxPlayer:GetSongData(ApiToken)
    

    return {}
end

function bloxPlayer.BloxPlayer_ERROR_HANDLER(Error) --> should ONLY be used in a xpcall statment
    local statuscode = spotify.Last_Status_Code
    local statusmessage = spotify.Last_Status_Message

    if statuscode ~= 200 then
        print("BLOXPLAYER:ERROR:SPOIFY\nSTATUS:"..statuscode.."\nMESSAGE:"..statusmessage)
    end
end

return bloxPlayer
