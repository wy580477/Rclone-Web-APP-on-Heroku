## 鸣谢

- [bastienwirtz/homer](https://github.com/bastienwirtz/homer)  使用yaml配置文件的静态导航页，便于自定义。
- [rclone/rclone](https://github.com/rclone/rclone)

## 注意

 1. **请勿滥用，Heroku账号封禁风险自负。**
 2. Heroku的文件系统是临时性的，每24小时强制重启一次后会恢复到部署时状态。
 3. 所有可以登陆此APP的用户可以访问/修改此APP以及Rclone远程存储的所有数据，不要存放敏感数据，不要与他人共享使用。
 4. 免费Heroku dyno半小时无Web访问会休眠，可以使用[hetrixtools](https://hetrixtools.com/uptime-monitor/215727.html)这样的免费VPS/网站监测服务定时http ping，保持持续运行。

[概述](#概述)

[部署方式](#部署方式)

[变量设置](#变量设置)  

[初次使用](#初次使用)  

[更多用法和注意事项](#更多用法和注意事项)  

## 概述

本项目集成了Rclone+WebUI、Rclone webdav服务、Rclone远程存储文件列表、可自定义的导航页、ttyd Web终端。

[yt-dlp+aria2版本传送门](https://github.com/wy580477/Heroku-All-In-One-APP)

![image](https://user-images.githubusercontent.com/98247050/168762880-0cb03160-609b-407f-bb7f-c293fb6c70c3.png)

 1. Rclone以daemon方式运行，可在WebUI上手动传输文件。
 2. Rclone可以接入其它host上运行的前端面板。

## 部署方式

 **请勿使用本仓库直接部署**  

  **Heroku修复安全漏洞中，目前无法通过网页从私有库部署**  

 1. 点击右上角Fork，再点击Create Fork。
 2. 在Fork出来的仓库页面上点击Setting，勾选Template repository。
 3. 然后点击Code返回之前的页面，点Setting下面新出现的按钮Use this template，起个随机名字创建新库。
 4. 比如你的Github用户名是bobby，新库名称是green。浏览器登陆heroku后，访问<https://dashboard.heroku.com/new?template=https://github.com/bobby/green> 即可部署。

### 变量设置

对部署时可设定的变量做如下说明。
| 变量| 说明 |
| :--- | :--- |
| `GLOBAL_USER` | 用户名，适用于所有需要输入用户名的Web服务 |
| `GLOBAL_PASSWORD` | 务必修改为强密码，同样适用于所有需要输入密码的Web服务 |
| `GLOBAL_LANGUAGE` | 设置导航页界面语言，chs为中文 |
| `GLOBAL_PORTAL_PATH` | 导航页路径和所有Web服务的基础URL，相当于密码之外多一层保护。不能为“/"和空值，结尾不能加“/" |
| `RCLONE_CONFIG_BASE64` | Rclone配置文件Base64编码，可使用linux系统base64命令或者在线base64工具生成。注意，多远程存储Rclone配置文件可能超过Heroku变量32kb的上限。 |
| `RCLONE_WEBDAV_PATH` | Rclone Webdav服务指向的Rclone远程存储目录，格式为：remote:/path。默认值auto会从Rclone配置文件第一行中提取远程存储名称并使用其根目录。 |
| `TZ` | 时区，Asia/Shanghai为中国时区 |
| `HEROKU_API_KEY` | Heroku账号API密钥，可选项，用于从dyno内部更新rclone配置文件变量，解决rclone token过期问题。需要HEROKU_APP_NAME和HEROKU_RESTART_TIME变量配合，而且dyno在指定的HEROKU_RESTART_TIME必须正在运行。可从Heroku账号面板处获得，也可以用heroku cli命令heroku authorizations:create创建。 |
| `HEROKU_APP_NAME` | Heroku APP名称。 |
| `HEROKU_KEEP_AWAKE` | 设置为"true"可以阻止dyno空闲时休眠，需要HEROKU_APP_NAME变量配合。 |
| `HEROKU_RESTART_TIME` | 指定更新Rclone配置文件的时间，可选项，在指定的时间正在运行的dyno会重启。格式为6:00，24小时制，时区为TZ变量所指定的时区。 |

### 初次使用

 1. 部署完成后，比如你的heroku域名是bobby.herokuapp.com，导航页路径是/portal，访问bobby.herokuapp.com/portal 即可到达导航页。
 2. Webdav地址： Heroku_app域名/${GLOBAL_PORTAL_PATH}/rclonedav

### 更多用法和注意事项

 1. 如果网页访问APP出现故障，按下shift+F5强制刷新，如果还不行，从浏览器中清除app对应的heroku域名缓存和cookie。
 2. Rclone配置文件末尾加上如下内容，可以在Rclone Web前端中挂载本地存储，方便手动上传。

```
[local]
type = alias
remote = /mnt/data
```

 3. 无法通过Rclone Web前端建立需要网页认证的存储配置。
 4. content/homer_conf目录下是导航页设置文件homer_chs(en).yml和图标资源，新加入的图标，在设置文件中要以./assets/tools/example.png这样的路径调用。
