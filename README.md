# Parallel Appium Test in Robot Framework via Pabot
- [http://robotframework.org/](http://robotframework.org/)
- [https://pabot.org/](https://pabot.org/)
- [https://appium.io/](https://appium.io/)

### Pre-Requisites
* Python
* Android sdk
* Robot Framework
* Appium 

### Installation
- Intstall Python, pip
- Install Appium
- Install library by command

```
 pip install -r requirements.txt
```

### Run Appium server
```
$ appium -p 4723 
```

### Install APK
Install APK/IPA file into the device

### Devices Set
Store device info such as UDID, Name, Appium Port, and System Port as .dat file

E.g.

```
[Device1]
tags=device1
udid=9RGNU20920100424
appium_port=4724
system_port=8201

[Device2]
tags=device2
udid=4aba4aacac3f71ce
appium_port=4723
system_port=8202
```
### How To Run
```
$ ./run-test.sh [tag] [threads]

./run-test.sh login 2
```