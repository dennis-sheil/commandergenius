Math Game: Porting Tux of Math Command (Tux Math) to Android

This is a port of the game Tux of Math Command, or Tux Math ( 
http://tux4kids.alioth.debian.org/tuxmath ), to Android.

You can read the file pelya.txt for details about his port of the SDL 
library to Android.  This port of Tux Math uses that library.

This uses Pelya's SDL port framework to build the Android APK.  The 
build works on Linux machines, and may work on MacOS X machines.

You do not need an Android device to use this port, it works on Android
emulators as well (although is usually slightly slower).

With an Android device, you can download an implementation of this code 
from the Google Play Android app market here -

http://play.google.com/store/apps/details?id=com.panaceasupplies.android.games.math


Building:
---------

This build method only accesses data in the AndroidData subdirectory.  
Changes made in the data subdirectory that are not moved to AndroidData 
are ignored.

To build, you must create the directory
project/jni/application/mathgame/AndroidData

Then everything in project/jni/application/mathgame/mathgame/data must 
be zipped up and moved to AndroidData (within the data directory, 
something like: zip -r data.zip *).

Then the zip file must be split up (split -b 1000000 -d data.zip 
data.zip) within AndroidData, and then the data.zip file erased.

Every change you make to data, you must manually repeat this process 
(zip to data.zip, move data.zip, split data.zip, erase data.zip)
before building.

Check that the link project/jni/application/src is pointing to 
project/jni/application/tuxmath properly.

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

On Android, some of the SDL_UpdateRect's and UpdateRect's are not 
updating properly.  A whole screen SDL_Flip can fix this as a kludge.  
We can investigate what the problem is.  This problem is not exclusive 
to Tux Math, it occurs on other programs using this Android port of the 
SDL library, so the problem might be with the port of the SDL_UpdateRect 
function instead of TuxMath's implementation of this function.  But if 
the kludge was used it would go into TuxMath's code, not the code for 
the framework for the SDL port.  It appears that the rectangles that are 
supposed to update are blinking in an odd manner, with random memory 
images being shown over the rectangle which is supposed to get the 
rectangle update.

Network functionality does not work.  Four files were moved from the src 
subdirectory to a new subdirectory called reacclimate.  Those four files 
are: generate_lesson.c, servermain.c, testclient.c and tuxmathadmin.c.

Factoroids does not work properly.

Text entry and the keyboard is not yet working.  A faint button with the 
letter A in the top left of the screen brings up the on-screen keyboard 
(not necessary during the comet game, as the keypad is there).  High 
score entry, names entered during games between friends and such are not 
done.  There is a lot to be dealt with here.  The on-screen keyboard 
should probably pop up when text needs to be entered.  But Android does 
not deal properly with text entered - the UTF8 modifications are similar 
to those of Windows, in having to be dealt with specially.

We force software mode for now, we can investigate hardware mode in the 
future.

We have done no work to allow custom games.

The config.h file in src was not gone over stringently, some of the 
defines in there can easily be wrong.

The volume keys are caught in the Video.java file and dealt with there.  
Perhaps this should be dealt with in the keys reddefined in 
AndroidAppSettings.cfg.  It seems to work.  This is an SDL port problem 
more than a problem with the Tuxmath code.

Is the keypad placed in the middle of the screen large enough for all 
screens?  On some devices, yes.  I tested on the Galaxy Note and for 
that and devices like it, I would have to say no.  This game certainly 
does not work well for small phones with a low number of dots per inch.

I have tested this on Android API 9 and up, I have not tested it with 
lower API versions yet.

This is currently exclusively in English, having it work in the other 
translated languages would be good.

On Android, the credits scroll, and the scroll during missions, cuts off
the bottom parts of characters during the scroll.  A kludge to fix this
is in the credits.c file, on this line:

465: if (scroll * speed >= DEFAULT_MENU_FONT_SIZE)

Increasing the second part (DEFAULT_MENU_FONT_SIZE) or decreasing the
first part (scroll * speed) will allow the bottom of characters to be
shown during the scroll.  This should be fixed properly.

Which is not to mention, DEFAULT_MENU_FONT_SIZE can probably be 
increased on most screens, especially larger ones with a high density of 
pixels per inch.


Our Implementation:
------------------

With an Android device, you can download our implementation at -

http://play.google.com/store/apps/details?id=com.panaceasupplies.android.games.math

The APK we have on Google Play is more-or-less the codebase here, with 
the addition (or subtraction) of:

* We tack on a simple opening screen with an ad when the app is opened

* We pulled out menu options for things we noted above do not work yet.  
  We also pulled out anything needing the keyboard like games with 
  friends, high scores and the like.

* We implement some of the kludges mentioned above.  For proper credits 
  and mission scrolling, we implement the kludge mentioned above.  We also 
  are doing an SDL_Flip instead of SDL_UpdateRect in some places so we do 
  not get the blinking rectangle problem mentioned here.

We already have enough kludges in this code, we didn't want to put those 
in as well.  But they are described above and you can implement them 
easily enough.  Contact us if we were not clear enough.

We certainly want to credit Tux of Math Command here, on Google Play, 
and in our game.  We see our published app as a fork of Tux Math, and 
others can make their own versions - this can even be folded back into 
the main Tux Math source tree (hopefully).  We also don't want to give 
the impression that this is an offical Tux of Math Command port, or 
Tux4Kids project and the like.  We've done some replacing of the game 
name and logos, and will probably be doing more.  We will always credit 
Tux of Math Command for the original source though.  We want to work 
with the program authors in balancing this correctly.


Licenses:
---------

The SDL library and port is released under the Lesser Gnu Public 
License.  The (not yet implemented) libintl library is released under 
the Lesser Gnu Public License version 2.1.

Tux of Math Command is released under the Gnu Public License version 3.

This port of Tux Math, done by Dennis Sheil of Panacea Supplies, is 
released under the Gnu Public License version 3.

The "Ultimate Droid" on-screen keyboard theme by Sean Stieber is 
licensed under Creative Commons - Attribution license.

The "Simple Theme" on-screen keyboard theme by Dmitry Matveev is 
licensed under zlib license.
