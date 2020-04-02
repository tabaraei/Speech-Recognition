function zeroCrossing = zeroCrossing(frames)

numberOfFrames = size(frames,2);
zeroCrossing = zeros(numberOfFrames,1);

for i=1:numberOfFrames
    % convert to signed vector, where x!=0
    currentFrame = sign(frames(:,i));
    currentFrame = currentFrame(currentFrame~=0);

    % compute sum in window of size 2, where x==0
    currentFrame = currentFrame + [currentFrame(2:size(currentFrame,1));0];
    zeroCrossing(i) = length(currentFrame(currentFrame==0));
end

end