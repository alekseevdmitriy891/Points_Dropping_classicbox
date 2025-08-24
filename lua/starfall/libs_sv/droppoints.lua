-- Global to all starfalls
local checkluatype = SF.CheckLuaType
local checkvalidnumber = SF.CheckValidNumber
local registerprivilege = SF.Permissions.registerPrivilege
local IsValid = FindMetaTable("Entity").IsValid
local IsWorld = FindMetaTable("Entity").IsWorld

-- Register privileges
registerprivilege("player.dropPoints", "dropPoints", "Makes Player Drop Points In Amount", { usergroups = { default = 1 }, entities = {} })

return function(instance)
local checkpermission = instance.player ~= SF.Superuser and SF.Permissions.check or function() end

local player_methods, player_meta, wrap, unwrap = instance.Types.Player.Methods, instance.Types.Player, instance.Types.Player.Wrap, instance.Types.Player.Unwrap

local getent, getply
instance:AddHook("initialize", function()
	getent = instance.Types.Entity.GetEntity
	getply = player_meta.GetPlayer
end)

instance:AddHook("deinitialize", function()
	
end)

--- Makes Player Drop Points in Amount
-- @server
-- @param number amount The Amount Player Will Drop
function player_methods:dropPoints(amount)
    checkvalidnumber(amount)
	local ply = getply(self)
	checkpermission(instance, ply, "player.dropPoints") 
	if amount >= amount and true then -- вместо первого аргумента вставляешь переменную поинтов игрока, вместо третьего аргумента после "and" вставляешь проверку разрешение на манипуляции с переменной поинтов игрока
		-- сюда отбавление переменный amount от переменной поинтов от игрока
		local droppedPoints = ents.Create("dropped_points")
		droppedPoints:Spawn()
		droppedPoints:SetAmount(amount)
		droppedPoints:SetPos(LocalToWorld(ply:OBBCenter()+Vector(50+math.Clamp(amount/25,0.25,100),0,math.Clamp(amount/25,0.25,100)),Angle(),ply:GetPos(),ply:EyeAngles()))
	end
end

end