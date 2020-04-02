function createSvmModel(root)

load([root, '\DataSet\trainFeatures.mat'])
labels = features(:,length(features));
features = features(:,1:length(features)-1);

Model = fitcsvm(features, labels, 'KernelFunction', 'linear', 'KernelScale', 'auto', 'Standardize', true, 'BoxConstraint', 1);
save([root, '\DataSet\Model.mat'], 'Model')

end