Write a commit message for the currently staged changes to .git/CLAUDE_COMMIT_MSG.

1. Run `git diff --staged` and `git status --short` to see exactly what is
   staged right now. Do not rely on memory of what was done earlier in the
   conversation — the user controls staging and may have staged a subset, or
   staged something you did not touch.
2. If nothing is staged, say so and stop.
3. Draft a concise commit message (1-2 sentence summary, focused on why
   rather than what) following this repo's existing commit style --
   check `git log --oneline -10` for tone and conventions.
4. Write the message to .git/CLAUDE_COMMIT_MSG (create the file; overwrite if
   present). Do not run `git commit` yourself -- the user commits.
5. Tell the user the message is ready and remind them to run:
   `git commit -t .git/CLAUDE_COMMIT_MSG`
