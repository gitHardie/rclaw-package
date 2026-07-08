# RClaw Package Repository

RClaw 固件的独立插件源仓库。

## 说明

本仓库从 [kenzok8/small-package](https://github.com/kenzok8/small-package) fork，并根据 RClaw 项目需求进行定制。

## 当前收录插件

### 应用插件

| 插件 | 包名 | 说明 |
|------|------|------|
| Dockerman | luci-app-dockerman | Docker 可视化管理 |
| Netdata | luci-app-netdata | 系统实时监控 |
| OpenClash | luci-app-openclash | 代理客户端 |
| SoftEtherVPN | luci-app-softethervpn | VPN 服务器 |
| vlmcsd | luci-app-vlmcsd | KMS 激活服务 |
| xunlei | luci-app-xunlei | 远程下载 |

### 主题

| 主题 | 包名 | 说明 |
|------|------|------|
| Glass | luci-theme-glass | 简洁玻璃风格主题 |

## 使用方法

在 OpenWrt 源码的 `feeds.conf` 中添加：

```
src-git rclaw https://github.com/gitHardie/rclaw-package.git
```

然后执行：

```bash
./scripts/feeds update -a
./scripts/feeds install -a
```

## 更新策略

本仓库会定期从上游 kenzok8/small-package 同步更新，同时保留 RClaw 项目的定制修改。

## 许可证

遵循各插件原有开源协议。
