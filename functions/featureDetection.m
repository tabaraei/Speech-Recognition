function newRecord = featureDetection(Signal, fs, label)

% -------------------------- Preproccessing --------------------------
frameSize = 330;
overlap = floor(0.25*frameSize);
frames = buffer(Signal, frameSize, overlap);
frames = frames.*hamming(frameSize);
% filter([1,-0.9],1,frames);

% ------------------------ Feature Detection -------------------------
% energy
energy = sum(frames.^2);
newRecord = [min(energy), max(energy), mean(energy), var(energy)];

% zerocrossing
z = zeroCrossing(frames);
newRecord = [newRecord, min(z), max(z), mean(z), var(z)];

% MFCC coefficients
MFCC = melcepst(Signal, fs, 'M', 13, floor(3*log(fs)), frameSize);
newRecord = [newRecord, min(MFCC), max(MFCC), mean(MFCC), var(MFCC)];

% first order diffrencial MFCC
MFCC_dif1 = diff(MFCC,1,2);
newRecord = [newRecord, min(MFCC_dif1), max(MFCC_dif1), mean(MFCC_dif1), var(MFCC_dif1)];

% second order diffrencial MFCC
MFCC_dif2 = diff(MFCC_dif1,1,2);
newRecord = [newRecord, min(MFCC_dif2), max(MFCC_dif2), mean(MFCC_dif2), var(MFCC_dif2)];

% --------------------- Add label to the dataset ---------------------
newRecord = [newRecord, label];

end