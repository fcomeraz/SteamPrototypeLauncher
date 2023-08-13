#Steam Default Path Location
#Feel free to change this value if you installed Steam in other location.
$global:steam_path = "C:\Program Files (x86)\Steam\steam.exe"

#Time to wait for steam to load (seconds).
#Feel free to change this value accordingly if Steam takes longer or shorter to load.
$global:steam_wait_time = 8

#Prototype Games Default Path Locations.
#Feel free to change these values if you installed games in other locations.
$global:prototype1_path = "C:\Program Files (x86)\Steam\steamapps\common\Prototype\prototypef.exe"
$global:prototype2_path = "C:\Program Files (x86)\Steam\steamapps\common\Prototype 2\prototype2.exe"

#Time to wait for game to load (seconds).
#Feel free to change this value accordingly if game takes longer or shorter to load.
$global:prototype_wait_time = 3


$global:target_cores = 0xFF

function SelectProcessor {
    Clear-Host
    do{
        Clear-Host
        Write-Host "1.- AMD"
        Write-Host "2.- Intel"

        $opt = Read-Host "Select your cpu"


        if($opt -eq 1){
            $global:target_cores = 0xF
        }

        if($opt -eq 2){
            $global:target_cores = 0xFF
        }

    }while(-not (($opt -eq 1) -or ($opt -eq 2)))

}

function ExecutePrototype{
    Clear-Host
    SelectProcessor
    
	$game_path = $global:prototype1_path

	if($opt -eq 1) {
		Write-Host "Executing Prototype..."
	} else {
		Write-Host "Executing Prototype 2..."
		$game_path = $global:prototype2_path
	}
    
    #Checks if Steam Process is Running.
    $steam = Get-Process steam -ErrorAction SilentlyContinue

    #If $steam is null then procedes to execute steam.
    if($steam -eq $null){
        start $global:steam_path

        #wait for steam process load in memory.
        start-sleep $global:steam_wait_time
        $steam = Get-Process steam -ErrorAction SilentlyContinue
    }

    if($steam){
        #Set Steam ProcessorAffinity to use only 4 cores (AMD) 
        #or 8 cores (Intel).
        $steam.ProcessorAffinity = $global:target_cores

        #Executes prototype 
        start $game_path

        #Waits for Prototype process to load in memory.
        start-sleep $global:prototype_wait_time

        #Get Prototype Process.
		$game_process = $null

		if($opt -eq 1) {
			$game_process = Get-Process prototypef -ErrorAction SilentlyContinue    
		} else {
			$game_process = Get-Process prototype2 -ErrorAction SilentlyContinue
		}  

        if($game_process){
            #Set prototype ProcessorAffinity to use only 4 cores (AMD) 
            #or 8 cores (Intel).
            $game_process.ProcessorAffinity = $global:target_cores
        }else{
            Write-Host "Game process not found."
        }
    }else{
        Write-Host "Steam process not found."
    }
}

function RestoreSteamProcessorAffinity{
    Clear-Host
    #Get Steam Process.
    $steam = Get-Process steam -ErrorAction SilentlyContinue

    if($steam){
        #Set Steam ProcessorAffinity to use all available cores.
        $steam.ProcessorAffinity = 0xFFFF
        Write-Host "Steam ProcessorAffinity Restored!!"
    }else{
        Write-Host "Steam Process not found."
    }

}

function CheckSteamProcessorAffinity{
    Clear-Host
    #Get Steam Process.
    $steam = Get-Process steam -ErrorAction SilentlyContinue


    $message = $steam.ProcessorAffinity

    if($message -eq 0xF){
        $message = "4 Cores."
    }

    if($message -eq 0xFF){
        $message = "8 Cores."
    }

    if($message -eq 0xFFFF){
        $message = "all available cores."
    }


    if($steam){
        Write-Host "Steam ProcessorAffinity is set to" $message
    }else{
        Write-Host "Steam Process not found"
    }
}

function main{
    do{
        Clear-Host
        Write-Host "1.- Execute Prototype 1"
        Write-Host "2.- Execute Prototype 2"
        Write-Host "3.- Check Steam ProcessorAffinity"
        Write-Host "4.- Restore Steam ProcessorAffinity"
        Write-Host "5.- Exit"

        $opt = Read-Host Select an option


        if($opt -eq 1 -or $opt -eq 2){
            ExecutePrototype
        }

        if($opt -eq 3){
            CheckSteamProcessorAffinity
        }
        
        if($opt -eq 4){
            RestoreSteamProcessorAffinity
        }

        if($opt -ne 5){
            pause
        } 
    }while($opt -ne 5)
}

main



