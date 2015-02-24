* *************************************************************************************
* PROGRAM: uwezo - TZ map prep.do
* PROGRAMMER: Angela Ambroz
* DATE CREATED: 23 February 2015
* DATE MODIFIED: 
* PURPOSE: Prepping the math/English/Swahili test scores, by district.
* USES DATA: TZ13_hhld.dta
* CREATES DATA: 
* ***********************************************************************************


**	Codes	**

/* 
The following code is used throughout:

	(N/A)
	
*/


**	Preamble	**

clear
clear matrix
cap log c
set mem 500m


**	Setting up the references	**
// References have now been moved to my profile_aa.do

global uwezoIHD		"C:/Documents and Settings/aambroz/My Documents/TWAWEZA/P_Uwezo/IHD Conference"


**	Log	**

local date: di %tdCCYY.NN.DD date(c(current_date),"DMY")

local cti = substr("`c(current_time)'", 1,5)
local cti: subinstr local cti ":" ".", all

log using "$uwezoIHD/logs/`date'_Logged_at_`cti'.log", replace


**	Proportions by district	**
// Proportions, by district, for students who get 5 on the swa/math/eng test.


foreach i in swahili english math {
	u "$uwezoIHD/data/TZ13_hhld.dta", clear

	 
	bys id_districtName: g n1=_N
	bys id_districtName `i': g n2=_N
	g prop = n2/n1

	collapse (mean) prop if `i'==5, by(id_districtName)
	outsheet using "$uwezoIHD/TZ13_`i'.csv", c replace

	}
	


** Closing the log	**

log c
