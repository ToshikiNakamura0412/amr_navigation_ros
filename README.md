# amr_navigation_ros

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A 2D navigation metapackage for AMR (Autonomous Mobile Robot)

## Environment
- Ubuntu 20.04
- ROS Noetic

## System
<p align="center">
  <img src="images/system.png" width="640px"/>
</p>

## packages
| Package | Build Status |
| ------ | ------|
| [a_star_ros](https://github.com/ToshikiNakamura0412/a_star_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/a_star_ros/workflows/build/badge.svg) |
| [dwa_planner](https://github.com/amslabtech/dwa_planner.git) | ![Build Status](https://github.com/amslabtech/dwa_planner/workflows/CI/badge.svg) |
| [emcl_ros](https://github.com/ToshikiNakamura0412/emcl_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/emcl_ros/workflows/build/badge.svg) |
| [local_goal_creator_ros](https://github.com/ToshikiNakamura0412/local_goal_creator_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/local_goal_creator_ros/workflows/build/badge.svg) |
| [raycast_mapping_ros](https://github.com/ToshikiNakamura0412/raycast_mapping_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/raycast_mapping_ros/workflows/build/badge.svg) |
| [scan_to_pcl_ros](https://github.com/ToshikiNakamura0412/scan_to_pcl_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/scan_to_pcl_ros/workflows/build/badge.svg) |

## Install and Build
```
# clone repository
cd /path/to/your/catkin_ws/src
git clone https://github.com/ToshikiNakamura0412/amr_navigation_ros.git
cd amr_navigation_ros
vcs import navigation < .rosinstall

# build
cd /path/to/your/catkin_ws
rosdep install --from-paths src --ignore-src -y # Install dependencies
catkin build -DCMAKE_BUILD_TYPE=Release         # Release build is recommended
```

## Running the demo
### Using simulator
```
# clone repository
cd /path/to/your/catkin_ws/src
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git

# build
cd /path/to/your/catkin_ws
rosdep install --from-paths src --ignore-src -y # Install dependencies
catkin build -DCMAKE_BUILD_TYPE=Release         # Release build is recommended

# run demo
export TURTLEBOT3_MODEL=burger
roslaunch amr_navigation_ros test.launch
```
