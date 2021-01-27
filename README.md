# Wiki

- 用于发现和更新IP地址服务
- 使用方法如下：
服务器端：

```bash
go build ip.go
./ip
```
需要推送地址的机器加入如下定时任务
```bash
*/15 6-23 * * * curl http://ip.xxx.com/setip
```
# License

Copyright 2021 James Li.
Licensed under the Apache License,
Version 2.0:
http://www.apache.org/licenses/LICENSE-2.0
