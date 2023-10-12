import requests

api_url = ""

requests.packages.urllib3.disable_warnings()

date = requests.get(api_url, verify=False)

with open("/home/ayounes/fortegate_backups/api_backup.conf", "wb") as f:
    for line in date:
        f.write(line)


