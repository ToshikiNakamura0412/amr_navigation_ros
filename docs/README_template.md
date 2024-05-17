# a_star_ros

![Build Status](https://github.com/ToshikiNakamura0412/<pkg_name>/workflows/build/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

ROS implementation of ~

<p align="center">
  <img src="https://github.com/ToshikiNakamura0412/amr_navigation_gifs/blob/master/images/<file_name>.gif" height="320px"/>
</p>

## Environment
- Ubuntu 20.04
- ROS Noetic

## Install and Build
```
# clone repository
cd /path/to/your/catkin_ws/src
git clone https://github.com/ToshikiNakamura0412/<pkg_name>.git

# build
cd /path/to/your/catkin_ws
rosdep install -riy --from-paths src --rosdistro noetic # Install dependencies
catkin build <pkg_name> -DCMAKE_BUILD_TYPE=Release      # Release build is recommended
```

## How to use
```
roslaunch <pkg_name> <file_name>.launch
```

## Running the demo
```
roslaunch <pkg_name> test.launch
```

<p align="center">
  <img src="https://github.com/ToshikiNakamura0412/amr_navigation_gifs/blob/master/images/<file_name>.gif" height="320px"/>
</p>

## Node I/O
![Node I/O](images/<file_name>.png)

## Nodes
### node_1
#### Published Topics
- ~\<name>/~ (`~/~`)
  - ~~~

#### Subscribed Topics
- /~ (`~/~`)
  - ~~~

#### Parameters
- ~\<name>/<b>hz</b> (int, default: `10` [Hz]):<br>
  The rate of main loop

## References
- url
