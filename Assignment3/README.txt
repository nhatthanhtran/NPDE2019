Program: Finite Element Method - 2D 
Class: Numerical PDE - Assignment 3
Author: Nhat Thanh Tran
Updated Date: 4/25/2019
-----------------------------------------------------------------
1. List of componenents:
a) Problem 1
	display_ROC.m
	exact_solution.m
	find_Uk.m
	fun_exact.m
	initial_function.m
	lgwt.m (Outside resource)
	mass_matrix_2D.m
	mass_matrix_dn.m
	mean_square_error.m
	phi.m
	Problem1.m
	Problem1ROC.m
	rate_of_convergent.m
	sigma_dn.m
	stiff_matrix_2D.m
	stiff_matrix_dn.m
	u_initial.m
b) Problem 2
	display_ROC.m
	findU.m
	initial_displacement.m
	initialU.m
	mean_square_error.m
	Problem2.m
	Problem2ROC.m
	rate_of_convergent.m
2. Instruction
a) Problem 1
	-Load all of the component on the same folder.
	-Run Problem1.m file to get the answer for part 7.
	-This will display 4 figures, the first 3 will 
	be a capture at each time k=0,1,10. The fourth 
	figure will display an animation of all of the
	time steps. The output of this script will be
	the max and mean square error.
	-Run Problem1ROC.m to obtain the output of 
	a table of ROC for the method.
b) Problem 2
	-Load all of the components on the same folder.
	-Run Problem2.m file to see an animation of the 
	approximate solution.
	-Run Problem2ROC.m file to obtain a table
	of ROC of the method.