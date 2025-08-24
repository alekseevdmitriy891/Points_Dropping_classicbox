function ulx.dropPoints( ply, amount )
    if SERVER then
        if amount > 0 and amount >= amount then -- после "and" в первом аргументе вставляешь переменную поинтов игрока 
            -- сюда отбавление переменный amount от переменной поинтов от игрока
            local droppedPoints = ents.Create("dropped_points")
            droppedPoints:Spawn()
            droppedPoints:SetAmount(amount)
            droppedPoints:SetPos(LocalToWorld(ply:OBBCenter()+Vector(50+math.Clamp(amount/25,0.25,100),0,math.Clamp(amount/25,0.25,100)),angle_zero,ply:GetPos(),ply:EyeAngles()))
            ply:ChatPrint("Succesfully Dropped Points")
        else
            ply:ChatPrint("Can't Drop amount lower than 1 or your points")
        end
    end
end
local dropPoints = ulx.command( "Util", "ulx droppoints", ulx.dropPoints, "!droppoints" )
dropPoints:addParam{ type=ULib.cmds.NumArg, min=1, default=100, hint="Amount", ULib.cmds.optional }
dropPoints:defaultAccess( ULib.ACCESS_ALL )
dropPoints:help( "Drops Amount of Points." )