function [ frames, indexes ] = vec2frames( vec, Nw, Ns, window)

% VEC2FRAMES Splits signal into overlapped frames using indexing.
% 
%   B=vec2frames(A,M,N,W) creates a matrix B whose columns consist of 
%   segments of length M, taken at every N samples along input vector A
%   and applying window W. 
%
%   Summary
%
%           A is an input vector
%
%           M is a frame length (in samples)
%
%           N is a frame shift (in samples)
%
%           W is an optional analysis window function to be applied to 
%             each frame, given as a function handle, e.g., W = @hanning
%             or as a vector of window samples, e.g., W = hanning( M )
%   
%           B is the output matrix of frames
%
%           R is a matrix of indexes used for framing, such that division 
%             of A into frames is achieved as follows: B=A(R);
%
 
    vec = vec(:);                                         % ensure column vector

    L = length( vec );                                    % length of the input vector
    M = floor((L-Nw)/Ns+1);                               % number of frames 
    
    indf = Ns*[0:(M-1)];                                  % indexes for frames      
    inds = [1:Nw].';                                      % indexes for samples
    indexes = indf(ones(Nw,1),:) + inds(:,ones(1,M));     % combined framing indexes

    % divide the input signal into frames using indexing
    frames = vec( indexes );
