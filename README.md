# HOME

- [INTRODUCTION](#introduction-to-minibot-for-wow)
- [GET STARTED](#get-started)

# INTRODUCTION TO MINIBOT FOR WOW

**MiniBot for WoW** is an easy-to-use, advanced, one-stop and subscription-based platform for developing, releasing and running WoW bot projects. It brings lots of revolutionary features while you don’t need anything else to get all the bot magics to become true!

The whole **MiniBot** has many innovative features. To name just a few, we will highlight only the most important and revolutionary ones here.

## Proprietary Kernel

No, we are not a pixel-based bot (proven to be unstable, low quality and even not 100% safe). Yes, we eat our own lunch by using our own memory-based kernel. It runs in Windows kernel mode utilizing virtualization technology (ring -1) while Warden (WoW anti-cheat) only runs in Windows user mode (ring 3). This is like a V16, the most powerful engine of a car on earth.

## Dual-Version Support

**MiniBot** supports both Retail and Classic version of WoW (only official servers).

## Official Lua-based Framework

The existing “WoW unlockers” in the market only provide a bare-metal engine and let 3rd party developers write Lua addons from ground up. Such developers have very little knowledge about how unlockers work under the hood. We believe this is wrong as it leads to high cost of development, lots of fragmentation, unreliability, and most importantly lack of safety. Besides, the end users can easily encounter passing-the-buck issues under this structure.

Thus, besides our own kernel, MiniBot also brings a well-encapsulated framework developed by the same team who invented the kernel. It establishes the standards of WoW bot development in the following terms.

## Navmesh-Driven
Obviously, the framework is based on Navmesh to achieve the most human-like navigation. Besides, it never uses Click-To-Move (the notorious yellow circle on the ground) but simulates every movement action like how 99% users usually play via keyboard.

## Code-Free Bot Development

**MiniBot** eliminates the necessity of coding Lua if you wish to build a normal bot product by providing a GUI-based tool called “MiniBot Studio”. Yes, you only need to have a structured timeline-based idea in your mind without any programming skills, just like directing a movie! Then, you can build your own highly-customized bot projects within a couple of hours just like how you use Excel or Adobe Premiere.

## Programmable Extensions

Though you don’t need to code Lua, but you still can if you wish to customize stuffs not provided by the official vocabulary. The Framework gives you several extension points where you can write your own Lua scripts. Such design still gives you great flexibility of extent that you wish to customize the stuffs.

If you are still not satisfied with the framework extension points, you can even create your own new Lua framework just like what the other unlockers can ONLY do, while it can still be commercially protected by the following feature.

## Commercial-Ready Projects

**MiniBot** puts the commercialization of Bot project development in top priority. Therefore, it allows you to create encrypted copies of your own project with full authorization control with only a simple command line tool. By only dispatching such protected copies to other users, you can rest assured that your own project work is fully copyright protected and commercially ready.

## OEM Friendly

Though **MiniBot** is a paid platform, we are still OEM friendly (aka white labeling). You can easily establish your own brand based on **MiniBot** technology. The CLI version (command-line) of **MiniBot** gives you a single command line (CLI) to build an OEM version of **MiniBot**, within a couple of minutes!

Besides, as **MiniBot CLI** can launch in “silent mode”, you could also choose the hard but more customized way to do OEM by building your own software.

## Affordable Subscription Price

A fortified kernel with revolutionary framework comes at a very affordable price. Don’t forget that you only need to subscribe once in one place, and you get everything needed! We only sell monthly subscriptions at maximum while short period trial subscriptions are also available. Moreover, the dual version support is included in one single subscription so you don’t need to pay extra for Retail and Classic versions separately!

# GET STARTED

In this section, we will guide you onboard the world of MiniBot in brief words.

## Start as a Normal User

As a normal Bot user, the steps to get onboard are within a couple of minutes.

1. Due to the kernel technology, make sure you are using a compatible Windows OS, including:
- Windows 7 SP1 with latest patch (6.1.7600.24384 or higher)
- Windows 8.1 with latest patch (6.3.9600.19678 or higher)
- Windows 10 with latest patch (1809 or higher)

2. Make sure your PC meets the minimum hardware requirement.
- For Intel users, your CPU must be Core Ivy Bridge (3rd generation) or later.
- For AMD users, your CPU must be Ryzen series.

3. Download the latest GUI version of **MiniBot** in [Releases](https://github.com/pierre-picard/minibot-wow/releases/latest).

4. Download the latest map pack in [Releases](https://github.com/pierre-picard/minibot-wow/releases/latest) and extract it into the main folder of **MiniBot** (`/maps` subfolder).

5. Start **MiniBot**, register a new user and login.

6. Subscribe to **MiniBot** with a recharge card of the right value corresponding to your selected option.

7. Grab one or more **MiniBot** projects (ending with .bot files) and put them in `/scripts` subfolder.

8. Configure the launch options, launch the system, and enter WoW.

9. If everything goes right, you should see the in-game **MiniBot** panel popped up. Choose the current project that you wish to run and click `Start` button. Remember to follow the other instructions of the project developer and happy botting!

## Start as a Project Developer

If you wish to create your own MiniBot projects, the steps to get started are also only a few as below.

1. Download the latest `MiniBot Studio` in [Releases](https://github.com/pierre-picard/minibot-wow/releases/latest).

2. Start `MiniBot Studio` and choose a base folder (aka workspace) that stores your projects to develop. Each project will be a subfolder in it.

3. Create a new project or load an existing one from the menu.

4. Launch **MiniBot** and switch to the current project being developed, then record the new paths.

5. Restart `MiniBot Studio` when you finish recording new paths in order to use them for project development.

6. Refer to our [Wiki](https://github.com/pierre-picard/minibot-wow/wiki) for more comprehensive development guide.

## Start as a Project Seller or MiniBot Reseller (Dealer)

If you wish to sell your project work or even want to white label the product to run your own business, welcome to use `MiniBot CLI`.

1. Download the latest CLI version of **MiniBot** in [Releases](https://github.com/pierre-picard/minibot-wow/releases/latest).

2. Download the latest map pack in [Releases](https://github.com/pierre-picard/minibot-wow/releases/latest) and extract it into the main folder of **MiniBot** (`/maps` subfolder).

3. Enter command `MiniBot.Cli.exe -h` to view all verbs of MiniBot command line.

4. You can use command `MiniBot.Cli.exe inject` to launch the system in one go.

5. You can use command `MiniBot.Cli.exe encrypt` to encrypt the source code of project with built-in authorizations and dispatch the protected copy to your end users.
- Such command needs an [auth.json](/cli/auth.json) definition file that contains the authorization info.

6. You can use command `MiniBot.Cli.exe oem` to build an OEM file (`product.dat`) to replace the original file.
- Such command requires Dealer access granted to your MiniBot account. Contact us for access request.
- Such command needs an [oem.json](/cli/oem.json) definition file that describes the OEM info.
