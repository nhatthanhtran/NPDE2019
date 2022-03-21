Program: Finite Element Method - 1D
Class: Numerical PDE - Assignment 2
Author: Nhat Thanh Tran
Updated Date: 4/9/2019
-----------------------------------------------------------------
1. List of components:
a) General 
	display_ROC.m
	L2_norm.m
	lgwt.m (Outside Resource)
	rate_of_convergent.m
	Uh_continous.m
	Uh_eval.m
b) Problem 1
	force_dirichlet.m
	load_vector_dirichlet.m
	Problem1.m
	Problem1ROC.m
	sigma_dirichlet.m
	stiff_matrix_dirichlet.m
	Uh_dirichlet.m
b) Problem 2
	force_dn.m
	load_vector_dn.m
	Problem2.m
	Problem2ROC.m
	sigma_dn.m
	stiff_matrix_dn.m
	Uh_dn.m
c) Problem 3
	force_mixed.m
	load_vector_mixed.m
	Problem3.m
	Problem3_ROC.m
	sigma_mixed.m
	stiff_matrix_mixed.m
	Uh_mixed.m

2. Instruction
For each problem all components loaded in the same folder, 
including any general codes.
a) Load the Folder contain all of the code in MatLab
b) For each problem, there are 2 script file that can be run.
Problem#.m is used to display the FEM solution and error,
while Problem#ROC.m is used to calcualte the rate of 
convergent.
