# AutoCAD Interactive Pipe Drawing Automation (AutoLISP)

An efficient AutoLISP routine tailored for mechanical, piping, and HVAC designers to accelerate routing workflows within AutoCAD. It eliminates repetitive layer switching by introducing a decoupled property-matching loop and transactional entity generation.

## Features

- **Decoupled Layer Matching:** Interactively sample any existing entity to match its layer context without forcing the new geometry to anchor onto the sampled object's endpoints.
- **Continuous Routing Loop:** Keeps the command active for rapid multi-run drafting until explicitly terminated via keyword or empty input.
- **Low-Overhead DXF Generation:** Uses native `entmake` transactions for instantaneous geometric instantiation instead of heavy command pipeline invocations.
- **Dynamic Input Overrides:** Shift target layers mid-command via keywords (`Select` / `Layer`) without breaking the active loop state.

## Installation & Deployment

1. Clone or download `pipedraw.lsp` into your localized CAD directory.
2. In AutoCAD, execute `APPLOAD`.
3. Select and load `pipedraw.lsp`.
4. Initialize the routine by typing `PIPEDRAW` into the command line interface.

## Command Workflow

```
Command: PIPEDRAW
Pick start point or [Select existing pipe / Layer / Exit] <Exit>: S
Select pipe to match layer: [Select target object]
Matched layer: [Target_Layer]. Ready to draw.

Pick start point or [Select existing pipe / Layer / Exit] <Exit>: [Click anywhere on canvas]
Pick next point (Press Enter to finish this run): [Click next routing node]
```

## Environment Compatibility

- **Host:** Autodesk AutoCAD (v2016 - Present)
- **Engine:** Core AutoLISP interpreter with Visual LISP (`vl-load-com`) extension support.

<img width="1909" height="1178" alt="image" src="https://github.com/user-attachments/assets/0145abf4-35ed-4d95-a304-b62bfd073af5" />

<img width="1860" height="1058" alt="image" src="https://github.com/user-attachments/assets/77776228-b104-47a1-bcf5-9d5003df3d69" />

<img width="1880" height="1182" alt="image" src="https://github.com/user-attachments/assets/33e9a16b-fb2c-4296-9d69-1cb04f791a2d" />

<img width="1661" height="1046" alt="image" src="https://github.com/user-attachments/assets/45a8e8be-26f4-49f1-a223-ea3cc3ee9214" />

<img width="1920" height="1146" alt="image" src="https://github.com/user-attachments/assets/ae771bbf-df2d-4d47-9e67-0210c04e10ad" />

<img width="2053" height="1247" alt="image" src="https://github.com/user-attachments/assets/5870488e-c7ab-49b9-9db0-81cdcf5e9005" />




