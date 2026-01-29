---
name: flatbuffers-coder
description: "FlatBuffers for Unity data tables. Use when: creating/updating .fbs schemas, generating C# classes, converting JSON to binary, or managing the FlatBuffers pipeline."
---

# FlatBuffers for Unity

Manage data schemas, code generation, and binary conversion.

## File Locations

| Type | Location |
|:-----|:---------|
| Schemas (.fbs) | `FlatBuffers/New_Fbs/` |
| Generated C# | `FlatBuffers/Gen_Cs/` → `Assets/Scripts/Game/Managers/FlatBuffers/` |
| Input JSON | `FlatBuffers/Input_Json/` |
| Output Binary | `FlatBuffers/Output_Bin/` → `Assets/StreamingAssets/Blueprints/` |

## Schema Pattern

```flatbuffers
// FlatBuffers/New_Fbs/ItemData.fbs
table ItemFlatBuffer {
  items:[ItemFlatBufferDataRaw];
}

table ItemFlatBufferDataRaw {
  ID:string (key);      // Always use key for lookups
  Name:string;
  Rarity:int = 0;       // Defaults save binary space
  Stackable:bool = false;
}

root_type ItemFlatBuffer;
```

## Workflow

```bash
# Generate C# classes
bash FlatBuffers/generate_cs.sh

# Convert JSON to binary
bash FlatBuffers/generate_data.sh

# Or run full pipeline (generate + copy to Unity)
python3 FlatBuffers/generateAll.py
```

## Principles

- **Unique Keys**: Always `ID:string (key);` for lookup tables
- **Defaults**: Provide defaults to save binary space
- **Document Fields**: Comment valid ranges and purposes in .fbs
- **Safe Generation**: Ensure Unity Editor isn't locking files before running
- **Validate**: Verify C# compiles after generation
