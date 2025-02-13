# Do These First
```tasks
path includes Recurring
not done
due before tomorrow
```
# Open Tasks
```dataviewjs
// This section computes a value called 'urgency' for all tasks, even those without a due date.
// Tasks are then sorted by urgency. The most urgent task is displayed on its own to help me
// avoid feeling overwhelmed by all my open tasks. I can trust the algo to tell me what to do next.

const max_urgency = 365; // Dunno this just feels right, since most of units here are Days

// This parameter controls how quickly task without due dates trickle upwards in the list
// as they get older. Changes on the order of 0.01 make a significant difference.
const rate = 1.10;

// Fetch all my open tasks.
let open_tasks = dv.pages('"Projects"').file.tasks.where(t => !t.completed);

// Iterate through them to assign each an urgency value.
for (let task of open_tasks) {
	if (task.due) {
		// Tasks with due dates have an urgency based on how many days are left before due.
		task.urgency = max_urgency - task.due.diff(dv.date("today"), "days").days;
	} else {
		// Tasks without due dates are more complicated.
		if (task.created) {
			// As tasks get older, their urgency should approach, but never exceed, max_urgency.
			// The arctan function is useful for this. It asymptotically approaches pi/2.
			// Calculate how old the task is, find the inverse tangent, then normalize to max_urgency.
			// Finally, round down to the nearest integer. The maximum value is max_urgency - 1, so tasks
			// without due dates are never more urgent than tasks due today.
			task.urgency = Math.floor(rate * Math.atan(task.created.diff(dv.date("today"), "days").days * (-1)) * max_urgency * 2 / Math.PI);
		} else {
			// If there's no due date or creation date, just set urgency to zero.
			// All tasks should have a creation date, but maybe I forgot.
			task.urgency = 0;
		}
	}

	// It's best for me to do hard tasks first. All tasks with the #hard tag get a higher urgency.
	if (task.tags.contains("#hard")) {
		task.urgency = task.urgency + 1;
	}
}

// Show me the most urgent task all on its own, to help avoid executive paralysis.
dv.header(3, "DO THIS NEXT:")
dv.taskList(open_tasks.sort(t => -t.urgency).slice(0,1), false);
dv.header(3, "&nbsp") // Some vertical whitespace.
// Then show the rest.
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
# Active Task Overview
```dataview
TASK
WHERE !completed
SORT due
GROUP BY file.link
```
# Completed
Read on to feel accomplished.
```dataview
TASK
FROM !"Recurring"
WHERE completed
SORT completed
```