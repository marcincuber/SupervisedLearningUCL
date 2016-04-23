% The for loop repeats the commands that are inside of it. The basic structure is
%   for <list-of-values>
%   <statements-to-be-done>
%   end

% Use this structure to repeat output, or do calculations
    % for loop now
for k = 1:5
    disp(sprintf('%8.5e',x(k))) %#ok<DSPS>
end

    % for loop doing a calculation
total = 0;
for k = 1:10
    total = total + x(k);
    disp(sprintf('Total for k=%2.0f is %15.8g',k,sum(x)))  %#ok<DSPS>
end

% sum(x) built in matlab command sums components of vector
% Here the command sum can replace the loop; it adds up the elements of a vector