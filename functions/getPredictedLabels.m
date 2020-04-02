function predictedLabels = getPredictedLabels(datasetName, root)

% datasetName = trainFeatures or useFeatures
load([root, '\DataSet\', datasetName, '.mat'])
features = features(:,1:length(features)-1);

load([root, '\DataSet\Model.mat'])
predictedLabels = Model.predict(features);

end