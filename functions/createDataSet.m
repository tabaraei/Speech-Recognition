function createDataSet(directory, root)

% ---------------------------- Read Audios ----------------------------
path = [root, '\Recordings\', directory, '\'];
hi = dir([path,'Hi*.wav']);
bye = dir([path,'Bye*.wav']);
features = [];

% -------------------------- Detect features --------------------------
for i=1:length(hi)
    % Read Hi Audio Files
    
    [Signal, fs] = audioread([path, hi(i).name]);
    features = [features; featureDetection(Signal, fs, 1)];
end

for i=1:length(bye)
    % Read Bye Audio Files
    [Signal, fs] = audioread([path, bye(i).name]);
    features = [features; featureDetection(Signal, fs, 2)];
end

% -------------------------- Save .mat File ---------------------------
if strcmp(directory, 'Train')
    save([root, '\DataSet\trainFeatures.mat'], 'features');
else
    save([root, '\DataSet\useFeatures.mat'], 'features');
end

end