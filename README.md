# Bézier Curve Shape Editor Roblox studio plugin

## Set-up
You can find the plugin here: [https://create.roblox.com/store/asset/18696218289](https://create.roblox.com/store/asset/18696218289/NOT-FINISHED-DO-NOT-USE).

Once you have installed it in Roblox Studio go to PLUGINS -> Plugins by @CubingDeveloper and click Bézier Curve Shapes

## Usage
To use the plugin start off by pressing the Select button to select a surface to add your curve to. Points can only be moved and created on that surface, and where you press will determine the center.
After you have created the center of your shape you can left click to create dots. You can simply move dots around by dragging them around. 
The color of the dots have different meanings.
- The yellow dot is the center
- The purple dot is the start and end of the shape.
- The green dots are points P0 and P3 (Start and end of the single curve)
- The blue dots are points P1 and P2

Once you have made your shape, simply press the finish button and the plugin will make an union that represents your shape. In the future I am planning to add support for `EditableMeshes`, but since they can't be saved and still are in Beta this most likely won't be added for a while

## Known issues
- Crossing lines will cause issues since it's using normals and unions to calculate the shape
- Sometimes you can't drag points due to how plugin mouses works. To fix this just have your mouse enter the plugin window again and you should be able to drag points again.

## Further help and discussion
In my [Discord](https://discord.gg/k8wNB9fv9R) you can ask me or other people for help
You can learn more about Bézier in [this Wikipedia article](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) or use my [Roblox visualiser](https://www.roblox.com/games/18319270006/B-zier-Curve-Editor-LVL-UP) to play around with different types of curves. This plugin uses cubic Bézier curves.

