#!/bin/bash

echo "${BASH_SOURCE[0]} is running"
adb start-server
wait

echo 'Searching for device..'
deviceCount=`adb devices | grep -c emulator`

if [[ $deviceCount =~ 0 ]]; then
	echo 'starting emulator'
	/Users/{user}/Library/Android/sdk/emulator/emulator -netdelay 30 -netspeed full -no-boot-anim -avd Pixel_2_API_28 & ## path to emulator
fi

set +e

bootanim=""
failcounter=""
timeout_in_sec=120

until [[ "$bootanim" =~ "stopped" ]]; do
	bootanim=`adb -e shell getprop init.svc.bootanim 2>&1 &`
	if [[ "$bootanim" =~ "device not found" || "$bootanim" =~ "device offline" || "$bootanim" =~ "running" ]]; then
		let "failcounter += 1"
		echo "Waiting for emulator start"
		if [[ $failcounter -gt timeout_in_sec ]]; then
			echo "Timeout ($timeout_in_sec seconds) reached; failed to start emulator"
			exit 1
		fi
	fi
	sleep 1
done

echo "Emulator is ready"

echo "Installing apk..."
adb install {path to .apk}
echo "Apk is installed!"
sleep 8