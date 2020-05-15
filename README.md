# local-bin


## General

This is a collection of various unrelated `bash`, `perl`, and `fish` scripts.

The scripts had initially been written for *Arch Linux*. Some may not work
"out of the box" on your machine as some files could reside at different
locations or some software may not be present on your system.
A lot of scripts are wrappers around other Linux command line tools, some
are almost one-liners and only few are a little bit more sophisticated somehow.

All scripts are licensed under the `GNU General Public License (GPL), version 3`.

Feel free to use the source codes as "example" to write your own tools
working for your configuration.


## Installation

In order to enhance your daily Linux experience place the scripts under
`/usr/local/bin` and remove the respective file name extension.

For example if you want to use the tool `battery.pl` on your system
you may "install" it using:

```
$ cp /home/<user>/Downloads/local-bin/battery.pl /usr/local/bin/battery
```

To get your battery status you can then simply run:

```
$ battery
```

Alternatively you could create a symbolic link to the script which would
do the same trick:

```
$ ln -sv /home/<user>/Downloads/local-bin/battery.pl /usr/local/bin/battery
```

Of course you will need to make the tools executable first:

```
$ chmod 755 <script>
```

(Substitute *&lt;user&gt;* with your username and *&lt;script&gt;* with the respective
 script you want to set the `execute` flag for. If you did not download the
 scripts to your `Downloads` folder you need to change the path to the scripts,
 as well, obviously.)


## Description

The collection currently contains the following **27 scripts**:

* **aphwaddr.sh**
    - print the hardware address (MAC address) of the wireless
      access point currently connected to
    - depends on: `awk`, `basename`, `bash`, `grep`, `ip`, `iw`

* **battery.pl**
    - prints the capacity (percentage) of one or two installed
      batteries and their charging status
    - if two batteries are installed a cumulated capacity is calculated
    - Note: uses the design capacity as maximium, thus *100%* may never be
      reached (this can be changed easily)
    - Note: you may need to change the path of the battery system files
    - depends on: `perl`

* **cfgsync.sh**
    - copy e.g. configuration files of user `root` to all other user's home
      directories
    - intended for single user systems with an additional non-privileged
      user, e.g. to execute riskier tasks
    - allows to only modify the configuration file of user root and then to
      synchronize with the other user accounts that have a home directory under
      `/home/`
    - configuration is to be done within the script using the global constant
      `QUIET` to control *verbosity*, and the respective calls to the `sync`
      function passing a path to a file or directory (with or without `/root/`
      prefix)
    - *NOTE*: use this script with care as it is intended to override existing
      configuration files of local users
    - depends on: `basename`, `bash`, `cp`, `dirname`, `mkdir`

* **clfish.fish**
    - clear the history of the `fish` shell (*friendly interactive shell*)
    - if `fish` is used within the `bash` environment, an additional command
      for clearing the `bash` history can be added, as well (*see* `histdel.sh`)
    - depends on: `fish`

* **cpall.sh**
    - copy all files from one location to another while optionally
      prepending/appending prefix/suffix to the copied files
    - depends on: `basename`, `bash`, `cp`

* **ddg.sh**
    - open `firefox` and search a pattern with *DuckDuckGo* search engine
      from command line
    - depends on: `bash`, `firefox`, `sed`

* **dns.sh**
    - get IP address for specific host name and vice versa using `host` tool
    - depends on: `awk`, `basename`, `bash`, `head`, `host`, `perl`, `sed`

* **doxystrip.sh**
    - strip documentation and comments from a `doxygen` "*Doxyfile*"
    - a default *Doxyfile* can be created using the command `$ doxygen -g`
      which contains lots of very useful documentation comments
    - unfortunately that file is approximately *2500* lines and `112 kB`
    - `doxystrip` removes comment from the *Doxyfile* to let it only be
      about *330* lines and `12 kB`
    - depends on: `bash`, `date`, `mv`, `rm`

* **fdiff.sh**
    - wrapper around `diff` system tool to get more specialized output
    - depends on: `awk`, `basename`, `bash`, `diff`

* **hex.pl**
    - convert plain ASCII string to ASCII hexadecimal representation
      and vice versa
    - depends on: `perl`

* **histdel.sh**
    - clear `bash` history of current user
    - depends on: `bash`

* **ifinfo.sh**
    - extracts information about the network interface currently used
      and assigned IP addresses
    - depends on: `awk`, `bash`, `grep`, `ip`, `wc`

* **invoke.sh**
    - start any program (including arguments) from command line
      as background task with definitely no output
    - most useful for software with graphical user interface
    - depends on: `bash`

* **ipstat.sh**
    - print active network interface, private IP address (LAN),
      public IP address (WAN), and TOR exit node IP address if any
    - depends on: `awk`, `bash`, `curl`, `grep`, `ip`, `ps`, `sed`

* **isgd.sh**
    - command line URL shortener using &lt;[https://is.gd](https://is.gd)&gt;
    - depends on: `basename`, `bash`, `curl`, `grep`, `perl`, `ps`

* **lock.sh**
    - lock the screen if no display manager is used
    - the script is a wrapper around `xsecurelock` and hence a configuration
      example
    - depends on: `bash`, `env`, `xdg-screensaver`, `xsecurelock`

* **makegen.sh**
    - generate a skeleton *Makefile* project
    - generates the *Makefile*, a main C source file and the directories
      `./src`, `./obj` and `./bin`
    - depends on: `basename`, `bash`, `mkdir`, `touch`

* **manline.sh**
    - view Linux *manual pages* online
    - make your browser (`firefox`) connect to
      &lt;[https://linux.die.net/man](https://linux.die.net/man)&gt;
    - *NOTE*: occasionally the server is not available
    - depends on: `basename`, `bash`, `firefox`

* **monitor.sh**
    - quick information about connected monitors
    - wrapper around `xrandr`
    - currently only supports operations *list* and *count*
    - depends on: `awk`, `basename`, `bash`, `xrandr`

* **mounts.sh**
    - list relevant devices (hard drives, USB storage devices, SD cards)
      currently mounted
    - depends on: `awk`, `bash`, `grep`, `mount`

* **normalize.pl**
    - adapt file names for use with Linux file systems
    - whitespaces and lots of special characters are replaced with underscore
      ("\_"), German umlauts and other graphemes are converted to their ASCII
      representation (e.g. "ä"->"ae", "â"->"a", ...)
    - depends on: `perl`

* **purge.sh**
    - delete cached or orphaned packages
    - for use with `pacman` package manager on *Arch Linux* based systems
    - *TODO*: additional support for `trizen` (`AUR` package manager)
    - depends on: `awk`, `bash`, `du`, `ls`, `pacman`, `perl`, `tr`, `wc`

* **restore.sh**
    - reopen hyperlinks stored in separate "`.href`" files or
      a single file containing one hyperlink per line
    - depends on: `basename`, `bash`, `cat`, `firefox`, `sleep`

* **rmscreen.sh**
    - removes the last screenshot accidently taken
    - *NOTE*: needs to be adapted in order to work with the screenshot taking
      application (i.e. file naming conventions, and the storage location)
    - depends on: `bash`, `date`, `head`, `ls`, `rm`

* **tinyurl.sh**
    - command line URL shortener using
      &lt;[https://tinyurl.com](https://tinyurl.com)&gt;
    - depends on: `basename`, `bash`, `curl`, `grep`, `perl`

* **trackpad.sh**
    - disables/reenables your *trackpad* device (and *ThinkPad TrackPoint*
      device if available)
    - if no parameter is given the *trackpad* is disabled if an *optical USB
      mouse* is detected and enabled if there is no such mouse
    - depends on: `basename`, `bash`, `grep`, `xinput`

* **wikipedia.sh**
    - open a specific *Wikipedia* article from command line
    - support for German and English language but easily extensible
    - depends on: `basename`, `bash`, `firefox`, `sed`, `tr`
