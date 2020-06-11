# tw-cap-archive-downloader
This is a simple Bash script to download Taiwan CAP archive file every day.

# Usage

- Clone this repository.

```Bash
git clone https://github.com/peter279k/tw-cap-archive-downloader
```

- Deploy this URL to targeted machine.
- Setup Cron schedule job on targeted machine and sepcific time is up to developers :).

```Bash
*/60 */11 * * * cd /path/to/tw-cap-archive-downloader && bash ./cap-downloader.sh > "result.txt"
```

# References

- [zip_archive_url](https://alerts.ncdr.nat.gov.tw/AlertdataDownload.aspx)
- [CAP reference](https://alerts.ncdr.nat.gov.tw/CAPfiledownload.aspx)
- [RSS for Alert Notification](https://alerts.ncdr.nat.gov.tw/RSS.aspx)
