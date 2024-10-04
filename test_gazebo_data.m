close all
clear
clc

bagReader = ros2bagreader('/home/tuan/rosbag2_2024_10_04-10_10_32/');

pcBag = select(bagReader,'Topic','/lidar/points');

pcMsg = readMessages(pcBag);

pc = pointCloud(rosReadXYZ(pcMsg{1,1}));

pcshow(pc,"MarkerSize",10)
xlim([0, 6]);
ylim([-4 4]);