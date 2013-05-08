function [points, outputs ] = create_points_and_classification( c, d1, d2, x_max, y_max, center )
%Given points c and value d1 and d2 generates the following points
% image is just the image
% c + (+- d1; +-d1) 
% c +(+- d2; 0) 
% c + (0; +- d2) 
% c +(+-d2; +-d2)
% c is of the form c = [x;y]
% output is the classification. It can be either 1 or -1
points = [c];
outputs = [1];

%% c + (+- d1; +-d1) 
point = c + [d1; d1];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, 1];

point = c + [d1; -d1];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, 1];

point = c + [-d1; d1];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, 1];

point = c + [-d1; -d1];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, 1];

%% c +(+- d2; 0) 
point = c + [d2; 0];
point = adjust_to_the_image( point, x_max, y_max, center);
points = [points, point];
outputs = [outputs, -1];

point = c + [-d2; 0];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, -1];

%% c +(0; +-d2) 
point = c + [0; d2];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, -1];

point = c + [0; -d2];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, -1];

%% c +(+-d2; +-d2) 
point = c + [d2; d2];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, -1];

point = c + [d2; -d2];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, -1];

point = c + [-d2; d2];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, -1];

point = c + [-d2; -d2];
point = adjust_to_the_image( point, x_max, y_max, center );
points = [points, point];
outputs = [outputs, -1];

end