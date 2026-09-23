Orient around wherever you've just been navigated to, instead of the session's
original working directory. Companion to =/bx-confirm0=: same report shape, different
source for the target path.

1. Determine the target path, in this order:
   - If $ARGUMENTS is given, use it.
   - Else, use the most recent =<ide_opened_file>= or =<ide_selection>= location in
     this conversation.
   - Else, fall back to the current working directory (i.e. behave like
     =/bx-confirm0=).

2. Resolve the target directory: if the target path is a file, take its containing
   directory. If that directory has no =CLAUDE.md=, walk upward until one is found.
   If none is found anywhere above it, stop and report that no aiActivity project
   covers that path.

3. Read the full import chain rooted at that =CLAUDE.md=, following its =@= imports.
   If it is a slim =initiateSub= =CLAUDE.md= (imports only =AI-Activity.org=,
   =AI-DevStatus.org=, =AI-WorkPlan.org=), also walk further upward from there for the
   ancestor =CLAUDE.md= that supplies the invariants (=AI-WORKFLOW.org=, =.claude/=),
   the same way Claude Code's own walk-up would.

4. Report, in the same shape as =/bx-confirm0=:
   - The resolved project directory (skip this line if it's just the cwd, i.e. the
     fallback case).
   - Every file imported, in order, noting which were symlinks and where they pointed.
   - A succinct (3-5 sentence) summary of what you have understood about *this*
     project.

5. If this project differs from whatever was the active context before this command,
   note explicitly that it is now the active context for the rest of the
   conversation — subsequent work refers to it unless told otherwise — and name the
   directory that was active before this switch, so switching back is just
   =/bx-confirm-here= run from that context (open a file there, or pass its path as
   =$ARGUMENTS=).

Do not re-read or re-summarize the previously active project's files; only note where
it was.
