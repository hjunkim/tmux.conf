# Engineering tmux.conf

이 저장소는 엔지니어들이 실무에서 자주 쓰는 설정을 담은 `tmux.conf`와, 같은 테마(catppuccin macchiato)로 맞춘 `.vimrc`를 제공합니다.

## 포함된 파일

| 파일 | 용도 |
|---|---|
| `tmux.conf` | tmux 설정 (TPM 기반 플러그인 포함) |
| `.vimrc` | vim 설정 (vim-plug + catppuccin, tmux와 테마 통일) |

## 포함된 설정

- `Ctrl-a`를 prefix로 사용
- 마우스 사용, 긴 히스토리, 창/패널 번호 재정렬
- Vim 스타일 복사/이동 키 바인딩
- 현재 경로 기준 창/패널 분할
- 상태바 및 기본 UX 개선
- TPM 기반 플러그인 관리

## 플러그인 목록

| Plugin | 용도 |
|---|---|
| `tmux-plugins/tpm` | tmux plugin manager |
| `tmux-plugins/tmux-sensible` | tmux 기본값을 실용적으로 보정 |
| `tmux-plugins/tmux-resurrect` | 세션/패널 상태 저장 및 복원 |
| `tmux-plugins/tmux-continuum` | 주기적 자동 저장/자동 복원 |
| `christoomey/vim-tmux-navigator` | Vim과 tmux 간 pane 이동 연동 |
| `catppuccin/tmux` | 상태바 테마 |

## 플랫폼별 사전 준비

### macOS

Homebrew로 설치합니다.

```bash
brew install tmux vim git
```

- 클립보드 연동(`pbcopy`)이 기본 제공됩니다.
- 기본 Terminal.app은 `Alt`(Option) 키를 Meta로 보내지 않아 `Alt-1`, `Alt-Left` 같은 바인딩이 동작하지 않습니다.
  iTerm2를 쓰거나, Terminal.app에서 **Preferences → Profiles → Keyboard → Use Option as Meta key**를 켜세요.

### Linux

```bash
# Debian/Ubuntu
sudo apt install tmux vim git

# RHEL/Fedora
sudo dnf install tmux vim git
```

- 클립보드는 기본적으로 OSC 52(터미널 경유)로 동작합니다. 아래 [클립보드](#클립보드) 참고.

### Windows

tmux는 Windows에서 네이티브로 동작하지 않습니다. 다음 중 하나를 사용하세요.

- **WSL2 (권장)** — Ubuntu 등을 설치한 뒤 위 Linux 절차를 그대로 따릅니다.
- Git Bash / MSYS2 / Cygwin — 동작하지만 일부 플러그인이 정상 동작하지 않을 수 있습니다.

Windows Terminal 사용을 권장합니다. 기본 콘솔(conhost)은 트루컬러와 폰트 지원이 부족해 catppuccin 테마가 깨져 보일 수 있습니다.

## 공통: 폰트

상태바에 Nerd Font 기호(둥근 세그먼트)가 사용됩니다. 깨져 보이면
[Nerd Font](https://www.nerdfonts.com/)(예: MesloLGS NF, JetBrainsMono NF)를 설치하고
터미널 폰트로 지정하세요.

## 설치 방법

> **순서 주의:** `tmux.conf` 마지막 줄에서 TPM을 실행하므로, **TPM을 먼저 설치**해야 합니다.
> 순서를 바꾸면 tmux 시작 시 에러가 납니다.

1. TPM 설치

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

2. 설정 파일 적용

   ```bash
   cp tmux.conf ~/.tmux.conf
   cp .vimrc ~/.vimrc
   ```

3. tmux 플러그인 설치

   tmux 세션 안에서 `Ctrl-a` + `I` (대문자 i)를 누릅니다.

   또는 셸에서 직접 실행해도 됩니다 (스크립트/원격 환경에 유용):

   ```bash
   ~/.tmux/plugins/tpm/bin/install_plugins
   ```

4. vim 플러그인 설치

   ```bash
   # vim-plug 설치
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

   # 플러그인 설치
   vim +PlugInstall +qall
   ```

5. 설정 리로드

   tmux 안에서 `Ctrl-a` + `r`

## 클립보드

`set -g set-clipboard on`이 켜져 있어 **OSC 52** 방식으로 복사됩니다.
터미널이 이를 지원하면 SSH 원격 접속 중에도 로컬 클립보드로 복사됩니다.

| 환경 | 동작 |
|---|---|
| macOS (iTerm2, Terminal.app) | 지원 |
| Windows Terminal (WSL 포함) | 지원 |
| Linux (Alacritty, kitty, WezTerm, foot) | 지원 |
| Linux (구버전 gnome-terminal 등) | 미지원 — 터미널 자체 복사 기능 사용 |

> `tmux.conf`에는 마우스 드래그 시 `pbcopy`로 보내는 바인딩이 있습니다.
> 이는 **macOS 전용**이며, Linux/WSL에서는 해당 명령이 없어 조용히 실패합니다.
> Linux/WSL을 쓴다면 해당 두 줄(`MouseDragEnd1Pane` 바인딩)을 지우면
> 기본 동작으로 넘어가 OSC 52 복사가 정상 작동합니다.

## 자주 쓰는 단축키

prefix는 `Ctrl-a`입니다.

### 패널 / 윈도우

| 키 | 동작 |
|---|---|
| `Ctrl-a \|` | 좌우 분할 (세로선 생성) |
| `Ctrl-a -` | 상하 분할 (가로선 생성) |
| `Ctrl-a c` | 현재 경로에서 새 윈도우 |
| `Ctrl-a h/j/k/l` | 패널 이동 |
| `Ctrl-a H/J/K/L` | 패널 크기 조절 |
| `Ctrl-h/j/k/l` | 패널 이동 (prefix 없이, vim과 연동) |
| `Alt-Left` / `Alt-Right` | 이전 / 다음 윈도우 |
| `Alt-1` ~ `Alt-5` | 해당 번호 윈도우로 이동 |

### 세션 저장 / 복원

| 키 | 동작 |
|---|---|
| `Ctrl-a Ctrl-s` | 세션 저장 (resurrect) |
| `Ctrl-a Ctrl-r` | 세션 복원 (resurrect) |

자동 저장은 15분 간격으로 동작합니다.
자동 **복원**은 기본 꺼져 있습니다. 켜려면 `tmux.conf`에서:

```tmux
set -g @continuum-restore 'on'
```

### 플러그인 관리

| 키 | 동작 |
|---|---|
| `Ctrl-a I` | 플러그인 설치 |
| `Ctrl-a U` | 플러그인 업데이트 |
| `Ctrl-a Alt-u` | 미사용 플러그인 삭제 |

### 기타

| 키 | 동작 |
|---|---|
| `Ctrl-a r` | 설정 리로드 |
| `Ctrl-a [` | 복사 모드 진입 (`v` 선택, `y` 복사) |
