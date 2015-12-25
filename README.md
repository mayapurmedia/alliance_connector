# Alliance Broadband bash login script

Hare Krishna. This is simple bash script to connect to Alliance Broadband 
internet.

For latest version visit: https://github.com/nrsimha/alliance_connector

## Requirements

You need to have either `curl` or `wget` installed.

## Install and run

* Copy `config.cfg.template` into `config.cfg` and fill your user credentials.
* Run `sh ./alliance_connector.sh`

## Adding into crontab

If you want to run script with cron every minute add following line into 
your crontab:

```
* * * * * cd DIRECTORY/PATH/TO/THE/SCRIPT && sh ./alliance_connector.sh > /dev/null
```
