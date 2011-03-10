git-backup
==========

A ruby script used to maintain an offsite backup of git repositories.

Usage
-----

Clone your repositories to be backed up into a single directory on some server:

    mkdir /home/myuser/mybackups
    cd /home/myuser/mybackups
    git clone user@server:repo1
    git clone user@server:repo2

Modify `baseDir` to match the full path to the directory you used in step 1

Run `./backup.rb`

Add it to cron via `crontab -e` for scheduled backups