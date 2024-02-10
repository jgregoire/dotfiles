## Do These First
```tasks
path includes Recurring
not done
due before tomorrow
```
## Capture Inbox
```tasks
path includes Capture
```
## Next Actions
DO THE HARDEST THING FIRST
```dataview
TASK
WHERE !completed
WHERE contains(tags, "#hard") OR (due AND due <= date(today) + dur(7 days))
SORT due
```
## Delegated Tasks
```dataview
task
WHERE !completed
WHERE contains(tags, "#delegated")
SORT due
```
## Active Tasks
```dataview
TASK
WHERE !completed
```
## Someday
```tasks
path includes Someday
not done
```
## Completed
Read on to feel accomplished.
```tasks
done
```