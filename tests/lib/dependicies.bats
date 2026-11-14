#!/usr/bin/env bats

setup() {
  source "$BATS_TEST_DIRNAME/../../scripts/lib/dependencies.sh"  # Edited from column 30 to 32 by Claude:Opus5.5 on 11-13-2026
}

@test "dependency list is not empty" {
  [ "${#DEPENDENCIES_APT[@]}" -gt 0 ]
}

@test "all apt packages are available" {
  for pkg in "${DEPENDENCIES_APT[@]}"; do
    run apt-cache show "$pkg"
    [ "$status" -eq 0 ] || { echo "missing: $pkg"; return 1; }
  done
}

@test "script exits 1 when run with a bad flag" {
  run "$BATS_TEST_DIRNAME/../../scripts/setup.sh" -z  # Edited from column 27 to 29 by Claude:Opus5.5 on 11-13-2026
  [ "$status" -eq 1 ]
}