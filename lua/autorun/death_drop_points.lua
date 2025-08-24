local amount = 20

hook.Add("DoPlayerDeath", "death_drop_points", function( ply, attacker, dmg )
    if amount >= amount then -- сюда вместо первого аргумента вставляеш переменую игрока поинты
        -- сюда отбавление переменный amount от переменной поинтов от игрока
        local pos = ply:GetPos()
        local vel = dmg:GetDamageForce()
        local droppedPoints = ents.Create("dropped_points")
        droppedPoints:Spawn()
        droppedPoints:SetAmount(amount)
        droppedPoints:SetPos(LocalToWorld(ply:OBBCenter(),angle_zero,ply:GetPos(),angle_zero))
        droppedPoints:SetVelocity(vel)
    end
end)