# Do These First
```tasks
path includes Recurring
not done
due before tomorrow
```
# Open Tasks
```dataviewjs
const max_urgency = 365;
const rate = 1.1;

let open_tasks = dv.pages('"Projects"').file.tasks.where(t => !t.completed);

for (let task of open_tasks) {
	if (task.due) {
		task.urgency = max_urgency - task.due.diff(dv.date("today"), "days").days;
	} else {
		if (task.created) {
			task.urgency = rate * Math.atan(task.created.diff(dv.date("today"), "days").days * (-1)) * max_urgency * 2 / Math.PI;
		} else {
			task.urgency = 0;
		}
	}

	if (task.tags.contains("#hard")) {
		task.urgency = task.urgency + 1;
	}
}
dv.header(3, "DO THIS NEXT:")
dv.taskList(open_tasks.sort(t => -t.urgency).slice(0,1), false);

dv.header(3, "And then:")
dv.taskList(open_tasks.sort(t => -t.urgency).slice(1), false);
```
# Delegated Tasks
```dataview
task
WHERE !completed
WHERE contains(tags, "#delegated")
SORT due
```
# Completed
Read on to feel accomplished.
```dataview
TASK
FROM !"Recurring"
WHERE completed
SORT completed
```