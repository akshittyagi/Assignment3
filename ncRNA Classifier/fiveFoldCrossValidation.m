function [cvalidat_sigma] = fiveFoldCrossValidation(XCValidate,YCValidate,nCValidatePoints,C,sigma)
    
X1 = XCValidate(1 :(nCValidatePoints/5));
Y1 = YCValidate(1 :(nCValidatePoints/5),:); 
X2 = XCValidate(1*(nCValidatePoints/5) + 1 : 2*(nCValidatePoints/5));
Y2 = YCValidate(1*(nCValidatePoints/5) + 1 : 2*(nCValidatePoints/5),:);
X3 = XCValidate(2*(nCValidatePoints/5) + 1 : 3*(nCValidatePoints/5));
Y3 = YCValidate(2*(nCValidatePoints/5) + 1 : 3*(nCValidatePoints/5),:);
X4 = XCValidate(3*(nCValidatePoints/5) + 1 : 4*(nCValidatePoints/5));
Y4 = YCValidate(3*(nCValidatePoints/5) + 1 : 4*(nCValidatePoints/5),:);
X5 = XCValidate(4*(nCValidatePoints/5) + 1 : 5*(nCValidatePoints/5));
Y5 = YCValidate(4*(nCValidatePoints/5) + 1 : 5*(nCValidatePoints/5),:);

gamma = 1/(2*sigma*sigma);
cmd = ['-q -s 0 -t 2 -c ', num2str(C), ' -g ', num2str(gamma)];
X1a = XCValidate(1*(nCValidatePoints/5) + 1 :end);
Y1a = YCValidate(1*(nCValidatePoints/5) + 1 :end,:);
svmTrainedData1 = svmtrain(X1a,Y1a,cmd);
[predicted_labelsFromValidation1] = svmpredict(X1,Y1,svmTrainedData1);

accuracy1 = mean(double(predicted_labelsFromValidation1==X1))*100;

X2a = [XCValidate(1:(nCValidatePoints/5)) ; XCValidate(2*(nCValidatePoints/5)+1:end)];
Y2a = [YCValidate(1:(nCValidatePoints/5),:) ; YCValidate(2*(nCValidatePoints/5)+1:end,:)];
svmTrainedData2 = svmtrain(X2a, Y2a,cmd);
[predicted_labelsFromValidation2] = svmpredict(X2,Y2,svmTrainedData2);
accuracy2 = mean(double(predicted_labelsFromValidation2==X2))*100;

X3a = [XCValidate(1:(2*nCValidatePoints/5)) ; XCValidate(3*(nCValidatePoints/5)+1:end)];
Y3a = [YCValidate(1:(2*nCValidatePoints/5),:) ; YCValidate(3*(nCValidatePoints/5)+1:end,:)];
svmTrainedData3 = svmtrain(X3a, Y3a,cmd);
[predicted_labelsFromValidation3] = svmpredict(X3,Y3,svmTrainedData3);
accuracy3 = mean(double(predicted_labelsFromValidation3==X3))*100;

X4a = [XCValidate(1:(3*nCValidatePoints/5)) ; XCValidate(4*(nCValidatePoints/5)+1:end)];
Y4a = [YCValidate(1:(3*nCValidatePoints/5),:) ; YCValidate(4*(nCValidatePoints/5)+1:end,:)];
svmTrainedData4 = svmtrain(X4a, Y4a,cmd);
[predicted_labelsFromValidation4] = svmpredict(X4,Y4,svmTrainedData4);
accuracy4 = mean(double(predicted_labelsFromValidation4==X4))*100;

X5a = XCValidate(1:(4*nCValidatePoints/5));
Y5a = YCValidate(1:(4*nCValidatePoints/5),:);
svmTrainedData5 = svmtrain(X5a, Y5a,cmd);
[predicted_labelsFromValidation5] = svmpredict(X5,Y5,svmTrainedData5);
accuracy5 = mean(double(predicted_labelsFromValidation5==X5))*100;

cvalidat_sigma = (accuracy1+accuracy2+accuracy3+accuracy4+accuracy5)/5;

end