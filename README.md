
# Bash Scripts Collection

### Installation:

**Clone repo**
```
git clone https://github.com/callmemikhail/mpc.git
```

### Usage:
##### Nsxiv copy
```
./nsxiv-copy.sh -d . ~/Downloads
```
small bash util, nsxiv copy
* [-d] or [--directory] specify the directory
* [-t] or [--target] specify the destination directory
##### Mini process controller
```
./mini-process-controller.sh -n librewolf -p -20 -t 10
```
* flag [-t] -- time period
* flag [-n] -- process name
* flag [-p] -- process priotity
