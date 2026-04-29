# OpenClaw Agent 同步配置

本仓库用于龙虾 Agent 的多设备配置同步。

## 文件结构

| 路径 | 说明 |
|------|------|
| SOUL.md | Agent 人格定义 |
| USER.md | 用户信息 |
| IDENTITY.md | Agent 身份 |
| AGENTS.md | 工作区规则 |
| TOOLS.md | 工具本地配置 |
| HEARTBEAT.md | 心跳任务配置 |
| BOOTSTRAP.md | 首次启动引导 |
| .openclaw/workspace-state.json | 工作区状态 |

## 新设备恢复

1. 安装 QClaw
2. 运行 PowerShell（管理员）：
`
irm https://raw.githubusercontent.com/aeoliandark/openclaw-config/main/restore.ps1 | iex
`
3. 重启 QClaw

## 更新同步

在当前设备运行 sync.ps1 即可推送最新配置到 GitHub。