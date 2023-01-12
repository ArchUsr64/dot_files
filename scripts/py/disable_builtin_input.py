import subprocess
import os
import time

external_keyboard_connected = False
internal_input_enabled = True

while (True):
       try:
               command_output = subprocess.check_output("swaymsg -t get_inputs | grep Cartel", shell = True);
       except Exception:
               command_output = ""
       if (command_output == ""):
               external_keyboard_connected = False
       else:
               external_keyboard_connected = True
       if (external_keyboard_connected and internal_input_enabled):
               internal_input_enabled = False
               os.system("swaymsg input 1:1:AT_Translated_Set_2_keyboard events disabled")
               os.system("swaymsg input 1267:12631:ASUE1409:00_04F3:3157_Touchpad events disabled")
       elif (not(external_keyboard_connected) and not(internal_input_enabled)):
               internal_input_enabled = True
               os.system("swaymsg input 1:1:AT_Translated_Set_2_keyboard events enabled")
               os.system("swaymsg input 1267:12631:ASUE1409:00_04F3:3157_Touchpad events enabled")
       time.sleep(1)
