function plotAccuracyvsCost(Xtrain,Ytrain,Xvalidate,Yvalidate,ntrainingPoints,nvalidationPoints)

C = zeros(100,1);
Accuracy = zeros(100,1);
for c=1:100
   C(c)=c;
   svmTrainedData = svmtrain(Xtrain, Ytrain, sprintf('-q -s 0 -t 0 -c %g', c));
   [predicted_labelsFromTesting] = svmpredict(Xvalidate,Yvalidate,svmTrainedData);
   accuracy = mean(double(predicted_labelsFromTesting==Xvalidate))*100;
   Accuracy(c) = accuracy;
end
plot(C,Accuracy);
pause;

c = 0.01;
count = 1;
C = zeros(5,1);
Accuracy = zeros(5,1);
while c<=100
   C(count)=c;
   svmTrainedData = svmtrain(Xtrain, Ytrain, sprintf('-q -s 0 -t 0 -c %g', c));
   [predicted_labelsFromTesting] = svmpredict(Xvalidate,Yvalidate,svmTrainedData);
   accuracy = mean(double(predicted_labelsFromTesting==Xvalidate))*100;
   Accuracy(count) = accuracy;
   count = count+1;
   c = c*10;
end
plot(log(C),Accuracy);
pause;
