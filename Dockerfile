ARG ROS_DISTRO=noetic
FROM ros:${ROS_DISTRO}
ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo git vim \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-${ROS_DISTRO}-desktop \
    python3-catkin-tools \
    python3-vcstool \
    ros-${ROS_DISTRO}-gazebo-ros-pkgs
RUN rm -rf /var/lib/apt/lists/*
RUN rm /etc/apt/apt.conf.d/docker-clean

# setup
USER $USERNAME
WORKDIR /home/$USERNAME/ws
RUN mkdir src && /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin build"

# install and build
WORKDIR /home/$USERNAME/ws/src
RUN git clone https://github.com/ToshikiNakamura0412/amr_navigation_ros.git \
    && git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git --depth 1 --single-branch \
    && git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3.git --depth 1 --single-branch \
    && git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git --depth 1 --single-branch
WORKDIR /home/$USERNAME/ws/src/amr_navigation_ros
RUN vcs import navigation < .rosinstall
WORKDIR /home/$USERNAME/ws
RUN sudo apt-get update && rosdep update --rosdistro ${ROS_DISTRO} && rosdep install -riy --from-paths src --rosdistro ${ROS_DISTRO}
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin build -DCMAKE_BUILD_TYPE=Release"

CMD ["/bin/bash"]
