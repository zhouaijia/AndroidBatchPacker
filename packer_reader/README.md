# packer_reader

```groovy
dependencies {
    compile 'com.aijia.batchpacker:packer_reader:1.0.0'
}
```

本库对外提供两个读取类：

- ChannelReader：读取Packer内置id对应的信息，一般用来存放渠道和额外信息。
- PackerReader: 读取自定义id对应的信息。

## 注意
非Android系统使用此jar包时需要添加org.json依赖

```groovy
compile 'org.json:json:20080701'
```
备注：这么做主要是为了减少android方法数，利用系统自带的org.json
