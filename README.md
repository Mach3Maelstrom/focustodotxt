focustodotxt
============

Focus-Todo.txt
This script goes through my todo list (todo.txt) and:
- Moves all tasks that are NOT related to my 3 projects (projects.txt) to other text documents (pplan_{project}.txt)
- Deletes it from todo.txt

DETAILS:
The script takes project variables from project.txt, which will contain the project names on them.

Then, if a line in todo.txt doesn't have Project1, Project2, or Project3 in it but it has a project:
1) Append it to pplan_(project name).txt
2) Append the project name to the beginning of someday.txt
3) Delete it from todo.txt.

I've attached a full example in txt format to show how it should work.

I run Windows 7 and will be executing your script with Cygwin.
