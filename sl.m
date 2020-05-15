clc;clear
%%
data = load('..\KITTI_sequence_1\poses.txt');
figure
hold on


for i=1:size(data,1)-1
    line([data(i,4),data(i+1,4)],[data(i,12),data(i+1,12)], 'color', 'red', 'linewidth',3);
end

d2 = load('C:\Users\test\Desktop\skoli2020f\project\SLAM\path1.txt');
%data = data(1:100,:)
% d2(:,2) = d2(:,2).*(-1);
% d2(:,1) = d2(:,1).*(-1);


for i=1:size(d2,1)-1
    line([d2(i,1),d2(i+1,1)],[d2(i,2),d2(i+1,2)]);
end
hold off

%%
clc,clear; close all
%data = load('C:\VisionPyhton\Project\KITTI_sequence_2\poses.txt');
data = load('C:\Users\Ole\Desktop\Project\dataset\sequences\06\poses.txt');
figure
hold on


for i=1:size(data,1)-1
    line([data(i,4),data(i+1,4)],[data(i,12),data(i+1,12)], 'color', 'red', 'linewidth',3);
end

data_actual = load('C:\Users\Ole\Desktop\Project\SLAM\ourCache\cam_frames.txt');



for i=1:size(data_actual,1)-1
    line([data_actual(i,4),data_actual(i+1,4)],[data_actual(i,12),data_actual(i+1,12)], 'color', 'k', 'linewidth',3);
end



d2 = load('C:\Users\Ole\Desktop\Project\SLAM\ourCache\path6.txt');
%data = data(1:100,:)
%d2(:,3) = d2(:,3).*(-1);
% d2(:,1) = d2(:,1).*(-1);
d2_comp=[data(1,:);d2(:,4:6), d2(:,1), d2(:,7:9), d2(:,2), d2(:,10:12),d2(:,3)];


for i=1:size(d2,1)-1
    line([d2(i,1),d2(i+1,1)],[d2(i,3),d2(i+1,3)]);
end
hold off
% 
% figure
% hold on
% 
% 
% for i=1:10
%     quiver3(data(i,4),data(i,8),data(i,12),data(i,1),data(i,5),data(i,9),'r')
%     quiver3(data(i,4),data(i,8),data(i,12),data(i,2),data(i,6),data(i,10),'g')
%     quiver3(data(i,4),data(i,8),data(i,12),data(i,3),data(i,7),data(i,11),'b')
%     
%     quiver3(d2(i,1),d2(i,2),d2(i,3),d2(i,4),d2(i,7),d2(i,10),'k')
%     quiver3(d2(i,1),d2(i,2),d2(i,3),d2(i,5),d2(i,8),d2(i,11),'g')
%     quiver3(d2(i,1),d2(i,2),d2(i,3),d2(i,6),d2(i,9),d2(i,12),'b')
% end
% 
% 
% hold off
%%
clc;clear;close all
dat_optimized = load('C:\Users\Ole\Desktop\Project\SLAM\ourCache\optimized_paramters.txt');

ro = axang2rotm([dat_optimized(1,1:3) norm(dat_optimized(1,1:3))]);
tr = dat_optimized(1,4:6);
tr_mat_first = [ro tr'; 0 0 0 1];

x = [];
z = [];

for i=2:size(dat_optimized,1)
    ro = axang2rotm([dat_optimized(i,1:3) norm(dat_optimized(i,1:3))]);
    tr = dat_optimized(i,4:6);
    tr_mat_sec = [ro tr'; 0 0 0 1];
    
    tr_mat_first = tr_mat_first * tr_mat_sec;
    x = [x, tr_mat_first(1,4)];
    z = [z, tr_mat_first(3,4)];
end
% hold on
for i=2:length(x)
    line([x(i-1) x(i)],[z(i-1) z(i)])
%     pause(0.01)
end

    
   
hold on
data = load('C:\Users\Ole\Desktop\Project\dataset\sequences\06\poses.txt');
for i=1:size(data,1)-1
    line([data(i,4),data(i+1,4)],[data(i,12),data(i+1,12)], 'color', 'red', 'linewidth',3);
end



d2 = load('C:\Users\Ole\Desktop\Project\SLAM\ourCache\path6.txt');

for i=1:size(d2,1)-1
    line([d2(i,1),d2(i+1,1)],[d2(i,3),d2(i+1,3)], 'color', 'green', 'linewidth',1);
end

