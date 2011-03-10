This was created to maintain an offsite backup of my private git repositories.

Usage:

1. clone your repositories into one location (baseDir) on some server
2. modify `baseDir` to match the actual directory on your server
3. run `./backup.rb`
4. add it to cron via `crontab -e` for scheduled backups