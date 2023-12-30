-- Created by eleseta#3053 and Nico 1997#4637 // https://discord.gg/4ECThkQmaX 
-- Config --
Config = {}

Config.Locale = "es"
Config.OpenKey = 'F3'
Config.CommandName = 'jobinfo'
Config.Menu = true
Config.Command = true
-- end config --

ESX = nil
local esxLegacy, esxR = pcall(
    function()
        if (ESX == nil) then
            ESX = exports['es_extended']:getSharedObject()
        end
    end
)

if (not esxLegacy) then
    CreateThread(
        function()
            while (ESX == nil) do
                Wait(0)
                TriggerEvent(
                    'esx:getSharedObject',
                    function(obj)
                        ESX = obj
                    end
                )
            end
        end
    )
end

if (Config.Menu) == true then
    RegisterCommand('+openjobmenu', function()
        openJobMenu()
    end)
    RegisterKeyMapping('+openjobmenu', 'Abrir Menú de trabajo', 'keyboard', Config.OpenKey)
end

if (Config.Command) == true then
     RegisterCommand(Config.CommandName, function()
         openJobMenu()
     end)
end


function openJobMenu()
        ESX.UI.Menu.CloseAll()

        Job = ((_U('job_name'))  .. ESX.GetPlayerData().job.label)
        Grade = ((_U('job_grade')) .. ESX.GetPlayerData().job.grade_label)
        Salary = ((_U('job_salary')) .. ESX.GetPlayerData().job.grade_salary)

    local elements = {
        {label = Job, value = '0'},
        {label = Grade, value = '0'},
        {label = Salary, value = '0'},
        {label = (_U('close_menu')), value = 'close'}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jobmenu',{
        title = (_U('job_title')),
        align = 'bottom-right',
        elements = elements
    },

function(data, menu)
        if data.current.value == '0' then
    elseif data.current.value == 'close' then
        menu.close()
    end
end,

function(data, menu)
    menu.close()
    end)
end

-- Created by eleseta#3053 and Nico 1997#4637 // https://discord.gg/4ECThkQmaX 
