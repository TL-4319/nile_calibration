# NILE Calibration  
This repo contains codes for multi modal extrensic calibration for NILE dataset. It also provide simulation to evaluate different methods.

## Dependencies

* Ubuntu 22.04

For synthetic data generation. Follow instruction from ROS2 [wiki](https://docs.ros.org/en/humble/Tutorials/Advanced/Simulators/Gazebo/Gazebo.html)
* ROS2 Humble
* Ignition Gazebo Fortress

## Run sim
```
ign gazebo -r <scene.world>
```

## Start ros gz bridge
To transport data from gazebo to ros2 sim
```
ros2 run ros_ign_bridge parameter_bridge /lidar/points@sensor_msgs/msg/PointCloud2@gz.msgs.PointCloudPacked
```

Still need to figure out how to publish the lidar frame so that it can be visualized in RVIZ
  
