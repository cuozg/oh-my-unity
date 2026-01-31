# Deep Investigation Patterns

Systematic approaches for analyzing PR impact on the codebase.

## Table of Contents

1. [Method Signature Changes](#method-signature-changes)
2. [Interface & Abstract Changes](#interface--abstract-changes)
3. [Event System Changes](#event-system-changes)
4. [Data Structure Changes](#data-structure-changes)
5. [State Machine Changes](#state-machine-changes)
6. [Dependency Injection Changes](#dependency-injection-changes)

---

## Method Signature Changes

When a public/protected method signature changes:

### Investigation Steps

```bash
# 1. Find all callers using LSP
lsp_find_references <file> <line> <char>

# 2. Fallback: grep for method name
grep -rn "MethodName\s*(" Assets/Scripts/ --include="*.cs"

# 3. Check for reflection usage
grep -rn "\"MethodName\"" Assets/Scripts/ --include="*.cs"
grep -rn "nameof(.*MethodName)" Assets/Scripts/ --include="*.cs"
```

### What to Check at Each Call Site

- [ ] Parameter count matches
- [ ] Parameter types are compatible
- [ ] Return type is handled correctly
- [ ] Optional parameters have defaults

### Report Template

```markdown
🔴 **Critical**: `ClassName.MethodName` signature changed.

**Before**: `void MethodName(int x, int y)`
**After**: `void MethodName(Vector3 position)`

**Callers requiring update** (N found):
| File | Line | Current Call | Fix Required |
|:-----|:-----|:-------------|:-------------|
| Foo.cs | 42 | `MethodName(1, 2)` | Convert to Vector3 |
```

---

## Interface & Abstract Changes

When interface methods or abstract members change:

### Investigation Steps

```bash
# 1. Find all implementations
grep -rn "class.*:.*IInterfaceName" Assets/Scripts/ --include="*.cs"
grep -rn ": IInterfaceName" Assets/Scripts/ --include="*.cs"

# 2. Find all usages of interface type
grep -rn "IInterfaceName" Assets/Scripts/ --include="*.cs"
```

### What to Check

- [ ] All implementations updated
- [ ] Explicit interface implementations
- [ ] Generic constraints using the interface
- [ ] Factory methods returning the interface

### Report Template

```markdown
🔴 **Critical**: `IRewardHandler.ProcessReward` signature changed.

**Implementations requiring update** (N found):
- `DailyRewardHandler.cs` - implements IRewardHandler
- `QuestRewardHandler.cs` - implements IRewardHandler
- `AchievementRewardHandler.cs` - implements IRewardHandler

**Usage sites** (M found):
- `RewardService.cs:34` - calls via interface
```

---

## Event System Changes

When event signatures or firing conditions change:

### Investigation Steps

```bash
# 1. Find all subscribers
grep -rn "EventName\s*+=" Assets/Scripts/ --include="*.cs"
grep -rn "EventName\s*-=" Assets/Scripts/ --include="*.cs"

# 2. Find all invocations
grep -rn "EventName\s*\?\s*\.Invoke" Assets/Scripts/ --include="*.cs"
grep -rn "EventName\s*\(" Assets/Scripts/ --include="*.cs"
```

### What to Check

- [ ] All subscribers handle new signature
- [ ] Event timing expectations still valid
- [ ] Null checks on both sides
- [ ] Unsubscribe patterns still work

### Report Template

```markdown
🔴 **Critical**: `OnMatchComplete` event signature changed.

**Before**: `Action<int score>`
**After**: `Action<MatchResult result>`

**Subscribers requiring update**:
| File | Line | Current Handler | Breaking |
|:-----|:-----|:----------------|:---------|
| UI/ScoreDisplay.cs | 89 | `OnScore(int s)` | YES |
| Analytics.cs | 45 | `TrackMatch(int s)` | YES |
```

---

## Data Structure Changes

When classes, structs, or ScriptableObjects change:

### Investigation Steps

```bash
# 1. Find all usages of the type
grep -rn "TypeName" Assets/Scripts/ --include="*.cs"

# 2. Find serialized references (ScriptableObjects)
grep -rn "TypeName" Assets/ --include="*.asset"
grep -rn "TypeName" Assets/ --include="*.prefab"

# 3. Find JSON/binary serialization
grep -rn "JsonUtility.*TypeName" Assets/Scripts/ --include="*.cs"
```

### What to Check

- [ ] Field renames break serialization
- [ ] Removed fields lose data
- [ ] Type changes break deserialization
- [ ] Default values for new fields

### Report Template

```markdown
🟡 **Major**: `PlayerData` struct changed.

**Field changes**:
- `score` (int) → REMOVED - existing saves will lose data
- `level` (int) → `playerLevel` (int) - serialization name mismatch
- NEW: `experience` (long) - needs default value

**Affected assets**: 
- `Assets/Data/DefaultPlayer.asset`
- `Assets/Resources/PlayerTemplate.asset`
```

---

## State Machine Changes

When state transitions or conditions change:

### Investigation Steps

```bash
# 1. Find state references
grep -rn "StateEnum\." Assets/Scripts/ --include="*.cs"

# 2. Find transition triggers
grep -rn "ChangeState\|SetState\|TransitionTo" Assets/Scripts/ --include="*.cs"
```

### What to Check

- [ ] All state transitions still valid
- [ ] Entry/exit callbacks still called
- [ ] Animation triggers match states
- [ ] UI state bindings updated

### Report Template

```markdown
🟡 **Major**: Game state `Playing` split into `PlayingNormal` and `PlayingBoss`.

**Callers checking for `Playing`**:
| File | Line | Check | Action |
|:-----|:-----|:------|:-------|
| GameUI.cs | 56 | `state == Playing` | Update to check both |
| InputHandler.cs | 23 | `state == Playing` | Update to check both |
```

---

## Dependency Injection Changes

When constructor parameters or service registrations change:

### Investigation Steps

```bash
# 1. Find all instantiation sites
grep -rn "new ClassName(" Assets/Scripts/ --include="*.cs"

# 2. Find DI registrations
grep -rn "Register.*ClassName\|Bind.*ClassName" Assets/Scripts/ --include="*.cs"

# 3. Find [Inject] usages
grep -rn "\[Inject\]" Assets/Scripts/ --include="*.cs" -A2 | grep "ClassName"
```

### What to Check

- [ ] All `new` calls updated
- [ ] DI container registration updated
- [ ] Factory methods updated
- [ ] Test mocks updated

---

## General Investigation Checklist

For ANY significant change:

```
□ Find all direct references (LSP/grep)
□ Find all indirect references (interfaces, base classes)
□ Find all reflection usage (strings, nameof)
□ Find all serialized references (assets, prefabs)
□ Check test files for broken tests
□ Check for breaking changes in public API
□ Verify null safety at boundaries
□ Confirm event/callback contracts
```
