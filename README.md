# Steam Prototype Launcher
A Launcher for Steam's Prototype and Prototype 2 games that automatically changes the ProcessorAffinity.

I've been running Prototype in Windows 11 but I was getting tired of manually changing the ProcessorAffinity so I found this trick of creating a batch file and then calling "start /affinity FF <steam_games_path>/prototypef.exe" but it did not work for me as it seems it is disabled for security reasons (don't quote me) also in my case in order for this fix to work both the steam.exe and prototypef.exe needs to be changed to use 8 cores.

So I decided to write this two-part script in order to run this game, for starters if for any reason you have enabled the option to run scripts directly into Powershell then you can skip the "PrototypeLauncher.bat" file as this script was created to bypass the execution policies of Powershell.

## Installation

Just download and unzip the project wherever you want :wink:</br></br>
![Screenshot 2023-01-26 230348](https://user-images.githubusercontent.com/1012931/215014229-233fd808-1cfc-48cc-bb57-57ff9efde3a5.png)

## How to use it

<ol>
<li>
  If the Steam App or the Game library is not located in the default location then you must update the "PrototypeScript.ps1" with the right paths.

  Open the file with a text editor such as notepad and modify the lines 3, 11 and 12.

  ```powershell
  $global:steam_path = "C:\Program Files (x86)\Steam\steam.exe"

  $global:prototype1_path = "C:\Program Files (x86)\Steam\steamapps\common\Prototype\prototypef.exe"
  $global:prototype2_path = "C:\Program Files (x86)\Steam\steamapps\common\Prototype 2\prototype2.exe"
  ```
  </br>
</li>

<li>
  Double click the file "PrototypeLauncher.bat" and select either option 1 or 2 to run either Prototype 1 or 2 respectively.

  </br>

  ![Screenshot 2023-01-26 234037](https://user-images.githubusercontent.com/1012931/215017829-1d2d9e30-a0f3-4be8-85b5-2cb8630856fe.png)
</li>

<li>
  Select your CPU and then press enter. (it seems that for AMD cpu's you have to set it to use 4 cores because amd cores have two threads per core, I'm not sure about this as I only have intel based computers)

  </br>

  ![Screenshot 2023-01-26 234530](https://user-images.githubusercontent.com/1012931/215018136-a1c71e57-f387-4178-befc-d1b99895d166.png)
</li>

<li>
  Lastly after playing the game if you don't want to close the Steam client and you want to restore the ProcessorAffinity you can use the option 3
  
  ![Screenshot 2023-01-26 234037](https://user-images.githubusercontent.com/1012931/215017829-1d2d9e30-a0f3-4be8-85b5-2cb8630856fe.png)
</li>

<li>
  I hope you like it :sunglasses:
</li>
</ol>
