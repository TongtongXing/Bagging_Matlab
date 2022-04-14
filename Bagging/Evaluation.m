function [accuracy,precision,recall] = Evaluation(pred,ytest)
TP=0; TN=0; FN=0; FP=0;
    for i=1:length(ytest)
        if(pred(i)==ytest(i) && pred(i)==1)
            TP=TP+1;
        elseif(pred(i)==ytest(i) && pred(i)==0)
            TN=TN+1;
        elseif(pred(i)~=ytest(i) && pred(i)==1)
            FP=FP+1;
        elseif(pred(i)~=ytest(i) && pred(i)==0)
            FN=FN+1;
        end
    end
    accuracy=(TP+TN)/(TP+TN+FP+FN);
    precision= TP/ (TP + FP);
    if isnan(precision)
        precision=0;
    end
    recall= TP/ (TP + FN);
    if isnan(recall)
        recall=0;
    end
end

