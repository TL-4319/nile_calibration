# NILE Calibration  
This repo contains codes for multi modal extrensic calibration for NILE dataset. It also provide simulation to evaluate different methods.

## Dependencies

* Ubuntu 22.04

For synthetic data generation. Follow instruction from ROS2 [wiki](https://docs.ros.org/en/humble/Tutorials/Advanced/Simulators/Gazebo/Gazebo.html)
* ROS2 Humble
* Ignition Gazebo Fortress
* MATLAB with ROS packages for processing

## Run sim
```
ign gazebo -r <scene.world>
```

## Start ros gz bridge
We want to only transfer the thermal and optical images as well as point cloud to be saved as rosbag for processing with Matlab
To transport data from gazebo to ros2 sim, run the following in a sourced terminal
```
ros2 run ros_ign_bridge parameter_bridge /lidar/points@sensor_msgs/msg/PointCloud2@gz.msgs.PointCloudPacked \
     /thermal_camera_8bit_left/image@sensor_msgs/msg/Image@gz.msgs.Image \
     /thermal_camera_8bit_right/image@sensor_msgs/msg/Image@gz.msgs.Image \
     /camera_left/image@sensor_msgs/msg/Image@gz.msgs.Image \
     /camera_right/image@sensor_msgs/msg/Image@gz.msgs.Image 
```

## Recording as bag
In a sourced terminal, run the following

```
ros2 bag record /lidar/points /thermal_camera_8bit_left/image /thermal_camera_8bit_right/image /camera_left/image /camera_right/image
```


  
