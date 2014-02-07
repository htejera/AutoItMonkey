AutoIt Monkey
============

Monkey provides an [AutoIt] interface for working with the Android [Monkey] tool.
This work is inspired by the [CyberAgent-adbkit-monkey] project a [Node.js] interface for working with the monkey tool.


## Monkey

The Monkey is a program that runs on your emulator or device and generates pseudo-random streams of user events such as clicks, touches, or gestures, as well as a number of system-level events but also Monkey program can be started in TCP mode with the --port argument. In this mode, it accepts a [range of commands] that can be used to interact with the UI in a non-random manner.

AutoItMonkey provides an interface for write an [AutoIt] script that control an Android device or emulator from outside of Android code. 










[AutoIt]: <www.autoitscript.com/site/autoit/>
[CyberAgent-adbkit-monkey]: <https://github.com/CyberAgent/adbkit-monkey>
[Node.js]: <http://nodejs.org/>
[Monkey]: <http://developer.android.com/tools/help/monkey.html>
[range of commands]: <https://github.com/android/platform_development/blob/master/cmds/monkey/README.NETWORK.txt>
