param(
    [Parameter(Mandatory=$true)]
    [string]$title,
    [int]$port = 6528  # 默认端口，可在命令行指定其他端口
)

# --------------------------
# 1️⃣ 生成安全 slug（URL 用）
# --------------------------
$slug = $title.ToLower() -replace '[^a-z0-9\u4e00-\u9fa5 ]', '' -replace '\s+', '-'

# --------------------------
# 2️⃣ 生成文章路径
# --------------------------
$postPath = "content/posts/$title.md"
$slugPath = "/posts/$slug/"

# --------------------------
# 3️⃣ 创建新文章
# --------------------------
hugo new "posts/$title.md"
Write-Host "✅ 文章已创建：$postPath"

# --------------------------
# 4️⃣ 替换 front matter 的 slug
# --------------------------
(Get-Content $postPath) |
ForEach-Object {
    if ($_ -match '^---') {
        "---`nslug: $slug`n$_"
    } else {
        $_
    }
} | Set-Content $postPath

# --------------------------
# 5️⃣ 打开文章文件编辑
# --------------------------
Start-Process notepad $postPath
Write-Host "✏️ 编辑文章内容"

# --------------------------
# 6️⃣ 启动 Hugo 本地服务器（后台）
# --------------------------
$hugoServerCmd = "hugo server --buildDrafts --bind 127.0.0.1 --port $port"
Start-Process powershell -ArgumentList $hugoServerCmd
Write-Host "🌐 Hugo 本地服务器已启动，端口：$port"

# --------------------------
# 7️⃣ 等待 Hugo 启动并打开浏览器
# --------------------------
Start-Sleep -Seconds 3
Start-Process "http://localhost:$port$slugPath"
Write-Host "🌐 已打开浏览器访问新文章：http://localhost:$port$slugPath"
