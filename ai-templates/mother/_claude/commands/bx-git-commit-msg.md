Write a commit message for the currently staged changes of one repo to its .git/CLAUDE_COMMIT_MSG.

The repo is $ARGUMENTS --- a repo name (e.g. =banna=, resolved among the repos this
session worked in or as a sibling of the current repo) or a path. With no argument, it is
the repo of the current directory. A leading "at" (=/bx-git-commit-msg at banna=) is allowed.

1. Run `git diff --staged` and `git status --short` in that repo to see exactly what is
   staged right now. Do not rely on memory of what was done earlier in the
   conversation — the user controls staging and may have staged a subset, or
   staged something you did not touch.
2. If nothing is staged, say so and stop. Show what is unstaged, so the user can stage it.
3. Draft a concise commit message (1-2 sentence summary, focused on why
   rather than what) following this repo's existing commit style --
   check `git log --oneline -10` for tone and conventions.
   If the staged work depends on an uncommitted or more recent commit in another repo
   (one module importing another's new file), say so in the message.
4. Write the message to that repo's .git/CLAUDE_COMMIT_MSG (create the file; overwrite if
   present). Do not run `git commit` yourself -- the user commits.
5. Tell the user the message is ready and remind them to run, in that repo:
   `git commit -t .git/CLAUDE_COMMIT_MSG`
