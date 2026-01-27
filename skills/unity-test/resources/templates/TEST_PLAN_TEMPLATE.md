# Test Plan: [Feature/System Name]

## 1. Overview
Summary of the feature being tested and the scope of the test suite.

## 2. Test Cases
| ID | Title | Scenario | Expected Result | Type |
|:---|:---|:---|:---|:---|
| TC-01 | Basic damage | Apply damage to NPC | Health decreases by exact amount | Unit (Edit) |
| TC-02 | Jump height | Trigger jump action | Z-position reaches target height | Play Mode |

## 3. Setup Requirements
- Prefabs required: `[PrefabName]`
- Scene context: `[Empty Scene / Test Scene]`
- Mocked dependencies: `[InterfaceName]`

## 4. Automation Strategy
- [ ] Edit Mode Tests
- [ ] Play Mode Tests
- [ ] CI Integration

## 5. Success Criteria
- [ ] 100% pass rate for current suite.
- [ ] Minimum 80% code coverage for target modules.
- [ ] No performance regression (FPS > 30 during Play Mode tests).
