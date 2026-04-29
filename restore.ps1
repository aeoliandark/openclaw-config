# OpenClaw 配置恢复脚本
# 在新设备上运行此脚本，从 GitHub 拉取 Agent 配置

$repo = "aeoliandark/openclaw-config"
$workspace = Join-Path $env:USERPROFILE ".qclaw\workspace\main"

# 创建工作区目录
if (!(Test-Path $workspace)) { New-Item -ItemType Directory -Path ($workspace | Out-Null }

# 获取仓库文件列表
$files = irm "https://api.github.com/repos/$repo/contents" -Headers @{"Accept"="application/vnd.github+json"}

# 下载每个文件
foreach ($f in $files) {
    if ($f.type -eq "file" -and $f.name -ne "README.md" -and $f.name -ne "restore.ps1") {
        $target = Join-Path $workspace $f.name
        Write-Output "[下载] $f.name ..."
        Invoke-WebRequest -Uri $f.download_url -OutFile $target -UseBasicParsing
    }
}

# 下载 .openclaw 目录
$openclawDir = Join-Path $workspace ".openclaw"
if (!(Test-Path $openclawDir) { New-Item -ItemType Directory -Path $openclawDir -Force | Out-Null }
$ocFiles = irm "https://api.github.com/repos/$repo/contents/.openclaw" -Headers @{"Accept"="application/vnd.github+json"}
foreach ($f in $ocFiles) {
    $target = Join-Path $openclawDir $f.name
    Invoke-WebRequest -Uri $f.download_url -OutFile $target -UseBasicParsing
    Write-Output "[OK] .openclaw/$f.name"
}

Write-Output "
✅ 配置恢复完成！请重启 QClaw。"