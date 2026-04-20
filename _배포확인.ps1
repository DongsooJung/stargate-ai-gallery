# UTF-8 with BOM · 배포 후 상태 진단
$ErrorActionPreference = 'Continue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$base = 'https://dongsoojung.github.io/stargate-ai-gallery'
Write-Host "=== 스타게이트 에이아이 갤러리 배포 진단 ===" -ForegroundColor Cyan
Write-Host "URL: $base" -ForegroundColor Yellow
Write-Host ''

# 1) index.html
try {
    $r = Invoke-WebRequest -Uri "$base/" -UseBasicParsing -TimeoutSec 15
    Write-Host ("[1] index.html HTTP {0} | {1} bytes" -f $r.StatusCode, $r.RawContentLength) -ForegroundColor Green
} catch { Write-Host "[1] index.html ERR: $_" -ForegroundColor Red }

# 2) data.json
try {
    $r2 = Invoke-WebRequest -Uri "$base/data.json" -UseBasicParsing -TimeoutSec 15
    $j = $r2.Content | ConvertFrom-Json
    Write-Host ("[2] data.json HTTP {0} | {1}건" -f $r2.StatusCode, $j.Count) -ForegroundColor Green
    $byCat = $j | Group-Object -Property cat | Sort-Object Name
    foreach ($g in $byCat) { Write-Host ("      {0,-22} {1}" -f $g.Name, $g.Count) -ForegroundColor DarkGray }
} catch { Write-Host "[2] data.json ERR: $_" -ForegroundColor Red }

# 3) 무작위 샘플 3건 확인
if ($j) {
    Write-Host ''
    Write-Host "[3] 무작위 샘플 3건 HTTP 확인" -ForegroundColor Yellow
    $sample = $j | Get-Random -Count 3
    foreach ($s in $sample) {
        try {
            $rr = Invoke-WebRequest -Uri "$base/$($s.html)" -UseBasicParsing -Method Head -TimeoutSec 10
            Write-Host ("      OK {0}  <- {1}" -f $s.html, $s.name) -ForegroundColor Green
        } catch { Write-Host ("      ERR {0}: {1}" -f $s.html, $_.Exception.Message) -ForegroundColor Red }
    }
}

# 4) Pages API 상태
Write-Host ''
try {
    $api = gh api repos/DongsooJung/stargate-ai-gallery/pages 2>$null | ConvertFrom-Json
    Write-Host ("[4] Pages API status: {0} | cname: {1}" -f $api.status, ($api.cname -as [string])) -ForegroundColor Green
} catch { Write-Host "[4] Pages API: gh 미설치 또는 미인증" -ForegroundColor DarkYellow }

Write-Host ''
Write-Host "완료. Chrome: $base/" -ForegroundColor Cyan
Read-Host "Enter로 종료"
