# reset_bluetooth
Tired of deleting Bluetooth PLISTs by hand.

## CREDIT ##
* Logged In User @ https://www.jamf.com/jamf-nation/discussions/12769/getting-the-currently-logged-in-user
* PLIST listing @ http://macid.co/blog/2015/11/05/resetting-bluetooth-on-os-x/
* Aaron Pollack for encouraging me to unlock the repo for the world to reset their Bluetooth functionality.
* Ben Daschel @ https://github.com/supercoffee fixed my for loop modified from https://www.cyberciti.biz/faq/use-a-for-loop-to-remove-file-in-unix/ and http://stackoverflow.com/a/20203051. He also added the "declare" bit for the plistsArray.


## Notes ##
Took some spare parts from other websites and wrapped them into a functional shell script. Open to suggestions on how to improve.

Save your work. Needs to restart at the end of the script. Interestingly, it doesn’t need to re-pair previous devices upon reboot. 

It’s worked 99% of the time for me when my PLISTs get corrupted and I get a broken Bluetooth symbol or have general Bluetooth issues.
