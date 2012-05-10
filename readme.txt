Big Top Circus: Porting Circus Linux to Android

This is a port to Android of the game
Circus Linux ( http://www.newbreedsoftware.com/circus-linux ).

You can read the file pelya.txt for details about his port of the SDL 
library to Android.  This port of Circus Linux utilizes that library.

TODO tasks/questions:

* Make sure this runs across all display sizes and densities.  Currently 
  the biggest offender for this is the placement of the initials when 
  one is typing out high scores, but there may be others.

* Consider input changes.  Right now one drags the teeter-totter back 
  and forth with one's finger, but we may use other input methods.  
  Perhaps tilting the screen left or right, perhaps an on-screen control 
  or controls.

* Support of languages other than English.

-----------------------------------------------------------------------
This program, like Circus Linux, is released under the terms of the Gnu 
Public License, version 2.

Pelya's port to Android of the SDL library, which this program uses, is 
released under the terms of the Lesser Gnu Public License.
