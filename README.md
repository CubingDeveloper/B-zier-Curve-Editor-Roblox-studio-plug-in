# Material Selector module for roblox plug-ins
## Set-up
You can find the plugin here: [Creator Store](https://create.roblox.com/store/asset/93888406964695/MaterialSelector-module-for-plugins).
Once you have installed it in Roblox Studio go to your toolbox then those four squares then my models. And then it should be there! Simply click it to insert it!

## Usage
Require the module script and initialize it like this:
```lua
local MaterialSelectorModule = require(script.MaterialSelectorModule)
MaterialSelectorModule(plugin) --The plugin is for creating UI. This is required.
```
Then bind the open to a function
```lua
MaterialSelector.onMaterialSelectionStarted = function()

  local selectedMaterial: Enum.Material = MaterialSelectedEvent.Event:Wait()
  if selectedMaterial then
    print("User selected material", selectedMaterial)
  else
    print("User cancelled the interaction")
  end
end
```
And now... for the final part, open the UI!
```lua
MaterialSelectorModule.promptSelectMaterial()
```
And now the user will be prompted to select a material! If you want to edit the preview colours simply use the function `.ColorUpdate(Color3)` to change all of the colours to a Color3


## Further help and discussion
In my [Discord](https://discord.gg/k8wNB9fv9R) you can ask me or other people for help! Feel free to DM me on Discord if you want to reach me directly. The issues tab can be used to report errors.
