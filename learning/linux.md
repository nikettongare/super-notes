# Linux

- Open Source
- Linux refers to the kernel
- These Linux distributions combine the Linux kernel with various software packages, utilities, libraries, and a graphical user interface (if included) to form complete operating systems.

## What is kernel ?

- The kernel is the core component of an operating system. It serves as a bridge between software and hardware, managing system resources and providing essential services for other software running on the system.
- Key features:
  - Hardware Abstraction: It abstracts the hardware complexities, providing a uniform interface for software programs to access hardware resources like CPU, memory, storage, and devices.
  - Process Management: It handles the execution of processes, scheduling tasks, and managing their communication and synchronization.
  - Memory Management: Allocates and deallocates memory for processes, manages virtual memory, and handles memory protection to prevent processes from interfering with each other.
  - Device Drivers: It includes drivers to interact with hardware components such as network interfaces, graphics cards, USB devices, etc.
  - File System Management: It provides access to files and directories, managing file permissions, and facilitating data storage and retrieval.
- Diffrent Kernels
  - Windows NT kernel
  - Linux kernel
  - macOS kernel ( Unix based )

## History

- YT video: https://www.youtube.com/watch?v=ShcR4Zfc6Dw&ab_channel=Fireship
- Linus Torvalds - 1991
  - His goal to create the free version on minix operating system
  - minix is based on unix

## Distributions

- Ubuntu
- RedHat
- Debian
- Mint
- KaliLinux
- CentOS
- Fedora
- And other 100s of distributions are available.
- chart: https://distrowatch.com/images/other/distro-family-tree.png

## Linux file system doesn't knows any file extension

## Directory Structure

- `/`: House (mount point, root file system)
  - `/bin`: Essential command binaries -> never touch
  - `/boot`: System boot loaders files ( kernel files ) -> never touch
  - `/dev`: Device files
  - `/etc`: Host-specific system-wide configuration files
  - `/home`: User home directory
  - `/lib`: Shared library modules
  - `/media`: Media file such as CD-ROM
  - `/mnt`: Temporary mounted filesystems
  - `/opt`: Add-on application software packages
  - `/proc`: Automatically generated file system
  - `/root`: Home directory for root user
  - `/run`: Run-time program data
  - `/sbin`: System Binaries -> never touch
  - `/srv`: Site-specific data served by this system
  - `/sys`: Virtual directory providing information about the system
  - `/tmp`: Temporary files
  - `/usr`: Read only user files
    - `/bin` - User's bin to store user specific data
    - `/sbin` 
    - `/etc`
    - `/local`
      - `/bin`
      - `/sbin`
  - `/var`: Files that is exprected to continuously change

```
We don't use anymore
    - /media
    - /opt
    - /snap
    - /srv
```

## importent symbol and there names

- `~`: tilda
- `*`: wildcard
- `$`: doller
- `#`: hashtag
- `@`: at
- `&`: ampersand
- `!`: exclamation mark or bang
- `-`: hyphen or dash.

## Flags

- Options avalable with command
- specify with single `-` or `--` with option

## Commands

- `control + l`: clear the terminal
- `control + c`: force close task in terminal

- echo: use to print on terminal

  - `echo "Hello World"`

- ls: List files in current directory

  - `ls --help`
  - `ls -la`
  - `ls \*`: files and folders with there sub-files and folders (ls Downloads/*)
  - `ls r\*a`: list all files start with r and ends with a
  - `ls \*a`: list all files ends with a
  - `ls r\*`: list all files start with r

- pwd: shows the path of cureent working directory (CWD) (Present woking directory).

  - `pwd`

- cd: use for navigation

  - `cd` or `cd ~` : user's home directory
  - `cd /`: root directory -` cd .` or `cd ./`: same directory
  - `cd ..` or `cd ../`: back once
  - `cd -`: preivios directory
  - `cd ../../`: to directory back

  - `Examples:`
  - `cd dirname`
  - `cd ..`
  - `cd dir1/dir2`
  - `cd dir1/dir2/dir3`
  - `cd ../../`
  - `cd ../../../..` - use to go 3 folder back
  - `cd /usr/local`
  - `cd`
  - `cd ~`
  - `cd ~/dir`
  - `cd -`

- man: shows the manual of command if avalable.

  - `man ls`: shows the manual of ls command.

- info: shows the information about command

  - `info ls`

- commandName --help: shows all flags avalable with command and all esential information about command.

  - `ls --help`

- who: Displays information about users who are currently logged into the system.

  - `who`

- whomi: Who am i.

  - Displays the username of the current user.
  - `whomi`

- which: shows the command location.

  - `which ls`

- whereis: show the command location and the command manual location.
  - `whereis ls`
- whatis: shows command description in one line.

  - `whatis ls`

- touch: use to create the file

  - touch filename: to create file
  - `touch bakasur.txt` - create the `bakasur.txt` file

- mkdir: use to create the directory

  - mkdir foldername: to create folder
  - `mkdir projects` - create the `projects` folder

- cat: use to read, write, append file.

  - cat filename: use to read file content.
    - `cat bakasur.txt` - use to read content of `bakasur.txt` file
  - cat > filename: create or write into file.

    - If file not exist it will create new file.
    - If file contains the data it will remove it and add newly added data.
    - To save file press enter and cltr + c .

    - `cat > bakasur.txt`

  - cat >> filename: use to append data into file.
    - Add new data into the file by keeping existing as it is.
    - `cat >> bakasur.txt`

- rename: use to rename the file or directory

  - rename currentname newname
  - `rename bakasur.txt newbakasur.txt`

- mv: Used to move files and directories from one location to another.

  - mv currentpath newpath
  - `mv bakasur.txt project/bakasur.txt`
  - we can also use this command to rename the files

- cp: Used to copy files and directories from one location to another.

  - cp currentfile newfile
  - `cp bakasur.txt project/bakasur.txt`

- rm: Used to remove files or directories

  - `rm -rf` direname or rm -rf filename: remove all files forcefully.
  - `rm a\*`: delete files or folder starts with a
  - `rm _-_`: delete files or folder containing - in between name
  - It's a powerful command and can delete multiple files at once.
  - The `-r` flag is used to delete directories and their contents recursively.

- grep: The grep command in Linux is a powerful utility used for searching text patterns or regular expressions within files or command output. It stands for "Global Regular Expression Print."

  - `grep "word" file.txt`

- find: Searches for files and directories in a specified location based on various criteria.

  - `find "word"`

- du: Shows disk space usage of directories and files.
- stat: Displays detailed file or filesystem status.

- history: past 100 commands

  - `history`: use to check last 100 commands
  - `history -c`: clear the history

- exit: use to logout the terminal
  - `exit`

## Understanding shell and it’s default variable

- `$PATH`: Contains directories where the system looks for executable files. 
  - `echo $PATH`
  - /usr/bin/echo Hello World
- `$HOME`: Points to the user's home directory. -`$SHELL`: Specifies the default shell for the user.
- `$USER` or `$LOGNAME`: Stores the username of the currently logged-in user.

## Vim

- insert
- copy
- peast
- quit
- save & quit

### info

- vim fileme: if file exist then it will open the file else it create and open
  - `vim bakasur.txt`
- `shift` + `:` + `q` = quit without saving the file
- `shift` + `:` + `wq` = save and quit
- `shift` + `:` + `q!` = forcefully quit
- press `i` to go in insert mode
- press `Esc` to back to read mode

### Vim keys and there information

- `i` or `shift + a` -> insert mode
- `esc` -> goto cmd mode
- `NOTE: all the following commands only work in cmd mode not work in insert mode`
- `:q` -> quit
- `:wq` -> save & quit
- `:q!` -> quit without saving
- `dd` -> cut or delete the text from specific line (single line)
- `yy` -> copy a single line
- `p` -> peast the copied items
- `u` -> undo the task
- `gg` -> curser move to top of file (line number 1)
- `shift + g` -> curser move to end of file (last line)
- `:set nu` -> set the line numbers to editor
- `:5` or `:<line number>` -> jump cursor to specific line (like `:5` moves cursor to line number 5)
- `:2,5d` -> delete content from line number 2 to 5
- `:2,23y` -> copy content from line 2 to line 23

### searcing in vim

- `/<serach-keyword>`
- example: `/from` -> search the `from` word in file
- press `enter`
  - press `n` for next()
  - press `shift + n` for previous()

### Editors like vim

- Nano
- NanoVim
  `NOTE: We can use any of one`

## File permissions

- total 9 combination
  - `rwxrwxrwx`
- check filepermission using `ls -l`

```
r -> read
w -> write
x -> exicute

- (dash) at starting means its file
d at staring means its directory

        -             rwx      rwx      rwx
 file/directory       user    group    other

samples:
-rw-r--r--  -> its means
                first - (dash) means its a file
                rw- means user can read, write but can not exicute file
                r-- means group can only read the file
                r-- others can only ready the file


drwxr-xr-x  -> its means
                first d means its a directory
                rwx means user can read, write and exicute
                r-x means group can read and exicute only can not write
                r-x means other can read and exicute only can not write
```

# Extra Commands

    - chmod
    - ping - are these computers even connected?
    - netstat
    - ps
    - df
    - top
    - more
    - less
    - uptime
    - source

    - wget - download files
    - curl - make any http request you want
    - ssh - secure shell
    - scp - copy files over a ssh connection

    - dig/nslookup - what's the IP for that domain (DNS query)
    - whois - is this domain registered ?
    - ngrep - grep for your network
    - tcpdump - show me all packets on port 80
    - ifconfig - whats my IP address

# Extra Topics

## Root & sudo user and its privileges
### Understanding the difference between # & $
- `username@hostname:~$` : (Regular user prompt)
- `username@hostname:~#` : (Root/superuser prompt)
- Understanding linux user & profile
- User permissions, RWX, changing permissions
  - Read, write and execute
  - Changing permission through bit and flag
- Root & sudo user and its privileges
- User management
  - Creating user
  - Changing password
- Inspecting all running applications, stopping and starting it.
  - service
  - systemctl
- Installing & uninstalling distribution packages
  - apt
  - rpm
  - yum
- Reboot the machine through the command line.
  - init 6
  - reboot
- Create cloud instance using UI and connect it via ssh
  - ssh user@ip
- Install Web Server Nginx

  - Engine X

- What is not important for regular user and will not be covered in this
  - Mounting new hard drive
  - Network Firewall
  - Creating multiple users
  - Custom software installation



## Root & sudo user and its privileges

## User management ✅
- Creating user
- Changing password



## Configuring SSH (Secure Shell)
- Use to connect to other computer using command line interface
