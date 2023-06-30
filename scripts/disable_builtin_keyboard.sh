#!/bin/bash

sleep 2

external_keyboard_connected=false
internal_input_enabled=true

while true; do
    swaymsg
    if [[ $? == 1 ]]; then
        exit
    fi
    command_output=$(swaymsg -t get_inputs | grep ArchUsr64_Rusty_Egboard)
    if [[ -z $command_output ]]; then
        external_keyboard_connected=false
    else
        external_keyboard_connected=true
    fi

    if [[ $external_keyboard_connected == true && $internal_input_enabled == true ]]; then
        internal_input_enabled=false
        swaymsg input 1:1:AT_Translated_Set_2_keyboard events disabled
    elif [[ $external_keyboard_connected == false && $internal_input_enabled == false ]]; then
        internal_input_enabled=true
        swaymsg input 1:1:AT_Translated_Set_2_keyboard events enabled
    fi

    sleep 1
done

