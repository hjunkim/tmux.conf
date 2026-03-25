# Engineering tmux.conf

이 저장소는 엔지니어들이 실무에서 자주 쓰는 설정을 담은 `tmux.conf`를 제공합니다.

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

## 설치 방법

1. 설정 파일 적용
   ```bash
   cp tmux.conf ~/.tmux.conf
   ```

2. TPM 설치
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

3. tmux 재시작 후 prefix + `I`로 플러그인 설치
   - 이 저장소 설정 기준 prefix는 `Ctrl-a`입니다.

4. 설정 리로드
   - tmux 안에서 `prefix + r`

## 자주 쓰는 단축키

- `Ctrl-a |` : 수평 분할
- `Ctrl-a -` : 수직 분할
- `Ctrl-a h/j/k/l` : 패널 이동
- `Ctrl-a H/J/K/L` : 패널 크기 조절
- `Alt-Left / Alt-Right` : 이전/다음 윈도우
- `Ctrl-a r` : 설정 리로드
