# statistics
Getting various stats from confusion matrix
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
