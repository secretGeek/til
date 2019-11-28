# cron and crontab

cron runs commands periodically.


## cron expressions

A cron expression has five parts....

	*     *     *   *    *        command to be executed
	-     -     -   -    -
	|     |     |   |    |
	|     |     |   |    +----- day of week (0 - 6) (Sunday=0)
	|     |     |   +------- month (1 - 12)
	|     |     +--------- day of        month (1 - 31)
	|     +----------- hour (0 - 23)
	+------------- min (0 - 59)

### MINUTES



    * * * * * ls         # Every  minute
    */2 * * * * ls       # Even minutes
    1-59/2 * * * * ls    # Odd minutes
    */5 * * * * ls       # Every 5 minutes
    */15 * * * * ls      # Every 15 minutes
    22 * * * * ls        # 22 minutes past the hour every hour...

    0 * * * * ls         # Every hour On the hour
    0 */2 * * * ls       # Even hours, on the hour
    0 1-23/2 * * * ls    # Odd hours on the hour
    0 */6 * * * ls       # Every 6 hours
    0 3 * * * ls         # At 3 AM (every day)...
    0 0 * * * ls         # Every day at midnight
    0 0 */2 * * ls       # EVEN days at midnight
    0 0 */5 * * ls       # Every 5 days

## crontab

Your `crontab` file stores all of the jobs you run periodically. You can edit this file with:

	sudo crontab -e

If you've never used crontab before, then the first time you run it it will ask which editor to use:

	$ sudo crontab -e
	no crontab for root - using an empty one

	Select an editor.  To change later, run 'select-editor'.
	  1. /bin/ed
	  2. /bin/nano        <---- easiest
	  3. /usr/bin/vim.basic
	  4. /usr/bin/vim.tiny

	Choose 1-4 [2]: 2

If you're a BASIC like me then choose `nano`

Next it will open `nano` with your empty crontab file (empty apart from explanatory comments)...

Add your cronexpressions at the bottom of the file.

e.g.

	15 3 * * * /usr/bin/certbot renew --quiet
	@reboot /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf 2>&1

## check cron logs....

	sudo grep CRON /var/log/syslog


If you see this in your cron logs:


	(CRON) info (No MTA installed, discarding output)

It's because one of the cron commands is producing output, and cron thinks it should email you, but it can't find a Mail-Transfer-Agent.

You can just pipe the output to nowhere by adding this to the command:

    >/dev/null 2>&1

e.g.

	*/10 * * * * curl http://example.com >/dev/null 2>&1



## /et/cron.hourly etc


On Ubuntu, you can put a shell script in one of these folders: /etc/cron.daily, /etc/cron.hourly, /etc/cron.monthly or /etc/cron.weekly.


## references

 * [crontab-generator](https://crontab-generator.org/)

## see also

 * [How To Secure Nginx with Let's Encrypt on Ubuntu 16.04](lets_encrypt.md)
