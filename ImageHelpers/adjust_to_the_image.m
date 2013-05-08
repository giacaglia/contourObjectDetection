function [ point ] = adjust_to_the_image( point, x_max, y_max, centroid_image )

point_adjusted_to_centroid = point;
point_adjusted_to_centroid(1,1) = point_adjusted_to_centroid(1,1) + centroid_image(1);
point_adjusted_to_centroid(2,1) = point_adjusted_to_centroid(2,1) + centroid_image(2);

point_adjusted_to_centroid(1,1) = max(point_adjusted_to_centroid(1,1), 1);
point_adjusted_to_centroid(2,1) = max(point_adjusted_to_centroid(2,1), 1);
point_adjusted_to_centroid(1,1) = min(point_adjusted_to_centroid(1,1), x_max);
point_adjusted_to_centroid(2,1) = min(point_adjusted_to_centroid(2,1), y_max);

point(1,1) = point_adjusted_to_centroid(1,1) - centroid_image(1);
point(2,1) = point_adjusted_to_centroid(2,1) - centroid_image(2);

end

