#!/bin/bash

echo "${BASH_SOURCE[0]} is running"
sh appium_go.sh &
wait
sh android_go.sh &
wait

pytest -v -s tests/
pst=$?

adb uninstall {your package}
wait
echo "close"
adb -s emulator-5554 emu kill
wait
echo "emulator is close"
adb kill-server
wait
echo "closing appium.."
ps aux | grep -i appium | awk {'print $2'} | xargs kill -9
echo "servers are closed"

if [[ $pst -eq 0 ]]; then
	exit 0
else
	exit 1
fi