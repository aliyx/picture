# Picture

一个基于nginx+lua+magic的图片处理服务,后端存储采用淘宝的tfs文件系统,目前应用于ffan公司.支持压缩/裁剪/合成,本地cache等基本功能.

Note: **可以忽略项目中的redis**

##  访问规则

![规则](docs/path.png)