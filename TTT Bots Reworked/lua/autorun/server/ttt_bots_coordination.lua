--[[
    This file enable the bots to harbor useful coordinative skills and apply them to combat..
    It also decides how traitor bots acquire new targets.
]]

//include("ttt_bots_rework.lua")

local Meta = FindMetaTable("Player")

function Meta:TraitorGetTarget()
    if(self.patience == nil) then self.patience = ((0)-(self.personality*math.random(-1, 1))) else self.patience = self.patience + 0.1 end


    local inns = self:GetInnoViewers()
    local ninns = #inns
    if (ninns > 0) then
        local bot = self
        bot.probability = (bot.patience / (math.pow(#inns[1]:GetInnoViewers(), 3)))
        bot.ptargs = inns
        //print(bot:Nick().." "..bot.probability)
        if (bot.probability*100 > (math.random(100, 10000)/100)) then
            return inns[1]
        end
    end

    for i,v in pairs(GetTraitorBots()) do -- help a teammate out, why not
        if v.target != nil && self.target == nil and self.personality == 1 then
            return v.target
        end
    end

end

timer.Create("TTTBotTraitorGetTarget", 1, 0, function()
	if gmod.GetGamemode().Name != "Trouble in Terrorist Town" then return end
    for i,bot in pairs(player.GetBots()) do
        if bot.target != nil and bot:GetRoleString() == "traitor" and roundIsActive and planter != bot then -- the below "if" statement but if it has a target
            
        end
        if bot.target == nil and bot:GetRoleString() == "traitor" and roundIsActive and planter != bot then -- no target, not planting, round active, traitor
            bot.target = bot:TraitorGetTarget()
        end
    end
end)