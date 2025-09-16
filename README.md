# amr_navigation_ros

[![CI](https://github.com/ToshikiNakamura0412/amr_navigation_ros/actions/workflows/ci.yml/badge.svg)](https://github.com/ToshikiNakamura0412/amr_navigation_ros/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A 2D navigation metapackage for AMR (Autonomous Mobile Robot)

Docker Supported (Demo only)

<p align="center">
  <img src="images/demo.gif" width="720px"/>
</p>

## Environment
- Ubuntu 20.04
- ROS Noetic
- (Docker)

## Requirement
- python3-vcstool

## System
<p align="center">
  <img src="images/system.png" width="640px"/>
</p>

## packages
| Package | Build Status | Language |
| ------ | ------ | ------ |
| [amr_navigation_utils_ros](https://github.com/ToshikiNakamura0412/amr_navigation_utils_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/amr_navigation_utils_ros/workflows/build/badge.svg) | C++ |
| [a_star_ros](https://github.com/ToshikiNakamura0412/a_star_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/a_star_ros/workflows/build/badge.svg) | C++ |
| [base_controller_ros](https://github.com/ToshikiNakamura0412/base_controller_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/base_controller_ros/workflows/build/badge.svg) | C++ |
| [dwa_planner](https://github.com/amslabtech/dwa_planner.git) | [![ci](https://github.com/amslabtech/dwa_planner/actions/workflows/main.yml/badge.svg)](https://github.com/amslabtech/dwa_planner/actions/workflows/main.yml) | C++ |
| [emcl_ros](https://github.com/ToshikiNakamura0412/emcl_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/emcl_ros/workflows/build/badge.svg) | C++ |
| [gridmap_to_pointcloud_ros](https://github.com/ToshikiNakamura0412/gridmap_to_pointcloud_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/gridmap_to_pointcloud_ros/workflows/build/badge.svg) | C++ |
| [gyrodometry_ros](https://github.com/ToshikiNakamura0412/gyrodometry_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/gyrodometry_ros/workflows/build/badge.svg) | C++ |
| [icp_matching_ros](https://github.com/ToshikiNakamura0412/icp_matching_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/icp_matching_ros/workflows/build/badge.svg) | C++ |
| [likelihood_field_gridmap_ros](https://github.com/ToshikiNakamura0412/likelihood_field_gridmap_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/likelihood_field_gridmap_ros/workflows/build/badge.svg) | C++ |
| [local_goal_creator_ros](https://github.com/ToshikiNakamura0412/local_goal_creator_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/local_goal_creator_ros/workflows/build/badge.svg) | C++ |
| [pointcloud_storer_ros](https://github.com/ToshikiNakamura0412/pointcloud_storer_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/pointcloud_storer_ros/workflows/build/badge.svg) | C++ |
| [raycast_mapping_ros](https://github.com/ToshikiNakamura0412/raycast_mapping_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/raycast_mapping_ros/workflows/build/badge.svg) | C++ |
| [recovery_behavior_ros](https://github.com/ToshikiNakamura0412/recovery_behavior_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/recovery_behavior_ros/workflows/build/badge.svg) | C++ |
| [scan_to_pcl_ros](https://github.com/ToshikiNakamura0412/scan_to_pcl_ros.git) | ![Build Status](https://github.com/ToshikiNakamura0412/scan_to_pcl_ros/workflows/build/badge.svg) | C++ |
| [waypoint_editor_ros](https://github.com/ToshikiNakamura0412/waypoint_editor_ros.git) | [![lint](https://github.com/ToshikiNakamura0412/waypoint_editor_ros/actions/workflows/lint.yaml/badge.svg)](https://github.com/ToshikiNakamura0412/waypoint_editor_ros/actions/workflows/lint.yaml) | Python |
| [waypoint_manager_ros](https://github.com/ToshikiNakamura0412/waypoint_manager_ros.git) | [![lint](https://github.com/ToshikiNakamura0412/waypoint_manager_ros/actions/workflows/lint.yaml/badge.svg)](https://github.com/ToshikiNakamura0412/waypoint_manager_ros/actions/workflows/lint.yaml) | Python |

## Use docker (Demo only)
```
git clone https://github.com/ToshikiNakamura0412/amr_navigation_ros.git && cd amr_navigation_ros

# build an image, create a container and start demo (Ctrl-c: stop a container and exit)
docker compose up
# remove a container
docker compose down
```

## Not use docker
### Install and Build
```
# clone repository
cd /path/to/your/catkin_ws/src
git clone https://github.com/ToshikiNakamura0412/amr_navigation_ros.git
cd amr_navigation_ros
vcs import navigation < .rosinstall

# build
cd /path/to/your/catkin_ws
rosdep install -riy --from-paths src --rosdistro noetic # Install dependencies
catkin build -DCMAKE_BUILD_TYPE=Release                 # Release build is recommended
```

### Running the demo
#### Using simulator
```
# clone repository
cd /path/to/your/catkin_ws/src
git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git

# build
cd /path/to/your/catkin_ws
rosdep install -riy --from-paths src --rosdistro noetic # Install dependencies
catkin build -DCMAKE_BUILD_TYPE=Release                 # Release build is recommended

# run demo
export TURTLEBOT3_MODEL=burger
roslaunch amr_navigation_ros demo.launch
```
