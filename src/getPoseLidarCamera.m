
function [pose_lidar_camera, laser_timestamp_camera] = getPoseLidarCamera(...
    timestamp,laser_timestamps, camera_timestamps, ins_timestamps, ...
    ins_poses, ins_quaternions)
%%  Get pose between the timestamp of the camera and the one of the LIDAR 

    [~, laser_timestamp_id] = min(abs(laser_timestamps-camera_timestamps(1,...
        timestamp)));
    laser_timestamp_camera = laser_timestamps(laser_timestamp_id);
    ins_pose_lidar_cameras  = InterpolatePoses(laser_timestamps(...
        laser_timestamp_id), camera_timestamps(timestamp), ...
        ins_timestamps, ins_poses, ins_quaternions, 1);

    pose_lidar_camera = ins_pose_lidar_cameras{1};

end