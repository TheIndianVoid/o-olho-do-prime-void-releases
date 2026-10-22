local ENDPOINT = 'https://rsbk-storm-suite.vercel.app/rsbk-storm.lua'
local ok, source = pcall(function()
    return game:HttpGet(ENDPOINT..'?t='..tostring(os.time()))
end)
if not ok or type(source) ~= 'string' or #source < 2000 then
    error('Prime Void Hub - Storm Suite | Falha ao carregar a source: '..tostring(source):sub(1,120), 0)
end
if source:sub(1,15):lower():find('<!doctype', 1, true) or source:sub(1,100):lower():find('<html', 1, true) then
    error('Prime Void Hub - Storm Suite | O servidor retornou HTML em vez de Lua.', 0)
end
local chunk, reason = loadstring(source)
if type(chunk) ~= 'function' then
    error('Prime Void Hub - Storm Suite | Source inválida: '..tostring(reason), 0)
end
return chunk()
