#!/bin/bash
# LinuxGSM command_details.sh function
# Author: Daniel Gibbs
# Website: https://linuxgsm.com
# Description: Displays server information.

local commandname="DETAILS"
local commandaction="Details"
local function_selfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

if [ "$2" != "--minimal" ]; then
	# Run checks and gathers details to display.
	check.sh

	info_messages.sh
	#Output details
	fn_info_message_gameserver

else
	# Run checks and gathers details to display.
	check.sh
	info_config.sh
    info_parms.sh
	info_distro.sh
	info_glibc.sh
	info_messages.sh
	query_gamedig.sh

	#Output details
	fn_info_message_distro
	fn_info_message_performance
	fn_info_message_disk
	fn_info_message_gameserver
	fn_info_message_script
	fn_info_message_backup

# Some game servers do not have parms.
if [ "${shortname}" != "ts3" ]&&[ "${shortname}" != "jc2" ]&&[ "${shortname}" != "dst" ]&&[ "${shortname}" != "pz" ]&&[ "${engine}" != "renderware" ]; then
	fn_parms
	fn_info_message_commandlineparms
fi
core_exit.sh