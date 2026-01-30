# Debug Report: {ERROR_NAME}

**Date:** {YYYY-MM-DD}  
**Reported By:** {User/Automated}  
**Severity:** {Critical/High/Medium/Low}  
**Status:** {Investigating/Root Cause Found/Fixed/Verified}

---

## 1. Error Summary

| Field | Value |
|-------|-------|
| **Error Type** | {e.g., NullReferenceException} |
| **File** | {e.g., Assets/Scripts/Player/PlayerController.cs} |
| **Line** | {e.g., 42} |
| **Method** | {e.g., UpdateHealth()} |
| **Frequency** | {Every frame / On button click / Random / Once} |
| **First Seen** | {Date/Version} |
| **Reproduction Steps** | {Step 1, Step 2, ...} |

---

## 2. Stack Trace

```
{Full stack trace here}
```

**Key Frames:**
1. `{TopMethod}` at `{File}:{Line}` ← **Immediate trigger**
2. `{CallerMethod}` at `{File}:{Line}`
3. `{RootCaller}` at `{File}:{Line}` ← **Entry point**

---

## 3. Investigation Findings

### 3.1 Code Context

```csharp
// {File}:{StartLine}-{EndLine}
{Relevant code snippet with error line highlighted}
```

### 3.2 Data Flow Analysis

```
{Source} → {Intermediate steps} → {Crash point}
```

**Variable states at crash:**
- `{var1}` = {value/null}
- `{var2}` = {value/null}

### 3.3 Lifecycle Analysis

| Event | Order | State |
|-------|-------|-------|
| Awake | 1 | {What's initialized} |
| OnEnable | 2 | {What's ready} |
| Start | 3 | {Expected state} |

### 3.4 Side Effects Identified

- [ ] Static state accessed: {Yes/No - details}
- [ ] Singleton dependencies: {Yes/No - details}
- [ ] Event subscriptions: {Yes/No - details}
- [ ] Async operations: {Yes/No - details}

---

## 4. Debug.Log Additions

### Files Modified

| File | Lines | Purpose |
|------|-------|---------|
| {File1} | {Line range} | {What logs capture} |
| {File2} | {Line range} | {What logs capture} |

### Log Statements Added

```csharp
// {File1}:{Line}
Debug.Log($"[DEBUG] {Description of what this captures}");

// {File2}:{Line}  
Debug.Log($"[DEBUG] {Description of what this captures}");
```

### Expected Log Output

```
[DEBUG] {Expected output when error occurs}
[DEBUG] {Shows null/invalid state}
```

---

## 5. Root Cause Analysis

### 5.1 Immediate Cause
> {What null/invalid value triggered the exception}

### 5.2 Proximate Cause
> {Why that value was null/invalid at that moment}

### 5.3 Root Cause
> {The underlying design/logic flaw that allowed this state}

### 5.4 Contributing Factors
- {Timing issue}
- {Missing validation}
- {Race condition}
- {etc.}

---

## 6. Solutions

### 6.1 Quick Fix (Prevent Crash)

```csharp
// {File}:{Line}
// BEFORE:
{Original code}

// AFTER:
{Code with guard clause/null check}
```

**Trade-offs:** {What this doesn't fix, potential side effects}

### 6.2 Proper Fix (Address Root Cause)

```csharp
// {File}:{Line}
// BEFORE:
{Original code}

// AFTER:
{Properly architected solution}
```

**Why this is better:** {Explanation}

### 6.3 Preventive Measures

- [ ] Add unit test for this scenario
- [ ] Add runtime assertion in debug builds
- [ ] Document initialization requirements
- [ ] Consider refactoring to {pattern}

---

## 7. Verification

### 7.1 Test Cases

| Test | Expected Result | Actual Result |
|------|-----------------|---------------|
| {Original repro steps} | No error | {Pending/Pass/Fail} |
| {Edge case 1} | Graceful handling | {Pending/Pass/Fail} |
| {Edge case 2} | Graceful handling | {Pending/Pass/Fail} |

### 7.2 Regression Check

- [ ] Existing functionality preserved
- [ ] No new console errors
- [ ] Performance not degraded

---

## 8. References

### Related Files
- `{File1}` - {Brief description}
- `{File2}` - {Brief description}

### Related Issues
- {Link to related bugs/tickets}

### Documentation
- {Links to relevant Unity docs, project docs}

---

## 9. Follow-up Actions

- [ ] Remove debug logs after verification
- [ ] Update related documentation
- [ ] Create ticket for proper fix (if quick fix applied)
- [ ] Review similar code for same pattern
