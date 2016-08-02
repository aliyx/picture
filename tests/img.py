#!/usr/bin/python3
# coding=utf-8
import http.client, urllib.parse, urllib.request
import os, sys, time

class Img:
    IP = '192.168.10.248:10502'
    H_URL = 'http://' + IP
    H_URL_POST = 'http://' + IP + '/tfs'

    def __init__(self):
        print ('starting ...')
        print ('ip: ' + Img.IP)

    def post(self, img_path):
        print ('start upload iamge: ' + img_path)
        fr = open(img_path,'rb')
        data = fr.read()
        req = urllib.request.Request(Img.H_URL_POST, data = data, method = 'POST')

        #header
        req.add_header('User-Agent','none')
        req.add_header('Referer','none')

        #post data to server
        f = urllib.request.urlopen(req)

        assert f.status == 200 , "upload image: " + img_path
        id = str(f.read(), encoding = 'utf-8')
        print (id)
        return id

    def get(self, uri):
        url = Img.H_URL + uri
        print ('start testing url: ' + url)
        req = urllib.request.Request(url, method = 'GET')  
        #header
        req.add_header('User-Agent','none')
        req.add_header('Referer','none')      
        
        # get server
        with urllib.request.urlopen(req) as f:
            pass

        assert f.status == 200 , "upload image: " + img_path
        print ('end')

    def cur_file_dir():
        path = sys.path[0]
        if os.path.isdir(path):
            return path
        elif os.path.isfile(path):
            return os.path.dirname(path)

    def __del__(self):
        print ('sucess...')

dir = Img.cur_file_dir() + os.sep
b_path = dir + 'b.jpg'
c_path = dir + 'c.png'

img = Img()  

# upload
b_img = img.post(b_path)
c_img = img.post(c_path)

# get
urls = []
#= /tfs/favicon.ico
urls.append('/tfs/favicon.ico')

#~ "^/(.*)/label_(\d+)_(T[^/]{17,50})$"
urls.append('/tfs/label_1_' + b_img)

#~ "^/(.*)/([^/]*)h00([[:alnum:]_]{30,50})$"
# ???

#~ "^/v1/tfs/orig/[[:alnum:]\._]{18,50}$"
urls.append('/v1/tfs/orig/' + b_img)

#~ "^/v1/tfs"
urls.append('/v1/tfs/' + b_img)

#~ "^/norm_(\d{1,3})/(nw|ne|se|sw|ct),(T[[:alnum:]_\.]{17}),(T[[:alnum:]_\.]{17})"
urls.append('/norm_200/ct,' + c_img + ',' + b_img)

#~ "^/tfs/(orig/|)(nw|ne|se|sw|ct),(T[[:alnum:]_\.]{17}),(T[[:alnum:]_\.]{17})"
urls.append('/tfs/ct,' + c_img + ',' + b_img)
urls.append('/tfs/orig/ct,' + c_img + ',' + b_img)

#~ "^/tfs/(orig/|)label_(\d+)/([[:alnum:]_\.]{18,50})$"
urls.append('/tfs/label_1/' + b_img)
urls.append('/tfs/orig/label_1/' + b_img)

#~ "^/tfs/norm_(\d{1,3})/(.+)$"
urls.append('/tfs/norm_100/' + b_img)

#~ "^/tfs"
urls.append('/tfs/' + b_img)

#~ "^/norm(_m|)_(\d+)/([[:alnum:]_\.]{18,50})$"
urls.append('/norm_100/' + b_img)
urls.append('/norm_m_100/' + b_img)

#/norm_m_(\d{1,3})/(.+)$"
urls.append('/norm_m_100/' + b_img)

#~ "^/(norm_\d{1,3}/|orig/|)label_(\d+)/([[:alnum:]_\.]{18,50})$"
urls.append('/norm_100/label_1/' + b_img)
urls.append('/orig/label_1/' + b_img)

for u in urls:
    img.get(u)