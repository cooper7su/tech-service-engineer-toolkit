#!/usr/bin/env bash
set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAILURES=0

info() {
  printf '[info] %s\n' "$1"
}

pass() {
  printf '[pass] %s\n' "$1"
}

fail() {
  printf '[fail] %s\n' "$1"
  FAILURES=$((FAILURES + 1))
}

check_file() {
  if [ -f "${ROOT}/$1" ]; then
    pass "file exists: $1"
  else
    fail "missing file: $1"
  fi
}

check_dir() {
  if [ -d "${ROOT}/$1" ]; then
    pass "directory exists: $1"
  else
    fail "missing directory: $1"
  fi
}

check_executable() {
  if [ -x "${ROOT}/$1" ]; then
    pass "script executable: $1"
  else
    fail "script not executable: $1"
  fi
}

check_readme_reference() {
  file="$1"
  if [ ! -f "${ROOT}/README.md" ]; then
    fail "README.md missing; cannot verify reference to $file"
    return
  fi
  if grep -F "$file" "${ROOT}/README.md" >/dev/null 2>&1; then
    pass "README references: $file"
  else
    fail "README does not reference: $file"
  fi
}

info "Verifying repository structure at ${ROOT}"

for dir in research docs templates scripts examples skills meta; do
  check_dir "$dir"
done

for file in \
  README.md \
  README.zh-CN.md \
  LICENSE \
  .gitignore \
  ATTRIBUTION.md \
  research/related_projects.md \
  docs/network_basics.md \
  docs/linux_quick_reference.md \
  docs/troubleshooting_flow.md \
  docs/deployment_checklist.md \
  docs/security_basics.md \
  docs/service_engineer_interview_mapping.md \
  docs/toolkit_usage_guide.md \
  templates/incident_report_template.md \
  templates/field_support_checklist.md \
  templates/deployment_record_template.md \
  templates/issue_closure_template.md \
  scripts/system_health_check.sh \
  scripts/collect_logs.sh \
  scripts/network_basic_check.sh \
  scripts/verify_toolkit.sh \
  examples/sample_incident_filled.md \
  examples/sample_field_support_case.md \
  examples/sample_deployment_record.md \
  skills/tech_service_engineer_toolkit_skill.zh-CN.md \
  skills/tech_service_engineer_toolkit_skill.en.md \
  skills/troubleshooting_skill.zh-CN.md \
  skills/troubleshooting_skill.en.md \
  skills/interview_usage_skill.zh-CN.md \
  skills/interview_usage_skill.en.md \
  meta/github_about_zh.txt \
  meta/github_about_en.txt \
  meta/repo_summary_zh.txt \
  meta/repo_summary_en.txt; do
  check_file "$file"
done

for script in \
  scripts/system_health_check.sh \
  scripts/collect_logs.sh \
  scripts/network_basic_check.sh \
  scripts/verify_toolkit.sh; do
  check_executable "$script"
  if bash -n "${ROOT}/$script" >/dev/null 2>&1; then
    pass "bash syntax ok: $script"
  else
    fail "bash syntax failed: $script"
  fi
done

for ref in \
  docs/troubleshooting_flow.md \
  docs/toolkit_usage_guide.md \
  scripts/collect_logs.sh \
  templates/incident_report_template.md \
  skills/tech_service_engineer_toolkit_skill.en.md \
  ATTRIBUTION.md; do
  check_readme_reference "$ref"
done

if [ "$FAILURES" -eq 0 ]; then
  printf '\nToolkit verification passed.\n'
  exit 0
fi

printf '\nToolkit verification failed with %s issue(s).\n' "$FAILURES"
exit 1
