# Steam Prototype Launcher
A Launcher for Steam's Prototype game that automatically changes the ProcessorAffinity.

I've been running Prototype in Windows 11 but I was getting tired of manually changing the ProcessorAffinity so I found this trick of creating a batch file and then calling "start /affinity FF <steam_games_path>/prototypef.exe" but it did not work for me as it seems it is disabled for security reasons (don't quote me) also in my case in order for this fix to work both the steam.exe and prototypef.exe needs to be changed to use 8 cores.

So I decided to write this two-part script in order to run this game, for starters if for any reason you have enabled the option to run scripts directly into Powershell then you can skip the "PrototypeLauncher.bat" file as this script was created to bypass the execution policies of Powershell.

## Installation


## How to use it
