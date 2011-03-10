#!/usr/bin/ruby
# == Synopsis 
#    Backup all of your git repositories
# 
# == Usage 
#    1) clone your repositories into one location (baseDir) on some server
#    2) in this file, modify 'baseDir' to match the actual directory on your server
#    3) ./backup.rb
#    4) cron it up for scheduled backups (use '[server]$ which ruby' to find ruby on your server, mine is in /usr/bin)
#       
#       [server]$ crontab -e
#       0 0 * * * /usr/bin/ruby /home/myuser/mybackups/backup.rb
#
# == Dependencies
#    ruby, git
#
# == Author
#    Patrick Reynolds
#    patrick@vunction.com

require 'fileutils'
require 'date'

def run
  start = Time.now
  
  ignore =  Array.new
  ignore = [
    ".",
    ".."
  ]
  
  ignoreFlag = false
  baseDir = "/home/myuser/mybackups/"

  print "Updating repositories...\n\n"
  Dir.foreach(baseDir) do |entry|
    
    if File::directory?(baseDir+entry)
    
      #ignore directories specified up top
      ignore.each do |i|
        if entry == i
          ignoreFlag = true
          break
        else
          ignoreFlag = false
        end
      end
      
      next if ignoreFlag == true
      
      #if we make it here, pull latest
      Dir.chdir(baseDir+entry)
      `git pull -v`
      print "\n\n"
      Dir.chdir(baseDir)

    end
 end

 print "\nCompleted in #{(Time.now-start).round} seconds\n\n"

end

run
