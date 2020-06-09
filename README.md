# Dependency setup to run tests:
1. Install brew `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
2. Install adb: `brew cask install android-platform-tools`
3. Install Python 3.6+: `brew install python3`
4. Install Python dependencies: `pip3 install requirements.txt`
5. Install npm: `brew install npm`
6. Install Appium server: `npm install -g appium`
7. Install appium-doctor: `npm install -g appium-doctor` 
8. Install Appium inspector: https://github.com/appium/appium-desktop/releases
9. Install android-driver for appium: `npm install -g appium-uiautomator2-driver --unsafe-perm=true`
10. Install chromedriver (for WebView, check the current driver version - (https://chromedriver.storage.googleapis.com/index.html) / (https://sites.google.com/a/chromium.org/chromedriver/downloads)): `npm install appium --chromedriver_version="2.44"`
11. Install android studio: https://developer.android.com/studio/ (it is recommended to install at least 1 emulator at once)
12. Open ~/.bash_profile (if it is not present-it is necessary to create) and specify the PATH `export PATH="/usr/local/bin:$PATH"`. 
Then you should run: `appium-doctor`. Depending on the presence of errors and the location of installed packages, you should also specify the following locales:

  `export JAVA_HOME=[path to java_home]` (for example: '/usr/bin/java' or like $(/usr/libexec/java_home));
  <br>
  `export PATH=$JAVA_HOME/bin:$PATH`;
  <br>
  `export ANDROID_HOME=[path to sdk]` (for example: '/Users/{user}/Library/Android/sdk');
  <br>
  `export PATH=~/Library/Android/sdk/platform-tools:$PATH`;
  <br>
  `export PATH=~/Library/Android/sdk/tools:$PATH`;
  <br>
  `CHROMEDRIVER_VERSION=2.44` (specify the version from point 9)

# To run on a real iOS device:
1. Install Carthage: `brew install carthage` (If there are problems - `brew reinstall carthage`)
2. Install xcode: https://developer.apple.com/xcode/
3. Install libimobiledevice: `brew install libimobiledevice`
4. Install ios-deploy: `brew install ios-deploy`
5. Install ideviceinstaller: `brew install ideviceinstaller`
6. Install ios-driver: `npm i appium-xcuitest-driver`
7. Use a signed certificate .p12

Troubleshooting:
https://github.com/libimobiledevice/ideviceinstaller/issues/48
##### It is important that after you specify all the paths were made to restart the terminal.

# Run tests Android:
1. Launch appium server: `appium`
2. Launch android emulator: `{path to emulator} -avd {specify the name of the emulator}` for example(`/Users/{user}/Library/Android/Sdk/emulator/emulator -avd Pixel_2_API_28`)
2. Running tests under Android `pytest -v -s tests/`

# Run tests iOS:
1. Launch appium server: `appium`
2. Running tests under iOS `pytest -v -s tests/`

# Useful links:
1. [Appium-python documentation](https://github.com/appium/python-client)
2. [Selenium](https://selenium-python.readthedocs.io/api.html#)
3. [Pytest](https://docs.pytest.org/en/latest/)
4. [appium-xcuitest-driver](https://github.com/appium/appium-xcuitest-driver/blob/master/docs/real-device-config.md)
5. [appium+real ios device](https://medium.com/@yash3x/appium-xcuitest-on-real-ios-devices-bd1ebe0dea55)
