# Global Developer Standards

## Who I Am
I'm a senior software engineer. I value clean, straightforward, easy-to-scale architecture.
Code readability is paramount. Naming matters deeply — variables, functions, and types should
be descriptive and self-documenting. When two names are equally clear, the shorter one wins.

---

## My Workflow Philosophy

- **Explore before implementing** — read relevant files before writing code
- **Plan before coding** on anything non-trivial; share the plan briefly first
- **Ask clarifying questions** before making architectural decisions or large refactors
- **Prefer targeted edits** over full rewrites unless the full rewrite is clearly better
- When something is ambiguous, state your assumption and proceed rather than halting
- For non trivial tasks, Always ask multichoice questions to get a better understand for what you need todo
---

## Workflow Orchestration

### 1. Plan Mode Default
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately — don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity
- **Plan first**: write plan to `tasks/todo.md` with checkable items, verify before implementing
- Track progress by marking items complete as you go
- Add a review section to `tasks/todo.md` when done
- Capture lessons in `tasks/lessons.md` after any correction

### 2. Subagent Strategy
- Use subagents liberally to keep the main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One track per subagent for focused execution

### 3. Self-Improvement Loop
- After ANY correction from the user: update `tasks/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake recurring
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant context

### 4. Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- Skip this for simple, obvious fixes — don't over-engineer
- Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests — then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

---

## Code Quality Principles

- Readability over cleverness — future me is the reader
- Prefer composition and small, focused functions
- Type hints / types on all function signatures
- Explicit error handling — no silent failures or swallowed exceptions
- Leave code cleaner than you found it (Boy Scout rule), but don't gold-plate
- **Simplicity first**: make every change as simple as possible, minimal blast radius
- **No laziness**: find root causes, no temporary fixes, senior developer standard
- **Minimal impact**: changes should only touch what's necessary — avoid introducing unrelated noise

---

## Naming Conventions

Good naming is non-negotiable. Code is read far more than it's written.

- Names should reveal intent — a reader should know what something does without reading its implementation
- Avoid abbreviations unless they are universally understood in the domain (e.g. `ctx`, `err`, `id`)
- Boolean names should read as questions: `isReady`, `hasAccess`, `canRetry`
- Functions should be named for what they do, not how: `getUserByID` not `queryDBForUser`
- When two names communicate equally well, the shorter one wins
- Never use single-letter variables outside of short loop indices or math contexts

---

## Go Standards

### Idioms & Style
- Follow standard Go conventions: `gofmt`, `golint`, `go vet` — no exceptions
- Prefer the standard library. Reach for third-party packages only when there's a clear, justified need
- Use `context.Context` as the first argument in any function that does I/O or could be cancelled
- Errors are values — handle them explicitly at each call site, don't let them bubble silently
- Wrap errors with `fmt.Errorf("doing X: %w", err)` to preserve the chain; never discard `err`
- Prefer `errors.Is` / `errors.As` over string matching on error messages

### Structure
- Keep packages small and focused — a package should have one clear responsibility
- Avoid `init()` unless absolutely necessary; prefer explicit initialization
- Interfaces belong in the package that *uses* them, not the one that implements them
- Struct fields: exported fields first, unexported below, grouped logically
- Constructor functions (`NewFoo`) should return the concrete type unless the interface is part of the public API contract

### Concurrency
- Don't start goroutines without a clear ownership and shutdown strategy
- Use `sync.WaitGroup`, `errgroup`, or channels — be explicit about who waits for whom
- Prefer `errgroup.WithContext` for parallel work that needs coordinated cancellation
- Document shared state and protect it with the appropriate primitive (`sync.Mutex`, channels, atomics)

### Testing
- Table-driven tests are the default pattern
- Use `t.Helper()` in test utilities so failures point to the call site
- Prefer `testify/require` for fatal assertions, `testify/assert` for non-fatal
- Test file naming: `foo_test.go` co-located with `foo.go`
- Test package: use `package foo_test` (black-box) unless you need access to unexported internals

### Common Pitfalls to Avoid
- Never ignore errors, even in `defer` calls — log or handle them
- Don't use `interface{}` / `any` where a concrete type or generic will do
- Avoid naked `return` in functions longer than a few lines
- Don't shadow `err` across blocks — rename the inner one meaningfully

---

## Communication Style

- Be concise. I'm a senior developer — skip the lecture unless I ask
- When explaining a change, one sentence of *why* is enough
- Flag trade-offs and risks briefly, then make a recommendation
- Don't repeat back what I just said to you
- Never add hollow affirmations like "Great question!" or "Certainly!"
- High-level summary of changes at each significant step — not a line-by-line narration

---

## Git Conventions

- Commit messages: imperative mood, max 72 chars (`Fix auth bug` not `Fixed auth bug`)
- Never commit secrets, API keys, `.env` files, or credentials under any framing
- Atomic commits — one logical change per commit

---

## Testing

- Write tests for new logic; prefer co-located test files
- Run the relevant test subset, not the full suite, unless asked
- Tests should be readable as documentation

---

## Security Defaults

- Never log sensitive data (passwords, tokens, PII)
- Validate and sanitize user inputs
- Flag when a pattern introduces a security risk, even if not asked

---

## When You're Uncertain

- Say so. "I'm not sure, but my best guess is X" beats confident hallucination
- If you'd need to see more files to be sure, ask for them
