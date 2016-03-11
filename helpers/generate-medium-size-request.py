#!/usr/bin/env python
import sys
import json
import urllib
import base64
from mimetypes import MimeTypes
import os
dir = os.path.dirname(__file__)

if len(sys.argv) < 4:
    print 'Must give the node uuid, image file-name, and output file.'
    print sys.argv

mime = MimeTypes()
url = urllib.pathname2url(sys.argv[2])
mime_type = mime.guess_type(url)

image_path = os.path.join(os.getcwd(), sys.argv[2])
with open(image_path, "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

data = {
    "uuid": sys.argv[1],
    "file": encoded_string,
    "mimetype": mime_type[0],
}

output_path = os.path.join(os.getcwd(), sys.argv[3])
with open(output_path, 'w') as outfile:
    json.dump(data, outfile)
