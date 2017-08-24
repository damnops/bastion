# 保垒机

### 部署

相关命令位于`auto`目录下

```
## 启动/部署服务
./auto/up
## 停止/删除服务
./auto/down
## 重建服务
./auto/recreate
```

### 操作记录

用户的操作记录相关存放在`/var/log/ophis`目录下，此目录在`docker-compose.yaml`中外挂到本地文件系统中。

###配置说明

系统的配置文件位于`etc`目录，相关文件内容说明如下

```
lists ### 此文件保存了授权给用户可执行的文件列表，请使用绝对路径
motd ### 登录之后的显示信息
profile ### 此文件定义了用户的环境变量等，如无必要，请不要轻易修改此文件
```

### 自定义命令

自定义命令已经系统初始化脚本位于`bin`目录

```
# useradd ### 添加用户
```

**请使用此`useradd`命令添加用户**，系统原生的`adduser`因为alpine镜像是使用busybox，而非真实的命令，无法被替换，所以需要使用自定义的参数才能设置用户环境

所有的用户家目录都在`/home/bastion`目录下

```
# getlogin ### 获取用户登录记录

Usage: getlogin [user]
	user: user name
```
```
# replay ### 播放用户操作记录

Usage: replay user time [speed]
  user: user name
  time: user login time
  speed: play speed
```


```
entrypoint ### 系统初始化入口，配置sshd等相关内容
prepare ### 用户目录初始化配置
```

### 端口

镜像的端口在启动后被映射到主机的`62222`端口，如需要，请在`docker-compose.yaml`文件中修改