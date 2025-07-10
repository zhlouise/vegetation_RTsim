function daughter_vector = daughter_branch(parent_vector,theta,length_factor)
% -------------------------------------------------------------------------
% Calculate the starting and ending coordinates (x,y,z) for a branch vector
%
% Geometry calculation based on paper "Description of the Form of Trees by
% the Parameters of Tree-like Body: Effects of the Branching Angle and the
% Branch Length on the Shape of the Tree-like Body" by Hisao Honda (1970)
%
% Input:
% 1. parent_vector (3*2 vector): column 1 - starting point
%                                column 2 - ending point
% 2. theta: the branching-off angle on the plane that contains both the
%           mother branch and the daughter branch (in degrees)
% 3. length_factor: length diminishing factor that dictatates the
%                   shortening of daughter branches
% 
% Output: 
% endpoint (3*2 vector): column 1 - starting point (parent branch's 
%                                   ending point)
%                        column 2 - ending point
%
% By Louise ZHOU
% -------------------------------------------------------------------------

u = parent_vector(1,2)-parent_vector(1,1);
v = parent_vector(2,2)-parent_vector(2,1);
w = parent_vector(3,2)-parent_vector(3,1);
L = sqrt(u^2+v^2+w^2);

starting_point = parent_vector(:,2);

x = starting_point(1)+length_factor*(u*cosd(theta)-(L*v*sind(theta))/sqrt(u^2+v^2));
y = starting_point(2)+length_factor*(v*cosd(theta)-(L*u*sind(theta))/sqrt(u^2+v^2));
z = starting_point(3)+length_factor*w*cosd(theta);
ending_point = [x,y,z];

daughter_vector = [starting_point;ending_point];

end