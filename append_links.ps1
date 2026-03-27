$draftsDir = "c:\changwenn\git\20260327_novel_learning\04_drafts"
$files = @(
    "001_激荡的前夕.md",
    "002_算盘上的道义.md",
    "003_街头抢筹战.md",
    "004_台账里的硕鼠.md",
    "005_叩开旧时代的大门.md",
    "006_一万日元的死锁.md",
    "007_算盘兵团的诞生.md",
    "008_账本上的宣判.md",
    "009_长町的月见节.md",
    "010_大藏省的审核迷宫.md",
    "011_折现率的密码.md",
    "012_复式阵法与一万日元的家谱.md"
)

for ($i = 0; $i -lt ($files.Length - 1); $i++) {
    $currentFile = Join-Path -Path $draftsDir -ChildPath $files[$i]
    $nextFileName = $files[$i+1]
    $nextTitle = $nextFileName.Replace(".md", "")
    
    $content = Get-Content -Path $currentFile -Raw -Encoding UTF8
    if ($content -notmatch "下一章：") {
        $appendStr = "`n`n---`n**[下一章：$nextTitle](./$nextFileName)**`n"
        Add-Content -Path $currentFile -Value $appendStr -Encoding UTF8
    }
}

$readmePath = "c:\changwenn\git\20260327_novel_learning\README.md"
$readmeContent = Get-Content -Path $readmePath -Raw -Encoding UTF8
if ($readmeContent -notmatch "马上开始阅读") {
    $readmeAppend = "`n`n## 马上开始阅读`n👉 **[点击这里跳转到第一章：激荡的前夕](./04_drafts/001_激荡的前夕.md)**`n"
    Add-Content -Path $readmePath -Value $readmeAppend -Encoding UTF8
}

Write-Host "All links appended successfully."
