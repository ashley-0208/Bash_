import sys


usage = int(sys.argv[1])

if usage > 80:
    print(f'[Alert] Disk usage is high: {usage}%')
else:
    print(f'[OK] Disk usage is normal: {usage}%')