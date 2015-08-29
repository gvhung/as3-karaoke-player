This AS3 Karaoke player will render lyrics and music in synchronization so that viewer can sing a long.<br />
The lyrics data file is adopted from W3C standard [Timed Text](http://www.w3.org/TR/ttaf1-dfxp/).<br />
The player uses [AS3Signals](http://github.com/robertpenner/as3-signals) as communication mechanism among components. (Instead of AS3 Events)<br />
The core player is just a rendering engine. Developers can implement their own graphical interface to control the engine and add other features.<br />
Current features:
  * Load and parse a Timed Text-based lyrics XML file (see [specifications](http://code.google.com/p/as3-karaoke-player/source/browse/trunk/flash/bin/xml/song_full_specs.xml))
  * Load and play progressive beat audio (MP3)
  * Lyric texts are synchronized with audio
  * Play, pause, stop, seek allowed
  * Set global lyric styles (font, color, size) and few options
  * An application for editing the lyric data file (currently in alpha quality release)
I have also created a sample player based on the Lunar skin from [RealEyes OSMF Media Player](http://code.google.com/p/reops/) with these additional features:
  * Set volume
  * Turn lyrics (A.K.A captions) on/off
  * Full Screen
View the sample player [here](http://int3ractive.freevnn.com/karplayer/) <br />
<br />
Warning: I'm continuously refactoring the library so that components can be used independently. There may be changes in the API after each version.<br />
<br />
Future plan (no promises):
  * Integrate into OSMF
  * Song-specific lyric color styling
  * Multiple text lines (more than 2, not decided how to show/animate them)
  * Custom transition for text line instances
  * Photo slide show for background
  * Red5 application for recording from user's microphone
  * Play video as background
  * Play karaoke video (videos with music and animated lyrics)
  * Flex Component
  * AIR application for local recording (if there is a good mp3 encoder)
  * ... (please suggest)
<br />
<br />
&lt;wiki:gadget url="http://www.ohloh.net/p/483446/widgets/project\_basic\_stats.xml" height="220" border="1"/&gt;