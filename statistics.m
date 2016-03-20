
%{
						Author - Madhudeep Petwal IIIT Hyderabad M.Tech CSIS madhudeep11petwal@gmail.com

	This function takes in arguments a Confusion matrix i.e. a square matrix 
	and returns Accuracy Recall Specificity and Precision

	For 2X2 Confusion Matrix
	
					Positive					Negative
	
	Positive		True Positive(tp)			False Negative(fn)
	Negative		False Positive(fp)			True Negative(tn)

    sensitivity = recall = tp / t = tp / (tp + fn)
    specificity = tn / n = tn / (tn + fp)
    precision = tp / p = tp / (tp + fp)

	For NXN Confusion Matrix - We can convert it to 2X2 matrix for each class

	For each row class there is recall specificity and precision as follows
	(i,i)  represents ConfusionMatrix(i,i)
	row(i) represents ConfusionMatrix(i,:)
	col(i) represents ConfusionMatrix(:,i)
	all    represents all values in ConfusionMatrix i.e. sum(ConfusionMatrix)

								Class1					not in Class1

	Class1					(i,i)(tp)					row(i)-(i,i)(fn)
	not in CLass1			col(i)-(i,i)(fp)			all - row(i) - col(i) + (i,i)(tn)

    sensitivity = recall = tp / t = tp / (tp + fn) 	= 		(i,i)/row(i)
    specificity = tn / n = tn / (tn + fp)     		=		 all-row(i)-col(i)+(ii)/all-row(i)
    precision = tp / p = tp / (tp + fp)		  		= 		(i,i)/col(i)


	Stats 			Matrix order
	Accuracy  			1X1 
	Recall 				NX1
	Specificity 		NX1
	Precision 			NX1

%}

function [ Accuracy Recall Specificity Precision ] = statisticsv2(ConfusionMatrix)

	TotalClasses = size(ConfusionMatrix)(1,1);
	
	% all the elements of confusion matrix
	TotalDataSet = sum(ConfusionMatrix(:));

	% all correctly classified dataset i.e major diagonal of confusion matrix divided by total *100  is accuracy in percentage	
	Accuracy = (trace(ConfusionMatrix)/TotalDataSet)*100;

	i=1:TotalClasses;

	Recall(i) = diag(ConfusionMatrix) ./ sum(ConfusionMatrix(i,:)')' ;
	Recall = Recall';
	
	Specificity(i) = (TotalDataSet - sum(ConfusionMatrix(i,:)')'...
					-sum(ConfusionMatrix(:,i))' + diag(ConfusionMatrix))...
					./(TotalDataSet - sum(ConfusionMatrix(i,:)')' ) ;
	Specificity = Specificity';

	Precision(i) = diag(ConfusionMatrix) ./ (sum(ConfusionMatrix(:,i))' );
	Precision = Precision';


endfunction
