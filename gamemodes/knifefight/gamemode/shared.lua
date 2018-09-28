GM.Name = "Knife Fight"
GM.Author = "Ep1c_M1n10n"
GM.Email = "ep1cm1n10n123@gmail.com"
GM.Website = "ep1cm1n10n.ddns.net"

//This code sets the needed variables for the rest of the code
models = {"models/player/kleiner.mdl", "models/player/police.mdl", "models/player/police_fem.mdl", "models/player/combine_soldier.mdl", "models/player/combine_super_soldier.mdl", "models/player/combine_soldier_prisonguard.mdl", "models/player/Group01/male_07.mdl"}
maps = {"gm_construct", "gm_flatgrass", "kf_spheres"}
knifes = {"csgo_flip", "csgo_default_knife", "csgo_bayonet", "csgo_default_t", "csgo_bowie"}
startTime = os.time()
timelimit = GetConVar("kf_timelimit"):GetInt()*60
currentMap = game.GetMap()

function GM:Initialize()
end

function GM:Tick()
endTime = startTime+timelimit
if os.time() >= endTime then
	game.ConsoleCommand("changelevel " ..table.Random(maps).. "\n")
end
end

function PlayerInitialSpawn( ply )
ply:SetModel( table.Random(models) )
end

hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn", PlayerInitialSpawn )
hook.Add( "Initialize", "Initialize", Initialize )

function KillCounter( victim, weapon, killer )  --Sets up a new function called KillCounter
        if killer:GetNWInt("killcounter") == 100000 then --If the killcounter variable equals 100000 then do something 
            PrintMessage(HUD_PRINTTALK, "Player" .. killer:GetName() .. "Has Won")  --When the killcounter equals 50 it will print this "Player <playername> has won
            timer.Simple(3, function()   --Sets up a timer for three seconds
                game.ConsoleCommand("changelevel " ..table.Random(maps).. "\n") --When the timer finishes it excecutes this console command   
            end)  
        end
            if killer~=victim then
            killer:SetNWInt("killcounter", killer:GetNWInt("killcounter") + 1)

        
        end
	kills=victim:GetNWInt("killcounter")
    end

hook.Add("PlayerDeath","KillCounter", KillCounter)

function GM:PlayerSwitchFlashlight(ply, SwitchOn)
	return true
end