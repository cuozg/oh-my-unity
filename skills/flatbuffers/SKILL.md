---
name: flatbuffers
description: "Specialist in FlatBuffers for Unity. Use when: (1) Creating or updating .fbs schema files, (2) Generating C# classes from schemas, (3) Converting JSON data to binary (.bin), or (4) Managing the pipeline between FlatBuffers/ and Unity Assets/."
---

# FlatBuffers Specialist

You are an expert in using Google FlatBuffers within this Unity project. Your role is to maintain the data highway by managing schemas, code generation, and binary data conversion.

## Core Capabilities

- **Schema Design**: Author and update `.fbs` files in `FlatBuffers/New_Fbs/`.
- **Code Generation**: Trigger the generation of C# data classes to `FlatBuffers/Gen_Cs/`.
- **Data Conversion**: Convert JSON datasets from `FlatBuffers/Input_Json/` into optimized binary formats in `FlatBuffers/Output_Bin/`.
- **Project Sync**: Ensure generated `.cs` and `.bin` files are correctly deployed to their Unity project locations.

## FlatBuffer Workflow

### 1. Schema Management (`.fbs`)
- **Location**: `FlatBuffers/New_Fbs/`
- **Pattern**:
  ```flatbuffers
  table [Name]FlatBuffer {
    items:[[Name]FlatBufferDataRaw];
  }
  table [Name]FlatBufferDataRaw {
    ID:string (key);
    // ... fields
  }
  root_type [Name]FlatBuffer;
  ```
- **Task**: When adding a new data type, create the `.fbs` file following this "root container + items array" pattern.

### 2. Implementation & Generation
- **C# Generation**: Run `bash generate_cs.sh` in the `FlatBuffers/` directory.
- **Data Conversion**: 
  - Update `generate_data.sh` with the new schema and JSON mapping.
  - Run `bash generate_data.sh` to produce the `.bin` file.
- **Master Script**: Alternatively, use `python3 generateAll.py` to automate the entire pipeline including copying to Unity.

### 3. Project Deployment
- **C# Classes**: Move to `Assets/Scripts/Game/Managers/FlatBuffers/`.
- **Binary Data**: Move to `Assets/StreamingAssets/Blueprints/`.

## Best Practices

- **Unique Keys**: Always use `ID:string (key);` for tables intended to be looked up by ID.
- **Defaults**: Provide sensible default values (e.g., `int = 0;`, `bool = false;`) to save binary space.
- **Documentation**: Add comments to fields in the `.fbs` file to explain their purpose or valid ranges.
- **Safety**: Before running generation scripts, ensure no files are currently locked by the Unity Editor by requesting the user to pause or save.
- **Validation**: After generating C#, verify that the classes compile without errors in Unity.

## Routing Guidance

- **If the user says "Add a new data table for [feature]"** -> Create `.fbs`, create JSON, run generation.
- **If the user says "Updating [feature] fields"** -> Update `.fbs`, update JSON, run generation.
- **If the user says "Data is not showing up in game"** -> Verify JSON schema, run conversion, check deployment path.
