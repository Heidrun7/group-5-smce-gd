# SMCE-gd ![CI](https://github.com/ItJustWorksTM/smce-gd/workflows/CI/badge.svg)

Official frontend for [libSMCE](https://github.com/ItJustWorksTM/libSMCE) using [Godot](https://godotengine.org/).  
Initially created to emulate cars supporting the [smartcar_shield](https://github.com/platisd/smartcar_shield) platform.

### Dependencies

- _[Godot](https://godotengine.org)_
- \*_[libSMCE](https://github.com/ItJustWorksTM/libSMCE)_ ([version](https://github.com/ItJustWorksTM/smce-gd/blob/master/CMakeLists.txt#L28))
- _[godot-cpp](https://github.com/godotengine/godot-cpp)_ (automatically built from source; \*_SConstruct_ is **not** used, but _Python3_ is still required)
- C++20-compatible compiler + _[CMake](https://cmake.org)_

### Prerequisites

1. **Setup** (follow the setup for: [Windows](https://github.com/ItJustWorksTM/smce-gd/wiki/Windows-setup) / [MacOS](https://github.com/ItJustWorksTM/smce-gd/wiki/MacOS-setup) / [Debian-based GNU/Linux](https://github.com/ItJustWorksTM/smce-gd/wiki/Debian-based-Linux-setup))
2. [libSMCE Releases](https://github.com/ItJustWorksTM/libSMCE/releases) (extract/install the artifact for your OS, Windows users should download the _Release_ version)
3. Set the env var `SMCE_ROOT` pointed to the root of the extracted _libSMCE directory_ (from step 2)
   1. On Windows:
   2. On MacOS:
      1. Open Terminal window in the user's root directory
         `nano .bash_profile`
      2. Add the env variable to the file (change the name of the release directory to match the one on your system): `export SMCE_ROOT=~/libSMCE-release`
4. Restart the computer to make sure the env var gets applied

### Building on Windows

```shell
mkdir build
cmake -B build
cmake --build build --config Release
```

### Post-building steps on Windows

1. Copy the file `SMCE.dll` from _\build_ to _\project\gdnative\lib_
2. Open the terminal and write `godot` to launch the godot editor
   1. Press "Import" and chose the file `project.godot` in _\project_
   2. Launch the project (this needs to be done at least once for the program to work when writing `godot --path project/`)

### Building on MacOS

```shell
mkdir build
cmake -B build
cmake --build build --target godot-smce
```

Then open the Godot Editor and import the project file found at _smce_gd/project/project.godot_

Packaging is done using _CPack_.  
_note: we bundle the shared lib of SMCE on export_

### Running on Windows

- `godot --path project/`
- Or open up the project folder in the _Godot editor_ and start from there.

### Running on MacOS

- `godot --path project/`
- You may encounter an error when first running the program due to your Mac's security settings.
  - Go to _System Preferences > Security and Privacy_ and if it says _"libSMCE was blocked from use because it is not from a identified developer"_, click on _Allow anyway_.

### Credits

Copyright ItJustWorks™, Apache 2.0 licensed

Software courtesy of [RuthgerD](https://github.com/RuthgerD)  
CI & Packaging by [AeroStun](https://github.com/AeroStun)  
Logo by [@Reves.sur.papier](https://instagram.com/reves.sur.papier/)  
Car model by [Ancelin Bouchet](https://github.com/anbouchet)
