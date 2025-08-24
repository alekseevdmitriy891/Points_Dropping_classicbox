AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName   = "Dropped Points"
ENT.Author      = "alekseevdmitriy891"
ENT.Spawnable = true

ENT.Category = "Other"

function ENT:SetupDataTables()
    self:NetworkVar("Int",0,"Amount")
    self:NetworkVarNotify("Amount",self.AmountChange)
end

function ENT:Initialize()
    self:SetModel("models/hunter/misc/sphere025x025.mdl")
    self:SetMaterial("models/debug/debugwhite")
    self:SetColor(Color(255,255,255))
    if SERVER then 
        self:SetUseType(SIMPLE_USE)
    end
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()

    if ( IsValid(phys) ) then
        phys:Wake()
    end
end

function ENT:Draw()
    render.SuppressEngineLighting( true )
    self:DrawModel()
    render.SuppressEngineLighting( false )
end

function ENT:Use(activator,caller,usetype,value)
    if SERVER then 
        self:EmitSound("ambient/levels/labs/coinslot1.wav")
        self:Remove()
    end
end

function ENT:AmountChange(name,old,new)
    self:SetModelScale(math.Clamp(new/100,0.25,100),0)
    self:GetPhysicsObject():SetMass(new)
    self:Activate()
end