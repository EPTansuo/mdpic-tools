# mdpic-base64
## 简介
将Markdown文件中的图片转为base64编码.(尚有问题)

**目前的问题: 无法转换较大的图片文件**

## 安装

切换到脚本所在目录,然后在终端中输入:

```
sudo cp mdpic-base64.sh /bin/mdpic-base64
```
或者是输入:

```
./install.sh
```

## 用法

```
mdpic-base64 demo.md out.md
```
说明:将`demo.md`中的远程图片以及本地图片文件转换为base64编码, 并将转换好的markdown文件保存到`out.md`中

## 卸载

使用命令:

```
sudo rm /bin/mdpic-base64
```

### 依赖

**需要安装base64才能使用**

**如果文件中有网络图片,则需要安装curl才能使用**

