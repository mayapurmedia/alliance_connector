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

## Install on OpenWRT router

Connect to your router over ssh.

Run following commands:

```
cd /tmp/
wget mayapurmedia.com/downloads/alliance_connector-v1.tar.gz
tar xzvf alliance_connector-v1.tar.gz -C /usr/
cd /usr/alliance_connector/
cp config.cfg.template config.cfg
```

Now edit your user credentials:

```
vi config.cfg
```

Last command will open editor. Press letter 'i' to switch to edit mode and 
then change user credentials. When you are done press Esc to exit edit mode, 
followed by :x and Enter key to save file and exit.

You should be able to test it now, by running:

```
sh ./alliance_connector.sh
```

Once you confirm script is working with current user credentials you can set 
script to automatically run every minute by following command.

If your crontab is empty you can run this command:

```
crontab openwrt-crontab
```

If your crontab has already something in you should add there following line:

```
* * * * * cd /usr/alliance_connector && sh ./alliance_connector.sh > /dev/null
```

It is done now. And from now it will try to connects to Alliance every minute
automatically, even after restart.
