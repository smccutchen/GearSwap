# FFXI GearSwap

These files are used to help change gear while playing Final Fantasy XI.  They are specifically tuned for my characters, Soverance and Monarc on the Siren server, though you can easily modify them to work for your characters as well.

To use these files requires Windower, a third-party application to interface with FFXI.  Specifically, this directory reflects the following directory on your local system:

..\Windower\addons\GearSwap\data

If you're new to GearSwap, you can get a quick crash course from this reddit post:

https://www.reddit.com/r/ffxi/comments/at3bxq/gearswap_for_idiots/egyoivh/

Check out the beta examples and instructions in the GearSwap install directory for more information.

Be aware of four things:

1) If Gearswap fails to execute a command and does not detect this, it will currently block all input until it is reloaded.
2) verify_equip() is not very robust, and in Delve it tends to not be usable. cast_delay() is recommended instead.
3) Logging is on by default. You can turn it off towards the top of gearswap.

Basic function scaffolding for a new file is shown below:

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