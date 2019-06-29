# EXP-Windows

This script was developed so that you can use a Windows device without someone noticing it, all you need is a computer with Linux and a few seconds with the Windows computer that will be hacked, unfortunately this step is important since we need to install our infected program on this computer.

### Prerequisites

These packages are needed to run EXP-Windows, if you don't have them you can install each one yourself or **let EXP-Windows install these packages for you**.

```
curl          - sudo apt-get install curl
apache2       - sudo apt-get install apache2
xclip         - sudo apt-get install xclip
xterm         - sudo apt-get install xterm
metasploit    - sudo apt-get install metasploit-framework *
xset          - sudo apt-get install x11-xserver-utils
```

**metasploit-framework** might need to be installed differently depending on your situation.

### Installing

You can install EXP-Windows with just these commands:

```
cd /folder/where/EXP-Windows/is/located/at/

sudo bash install.sh -i
```
Also, you can **run EXP-Windows with "exploitw" directly on console after you have installed it**.

### You Can Edit The Script Yourself

There's three arguments that you can edit yourself for better use of the EXP-Windows script...

```
# - Set Your API Key If You Want To Use The "Geolocate" Command On Meterpreter - Default value #
APIKEY=#

# - Update The Latest Packages - Default value "yes"
UpdatePackages=yes

# - Update Script Or ".config" To The Latest Version On GitHub - Default value "yes"
UpdateScript=yes
```
Each one has a very specific task on EXP-Windows, so don't leave them with nothing on.

## Authors

* **Anderson L Polo A** - *Initial work* - [MidNightSonne](https://github.com/midnightsonne)

## Contact

* Email: midnightsonnecontact@gmail.com
* WhatsApp: (55) +51 99901-5280
* Instagram: @andersonpoloficial

## License

This project is licensed under the **GPL v3.0** License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* My ex GitHub account MidNightSun
