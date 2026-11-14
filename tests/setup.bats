#!/usr/bin/env bats
# AI-GENERATED START by Claude:Opus5.5 on 11-13-2026

# setup.sh cd's into its parent directory and sources ./scripts/check_deps.sh.
# To test that without installing anything, copy the real setup.sh into a
# throwaway project tree next to a stub check_deps.sh that only prints a marker.
setup() {
  FAKE_ROOT="$BATS_TEST_TMPDIR/project"
  mkdir -p "$FAKE_ROOT/scripts"
  cp "$BATS_TEST_DIRNAME/../scripts/setup.sh" "$FAKE_ROOT/scripts/setup.sh"
  cat > "$FAKE_ROOT/scripts/check_deps.sh" <<'EOF'
echo "check_deps sourced from $PWD"
EOF
}

@test "-h prints usage and exits 0" {
  run bash "$FAKE_ROOT/scripts/setup.sh" -h
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage:"* ]]
}

@test "-h does not run check_deps.sh" {
  run bash "$FAKE_ROOT/scripts/setup.sh" -h
  [[ "$output" != *"check_deps sourced"* ]]
}

@test "bad flag exits 1" {
  run bash "$FAKE_ROOT/scripts/setup.sh" -z
  [ "$status" -eq 1 ]
}

@test "no flags runs check_deps.sh" {
  run bash "$FAKE_ROOT/scripts/setup.sh"
  [ "$status" -eq 0 ]
  [[ "$output" == *"check_deps sourced"* ]]
}

@test "-d skips check_deps.sh" {
  run bash "$FAKE_ROOT/scripts/setup.sh" -d
  [ "$status" -eq 0 ]
  [[ "$output" != *"check_deps sourced"* ]]
}

@test "check_deps.sh runs from the project root" {
  run bash "$FAKE_ROOT/scripts/setup.sh"
  [ "$output" = "check_deps sourced from $FAKE_ROOT" ]
}

@test "works when called with a relative path from another directory" {
  cd "$FAKE_ROOT/scripts"
  run ./setup.sh
  [ "$status" -eq 0 ]
  [ "$output" = "check_deps sourced from $FAKE_ROOT" ]
}

@test "extra non-option arguments are ignored" {
  run bash "$FAKE_ROOT/scripts/setup.sh" -d extra args
  [ "$status" -eq 0 ]
}

# AI-GENERATED END
