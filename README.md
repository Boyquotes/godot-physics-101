# Godot Physics 101

## TLDR

This is a compilation of physical scenes and simulations for inspection and learning of GodotEngine physics.

## Explanation

Since I started working with game engines, I have been interested in the implemented physical systems. Since I wanted to do 2D simulations, there were only few possibilities at that time (e.g. Box2D). Then I stumbled across the Godot Engine and was immediately convinced of its power. So I did a lot of testing in a lot of simple projects to get a grasp of the underlying mechanics. Now I would like to summarize my knowledge in one project/repository and make it understandable for others. So here we are: Godot Physics 101.

## How it works

When running the project you'll get a welcome screen where you can choose one of the provided scenes. These encapsulate one aspect of Godots capabilities in simulating a physical world. You can start a scene, watch it running (or interacting with it) and read about its foundations in a description sidebar. There are scenes for 2D and 3D physics.

## Overview

1. General
	1.1 Docs
2. 2D
	2.1 Sandbox2D
	2.2 Bodyconcepts2D
	2.3 Gravity2D
3. 3D
	3.1 Sandbox
	3.2 Bodyconcepts
	3.3 Gravity

## Standing on the shoulder of giants

Here is a list of projects, which I will use as a basis for the compilation of examples:

### Docs

- http://box2d.org/manual.pdf
- https://docs.unity3d.com/Manual/PhysicsSection.html
- https://docs.unrealengine.com/en-US/Engine/Physics/index.html
- https://docs.cryengine.com/display/CEMANUAL/Physics

### Examples

- Bullet Physics Examples Explorer
- Processing examples list https://processing.org/examples/
- Phaser.io examples https://phaser.io/examples/v3/category/physics
- LiquidFun http://google.github.io/liquidfun/
- PhyscsJS http://wellcaffeinated.net/PhysicsJS/
- P2.js https://github.com/schteppe/p2.js#demos
- Planck.js http://piqnt.com/planck.js/
- Physijs https://github.com/chandlerprall/Physijs#examples
- Matter.js https://github.com/liabru/matter-js#demos
- Cannon.js http://schteppe.github.io/cannon.js/
- Ammo.js https://github.com/kripken/ammo.js#demos
- Oimo.js https://github.com/lo-th/Oimo.js#demo and http://lo-th.github.io/Oimo.js/#basic
- nphysics https://www.nphysics.org/demo_all_examples2/ and https://www.nphysics.org/demo_all_examples3/

