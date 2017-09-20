# Picture

一个基于Tengine+Lua+ImageMagic的图片处理服务,后端存储采用淘宝的tfs文件系统,目前应用于ffan公司.支持压缩/裁剪/合成,本地cache等基本功能,支持的图片格式为`jpg|jpeg|gif|png`.

Note: **可以忽略项目中的redis**

## 部署

### 需要安装淘宝的tfs文件服务器和tengine

### 运行

```bash
./configure local/test/sit/prod
make install && make run
```

## 访问规则

通过Path来区分图片的功能:  
* i1 存放原图  
* i2 存放缩放/裁剪之后的图片  
* i3 存储打标的图片  
* i4 存储合成的图片  
* i5 用于支持断点续传  

以T10FbTB4hT1RCvBVdK图片为例.

### 图片格式转换

格式为`_.{webp|jpg|png}`  
比如:  
img.picture.com:10500/tfs/i1/T10FbTB4hT1RCvBVdK_.webp  
img.picture.com:10500/tfs/i2/T10FbTB4hT1RCvBVdK_200x_.webp

### 图片压缩

格式为`_q{quantity}`  
比如:  
img.picture.com:10500/tfs/i1/T10FbTB4hT1RCvBVdK_.webp_q70

### 图片缩放/裁剪

`%d`的区间是[100,999}  
格式为:  
`%dx%d` 缩放图片,宽和高不超过指定的值,保持原图的宽高比  
`%dx%d!` 缩放图片到指定的宽和高,忽略原图的宽高比  
`%dx%d!!` 裁剪,保持原图宽高比  
`%dx` 定宽  
`x%d` 定高  

比如:  
img.picture.com:10500/tfs/i2/T10FbTB4hT1RCvBVdK_300x300  
img.picture.com:10500/tfs/i2/T10FbTB4hT1RCvBVdK_300x_q70_.webp

### 打标

比如:  
img.picture.com:10500/tfs/i3/label_1/T10FbTB4hT1RCvBVdK_300x_q70_.webp  
label_1替换label_1为自己的label_?即可

### 合成

位置  
`nw` 西北  
`ne` 东北  
`sw` 西南  
`se` 东南  
`ct` 居中  

比如:  
img.picture.com:10500/tfs/i3/nw/T10FbTB4hT1RCvBVdK,T1XtETByZT1RCvBVdK_300x_q70_.webp