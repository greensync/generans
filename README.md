<!---
Copyright (c) 2015 GreenSync Pty Ltd.

This file is part of generans.

generans is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

generans is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with generans.  If not, see <http://www.gnu.org/licenses/lgpl.html>.
--->

# generans
A pulse generator and DSL for the Phidget 1018 and 1018_2 I/O boards.

![generans in action](http://s2.postimg.org/burh3dgqh/oscilloscope_capture.png)

## installation
1. [Install Ruby](https://www.ruby-lang.org/en/installation/) 2.0 (or later) and [bundler](http://bundler.io/#getting-started).
2. Install the [Phidget drivers](http://www.phidgets.com/docs/Operating_System_Support).
3. run `bundle install` to fetch and install all the Ruby libraries needed by generans.

## usage
    $ ./generans --help
    Generates pulses on a Phidget 1018 I/O board.
        -v, --verbose                    Be chatty about status to STDOUT
        -t, --timeout MS                 Connection timeout in ms
        -p, --pulses NUM                 Number of pulses to generate
        -f, --frequency HZ               Frequency of pulses to generate (Hz)
        -d, --duty DUTY                  Duty cycle (%)
        -o, --output OUTPUT              Output port to which to send pulses (0 - 7)

## troubleshooting

### an error occurred: Given timeout has been exceeded.
This usually indicates a failure to communicate with the board.

- Check that your Phidget board is physically connected to a USB port with a reliable cable.
- If using Linux, [configure udev](http://www.phidgets.com/docs/OS_-_Linux#Setting_udev_Rules) to allow access to the device as a non-root user.

## licence
generans is licensed under the GNU Lesser General Public License.

### why the LGPL?
The GPL is specifically designed to reduce the usefulness of GPL-licensed code to closed-source, proprietary software. The BSD license (and similar) don't mandate code-sharing if the BSD-licensed code is modified by licensees. The LGPL achieves the best of both worlds: an LGPL-licensed library can be incorporated within closed-source proprietary code, and yet those using an LGPL-licensed library are required to release source code to that library if they change it.

## thanks
Thanks to the good folks at GreenSync for the office time to work on generans, and also for the use of their hardware to test the output.
