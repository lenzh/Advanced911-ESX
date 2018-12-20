-----------------------------------------------------
--- Advanced 911, Made by FAXES modified by Lenzh ---
-----------------------------------------------------

--- CONFIG ---
ESX                              = nil
local PlayerData        = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

---------------------------------------------------------------------------------
RegisterNetEvent('Fax:SendCall')
AddEventHandler('Fax:SendCall', function(service, desc, callid)
    local src = s
    local ped = GetPlayerPed(PlayerId())
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    local street1, crossing  = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local streetName = (GetStreetNameFromHashKey(street1))


	if service == "pd" then
		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
      if crossing ~= nil then
        crossing = GetStreetNameFromHashKey(crossing)
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid, streetName, crossing)
    else
      TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid, streetName)
		end

	 elseif service == "ems" then
		if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
      if crossing ~= nil then
        crossing = GetStreetNameFromHashKey(crossing)
			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid, streetName, crossing)
    else
      TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid, streetName)
        end

        elseif service == "all" then
      		if PlayerData.job ~= nil and PlayerData.job.name == 'police' or PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
            if crossing ~= nil then
              crossing = GetStreetNameFromHashKey(crossing)
      			TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid, streetName, crossing)
          else
            TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid, streetName)
      		end
    end
   end
  end
 end
end
)
