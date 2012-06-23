Toy Train: Porting Ri-li to Android

This is a port of the free software game Ri-li ( 
http://ri-li.sourceforge.net ) to Android.

You can read the file pelya.txt for details about his port of the SDL 
library to Android.  This port of Ri-li uses that library.

This uses Pelya's SDL port framework to build the Android APK.  The 
build works on Linux machines, and may work on MacOS X machines.

You do not need an Android device to use this port, it works on Android
emulators as well (although is usually slightly slower).

With an Android device, you can download an implementation of this code 
from the Google Play Android app market here -

http://play.google.com/store/apps/details?id=com.panaceasupplies.android.games.toytrain


Building:
---------

For Pelya's build framework, changes in data must also be done in 
AndroidData, read the documentation for details.

Check that the link project/jni/application/src is pointing to 
project/jni/application/toytrain properly.

Then do:

./ChangeAppSettings.sh -a
android update project -p project -t android-12
sh build.sh

This should install the APK on your attached Android device or emulator. 

After those steps, the project subdirectory should have the standard 
Android build needed for an ant-type install.  Although "sh build.sh" 
installs a debug APK to your Android device/emulator anyhow.


Todo:
-----

If the train has three choices of where to go, you may have to hit the 
screen twice to get to your choice.  Perhaps detecting where the screen 
is tapped, and changing tracks based on one tap in that situation might 
make better play.  This should get coded up and we can test which method 
is better.

The source code to work on sprites is located here: 
http://prdownloads.sourceforge.net/ri-li/Ri-li-devel-2.0.1.tar.bz2?download 
Some of the sprites should be updated.  For example, instead of saying 
"press any key" when a new level starts, it should say something like 
"Touch the screen".

The high score screen needs a keyboard currently.  Work should be done 
in terms of detecting if a device has a keyboard, if not popping one up 
when you reach a high-score, and entering the name properly.

Each language comes with a large data file, and a lot of download time 
and space is wasted in terms of the languages you will not be using.  We 
have to think of how to deal with this.  The currently preferred option 
would be to come installed with one or two languages, and then download 
other languages as needed.


Our Implementation:
------------------

With an Android device, you can download our implementation at -

http://play.google.com/store/apps/details?id=com.panaceasupplies.android.games.toytrain

The APK we have on Google Play is more-or-less the code base here, with 
the addition (or subtraction) of:

* We include all languages here.  To save space on our implementation, 
  we pulled all language support save for English and Spanish.  As the 
  language screen is no longer needed, we auto-detect if the device is 
  in Spanish, otherwise the game is in English.

* To save space, we removed some of the music files.

* We tack on a simple opening screen with an ad when the app is opened.

* We implement a very kludgey way to enter high scores.  It is such a 
  kludge, we thought it better to not put it here.  If you want to work 
  on high score entry, or want to see the kludge, contact us.



Licenses:
---------

The port work of Ri-li done by Dennis Sheil of Panacea Supplies, is 
released under the Gnu Public License version 3.

Ri-li is released under the Gnu Public License version 3.

The SDL library and port is released under the Lesser Gnu Public 
License.  

The "Ultimate Droid" on-screen keyboard theme by Sean Stieber is 
licensed under Creative Commons - Attribution license.

The "Simple Theme" on-screen keyboard theme by Dmitry Matveev is 
licensed under zlib license.


Thanks:
-------

Thanks to Dominique Roux-Serret for programming Ri-li.
Thanks to Sergii "Pelya" Pylypenko for porting SDL to Android.

