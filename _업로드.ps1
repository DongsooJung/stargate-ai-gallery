# Stargate AI HTML Gallery - GitHub Pages 원클릭 업로드
# 사용법: 파일 우클릭 → "PowerShell로 실행"
# 사전 조건: git 설치, GitHub 계정에서 저장소 생성 완료

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "=== Stargate AI HTML Gallery 배포 ===" -ForegroundColor Cyan

# 현재 스크립트 위치로 이동
Set-Location -Path $PSScriptRoot

# 1) 입력
$username = Read-Host "GitHub 사용자명 입력 (예: dongsoo-jung)"
$repo     = Read-Host "저장소 이름 입력 (기본값: stargate-ai-gallery)"
if ([string]::IsNullOrWhiteSpace($repo)) { $repo = 'stargate-ai-gallery' }

$remote = "https://github.com/$username/$repo.git"
Write-Host "`n원격 저장소: $remote" -ForegroundColor Yellow

# 2) Git 초기화
if (-not (Test-Path ".git")) {
    Write-Host "`n[1/5] git init..." -ForegroundColor Green
    git init | Out-Null
    git branch -M main
}

# 3) 원격 연결
$existing = git remote 2>$null
if ($existing -notcontains 'origin') {
    Write-Host "[2/5] remote 추가..." -ForegroundColor Green
    git remote add origin $remote
} else {
    Write-Host "[2/5] remote 업데이트..." -ForegroundColor Green
    git remote set-url origin $remote
}

# 4) 스테이징 & 커밋
Write-Host "[3/5] 파일 스테이징..." -ForegroundColor Green
git add .
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "  변경 없음." -ForegroundColor DarkGray
} else {
    $msg = "deploy: Stargate AI HTML Gallery ($(Get-Date -Format 'yyyy-MM-dd'))"
    git commit -m $msg | Out-Null
    Write-Host "  커밋 완료: $msg" -ForegroundColor DarkGray
}

# 5) Push
Write-Host "[4/5] push origin main..." -ForegroundColor Green
git push -u origin main

# 6) 안내
Write-Host "`n[5/5] 완료!" -ForegroundColor Green
Write-Host "`n다음 단계:" -ForegroundColor Cyan
Write-Host "  1. https://github.com/$username/$repo/settings/pages 접속"
Write-Host "  2. Source: Deploy from a branch → Branch: main / root → Save"
Write-Host "  3. 1~2분 후 배포 완료:"
Write-Host "     https://$username.github.io/$repo/" -ForegroundColor Yellow
Write-Host ""
Read-Host "Enter로 종료"
