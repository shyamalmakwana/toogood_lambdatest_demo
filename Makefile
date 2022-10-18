run_all_in_parallel:
	make -j test_ios_config test_android_config

test_android_config:
	robot -A src/data/androidConfig.txt

test_ios_config:
	robot -A src/data/iosConfig.txt

test_android_web:
	robot -A src/data/androidWebConfig.txt

test_ios_web:
	robot -A src/data/iosWebConfig.txt

test_Android1:
	robot --variable version:10 --variable platform:Android --variable deviceName:"Galaxy S20" --variable isRealMobile:true --variable visual:true --variable network:false --variable console:false --variable app:"lt://APP10160201651665929833436251" src/scenario/androidTest.robot

test_Android2:
	robot --variable version:10 --variable platform:Android --variable deviceName:"Galaxy S10" --variable isRealMobile:true --variable visual:true --variable network:false --variable console:false --variable app:"lt://APP10160201651665929833436251" src/scenario/androidTest.robot

test_iOS1:
	robot --variable version:14 --variable platform:iOS --variable deviceName:"iPhone 11" --variable isRealMobile:true --variable visual:true --variable network:false --variable console:false --variable app:"lt://APP10160201651665929844405335" src/scenario/iosTest.robot

test_iOS2:
	robot --variable version:14 --variable platform:iOS --variable deviceName:"iPhone 12" --variable isRealMobile:true --variable visual:true --variable network:false --variable console:false --variable app:"lt://APP10160201651665929844405335" src/scenario/iosTest.robot