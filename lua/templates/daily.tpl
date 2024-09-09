Today is {{Today}}.

Check [[Tasks]], [[Main Tasks]] and [[Monthly Tasks]], and [[Focus]] note.
See [[Quali]], and [[Organizing|Organizing]] for more

## Daily Reminders
{{&reminders}}

>[!todo]- Goal tasks for today
```tasks
not done
((due before tomorrow) AND (tags include #goal)) OR (tags include #today)
group by filename
sort by due
```
>[!todo] Medium tasks for today
```tasks
not done
tags include #medium
group by filename
sort by due
```
>[!todo] Hard tasks for today
```tasks
not done
tags include #hard
group by filename
sort by due
```

>[!todo]- Important tasks
>```tasks
not done
tags include #important
sort by due
>```

>[!todo]- Tasks due today or late
>```dataview
task
from !"Personal Tasks" and !"Readings" and !"Organizing Tasks"
where due and due <= date(tomorrow) and !completed
group by file.link
sort due
>```

>[!done]+ Tasks Completed Today
>```dataview
task
from ""
where completion = date(today)
>```

>[!todo]- Language Tasks
>- [ ] read 1 text per day
>- [ ] write 1 text per day
>- [ ] Hear podcasts
>- [ ] Listen to podcasts
>- [ ] Sutdy at least one short lingq lesson, or at least 3 pages of a longer lesson

>[!todo]- All undone tasks
>```tasks
not done
sort by due
>```
