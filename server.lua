local scenes = {}

RegisterServerEvent("darkk_ops:add")
AddEventHandler("darkk_ops:add", function(text)
    local _source = source
    local _text = tostring(text)
    local scene = {text = _text, serverid = _source}
    scenes[#scenes+1] = scene
    TriggerClientEvent("darkk_ops:sendscenes", -1, scenes)
end)

RegisterServerEvent("darkk_ops:getscenes")
AddEventHandler("darkk_ops:getscenes", function(text)
    local _source = source
    TriggerClientEvent("darkk_ops:sendscenes", _source, scenes)
end)

RegisterServerEvent("darkk_ops:delete")
AddEventHandler("darkk_ops:delete", function()
    local _source = source
    if scenes[1] ~= nil then
        for i,v in pairs(scenes) do
            if scenes[i].serverid == _source then
                table.remove(scenes, i)
                break
            end
        end
    end
    TriggerClientEvent("darkk_ops:sendscenes", -1, scenes)
end)