function out = Bagging(feat,label,opts)
if isfield(opts,'Model'), Model = opts.Model; end
% Define training & validation sets
trainIdx = Model.training;    testIdx = Model.test;
xtrain   = feat(trainIdx,:);  ytrain  = label(trainIdx);
xtest   = feat(testIdx,:);   ytest  = label(testIdx);
% Training model
My_Model = fitensemble(xtrain,ytrain,'bag',2,'Tree','type','classification');
% Prediction
pred     = predict(My_Model,xtest);
% Evaluate
[acc,pre,rec] = Evaluation(pred,ytest);    
out = [acc,pre,rec];
end