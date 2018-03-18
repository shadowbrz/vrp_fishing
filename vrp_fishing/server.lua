-- Credits: Sighmir and Shadow --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vRPps = {}
Tunnel.bindInterface("vrp_fishing",vRPps)

function vRPps.checkPermission()
  local user_id = vRP.getUserId(source)
  return vRP.hasPermission(user_id, "#varadepescar.1")
end

local peixes = { 
	"sardinha",
	"peixe-gato",
	"salmao",
	"corvina"
}

local pescadores = {}

function tickPescador()
  for k,v in pairs(pescadores) do
    if v then
      pescadores[k] = v+1
      if math.fmod(pescadores[k],10) == 0 then
        local user_id = vRP.getUserId(k)
		local peixe = peixes[math.random(1,#peixes)]
		if ((vRP.getInventoryWeight(user_id)+vRP.getItemWeight(peixe)) <= vRP.getInventoryMaxWeight(user_id)) then
			vRP.giveInventoryItem(user_id,peixe,1,true)
		else
			 vRPclient.notify(vRP.getUserSource(user_id), "~r~Seu inventory esta cheio.")
		end
      end
    end
  end
 SetTimeout(1000, tickPescador)
end
tickPescador()

RegisterServerEvent("addPescador")
AddEventHandler("addPescador", function()
  pescadores[source] = 0;
end)


RegisterServerEvent("removePescador")
AddEventHandler("removePescador", function()
  pescadores[source] = nil;
end)

RegisterServerEvent("checar:venda")
AddEventHandler("checar:venda", function()
	local source = source
	local user_id = vRP.getUserId(source)

		local sardinha = vRP.getInventoryItemAmount(user_id,"sardinha")
		local peixegato = vRP.getInventoryItemAmount(user_id,"peixe-gato")
		local salmao = vRP.getInventoryItemAmount(user_id,"salmao")
		local corvina = vRP.getInventoryItemAmount(user_id,"corvina")
			
			if sardinha >= 5 then
			local x = math.random(1,5)

			local amount = 5 * x
				vRP.giveMoney(user_id,amount)
				vRP.tryGetInventoryItem(user_id,"sardinha",x)

				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Você vendeu " ..x.. " sardinha por R$" .. amount ,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
				})

		elseif sardinha == 4 then
			local x = math.random(1,4)
			local amount = 5 * x
				vRP.giveMoney(user_id,amount)
				vRP.tryGetInventoryItem(user_id,"sardinha",x)

				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Você vendeu " ..x.. " sardinha por R$"..amount,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
				})

		elseif sardinha == 3 then
			local x = math.random(1,3)
			local amount = 5 * x
				vRP.giveMoney(user_id,amount)
				vRP.tryGetInventoryItem(user_id,"sardinha",x)

				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Você vendeu " ..x.. " sardinha por R$"..amount,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
				})

		elseif sardinha == 2 then
			local x = math.random(1,2)
			local amount = 5 * x
				vRP.giveMoney(user_id,amount)
				vRP.tryGetInventoryItem(user_id,"sardinha",x)

				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Você vendeu " ..x.. " sardinha por R$"..amount,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
				})

		elseif sardinha == 1 then
			local amount = 5
				vRP.giveMoney(user_id,amount)
				vRP.tryGetInventoryItem(user_id,"sardinha",1)

				TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
				TriggerClientEvent("pNotify:SendNotification", source, {
					text = "Você vendeu 1 sardinha por R$"..amount,
					type = "success",
					progressBar = false,
					queue = "lmao",
					timeout = 2000,
					layout = "CenterLeft"
				})

		elseif peixegato >= 5 then
			local x2 = math.random(1,5)
			local amount = 10 * x2
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"peixe-gato",x2)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x2.. " peixe-gato por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif peixegato == 4 then
			local x2 = math.random(1,4)
			local amount = 10 * x2
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"peixe-gato",x2)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x2.. " peixe-gato por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif peixegato == 3 then
			local x2 = math.random(1,3)
			local amount = 10 * x2
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"peixe-gato",x2)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x2.. " peixe-gato por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif peixegato == 2 then
			local x2 = math.random(1,2)
			local amount = 10 * x2
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"peixe-gato",x2)
			
			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x2.. " peixe-gato por R$"..amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif peixegato == 1 then
			local amount = 10
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"peixe-gato",1)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu 1 peixe-gato por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif salmao >= 5 then
			local x3 = math.random(1,5)
			local amount = 15 * x3
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"salmao",x3)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x3.. " salmao por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif salmao == 4 then
			local x3 = math.random(1,4)

			local amount = 15 * x3
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"salmao",x3)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x3.. " salmao por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif salmao == 3 then
			local x3 = math.random(1,3)

			local amount = 15 * x3
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"salmao",x3)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x3.. " salmao por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif salmao == 2 then
			local x3 = math.random(1,2)

			local amount = 15 * x3
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"salmao",x3)
			
			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x3.. " salmao por R$"..amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif salmao == 1 then

			local amount = 15
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"salmao",1)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu 1 salmao por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})
				
		elseif corvina >= 5 then
			local x4 = math.random(1,5)

			local amount = 20 * x4
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"corvina",x4)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x4.. " corvina por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif corvina == 4 then
			local x4 = math.random(1,4)

			local amount = 20 * x4
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"corvina",x4)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x4.. " corvina por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif corvina == 3 then
			local x4 = math.random(1,3)

			local amount = 20 * x4
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"corvina",x4)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x4.. " corvina por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif corvina == 2 then
			local x4 = math.random(1,2)

			local amount = 20 * x4
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"corvina",x4)
			
			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu " ..x4.. " corvina por R$"..amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})

		elseif corvina == 1 then

			local amount = 20
			vRP.giveMoney(user_id,amount)
			vRP.tryGetInventoryItem(user_id,"corvina",1)

			TriggerClientEvent("pNotify:SetQueueMax", source, "lmao", 5)
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Você vendeu 1 corvina por R$" .. amount,
				type = "success",
				progressBar = false,
				queue = "lmao",
				timeout = 2000,
				layout = "CenterLeft"
			})
		end
end)