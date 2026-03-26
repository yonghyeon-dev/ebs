#!/usr/bin/env bash
# test-resolve-team.sh — resolve-team.sh 검증 스크립트
# 5가지 검증: (a) 이름 기반 감지, (b) PID 파일 무시, (c) 환경변수 우선, (d) 최신 mtime 선택, (e) 빈 파일 solo

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

source .flowset/scripts/resolve-team.sh

PASS=0
FAIL=0
TOTAL=5

# 테스트용 임시 디렉토리 설정
TEST_TEAMS_DIR=".flowset/teams"
BACKUP_DIR="/tmp/test-resolve-team-backup-$$"

# 기존 .team 파일 백업
mkdir -p "$BACKUP_DIR"
cp "$TEST_TEAMS_DIR"/*.team "$BACKUP_DIR/" 2>/dev/null || true

cleanup() {
  # 테스트용 파일 제거, 백업 복원
  rm -f "$TEST_TEAMS_DIR"/99999.team "$TEST_TEAMS_DIR"/testteam.team "$TEST_TEAMS_DIR"/fileteam.team "$TEST_TEAMS_DIR"/older.team "$TEST_TEAMS_DIR"/newer.team "$TEST_TEAMS_DIR"/empty.team 2>/dev/null
  cp "$BACKUP_DIR"/*.team "$TEST_TEAMS_DIR/" 2>/dev/null || true
  rm -rf "$BACKUP_DIR"
}
trap cleanup EXIT

# --- Test (a): 이름 기반 .team 파일 감지 ---
echo "=== Test (a): 이름 기반 .team 파일 감지 ==="
unset TEAM_NAME
# 기존 파일 일시 제거 (간섭 방지)
rm -f "$TEST_TEAMS_DIR"/*.team 2>/dev/null || true
echo "testteam" > "$TEST_TEAMS_DIR/testteam.team"
RESOLVED_TEAM_NAME=""
resolve_team_name ""
if [[ "$RESOLVED_TEAM_NAME" == "testteam" ]]; then
  echo "PASS: resolved '$RESOLVED_TEAM_NAME'"
  ((PASS++))
else
  echo "FAIL: expected 'testteam', got '$RESOLVED_TEAM_NAME'"
  ((FAIL++))
fi

# --- Test (b): PID 파일(숫자만) 무시 ---
echo ""
echo "=== Test (b): PID 파일(숫자만) 무시 ==="
unset TEAM_NAME
rm -f "$TEST_TEAMS_DIR"/*.team 2>/dev/null || true
echo "zombie" > "$TEST_TEAMS_DIR/99999.team"
RESOLVED_TEAM_NAME=""
resolve_team_name ""
if [[ -z "$RESOLVED_TEAM_NAME" ]]; then
  echo "PASS: PID file ignored, resolved empty (solo mode)"
  ((PASS++))
else
  echo "FAIL: expected empty, got '$RESOLVED_TEAM_NAME'"
  ((FAIL++))
fi

# --- Test (c): TEAM_NAME 환경변수 우선 적용 ---
echo ""
echo "=== Test (c): TEAM_NAME 환경변수 우선 적용 ==="
rm -f "$TEST_TEAMS_DIR"/*.team 2>/dev/null || true
echo "fileteam" > "$TEST_TEAMS_DIR/fileteam.team"
export TEAM_NAME="envteam"
RESOLVED_TEAM_NAME=""
resolve_team_name ""
unset TEAM_NAME
if [[ "$RESOLVED_TEAM_NAME" == "envteam" ]]; then
  echo "PASS: env var took priority, resolved '$RESOLVED_TEAM_NAME'"
  ((PASS++))
else
  echo "FAIL: expected 'envteam', got '$RESOLVED_TEAM_NAME'"
  ((FAIL++))
fi

# --- Test (d): 복수 .team 파일 — 최신 mtime 선택 ---
echo ""
echo "=== Test (d): 복수 .team 파일 — 최신 mtime 선택 ==="
unset TEAM_NAME
rm -f "$TEST_TEAMS_DIR"/*.team 2>/dev/null || true
echo "older" > "$TEST_TEAMS_DIR/older.team"
sleep 1
echo "newer" > "$TEST_TEAMS_DIR/newer.team"
RESOLVED_TEAM_NAME=""
resolve_team_name ""
if [[ "$RESOLVED_TEAM_NAME" == "newer" ]]; then
  echo "PASS: latest mtime selected, resolved '$RESOLVED_TEAM_NAME'"
  ((PASS++))
else
  echo "FAIL: expected 'newer', got '$RESOLVED_TEAM_NAME'"
  ((FAIL++))
fi

# --- Test (e): 빈 .team 파일만 존재 — solo 모드 ---
echo ""
echo "=== Test (e): 빈 .team 파일만 존재 — solo 모드 ==="
unset TEAM_NAME
rm -f "$TEST_TEAMS_DIR"/*.team 2>/dev/null || true
touch "$TEST_TEAMS_DIR/empty.team"
RESOLVED_TEAM_NAME=""
resolve_team_name ""
if [[ -z "$RESOLVED_TEAM_NAME" ]]; then
  echo "PASS: empty file ignored, resolved empty (solo mode)"
  ((PASS++))
else
  echo "FAIL: expected empty, got '$RESOLVED_TEAM_NAME'"
  ((FAIL++))
fi

# --- 결과 ---
echo ""
echo "================================"
echo "Results: $PASS/$TOTAL PASS, $FAIL/$TOTAL FAIL"
if [[ $FAIL -eq 0 ]]; then
  echo "ALL TESTS PASSED"
  exit 0
else
  echo "SOME TESTS FAILED"
  exit 1
fi
