Today is {{Today}}.

Check [[vtasks]], [[Main Tasks]], and [[Focus]] note.
See [[Quali]], and [[Organizing|Organizing]] for more

## Daily Reminders
{{&reminders}}

## Due Tasks
{{jq: '[ .[] | select(.status!="done" and .due!=null ) ] | sort_by(.due)' }}



## Goal tasks for today
{{jq: '[ .[] | select(.status!="done" and (.tags | index("#goal") or index("#today") ) ) ] | sort_by(.due)' }}




## Important tasks
{{jq: '[ .[] | select(.status!="done" and .tags | index("#important") ) ] | sort_by(.due)' }}



## Tasks due today or late
{{jq: --arg today "$(date +%Y-%m-%d)" '[ .[] | select(.status!="done" and .due!=null and .due <= $today ) ] | sort_by(.due)' }}




## Tasks Completed Today
{{jq: --arg today "$(date +%Y-%m-%d)" '[ .[] | select(.status=="done" and .due==$today) ] | sort_by(.due)' }}



## Language Tasks
- [ ] read 1 text per day
- [ ] write 1 text per day
- [ ] Hear podcasts
- [ ] Listen to podcasts
- [ ] Sutdy at least one short lingq lesson, or at least 3 pages of a longer lesson


