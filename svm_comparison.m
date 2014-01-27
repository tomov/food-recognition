

svm = {};

for class = 1:15

    yesno = zeros();
    svm{class} = svmtrain(inputs', targets');
    

end

