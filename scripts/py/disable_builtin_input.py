import subprocess
import os
import time

while (True):
    output = ""
    disabled = False
    try:
        output = subprocess.check_output("swaymsg -t get_inputs | grep 12x4_Nugget", shell = True);
    except Exception:
        output = ""
    if (output == ""):
        os.system("swaymsg input 1:1:AT_Translated_Set_2_keyboard events enabled")
        os.system("swaymsg input 1267:12631:ASUE1409:00_04F3:3157_Touchpad events enabled")
    else:
        os.system("swaymsg input 1:1:AT_Translated_Set_2_keyboard events disabled")
        os.system("swaymsg input 1267:12631:ASUE1409:00_04F3:3157_Touchpad events disabled")
    time.sleep(1)
