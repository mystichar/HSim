##PLOTCUBE
## SOURCE:https://www.mathworks.com/matlabcentral/fileexchange/15161-plotcube
## AUTHOR: ADAM DANZ
function h = PLOTCUBE(varargin) 
inArgs = { ... 
[10 56 100] , ... % Default edge sizes (x,y and z) 
0*[10 10 10] , ... % Default coordinates of the origin point of the cube 
.7 , ... % Default alpha value for the cube's faces 
[1 0 0] , ... % Default Color for the cube 
gca ... % default axis 
}; 
% Replace default input arguments by input values 
inArgs(1:nargin) = varargin; 
% Create all variables 
[edges,origin,alpha,clr,axh] = deal(inArgs{:}); 
XYZ = { ... 
[0 0 0 0] [0 0 1 1] [0 1 1 0] ; ... 
[1 1 1 1] [0 0 1 1] [0 1 1 0] ; ... 
[0 1 1 0] [0 0 0 0] [0 0 1 1] ; ... 
[0 1 1 0] [1 1 1 1] [0 0 1 1] ; ... 
[0 1 1 0] [0 0 1 1] [0 0 0 0] ; ... 
[0 1 1 0] [0 0 1 1] [1 1 1 1] ... 
}; 
XYZ = mat2cell(... 
cellfun( @(x,y,z) x*y+z , ... 
XYZ , ... 
repmat(num2cell(edges),6,1) , ... 
repmat(num2cell(origin),6,1) , ... 
'UniformOutput',false), ... 
6,[1 1 1]); 
h = cellfun(@patch,repmat({axh},6,1),... 
XYZ{1},XYZ{2},XYZ{3},... 
repmat({clr},6,1),... 
repmat({'FaceAlpha'},6,1),... 
repmat({alpha},6,1)... 
); 
view(3);