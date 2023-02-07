# Markdown图片工具

## 简介:

**mdpic-dl:** 将Markdown文件中的网络图片下载到本地.

[mdpic-dl 具体介绍和用法](./mdpic-dl/README.md)

**mdpic-base64:** 将Markdown文件中的图片转为base64编码.

[mdpic-base64 具体介绍和用法](./mdpic-base64/README.md)

## 安装: 

```
./install.sh
```

## 说明:

1. 此工具使用的shell脚本编写,脚本解释器使用`bash`, 更换其它的解释器, 可能会出现不兼容的问题. 
2. 由于`GNU sed`和`BSD sed`存在一些不同, 所以即使同样使用`bash`, 此脚本也无法直接在BSD系统上运行. 如果想要在BSD系统上使用此脚本,需要更改sed的命令行参数(`OS X`同理).
3. 如果需要在非`GNU\Linux`上使用此脚本, 还需要指明该脚本使用的脚本解释器. 如安装时命令原本为`./install.sh`, 则需要改为`bash ./install.sh`

