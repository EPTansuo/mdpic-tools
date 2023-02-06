# mdpic-dl
## 简介
将Markdown文件中的网络图片下载到本地
## 安装

切换到脚本所在目录,然后在终端中输入:

```
sudo cp mdpic-dl.sh /bin/mdpic-dl
```
或者是输入:

```
./install.sh
```

## 用法

```
mdpic-dl demo.md out.md
```
说明:将`demo.md`中的远程图片下载到`demo.md.files`文件夹中,且将`demo.md`复制到`out.md`文件中,并改变将`out.md`中的图片链接改为本地文件的相对路径.

## 卸载

使用命令:

```
sudo rm /bin/mdpic-dl
```

### 依赖

**需要安装curl才能使用**
