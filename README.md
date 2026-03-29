# FFXI GearSwap

These files are used to help automate equipment changes while playing Final Fantasy XI.  They are specifically tuned for my characters, Soverance and Monarc on the Siren server, though you can easily modify them to work for your characters as well.

# Requirements

* An installed and updated official version of Final Fantasy XI
* * http://www.playonline.com/ff11us/download/media/install_win.html
* Windower 4 (stable)
* * https://docs.windower.net/

# FFXI Config Settings
This is an installed app you must launch prior to starting FFXI.

* Window Mode:  Borderless Window
* Resolution: 1920 x 1080
* Play opening movie on startup = NO

# FFXI In-Game Settings

## Backup / Restore Macros from official server
In the latest version of FFXI, you can simply select an option on the character select screen to save your restore your character config from the official Square Enix servers.  You used to have to do this with a hidden keyboard command, but not anymore!


## Gameplay

* Inventory - Auto Sort = ON
* Inventory - Type 1

## Chat Filters
* Any messages for "others" or "NPCs"

## Window Settings
* Window Type = 6

## Misc. 3
* Area Display = ON
* Status Icons - Timer Display = ON
* Status Icons - Party Display = ON

## Global
* Language Filter = OFF
* Auto-Disconnect = OFF

# Windower Profile Config
* Region = Auto-Detect
* Resolution = 3840 x 2160  (4K, use 2x UI scale)
* Resolution = 1920 x 1080  (1080p, use 1x UI scale)
* Window Mode = Borderless Window
* UI Scale = 2x 
* Super Sampling = ON
* Bump Mapping = OFF (use ambient lighting instead, F11 key in-game)

* **NOTE 1:**  Use a standard resolution (1080p or 4k). Ultrawide or non-standard resolutions look terrible/stretched.
* **NOTE 2:**  If your monitor has G-SYNC / Adaptive Sync, you should disable it, otherwise you may experience crashes due to display adapter resets

# Recommended Windower Extensions

## Addons

https://docs.windower.net/addons/

* Craft   
* Distance  
* GearSwap  
* TargetInfo (specific use case)
* Timestamp  (best for HNM ToD)
* TParty  

## Plugins

https://docs.windower.net/plugins/

* AutoExec   
* DelayMeNot 
* WinControl

# GearSwap Configuration

This repository reflects the following installation directory on your local system:

`..\Windower\addons\GearSwap\data`

By default, GearSwap will search within subfolders of the current character name.

You can then use the commands found on the [GearSwap Documentation](https://docs.windower.net/addons/gearswap/) to load the files in-game.  For example, the following command would load the RDM template when run inside Monarc's windower console:

`gs load RDM`

If you're new to GearSwap, you can get a quick crash course from [this reddit post](https://www.reddit.com/r/ffxi/comments/at3bxq/gearswap_for_idiots/egyoivh/):

You can also check out the beta examples and instructions in the GearSwap install directory for more information.

```
The absolute easiest way to create a gearset will be to equip everything in game (all 16 slots), and then use the gearswap "Export" command by typing the following command into your in-game chat bar:

//gs export

This will export a file i-nto your "../Windower/addons/Gearswap/data/exports/" directory that allows you to simply copy and paste the gear (with appropriate syntax, naming, and even augments) into your new set.
```

**Be aware of four things:**

1. If Gearswap fails to execute a command and does not detect it, the addon will likely block all input until it is reloaded.
2. verify_equip() is not very robust, and in Delve it tends to not be usable. cast_delay() is recommended instead.
3. Logging is on by default. You can turn it off towards the top of gearswap.

Basic function scaffolding for a new file is shown below:

```
-----------------------------------------------------------------------------------

function get_sets()

--This function prepares your equipment sets.

end

-----------------------------------------------------------------------------------

function precast(spell)

--This function performs right before the action is sent to the server.

end

-----------------------------------------------------------------------------------

function midcast(spell)

--This function performs after precast but before the action is sent to the server.

end

-----------------------------------------------------------------------------------

function aftercast(spell)

--This function performs after the action has taken place

end

-----------------------------------------------------------------------------------
```

# Other FFXI / Windower Tidbits

* hit insert to bring up windower console

## WinControl
Move the screen over to another monitor!  (These are examples for different monitor configurations I've used - yours may differ)

* 4k resolution, far left screen
`wincontrol move -3840 0`

* 2k resolution, far left screen
`wincontrol move -2560 0`

* ultrawide 1440, bottom right screen
`wincontrol move 1520 320`

## High DPI resolution fix
Sometimes when you load Windower on a high DPI (4k) monitor, the FFXI window will be massively oversized due to the resolution scaling setting in Windows.

To resolve this, locate the following files:

`../SquareEnix/FINAL FANTASY XI/polboot.exe`
`../SquareEnix/PlayOnlineViewer/pol.exe`

For each file, open `Properties -> Compatibility -> Change High DPI Settings` and enable the option to `Override high DPI scaling behavior. Scaling performed by "Application"`

## Graphical Crash Fixes
Crashes are common on newer operating systems, since FFXI was built originally to target DirectX 8.  Mods are available to translate the DX8 calls into a modern API like DX9 or DX11.  
See this link for more info:

https://www.bg-wiki.com/bg/User:Sitara/GraphicsEnhancement#DirectX8_Proxies

* **NOTE #1**  this doesn't seem to fix the crashes caused by a UAC prompt, or when a resolution change forces a display adapter reset (such as when plugging in a second monitor while the game window is open)

If your game is crashing because of a UAC prompt, then the simple fix is to disable UAC..........

* **NOTE #2** If your monitor has G-SYNC / Adaptive Sync, you should disable it, otherwise you may experience crashes due to display adapter resets

## Crafting Automation
Crafting in FFXI is slow as shit.  When you're faced with crafting a ton of the same items over and over again... well, it's just a dreadful task.  The Windower Add-On "craft" can help automate it, and relieve much of this pain.

https://docs.windower.net/addons/craft/

To show the help text in game, enter this command into the console:

`//craft help`

When you read that help command, it'll describe how to modify the "recipes.lua" file to allow automation of new recipes.  To do so:

* in a text editor, open `{{ windower_install_dir }}\addons\craft\recipes.lua`
* in game, enter console command:  `//craft display`
*This will make the craft packet data display in the game's chat log when you manually craft an item*
* Use the data shown from the packet display of a manual craft to modify the recipes.lua, adding a new recipe to the existing array
*Note that you can name the new recipe anything you want, it's only a name reference for the 'craft' windower add-on and not a reference to whatever the game would call that recipe*

Once you've modified the recipes.lua, you must reload the 'craft' add-on.  In the console, enter:

`//lua reload craft`

Now you can use the add-on for automated crafting.  In the console, enter:

`//craft make {[ your_recipe_name ]} {{ number_to_make }}`

for example, if you made a recipe called "Desynth 2", and wanted to perform the synth 20 times, you would enter:   `//craft make "Desynth 2" 20`

With the most recent crafting command having been run via the 'craft' add-on, you can automate the rest of your crafting with the 'repeat' switch (sometimes this doesn't seem to work correctly):

`//craft repeat 48`

where '48' is the number of crafting attempts you wish to repeat.  Make sure you have enough items and inventory space!

## Gameplay Tips

### Alexandrite Farming
Do Salvage, specifically Arrapago Remnants II.  Essentially you unlock all your gear + stats, spawn the Dvergr on Floor 4, and battle the Bloodthirsty Dweorg as the final boss for a 100% drop rate on a Linen Coin Purse (1-99 alex).  See the [BGWiki article](https://www.bg-wiki.com/ffxi/Silver_Sea_Remnants_II) for more specific details.

### Abyssea 
NM key item farming requires a red proc on the mob in question.

* Greatsword    = Freezebite (ice)
* Staff         = Earth Crusher (earth)
* Polearm       = Raiden Thrust (lightning)
* Scythe        = Shadow of Death (dark)

### Dynamis
Best to farm CoP dynamis zones, like Buburimu/Qufim/Valkurm.

Go as THF/DNC.  Keep subjobs unlocked.  Equip low iLvl weapons.  Empty your inventory, 50+ free slots.  

If you have all 3 DNC trusts, you can go with subjobs locked, which allows for a white proc with 100% chance on a hundred piece.  You'll be relying mostly on the trusts to proc in this case.

First thing once inside, get all 5 time extensions.  This is required before attempting red procs, as they will not appear otherwise.

In Buburimu, you should also kill all the dragons, as they have high drop rates on hundred pieces.

Attempt JA procs, with the following abilities.  The order listed here is their cooldown order for optimal timing.

* Box Step  (primary JA to use for procs)
* Violent Flourish
* Box Step
* Bully
* Box Step
* Mug
* Box Step
* Despoil
* Box Step
* Violent Flourish
* Box Step

Once proc'd, go ahead and immediately kill the mob with a weapon skill.

Buburimu camp route:

* 00:00 - 08:00 Crawlers, Ravens, Urganites
* 08:00 - 16:00 Mandies, Bunnies, Efts
* 16:00 - 24:00 Scorpions, Crabs, Dhalmels

Typically the route goes Raven -> Mandy -> Scorpions

You need sneak/invis macro.

For trusts you typically want to use the DNC trusts, which are:

* Uka Totlihn  (already have on sov)
* Mumor  (Sunbreeze Festival, should be in August)
* Mayakov  (already have on sov)
* Cherukiki
* Yoran-Oran

## Ultimate Weapon Progress
Soverance

* Vajra (119)
* Mandau (119 afterglow)
* Kartika (75, need to do Glavoids to turn it into a Twashtar)
* Tizona (119 afterglow)
* Almace (119 afterglow)
* Excalibur (75)
* Ukonvasara (90)
* Apocalypse (75)
* Kikoku (80)
* Amanomurakumo (75)
* Yoichinoyumi (75)
* Annihilator (99)
* Gjallarhorn (75)
* Aegis (99)
* Ochain (90)
* Toreutic Shield (stage 4, 24.2%)

## TRUST COMPLETION CHECKLIST
This checklist only looks at the Soverance character - I don't care about trusts on Monarc or any other character.

<details>
    <summary>====== Trust List ======</summary>

```
| Cherukiki         = Complete
| Ferreous Coffin   = COMPLETE
| Karaha-Baruha     = COMPLETE
| Kupipi            = COMPLETE
| Mihli Aliapoh     = COMPLETE
| Ygnas             = 
| Amchuchu          = COMPLETE
| Ark Angel EV      = COMPLETE
| Ark Angel HM      = 
| August            = COMPLETE
| Curilla           = COMPLETE
| Gessho            = COMPLETE
| Mnejing           = COMPLETE
| Rahal             = COMPLETE
| Rughadjeen        = COMPLETE
| Trion             = COMPLETE
| Valaineral        = COMPLETE
| Arciela           = COMPLETE
| Arciela II        = COMPLETE
| Joachim           = COMPLETE
| King of Hearts    = COMPLETE
| Koru-Moru         = COMPLETE
| Qultada           = COMPLETE
| Ulmia             = COMPLETE
| Adelheid          = COMPLETE
| Ajido-Marujido    = COMPLETE
| Ark Angel TT      = 
| Domina Shantotto  = COMPLETE
| Gadalar           = 
| Ingrid            = 
| Kayeel-Payeel     = COMPLETE
| Kukki-Chebukki    = 
| Leonoyne          = 
| Mumor II          = 
| Ovjang            = COMPLETE
| Robel-Akbel       = COMPLETE
| Rosulatia         = COMPLETE
| Shantotto         = COMPLETE
| Shantotto II      = COMPLETE
| Ullegore          = COMPLETE
| Elivira           = 
| Makki-Chebukki    = COMPLETE
| Margret           = 
| Najelith          = COMPLETE
| Semih Lafihna     = COMPLETE
| Tenzen II         = COMPLETE
| Brygid            = COMPLETE
| Kupofried         = COMPLETE
| Kuyin Hathdenna   = COMPLETE
| Moogle            = COMPLETE
| Sakura            = COMPLETE
| Star Sibyl        = COMPLETE
| Abenzio           = COMPLETE
| Abquhbah          = COMPLETE
| Aldo              = COMPLETE
| Areuhat           = COMPLETE
| Ark Angel GK      = COMPLETE
| Ark Angel MR      = 
| Ayame             = COMPLETE
| Babban Mheillea   = 
| Balamor           = COMPLETE
| Chacharoon        = 
| Cid               = COMPLETE
| Darrcuiln         = COMPLETE
| Excenmille        = COMPLETE
| Excenmille (S)    = 
| Fablinix          = 
| Gilgamesh         = COMPLETE
| Halver            = COMPLETE
| Ingrid II         = COMPLETE
| Iroha             = COMPLETE
| Iroha II          = COMPLETE
| Iron Eater        = COMPLETE
| Klara             = 
| Lehko Habhoka     = COMPLETE
| Lhe Lhangavo      = COMPLETE
| Lhu Mhakaracca    = COMPLETE
| Lilisette         = COMPLETE
| Lilisette II      = COMPLETE
| Lion              = COMPLETE
| Lion II           = COMPLETE
| Luzaf             = COMPLETE
| Maat              = COMPLETE
| Maximilian        = 
| Mayakov           = COMPLETE
| Mildaurion        = COMPLETE
| Monberaux         =
| Morimar           = COMPLETE
| Mumor             = 
| Naja Salaheem     = COMPLETE
| Naji              = COMPLETE
| Nanaa Mihgo       = COMPLETE
| Nashmeira         = COMPLETE
| Nashmeira II      = COMPLETE
| Noillurie         = COMPLETE
| Prishe            = 
| Prishe II         = COMPLETE
| Rainemard         = COMPLETE
| Romaa Mihgo       = 
| Rongelouts        = COMPLETE
| Selh'teus         = COMPLETE
| Shikaree Z        =
| Tenzen            = COMPLETE
| Teodor            = COMPLETE
| Uka Totlihn       = COMPLETE
| Volker            = COMPLETE
| Zazarg            = COMPLETE
| Zeid              = COMPLETE
| Zeid II           = COMPLETE
```

</details>
