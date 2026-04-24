% main.m에서 Plot을 위해 iteration의 error 값을 array 형태로 반환
function [root, error_storage] = secant(x0, x1, error_bd, max_iterate,index_f)

format short e

% Initialize
it_count = 0;
error = 1;
error_storage = []; % Error storage array for plot

% Constraint (Loop Condition)
while abs(error) > error_bd & it_count <= max_iterate
    % Function Value
    fx0 = f(x0, index_f);
    fx1 = f(x1, index_f); 

    if fx1 - fx0 == 0
        disp('V0 = V1; Division by zero; Stop')
        return
    end

    % Secant Method
    x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);

    % Calculate Error
    error = x2 -x1;
    iteration = [it_count, x1, fx1, error]
    % 화면 출력을 위해 ; 제거

    error_storage = [error_storage; abs(error)]; %Storage abs(error)

    %$ Update Parameter
    x0 = x1;
    x1 = x2;

    % +1 for iteration
    it_count = it_count + 1;
end

% 출력
if it_count > max_iterate
    disp('The number of iterates calculated exceeded') 
    disp('max_iterate.  An accurate root was not')
    disp('calculated.')
else
    format long
    root = x2
    format short e
    error
    format short
    it_count
end

% function to define equation for rootfinding problem.
function value = f(x,index)

switch index
case 1
    % Values
    P = 778;
    T = 350;
    a = 365;
    b = 0.3;
    R =1.618;

    %Function
    value = (R*T)/(x-b) - a/(x^2 + 2*b*x - b^2) -P; 
end