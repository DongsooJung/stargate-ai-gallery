# Stargate AI HTML Gallery

Stargate Corporation이 AI로 생성한 HTML 프로토타입·대시보드·랜딩·명함·브랜드 자산 65건의 정적 아카이브입니다.

## 구조

```
스타게이트 에이아이 갤러리/   ← 로컬 폴더명 (한글)
├── index.html          ← 메인 갤러리 (검색·필터·정렬)
├── data.json           ← 메타데이터 (카테고리·원본경로·수정일)
├── files/
│   ├── *.html          ← 65개 AI 생성 HTML (ASCII 안전 이름)
│   └── thumbs/
│       └── *.png       ← 65개 썸네일 이미지
├── README.md
└── .gitignore
```

## 카테고리 (19개)

AI-명함카드 · AI-Cafe24상품상세 · AI-법인사업 · AI-업무자동화 · AI-랜딩페이지 · AI-지식그래프 · AI-아키텍처설명 · AI-폰트브랜딩 · AI-AI데모 · AI-기획문서 · AI-브리핑 · AI-Claude생성 · AI-북마크리포트 · AI-교육자료 · AI-조직도 · AI-창작플랫폼 · AI-전략대시보드 · AI-생산성대시보드 · AI-스크린샷인덱스 · AI-이미지인포그래픽

## GitHub Pages 배포 방법

> **주의**: GitHub 저장소명(URL)은 ASCII만 허용되므로 `stargate-ai-gallery`로 유지합니다.
> 로컬 폴더명만 한글(`스타게이트 에이아이 갤러리`)로 사용합니다.

### 1) 저장소 생성 (GitHub 웹)
- New repository → 이름: `stargate-ai-gallery` (ASCII 고정)
- Public 선택, README 체크 해제
- Create repository

### 2) 로컬에서 Push (PowerShell)

```powershell
cd "C:\Users\DONGSOO_PC\Desktop\Cowork(260323)\스타게이트 에이아이 갤러리"
git init
git add .
git commit -m "init: Stargate AI HTML Gallery (65 files, 19 categories)"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/stargate-ai-gallery.git
git push -u origin main
```

또는 동봉된 `_업로드.ps1` 을 실행하면 위 과정을 자동 수행합니다 (`$PSScriptRoot` 기반이라 폴더 이동/이름변경 무관).

### 3) Pages 활성화
- Settings → Pages → Source: `Deploy from a branch` → Branch: `main` / `/ (root)` → Save
- 1~2분 후 `https://YOUR_USERNAME.github.io/stargate-ai-gallery/` 에서 확인

### 4) 커스텀 도메인 (선택)
- Settings → Pages → Custom domain → `gallery.stargate11.com` 등록
- 도메인 DNS에 CNAME 레코드: `YOUR_USERNAME.github.io`

## 파일명 규칙

원본 한글 파일명은 GitHub Pages URL 인코딩 이슈 방지를 위해 ASCII 규칙으로 변환했습니다. 원본 한글 제목은 `data.json`과 갤러리 UI에서 그대로 표시됩니다.

| 접두사 | 카테고리 |
|---|---|
| `card-` | 명함카드 |
| `cafe24-` | Cafe24 상품상세 |
| `biz-` | 법인사업 |
| `land-` | 랜딩페이지 |
| `graph-` | 지식그래프 |
| `arch-` | 아키텍처설명 |
| `auto-` | 업무자동화 |
| `dash-` | 전략대시보드 |
| `pd-` | 생산성대시보드 |
| `demo-` | AI데모 |
| `font-` | 폰트브랜딩 |
| `plan-` | 기획문서 |
| `brief-` | 브리핑 |
| `cla-` | Claude생성 |
| `bm-` | 북마크리포트 |
| `edu-` | 교육자료 |
| `org-` | 조직도 |
| `lit-` | 창작플랫폼 |
| `ss-` | 스크린샷인덱스 |
| `ig-` | 이미지인포그래픽 |

## 주의사항

- 공개 저장소이므로 **API 키·개인정보·민감 법인 문서가 포함된 HTML은 사전에 제외**하거나 별도 비공개 저장소로 분리하세요.
- 특히 `AI-법인사업`, `AI-브리핑` 내 문서는 공개 전 내용 검토 필수.
- 서버사이드 코드 불가 (정적 HTML/CSS/JS만).

## 라이선스

내부 자산 아카이브 — 별도 명시 없으면 무단 복제·재배포 금지.
