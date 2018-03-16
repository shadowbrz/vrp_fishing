local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
PSserver = Tunnel.getInterface("vrp_fishing")

local mostrarBlip = true

local areadepesca = {
  {name="Area de Pesca", id=68, colour=3, x=-1850.4851074219, y=-1248.4239501953, z=8.6157894134521},
}

local lojadepesca = {
  {name="Loja de peixes", id=356, colour=75, x=-1845.090, y=-1197.110, z=19.186},
}

Citizen.CreateThread(function()
 if (mostrarBlip == true) then
    for _, item in pairs(areadepesca) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipColour(item.blip, item.colour)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
 end
end)

Citizen.CreateThread(function()
 if (mostrarBlip == true) then
    for _, item in pairs(lojadepesca) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipColour(item.blip, item.colour)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
 end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1850.4851074219,-1248.4239501953,8.6157894134521, true ) < 1 then
				DisplayHelpText("Pressione ~g~E~s~ para pescar")
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1854.8659667969,-1244.9125976563,8.6157789230347, true ) < 1 then
				DisplayHelpText("Pressione ~g~E~s~ para pescar")
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1839.5308837891,-1257.5223388672,8.6157913208008, true ) < 1 then
				DisplayHelpText("Pressione ~g~E~s~ para pescar")
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1835.9487304688,-1260.5450439453,8.6157913208008, true ) < 1 then
				DisplayHelpText("Pressione ~g~E~s~ para pescar")
		end
	end
end)

local pescando = false

Citizen.CreateThread(function(player)
	while true do
		Wait(0)
		
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)

		DrawMarker(27, -1850.485,-1248.423,8.635-1.0001, 0, 0, 0, 0, 0, 0, 1.3001,1.3001,1.5001, 0, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, -1850.485,-1248.423,8.625, true) <= 5.0 then
			if IsControlJustPressed(0, 38) and PSserver.checkPermission() then
				pescando = true
				vRP.playAnim(false,{task="WORLD_HUMAN_STAND_FISHING"},true)
				TriggerServerEvent("addPescador")
			elseif IsControlJustPressed(0, 32) then
				pescando = false
				vRP.stopAnim(player,false)
				TriggerServerEvent("removePescador")
			end
		end	

		DrawMarker(27, -1854.865,-1244.912,8.635-1.0001, 0, 0, 0, 0, 0, 0, 1.3001,1.3001,1.5001, 0, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, -1854.865,-1244.912,8.625, true) <= 5.0 then
			if IsControlJustPressed(0, 38) and PSserver.checkPermission() then
				pescando = true
				vRP.playAnim(false,{task="WORLD_HUMAN_STAND_FISHING"},true)
				TriggerServerEvent("addPescador")
			elseif IsControlJustPressed(0, 32) then
				pescando = false
				vRP.stopAnim(player,false)
				TriggerServerEvent("removePescador")
			end
		end

		DrawMarker(27, -1839.530,-1257.522,8.635-1.0001, 0, 0, 0, 0, 0, 0, 1.3001,1.3001,1.5001, 0, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, -1839.530,-1257.522,8.625, true) <= 5.0 then
			if IsControlJustPressed(0, 38) and PSserver.checkPermission() then
				pescando = true
				vRP.playAnim(false,{task="WORLD_HUMAN_STAND_FISHING"},true)
				TriggerServerEvent("addPescador")
			elseif IsControlJustPressed(0, 32) then
				pescando = false
				vRP.stopAnim(player,false)
				TriggerServerEvent("removePescador")
			end
		end	

		DrawMarker(27, -1835.948,-1260.545,8.635-1.0001, 0, 0, 0, 0, 0, 0,1.3001,1.3001,1.5001, 0, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, -1835.948,-1260.545,8.625, true) <= 5.0 then
			if IsControlJustPressed(0, 38) and PSserver.checkPermission() then
				pescando = true
				vRP.playAnim(false,{task="WORLD_HUMAN_STAND_FISHING"},true)
				TriggerServerEvent("addPescador")
			elseif IsControlJustPressed(0, 32) then
				pescando = false
				vRP.stopAnim(player,false)
				TriggerServerEvent("removePescador")
			end
		end		
		
		if pescando == true then
			DrawSpecialText("Pressione ~g~W~s~ para parar de pescar")
			DisableControlAction( 0, 38, true )
		end
		
	end
end)

Citizen.CreateThread(function()
	local x = -1845.090
	local y = -1197.110
	local z = 19.186

	while true do
	Citizen.Wait(1)
			
	local playerPos = GetEntityCoords(GetPlayerPed(-1), true)

	if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 20.0) then
		DrawMarker(1, x, y, z - 1, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 165, 0,165, 0, 0, 0,0)

		if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 2.0) then
		DisplayHelpText("Pressione ~g~E~s~ para vender peixe")
		if (IsControlJustReleased(1, 51)) then
			TriggerServerEvent("checar:venda")
			Citizen.Wait(0)
		end
	  end
    end
   end
end)

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
