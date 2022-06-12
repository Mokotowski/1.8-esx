ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)

	ESX.TriggerServerCallback('esx_shops:requestDBItems', function(ShopItems)
		for k,v in pairs(ShopItems) do
			Config.Shops[k].Items = v
		end
	end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	TriggerServerEvent('neey_sim:joinAcitvate')
end)
function OpenBuyMenuSim_cash()
    local elements = {
      {label = 'Zakup karty SIM (25$)',		value = 'b_sim'},
      {label = 'Zarządzanie kartami SIM',		value = 'z_sim'},
    }
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'sim_player',
      {
        title = "CoS Mobile",
        align = 'center',
        elements	= elements
      },
      function(data, menu)
        -- KUPOWANIE KARTY SIM
        if data.current.value == 'b_sim' then
          ESX.TriggerServerCallback('OsloRP:getMoney', function(money)
            if money > 24 then
              ESX.TriggerServerCallback('OsloRP:getCount', function(count)
                if count < 3 then
                  TriggerServerEvent('OsloRP:buySim')
                else
                  ESX.ShowNotification("~r~Osiągnieto limit kart SIM!")
                end
              end)
            else
              ESX.ShowNotification("~r~Nie masz wystarczającej liczby pieniędzy!")
            end
          end)
        end

        if data.current.value == 'z_sim' then
          ESX.TriggerServerCallback('OsloRP:getPlayerSims', function(sims)
            if #sims > 0 then
              local elements2 = {}
              for k,v in pairs(sims) do
                table.insert(elements2, { label = sims[k].label, value = sims[k].number })
              end
              ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'zsim_player',
                {
                  title = "Karty SIM",
                  align = 'center',
                  elements	= elements2
                },
                function(data2, menu2)
                  local elements3 = {
                    {label = 'Usuwanie karty SIM',	value = 'u_sim', sim = data2.current.value},
                    {label = 'Duplikat karty SIM (300$)',	value = 'd_sim', sim = data2.current.value},
                  }
                  ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'msim_player',
                    {
                      title = "Karta SIM #" .. data2.current.value,
                      align = 'center',
                      elements	= elements3
                    },
                    function(data3, menu3)
                      if data3.current.value == 'u_sim' then
                        TriggerServerEvent('OsloRP:deleteSim', data3.current.sim)
                        menu3.close()
                        menu2.close()
                      end
                      if data3.current.value == 'd_sim' then
                        TriggerServerEvent('OsloRP:duplicateSim', data3.current.sim)
                        menu3.close()
                        menu2.close()
                      end
                    end,
                    function(data3,menu3)
                      menu3.close()
                    end
                  )
                end,
                function(data2,menu2)
                  menu2.close()
                end
              )
            else
              ESX.ShowNotification("~r~Nie posiadasz karty SIM!")
            end
          end, GetPlayerServerId(PlayerId()))
        end
      end,
      function(data,menu)
        menu.close()
      end
    )
  end


  function OpenBuyMenuSim_bank()
    local elements = {
      {label = 'Zakup karty SIM (25$)',		value = 'b_sim'},
      {label = 'Zarządzanie kartami SIM',		value = 'z_sim'},
    }
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'sim_player',
      {
        title = "CoS Mobile",
        align = 'center',
        elements	= elements
      },
      function(data, menu)
        -- KUPOWANIE KARTY SIM
        if data.current.value == 'b_sim' then
          ESX.TriggerServerCallback('OsloRP:getMoney_bank', function(money)
            if money > 24 then
              ESX.TriggerServerCallback('OsloRP:getCount', function(count)
                if count < 3 then
                  TriggerServerEvent('OsloRP:buySim_bank')
                else
                  ESX.ShowNotification("~r~Osiągnieto limit kart SIM!")
                end
              end)
            else
              ESX.ShowNotification("~r~Nie masz wystarczającej liczby pieniędzy!")
            end
          end)
        end

        if data.current.value == 'z_sim' then
          ESX.TriggerServerCallback('OsloRP:getPlayerSims', function(sims)
            if #sims > 0 then
              local elements2 = {}
              for k,v in pairs(sims) do
                table.insert(elements2, { label = sims[k].label, value = sims[k].number })
              end
              ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'zsim_player',
                {
                  title = "Karty SIM",
                  align = 'center',
                  elements	= elements2
                },
                function(data2, menu2)
                  local elements3 = {
                    {label = 'Usuwanie karty SIM',	value = 'u_sim', sim = data2.current.value},
                    {label = 'Duplikat karty SIM (300$)',	value = 'd_sim', sim = data2.current.value},
                  }
                  ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'msim_player',
                    {
                      title = "Karta SIM #" .. data2.current.value,
                      align = 'center',
                      elements	= elements3
                    },
                    function(data3, menu3)
                      if data3.current.value == 'u_sim' then
                        TriggerServerEvent('OsloRP:deleteSim', data3.current.sim)
                        menu3.close()
                        menu2.close()
                      end
                      if data3.current.value == 'd_sim' then
                        TriggerServerEvent('OsloRP:duplicateSim', data3.current.sim)
                        menu3.close()
                        menu2.close()
                      end
                    end,
                    function(data3,menu3)
                      menu3.close()
                    end
                  )
                end,
                function(data2,menu2)
                  menu2.close()
                end
              )
            else
              ESX.ShowNotification("~r~Nie posiadasz karty SIM!")
            end
          end, GetPlayerServerId(PlayerId()))
        end
      end,
      function(data,menu)
        menu.close()
      end
    )
  end


function platnosc(zone)

	
	local elements = {
		{label = 'Płatnośc gotówką',value = 'gotowka'},
	   {label = 'Płatnośc kartą ',value = 'karta'}
	   }
   
	   ESX.UI.Menu.CloseAll()
	   ESX.UI.Menu.Open(
	   'default', GetCurrentResourceName(), 'wybor_platnosci',
	   {
		   title    = 'Wybor Płatności',
		   align    = 'center',
		   elements = elements
	   }, function(data, menu)    
		   local action = data.current.value
		   if zone == 'Multimedialny'then  
			if action == 'gotowka' then
				OpenBuyMenuSim_cash(zone)
			 elseif action == 'karta' then
				OpenBuyMenuSim_bank(zone)
			 end 	
			else
				if action == 'gotowka' then
					OpenShopMenu_gotowka(zone)
				 elseif action == 'karta' then
					 OpenShopMenu_karta(zone)
				 end 	
			end 

		
	   end, function(data, menu)
		   menu.close()
	   end)
end
   
function OpenShopMenu_gotowka(zone)
	   local elements = {}

	   for i=1, #Config.Shops[zone].Items, 1 do
		   local item = Config.Shops[zone].Items[i]
   
   
		   	table.insert(elements, {
				label      = ('%s - <span style="color:green;">%s</span>'):format(item.label, _U('shop_item', ESX.Math.GroupDigits(item.price))),
				itemLabel = item.label,
				item       = item.item,
				price      = item.price,

				-- menu properties
				value      = 1,
				type       = 'slider',
				min        = 1,
				max        = item.limit
			})
	   end


	   ESX.UI.Menu.CloseAll()
	   ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		   title    = _U('shop'),
		   align    = 'center',
		   elements = elements
	   }, function(data, menu)
		   ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			   title    = _U('shop_confirm', data.current.value, data.current.label),
			   align    = 'center',
			   elements = {
				   {label = _U('no'),  value = 'no'},
				   {label = _U('yes'), value = 'yes'}
			   }
		   }, function(data2, menu2)
			for k,v in pairs(Config.Shops) do
			   	if data2.current.value == 'yes' and not v.DarkShop then
					TriggerServerEvent('esx_shops:buyItem_gotowka', data.current.item, data.current.value, zone) 
			   	elseif data2.current.value == 'yes' and  v.DarkShop  then  
					TriggerServerEvent('esx_shops:buyItemDarkShop', data.current.item, data.current.value, zone)
			   
				end 
			   menu2.close()
			end
		   end, function(data2, menu2)
			   menu2.close()
		   end)
	   end, function(data, menu)
		   menu.close()
   

	   end)
end


function OpenShopMenu_karta(zone)
	local elements = {}
	for i=1, #Config.Shops[zone].Items, 1 do
		local item = Config.Shops[zone].Items[i]

		if item.limit == -1 then
			item.limit = 100
		end

		table.insert(elements, {
			label      = ('%s - <span style="color:green;">%s</span>'):format(item.label, _U('shop_item', ESX.Math.GroupDigits(item.price))),
			itemLabel = item.label,
			item       = item.item,
			price      = item.price,

			-- menu properties
			value      = 1,
			type       = 'slider',
			min        = 1,
			max        = item.limit
		})
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title    = _U('shop'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title    = _U('shop_confirm', data.current.value, data.current.label),
			align    = 'center',
			elements = {
				{label = _U('no'),  value = 'no'},
				{label = _U('yes'), value = 'yes'}
			}
		}, function(data2, menu2)
			for k,v in pairs(Config.Shops) do
				if data2.current.value == 'yes' and not v.DarkShop then
					TriggerServerEvent('esx_shops:buyItem_karta', data.current.item, data.current.value, zone) 
			elseif data2.current.value == 'yes' and  v.DarkShop then  
				--TriggerServerEvent('esx_shops:buyItemDarkShop', data.current.item, data.current.value, zone)
			end
			menu2.close()
		end
			

		
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()


	end)
end


-- Create Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Shops) do

		if v.Weapon and not v.NoBlip then
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)

				SetBlipSprite (blip, 156)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, 2)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName('Sklep z Bronią')
				EndTextCommandSetBlipName(blip)
			end
		end
		if v.Techniczny and not v.NoBlip then 
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)

				SetBlipSprite (blip, 478)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, 17)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName('Sklep Techniczny')
				EndTextCommandSetBlipName(blip)
			end
		end

		if not v.Weapon and not v.NoBlip and not v.Techniczny and not v.Kawiarnia then
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)

				SetBlipSprite (blip, 628)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, 2)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('shops'))
				EndTextCommandSetBlipName(blip)
			end
		end
		
		if not v.Weapon and not v.NoBlip and not v.Techniczny and v.Multimedialny then
			for i = 1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)

				SetBlipSprite (blip, 606)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, 3)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName('Multimedialny')
				EndTextCommandSetBlipName(blip)
			end
		end

	end
end)





---- Rysowanie Markerów 
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	PlayerData = ESX.GetPlayerData()
	Citizen.CreateThread(function()
		local delay = 1
		while true do
			local wait = true
				local ped = PlayerPedId()
				local pos = GetEntityCoords(ped) 
				for k,v in pairs(Config.Shops) do
					for i = 1, #v.Pos, 1 do
						local dist = Vdist(pos, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
						if dist <= Config.MaxDist then
							wait = false
							if dist <= 0.9 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_PICKUP~ aby otworzyć menu sklepu!')
								if IsControlJustReleased(0, 38) then
									if v.TwentyFourSeven then 
										platnosc('TwentyFourSeven')
									
									elseif v.RobsLiquor then 
										platnosc('RobsLiquor')
									elseif v.LTDgasoline then 
										platnosc('LTDgasoline')
										
									elseif v.Techniczny then 
										platnosc('Techniczny')
									elseif v.Weapon then 
										ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
											if hasWeaponLicense then
												platnosc('WeaponShop')
											else 
												ESX.ShowHelpNotification('Nie masz licencji!')

											end
										end, GetPlayerServerId(PlayerId()), 'weapon')
							
									elseif v.Multimedialny then
										platnosc('Multimedialny')
									elseif v.DarkShop then 
										platnosc('DarkShop')
									elseif v.Kawiarnia then 
										platnosc('Kawiarnia')
									else
									end
									
								end
							end
							DrawMarker(27, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 27, 6, 500, false, true, 2, false, false, false, false)
						end
					end
				end
			if wait then delay = 1000 else delay = 1 end
			Citizen.Wait(delay)
		end
	end) 
end) 
