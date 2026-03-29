#!/usr/bin/env bats

setup() {
    load "${BATS_TEST_DIRNAME}/test_helper"
}

# -------------------- ROS environment --------------------

@test "ROS_DISTRO is set" {
    assert [ -n "${ROS_DISTRO}" ]
}

@test "ROS_DISTRO is kinetic" {
    assert_equal "${ROS_DISTRO}" "kinetic"
}

@test "ROS setup.bash exists" {
    assert [ -f "/opt/ros/${ROS_DISTRO}/setup.bash" ]
}

@test "ROS environment can be sourced" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && echo ok"
    assert_success
    assert_output "ok"
}

@test "rostopic command is available after sourcing ROS" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && which rostopic"
    assert_success
}

@test "rosrun command is available after sourcing ROS" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && which rosrun"
    assert_success
}

@test "rosnode command is available after sourcing ROS" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && which rosnode"
    assert_success
}

@test "roslaunch command is available after sourcing ROS" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && which roslaunch"
    assert_success
}

@test "rosmsg command is available after sourcing ROS" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && which rosmsg"
    assert_success
}

# -------------------- GUI tools (desktop-full) --------------------

@test "rviz command is available after sourcing ROS" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && which rviz"
    assert_success
}

@test "rqt command is available after sourcing ROS" {
    run bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && which rqt"
    assert_success
}

@test "gazebo command is available" {
    run which gazebo
    assert_success
}

# -------------------- Base tools --------------------

@test "python is available" {
    run which python
    assert_success
}

@test "pip is available" {
    run which pip
    assert_success
}

@test "git is available" {
    run which git
    assert_success
}

@test "vim is available" {
    run which vim
    assert_success
}

@test "curl is available" {
    run which curl
    assert_success
}

@test "wget is available" {
    run which wget
    assert_success
}

@test "tmux is available" {
    run which tmux
    assert_success
}

@test "tree is available" {
    run which tree
    assert_success
}

@test "htop is available" {
    run which htop
    assert_success
}

@test "sudo is available" {
    run which sudo
    assert_success
}

@test "sudo works without password" {
    run sudo -n true
    assert_success
}

# -------------------- System --------------------

@test "user is not root" {
    run id -u
    assert_success
    refute_output "0"
}

@test "HOME is set and exists" {
    assert [ -n "${HOME}" ]
    assert [ -d "${HOME}" ]
}

@test "timezone is Asia/Taipei" {
    run cat /etc/timezone
    assert_success
    assert_output "Asia/Taipei"
}

@test "LANG is en_US.UTF-8" {
    assert_equal "${LANG}" "en_US.UTF-8"
}

@test "LC_ALL is en_US.UTF-8" {
    assert_equal "${LC_ALL}" "en_US.UTF-8"
}

@test "NVIDIA_VISIBLE_DEVICES is set" {
    assert_equal "${NVIDIA_VISIBLE_DEVICES}" "all"
}

@test "NVIDIA_DRIVER_CAPABILITIES is set" {
    assert_equal "${NVIDIA_DRIVER_CAPABILITIES}" "all"
}

@test "entrypoint.sh exists and is executable" {
    assert [ -x "/entrypoint.sh" ]
}

@test "work directory exists" {
    assert [ -d "${HOME}/work" ]
}

@test "work directory is writable" {
    run bash -c "touch '${HOME}/work/.smoke_test' && rm '${HOME}/work/.smoke_test'"
    assert_success
}

@test "bash-completion is installed" {
    assert [ -f "/usr/share/bash-completion/bash_completion" ]
}
