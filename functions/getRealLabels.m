function labels = getRealLabels(datasetName, root)

% datasetName = trainFeatures or useFeatures
load([root, '\DataSet\', datasetName, '.mat'])
labels = features(:,length(features));

end