#!/usr/bin/env bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
USED=$(echo "$input" | jq -r '.context_window.current_usage | ((.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0))')
SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')

# Format a token count as 950, 84k, or 1.0M
fmt_tokens() {
  if [ "$1" -lt 1000 ]; then echo "$1"
  elif [ "$1" -lt 1000000 ]; then echo "$(($1 / 1000))k"
  else awk -v n="$1" 'BEGIN { printf "%.1fM", n / 1000000 }'; fi
}

CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'

# Pick bar color based on context usage
if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR=""; fi

FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
printf -v FILL "%${FILLED}s"; printf -v PAD "%${EMPTY}s"
BAR="${FILL// /█}${PAD// /░}"

COST_FMT=$(printf '$%.2f' "$COST")
TOKENS_FMT="$(fmt_tokens "$USED")/$(fmt_tokens "$SIZE")"
echo -e "${CYAN}[$MODEL]${RESET} ${BAR_COLOR}${BAR}${RESET} ${PCT}% ${BAR_COLOR}${TOKENS_FMT}${RESET} | ${YELLOW}${COST_FMT}${RESET}"
