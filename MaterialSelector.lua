--[[

CubingDeveloper 2024

Material selector menu for Roblox studio plug-ins

]]
local materialSelectorModule = {}
local widgetInfo: DockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,
	false
)

local UI = script.MaterialManager.MaterialFrame:Clone()

local event = script.MaterialSelected
local parts = {}

local materials = Enum.Material:GetEnumItems()
materialSelectorModule.onMaterialSelectionStarted = function() end --[[
^ Edit this function to run code when the material selector is openend ^
]]

function createMaterialFrame(name: string, parent: Enum.Material)
	
	local templateClone = script.Template:Clone()
	templateClone.Name = name
	templateClone.DescAndNameContainer.MaterialName.Text = name
	templateClone.DescAndNameContainer.Description.Text = parent and `Materialvariant {name} of {parent}` or `Built-in Roblox material (Enum.Material.{name})`
	
	return templateClone
end

function materialSelectorModule.loadMaterial(Material: Enum.Material)

	local templateClone = createMaterialFrame(Material.Name, nil)
	
	templateClone.PartViewport.Sphere.Material = Material
	
	table.insert(parts, templateClone.PartViewport.Sphere)
	
	templateClone.ButtonContainer.Select.MouseButton1Click:Connect(function()
		--Close the widget and fire the event to return the selected material
		materialSelectorModule.mainWidget.Enabled = false
		event:Fire(Material)
	end)
	
	
	templateClone.Parent = UI.MaterialContainer
end

function materialSelectorModule.init(pluginSource: Plugin)

	materialSelectorModule.mainWidget = pluginSource:CreateDockWidgetPluginGui("Material Selector", widgetInfo)
	materialSelectorModule.mainWidget.Title = "Material Selector - CubingDeveloper"
	materialSelectorModule.mainWidget.Name = "MaterialSelector"
	
	UI.Parent = materialSelectorModule.mainWidget
	
	materialSelectorModule.mainWidget:GetPropertyChangedSignal("Enabled"):Connect(function()
		
		if not materialSelectorModule.mainWidget.Enabled then
			--Fire the event to make sure the script doesn't wait forever
			event:Fire(nil)
		end
		
	end)
	
	for _,v in materials do
		
		materialSelectorModule.loadMaterial(v)
		
	end
	
	
	
end

function materialSelectorModule.ColorUpdate(color: Color3)
	
	for _, prt in parts do
		prt.Color = color
	end
	
end

function materialSelectorModule.promptSelectMaterial()
	
	materialSelectorModule.mainWidget.Enabled = true
	materialSelectorModule.onMaterialSelectionStarted()	
end

return materialSelectorModule
