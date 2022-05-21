[点击前往中文说明](https://github.com/wy580477/Rclone-Web-APP-on-Heroku/blob/main/README_chs.md)

## Warning | 警告
 2022/5/21
 - Unmaintained repo，deploy at your own risk.
 - 停止维护，部署风险自负。

## Acknowledgments

- [bastienwirtz/homer](https://github.com/bastienwirtz/homer)  A very simple static homepage for your server.
- [rclone/rclone](https://github.com/rclone/rclone)

## Attention

 1. **Do not abuse heroku's service, or your account could get banned.**
 2. Anyone who can login into this app has full access to data in this app and Rclone remotes. Do not share with other ppl, and do not store sensitive information with this app.

[Overview](#Overview)

[Deployment](#Deployment)

[First run](#first)  

[More usages and precautions](#more)  

## <a id="Overview"></a>Overview

This project integrates Rclone + WebUI with auto-upload function, Rclone serve http & webdav, customizable portal page, ttyd web terminal.

![image](https://user-images.githubusercontent.com/98247050/168762485-ef0e5a96-3267-40f5-a3d8-f1d3a9f056e1.png)

 1. Rclone runs on daemon mode, easy to manually transfer files.
 2. You can connect Rclone from frontends running on other hosts.

## <a id="Deployment"></a>Deployment

 **Do not deploy directly from this repository**  

 1. Fork this this repository.
 2. Click Setting on fork repository page and check Template repository.
 3. Click new button: Use this template，create a new repository。
 4. For example, your Github username is bobby, and the new repository name is green. After logging in to heroku, visit <https://dashboard.heroku.com/new?template=https://github.com/bobby/green> to deploy.

## <a id="first"></a>First run

 1. After deployment, for example, your heroku domain name is bobby.herokuapp.com, the portal page path is /portal, then visit bobby.herokuapp.com/portal to reach the portal page.
 2. Webdav address: your_Heroku_app_domain/${GLOBAL_PORTAL_PATH}/rclonedav

## <a id="more"></a>More usages and precautions

 1. Hit shift+F5 to force refresh if web services don't work properly. If app still doesn't work, clear cache and cookie of your heroku domain from browser.
 2. Add the following content to the end of the Rclone config file, you can add local heroku storage in Rclone Web UI for manual upload.

```
[local]
type = alias
remote = /mnt/data
```

 3. It is not possible to configure a Rclone remote which requires web authentication through Rclone web UI in this app.
 4. Portal page config file homer_en.yml and icon resources are under content/homer_conf directory in repository, use path as ./assets/tools/example.png to add the new icon to homer config file.
