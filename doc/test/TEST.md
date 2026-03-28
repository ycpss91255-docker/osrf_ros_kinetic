# TEST.md

**61 tests** total.

## test/smoke_test/ros_env.bats (34)

### ROS environment (9)

| Test | Description |
|------|-------------|
| `ROS_DISTRO is set` | Verify ROS_DISTRO environment variable is set |
| `ROS_DISTRO is kinetic` | Verify ROS_DISTRO equals "kinetic" |
| `ROS setup.bash exists` | Verify /opt/ros/kinetic/setup.bash exists |
| `ROS environment can be sourced` | Source setup.bash and confirm success |
| `rostopic command is available after sourcing ROS` | Verify rostopic is on PATH |
| `rosrun command is available after sourcing ROS` | Verify rosrun is on PATH |
| `rosnode command is available after sourcing ROS` | Verify rosnode is on PATH |
| `roslaunch command is available after sourcing ROS` | Verify roslaunch is on PATH |
| `rosmsg command is available after sourcing ROS` | Verify rosmsg is on PATH |

### GUI tools - desktop-full (3)

| Test | Description |
|------|-------------|
| `rviz command is available after sourcing ROS` | Verify rviz is on PATH |
| `rqt command is available after sourcing ROS` | Verify rqt is on PATH |
| `gazebo command is available` | Verify gazebo is on PATH |

### Base tools (11)

| Test | Description |
|------|-------------|
| `python is available` | Verify python is on PATH |
| `pip is available` | Verify pip is on PATH |
| `git is available` | Verify git is on PATH |
| `vim is available` | Verify vim is on PATH |
| `curl is available` | Verify curl is on PATH |
| `wget is available` | Verify wget is on PATH |
| `tmux is available` | Verify tmux is on PATH |
| `tree is available` | Verify tree is on PATH |
| `htop is available` | Verify htop is on PATH |
| `sudo is available` | Verify sudo is on PATH |
| `sudo works without password` | Verify passwordless sudo |

### System (11)

| Test | Description |
|------|-------------|
| `user is not root` | Verify container runs as non-root user |
| `HOME is set and exists` | Verify HOME is set and directory exists |
| `timezone is Asia/Taipei` | Verify timezone configuration |
| `LANG is en_US.UTF-8` | Verify LANG locale setting |
| `LC_ALL is en_US.UTF-8` | Verify LC_ALL locale setting |
| `NVIDIA_VISIBLE_DEVICES is set` | Verify NVIDIA_VISIBLE_DEVICES equals "all" |
| `NVIDIA_DRIVER_CAPABILITIES is set` | Verify NVIDIA_DRIVER_CAPABILITIES equals "all" |
| `entrypoint.sh exists and is executable` | Verify /entrypoint.sh is executable |
| `work directory exists` | Verify ~/work directory exists |
| `work directory is writable` | Verify ~/work is writable |
| `bash-completion is installed` | Verify bash-completion is installed |

## Shared tests from docker_template

### docker_template/test/smoke_test/script_help.bats (16)

| Test | Description |
|------|-------------|
| `build.sh -h exits 0` | Help flag exits successfully |
| `build.sh --help exits 0` | Long help flag exits successfully |
| `build.sh -h prints usage` | Help output contains "Usage:" |
| `run.sh -h exits 0` | Help flag exits successfully |
| `run.sh --help exits 0` | Long help flag exits successfully |
| `run.sh -h prints usage` | Help output contains "Usage:" |
| `exec.sh -h exits 0` | Help flag exits successfully |
| `exec.sh --help exits 0` | Long help flag exits successfully |
| `exec.sh -h prints usage` | Help output contains "Usage:" |
| `stop.sh -h exits 0` | Help flag exits successfully |
| `stop.sh --help exits 0` | Long help flag exits successfully |
| `stop.sh -h prints usage` | Help output contains "Usage:" |
| `build.sh detects zh from LANG=zh_TW.UTF-8` | Auto-detect Traditional Chinese |
| `build.sh detects ja from LANG=ja_JP.UTF-8` | Auto-detect Japanese |
| `build.sh defaults to en for LANG=en_US.UTF-8` | Default to English |
| `build.sh SETUP_LANG overrides LANG` | SETUP_LANG takes precedence over LANG |

### docker_template/test/smoke_test/display_env.bats (11)

| Test | Description |
|------|-------------|
| `compose.yaml contains WAYLAND_DISPLAY env` | Wayland display variable in compose |
| `compose.yaml contains XDG_RUNTIME_DIR env` | XDG runtime dir variable in compose |
| `compose.yaml contains XAUTHORITY env` | X authority variable in compose |
| `compose.yaml mounts XDG_RUNTIME_DIR as rw` | XDG runtime dir mounted read-write |
| `compose.yaml mounts XAUTHORITY volume` | X authority volume mounted |
| `compose.yaml has no consecutive duplicate keys` | YAML validity check |
| `compose.yaml mounts X11-unix volume` | X11 socket volume mounted |
| `run.sh contains XDG_SESSION_TYPE check` | Display session type detection |
| `run.sh calls xhost +SI:localuser on wayland` | Wayland xhost permission |
| `run.sh calls xhost +local: on X11` | X11 xhost permission |
| `run.sh defaults to X11 xhost when XDG_SESSION_TYPE unset` | Fallback to X11 when unset |
