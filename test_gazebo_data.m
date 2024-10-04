close all
clear
clc

% Object to read bag file
bag_reader = ros2bagreader('/home/tuan/rosbag2_2024_10_04-11_12_56/');

% Get data based on topics
left_thermal_bag = select(bag_reader,'Topic','/thermal_camera_8bit_left/image');
right_thermal_bag = select(bag_reader,'Topic','/thermal_camera_8bit_right/image');
left_optical_bag = select(bag_reader,'Topic','/camera_left/image');
right_optical_bag = select(bag_reader,'Topic','/camera_right/image');
lidar_bag= select(bag_reader,'Topic','/lidar/points');

% Get message
left_thermal_msg = readMessages(left_thermal_bag);
right_thermal_msg = readMessages(right_thermal_bag);
left_optical_msg = readMessages(left_optical_bag);
right_optical_msg = readMessages(right_optical_bag);
lidar_msg = readMessages(lidar_bag);

left_thermal_img = rosReadImage(left_thermal_msg{1,1});
right_thermal_img = rosReadImage(right_thermal_msg{1,1});
left_optical_img = rosReadImage(left_optical_msg{1,1});
right_optical_img = rosReadImage(right_optical_msg{1,1});
pc = pointCloud(rosReadXYZ(lidar_msg{1,1}));

figure()
imshow(horzcat(left_thermal_img, right_thermal_img));


figure()
imshow(horzcat(left_optical_img, right_optical_img))

figure()
pcshow(pc,"MarkerSize",10)
xlim([0, 6]);
ylim([-4 4]);