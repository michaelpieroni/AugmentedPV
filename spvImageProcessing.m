
function [ImOUT] = spvImageProcessing(ImINPUT, varargin)

% This function is aimed at processing the input stream to enhance\delate
% features or zoom in region of interest of the image

%INPUT
%   ImINPUT
%   varargin: to include for processing
%OUTPUT
%   ImOUT

%Convert to double values
ImINPUT_d = double(ImINPUT);


% Frame/image processing: nothing for the moment
ImOUT = ImINPUT_d;