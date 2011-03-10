This was created to maintain an offsite backup of my private git repositories.

Usage:

1. Clone your repositories to be backed up into a single directory on some server
  `mkdir /home/myuser/mybackups
  cd /home/myuser/mybackups
  git clone user@server:repo1
  git clone user@server:repo2`
2. Modify `baseDir` to match the full path to the directory you used in step 1
3. Run `./backup.rb`
4. Add it to cron via `crontab -e` for scheduled backups