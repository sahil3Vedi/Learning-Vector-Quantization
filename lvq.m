input_vectors =[3 2; 7 6; 2 3; 6 7; 1 2; 5 6; 2 1; 6 5]';
output_targets = [1 2 1 2 1 2 1 2];
input_size = length(input_vectors);
learning_rate = 0.1;
W1 = input_vectors(:,1);
W2 = input_vectors(:,2);
for a = 1:50
 for n = 1:input_size
 X1 = norm((input_vectors(:,n)-W1))^2;
 X2 = norm((input_vectors(:,n)-W2))^2;
 x = min(X1,X2);
 if x == X1 && output_targets(n) == 1
 W1 = W1 + learning_rate*(input_vectors(:,n)-W1);
 elseif x == X1 && output_targets(n) == 2
 W1 = W1 - learning_rate*(input_vectors(:,n)-W1);
 elseif x == X2 && output_targets(n) == 2
 W2 = W2 + learning_rate*(input_vectors(:,n)-W2);
 elseif x == X2 && output_targets(n) == 1
 W2 = W2 - learning_rate*(input_vectors(:,n)-W2);
 end
 end
end
disp(['The learning vector W1 = ']);disp(W1)
disp(['The learning vector W2 = ']);disp(W2)
hold on
plot(input_vectors(1,:),input_vectors(2,:),'bo','LineWidth',2);
plot(W1(1,:),W1(2,:),'r*','LineWidth',1);
plot(W2(1,:),W2(2,:),'y*','LineWidth',1);
hold off
legend('input vector','W1','W2');
title('Learning Vector Quantization')