import requests
import sys
import pyperclip
import os
from dotenv import load_dotenv

load_dotenv()

params = {
    'key': os.getenv('WLLDRNET_API_KEY'),
    'url': sys.argv[1],
}
if len(sys.argv) > 2:
    params['custom_ending'] = sys.argv[2]

r = requests.get('https://wlldr.net/api/v2/action/shorten', params=params)

link = r.text[7:]

print(link)
pyperclip.copy(link)
