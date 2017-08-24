# RangamaniLabWIREs
Enclosed are all of the MATLAB files, spilt up into 3 folders
1. Cooper Model; Ca/cAMP oscillation model
	Contains 2 subfolders
		1.Cooper Well mixed: run the file RunCa_camp.m for the well mixed results a multiple a values (figure 10)
		2.Cooper PDE Files: run the file runCa_campPDE.m for a system for size 16um and a=2 (figure 13)
	Also contains the files
		Casys: This is for the other files to complete/ does not show anything
		CooperBiFur: This file creates the BiFurcation plot to show stability (figure 11(C))
		CooperDiffusionStability: This file scans across k to show the real and imaginary eigenvalues (figure 12)
		CooperStability: This file scans across a in the well mixed model to show the real part of the eigenvalue (figure 11(A,B))
2. Thomas Model; Turing Pattern generator
	Contains 1 subfolder
		Thomas PDE Files: run the file runTuring.m to find a spatial pattern for system size 10 (figure 4)
	Also contains the files
		ThomasNullcline: Generates the Nullcline graph for the Thomas system (figure 2A)
		ThomasStability: Finds the range of bistabable parameters at various parameter values (figure 2(B,C))
		ThomasStabilityDiffusion: Finds the points across a parameter scan in which all 4 Turing conditions are statisfied (figure 3)
3. WPP Model; Wave pinning model
	Contains 1 subfolder
		WPP PDE Files: run the file runWPP.m to generate a solution for system size 10um, see comments in file if no pattern is generated (figure 8)
	Also contains the files
		WPP: shows the bistability across chosen k0 and p values (figure 5(B,C,D), Figure 6)
		WPPNull: Generates the Nullcline for the WPP model (figure 5(A))
