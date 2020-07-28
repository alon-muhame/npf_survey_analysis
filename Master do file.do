********************************************************************************
*This Do File Was Created on Thursday: 30.10.2019 @ 12:00 PM
*Created by Muhame Alon 
*Purpose: To Analyze Endline Survey by NP_Endline_Evaluation_South_Sudan
                     **** Master Do file*** 
********************SECTION 1***************************************************

*** OVER VIEW OF ANALYSIS OF SURVEYs/QUESTIONAIRE(S) 
     **** DESCRIPTIVE STATISTICS***
*** TYPES OF QUESTIONS****
*1. Categorical Questions e.g Male or Female, Race , States/Regions, Villages, Districts***
*2. Ordinal type questions e.g Agegroups, some order is observed among the question, etc.***
*3. Continous type questions e.g Income, no of children, level of competency in computer , etc...***

*** Univariate Analysis ***
*Type 1: Categorical Qns; Count/Frequencies , Bar charts /pie charts etc.***
*Type 2: Ordinal Qns ; Count/Frequencies , Bar charts/pie charts etc.***
*Type 3: Continuous Qns; Measures of Central Tendency ; Mean, sd, etc, & Measures of Spread e.g variance;**

**Bivariate Analysis***
*Type 1: Categorical Qns; Comparision of two categorical questions , or Comaprison of Categorical (Gender /Age)& Continuos; Use stacked Bar charts /pie charts etc.***
*Type 2: Categorical & Continuous Qns ; Comparision of means e.g Gender and use of a service/ accessibility of a service, Use Clustered Bar chart etc.***
*Type 3: Continuous Qns; cluster plot e.g use of a service & Competency **

       ** BASIS TO MAKE PREDICTIONS***
****Inferential Statistics**
*If a result from data Could or Couldn't by chance 
** Could be achieved by Chance- Not significant**
** Could not be achived by Chance- Significant**(CI 95%)

** Test, One(Male & Females) Categorical qn(s) - One way chi-square test
** Test, Two categorical (Gender & Age)       - Two way chi -square test
** Test, Categorical & Continous qns; Comaprison of means , t-test, ANOVA (More than two groups)
** Test, Two Continuous , Corrolation Analysis; 

clear all
set more off 
#delimit;

cd "E:\Research Progress\NP_Endline"
*import dataset ;
use "E:\Research Progress\NP_Endline\data\clean dataset",clear

//using globals
global data "E:\Research Progress\NP_Endline\NP_Endline\data"
global output "E:\Research Progress\NP_Endline\NP_Endline\results"

// Renaming Variables in the dataset;//

ren C state
ren Q11 respodentsex 
ren Q12 hhhead
ren Q13 reltohhhead
ren Q13_OTHER reltohhhead_other
ren Q14 ageofrespondent
ren Q15 maritalstatus
ren Q15_Other maritalstatus_other
ren Q16 highestlevelofeducation
ren Q17 hasyourhholdbeenhere
ren Q18 howlongdidyoucomehere
ren Q19 havehosteddisplacedpeople
ren Q21 twomostimportantsourcesincome
ren Q110 totalmale
ren Q110_Other totalfemale
ren Q111_Total totalfemale
ren Q21_A total_male 
ren Q111A male_living_HHold
ren Q111B female_living_HHold
ren Q112 numberofchildren_under18

* Data Inspection
describe
tab maritalstatus
su maritalstatus
*Table analysis 
table maritalstatus, col row
table respodentsex state,col row


*Labelling variables 
label var A "Personal Indetification Number"
label var B "Date of Interview"
label var state "State" 
label var State "Village" 
label var respodentsex "gender" 
label var  hhhead "HHead" 
label var reltohhhead  "HHead_Relative" 
label var reltohhhead_other  "HHead_Relative_Others" 
label var ageofrespondent  "Age" 
label var maritalstatus  "Marital_status" 
label var  maritalstatus_other "Marital_Others" 
label var  highestlevelofeducation "Highest_Level_Education" 
label var  hasyourhholdbeenhere "HHold_Not_Moved_Before" 
label var  howlongdidyoucomehere "Period_Been_Here" 
label var  havehosteddisplacedpeople "Hosted_Any_Returned_People"
label var  totalmale "Other_Income_sources"
label var totalfemale "Total_Living_Household"
label var Q111A "Total_Male_Living_HHold"
label var Q111B "Total_Female_Living_HHold"

*Label define and label value
destring respodentsex, gen(gender)
label define gender 1 "Male" 2 "Female"
label values gender gender

label define Highest_Level_Education 1 "No education" 2 "Primary" 3 "Secondary/Technical" 4 "Tertiary/University" 99 "Refused To Answer"
label define HHead 1 "Man" 2 "Woman" 3 "Child headed Household" 
label define HHead_Relative 1 "Head Household" 2 "Spouse" 3 "Son/Daughter of Household" 4 "Other"
label define Marital_status 1 "Married" 2 "Living with a partner" 3 "Single" 4 "Widowed" 5 "Others"
label define HHold_Not_Moved_Before 1 "Last 12 months" 2 "1-5 years" 3 "5-10 years" 88 "Don't Know" 99 "Refused"
label define Two_Sources_Income 1 "Crop farming" 2 "Livestock Rearing Incl. Fishing" 3 "Wages or Salary Earner" 4 "Business/Trading" 5 "Cash Remittance" 6 "Support from NGO" 7 "Others" 99 "Refused" 

********************SECTION 2***************************************************
ren Q21 safetyandsecurity 
label var safetyandsecurity  "Safety_security_Area"
label define Safety_security_Area 1 "safe" 2 "Somewhat safe" 3 "Somewhat Unsafe" 4 "Unsafe" 88 "Don't Know" 99 "Refused"
label values safety safety 
ren Q22 incidentsofviolence
label var incidentsofviolence "Violence_Occurance"
label define Violence_Occurance 1 "Frequent" 2 "Somewhat Frequent" 3 "Infrequent" 88 "Dont Know" 99 "Refused" 
label values Violence_Occurance Violence_Occurance
ren (Q231 Q232 Q233 Q234 Q235 Q236 Q237 Q238 Q239 Q2310 Q2388 Q2399) /// 
( robery harassent theft abduction murder assaults sexualattacks revengeattacks violenceagainstwomengirls violenceagainstchildren dontknow refused )

ren Q241 financialinsecurity
ren Q242 fewopportunities  
ren Q243 crime
ren Q244 cattle
ren Q245 smallarmsguns
ren Q246 alcoholdrugs
ren Q247 marriage
ren Q248 competitionforresources
ren Q249 familyissues
ren Q2410 intercommunalconflict
ren Q2411 securityagencies 
ren Q2412 rumors
ren Q2413 limtedfreedom
ren Q2414 competetionlocalleadership
ren Q2415 competepolitical
ren Q2488 donotkonow
ren Q2499 refused2

ren Q25 havebeenthreatned
ren Q26 numberoftimesthreatned

ren Q271 waterpoints
ren Q272 foodorotheritemdistributn
ren Q273 latrines
ren Q274 insideyourhouse
ren Q275 inpublicspace
ren Q276 outsideincommunity
ren Q277 intownormarket
ren Q2788 dontknowQ2788
ren Q2799 refusedQ2799
ren Q28 sexofattacked
ren Q210 sexofattacker 
ren Q211 safetyandsecurityofcommunity
ren Q212 howsafedoyouwalkafterdark 
ren Q213 howsafedoyouwalkduringdaytime
ren Q214 howfeeltowalkoutsidevillage



*****************************************  Analysis & Graphs for Final WriteUp***********************************************************
********************Stacked Charts**************
graph bar (count) [fw=gender], over(education, descending) over(marital) percent subtitle(% of Marital) stack asyvars bar(5, bfcolor(red*0.8)) bar(4, bfcolor(red*0.3) blcolor(red*0.8)) bar(3, bfcolor(blue*0.2) blcolor(blue*1.2)) bar(2, bfcolor(blue*0.7) blcolor(blue*1.2)) bar(1, bcolor(blue*1.2)) legend(pos(3) col(1)) ysc(r(-5 100)) yla(, ang(h))

*** For Comparision Mosaiac Graph /spline plot**************
spineplot health age [w=freq], bar1(color(gs4)) bar2(color(gs8))  bar3(color(blue*0.2)) bar4(color(blue*0.6)) bar5(color(blue))  xla(, labsize(*0.8) axis(2)) percent xla(0(20)100) yla(0(20)100, axis(2))

*****************Comaprision********************* Without Multiple Charts*******
ssc inst catplot needed before 
catplot health agegroup [w=freq], percent(agegroup) asyvars stack subtitle(% of age group)

***** Basic Charts in Stata*****

****Bar charts are basic, and may seem very well supported in Stata, as only*****
a little acquaintance with the documentation reveals four commands,
graph bar, graph hbar, twoway bar and twoway rbar, which might seem
already three more than one might need


*****************Section 1***************************************************************************



*Sample Sizes in Four States/Regions 
count 
*Handling & Treating Missing Data 
tab Marital, missing
count if Marital==.
drop if Marital==. /// OR 

*Population /Gender/Marital status e.t.c Xtics in Four Sttes
tabulate Gender Marital 
table Gender Marital state, col row cell 
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desc1.doc") word replace: ///
bysort Gender: tabstat education, stats(n mean sd min max)
count if education ==0 & Gender==1
count if education ==0 | Gender==1
table Gender Marital state
xi,noomit: graph bar i.education ,by(gender) name(A,replace)
graph hbar (median) Marital education, over(state)
graph hbar Age education, over(state)
graph hbar(median) Age education, over(state)
hist education, frequency

graph bar education Gender, over(state)
hist education, width(2.9) frequency
catplot  state agegroups, blabel(bar) by(Gender)
bysort Gender: tab state education, col nokey

tabstat Age , s(mean median sd var count range min max) by(Gender)


catplot hbar state agegroups, percent(state Gender) blabel(bar) by(Gender)
graph hbar agegroups  HouseHead, blabel(bar) by(, title(Gender and state)) by(Gender state, total)
graph hbar (mean) agegroups HouseHead Marital, over(Gender) over(state, label(labsize(small))) blabel(bar) title(Demographics) legend(label(1 "Age") label(2 "State") label(3 "Marital"))

*Age Composition in Four Regions

recode Age (18/28 = 1 “18 to 28”)(29/39 = 2 “29 to 39”)(40/50 = 3 “40 to 50”)(51/61 = 4 “51 to 61”) (else="62+"), generate(agegroups) label(agegroups)

//spineplot education Age [w=freq], bar1(color(gs4)) bar2(color(gs8))  bar3(color(blue*0.2)) bar4(color(blue*0.6)) bar5(color(blue))  xla(, labsize(*0.8) axis(2)) percent xla(0(20)100) yla(0(20)100, axis(2))

catplot education Gender [w=education], percent(Gender) asyvars stack subtitle(% of Gender)
catplot Age Gender [w=Age], percent(Gender) asyvars stack subtitle(% of Gender)
tab agegroups state, col row cell
catplot state agegroups, blabel(bar)
catplot bar state agegroups, percent(agegroups) blabel(bar)
catplot agegroups state, percent(state) blabel(bar)

***** Average HouseHold Size by states/regions, Villages, *****************
tabulate 
***** HouseHold Headship By Region **************************
table HouseHead state, col row
table HouseHead state, by(Gender) col row
table HouseHead state, by(gender)
table HouseHead Gender, by(state)
tabulate HouseHead Gender, col row
tabulate HouseHead state, col row
table HouseHead Gender, by(state) col row 
table HouseHead Gender, by(age) col row
table HouseHead Age, by(Gender) col row
table HouseHead Age, by(Gender)
tabulate HouseHead Age, col row

*****Distribution of Household Headship by Agegrroup and Sex By Region By Education level*****************
table HouseHead Age, by(Gender)
table HouseHead Gender, by(state) col row 
***** Marital Status of Household members by gender By Rgeion ***********************************
table Marital Gender state, col row
table Marital Gender, by(state)
tabulate Marital Gender, col row
****** Pie Chart of Highest level of Education******************************
graph pie education, by(Gender)
****** Movement or Migration of Household by Gender By Age Group By Region**********************************
tabulate Household_stayed_here state
tabulate Household_stayed_here state, col row
*Insert a histogram or piechart or pareto chart for above
histogram Sex Attacked, width(1) start(13) percent
****** Reasons for Migration - Table of Frequencies and Reasons moved***************************************
tabulate HouseHold_Period_stayed_Here state
tabulate HouseHold_Period_stayed_Here state, col row
*Insert a chart for above

***** Sources of Income*************
*Most two sources of income
tabulate Gender Sources_Income, col row
*Insert A pie chart for sources of income visuals

***** Total Number of Children Under in a household by Region**************************************************************
tabulate Children_under18 state, col row
bysort state: tab Children_under18 Children_Head, colum row
hist Children_Under18, discrete
hist Children_Under18, discrete by(state)
tabstat Age Children_Under18, s(mean median sd var count range min max) by(Gender)
*"recode Children_Under18, into small=0-3, medium = 4-6, Large= 7-13, Extra large= 13+"


***** Distribution of the schooling status of persons aged 18-28, 29-39, 40-50, 51-61 etc years and above********************
tabulate education agegroups, col row
table education agegroups, col row
graph pie state, over(education)
graph pie state, over(education) legend(on)
graph pie state, over(education) title(Highest Level of Education by State) legend(on)

***** Schooling by Region****(Include titles, axis, and color of bars accordingly)*********************************
tabulate education state, col row
hist education, discrete by(state)
hist state, discrete by(education)
***** Status of Employment and Economic activity by sex by region *****************************************************
tabulate Sources_Income state agegroups, col row
graph pie Gender, over( Sources_Income)



*******  SECTION 2 Civilian Protection & Security ***********************************************************************
*** Load Data Afresh Again*****
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear


***** How do you rate safety and Securrity by Region ********************
catplot Gender Safety_Security  [w=Age], percent( Safety_Security ) asyvars stack subtitle(% Gender)
catplot Gender Safety_Security  [w= Safety_Security ], percent( Safety_Security ) asyvars stack subtitle(% Gender)
********* occurance of Violence by Region and what type of violence crimes *****
*Pie chart for occurance of Violence by state
tabulate Incidents_Violence state, row col
table Incidents_Violence, by(state)
graph bar Incidents_Violence,  by(state)
graph pie state, over(Incidents_Violence) missing plabel(_all percent) title(Occurance of Incidents of  Violence in Comunity) legend(on cols(7))

***What type of violent crime or violent crime occurred most often here? (Multiple responses)*****

destring Q231, gen(Q231_a)
destring Q232, gen(Q232_b)
destring Q233, gen(Q233_c)
destring Q234, gen(Q234_d)
destring Q235, gen(Q235_e)
destring Q236, gen(Q236_f)
destring Q237, gen(Q237_g)
destring Q238, gen(Q238_h)
destring Q239, gen(Q239_i)
destring Q2310, gen(Q2310_j)
destring Q2388, gen(Q2388_k)
destring Q2399, gen(Q2399_l)

label var Q231_a "What type of violent crime or violent occured most often here(1.Robbery)"
label var Q232_b "What type of violent crime or violent occured most often here(2.Harrassment)"
label var Q233_c "What type of violent crime or violent occured most often here(3.Theft)"
label var Q234_d "What type of violent crime or violent occured most often here(4.Abduction/arbitrary detention)"
label var Q235_e "What type of violent crime or violent occured most often here(5.Murder)"
label var Q236_f "What type of violent crime or violent occured most often here(6.Assaults/beatings)"
label var Q231_g "What type of violent crime or violent occured most often here(7.sexual attacks)"
label var Q238_h "What type of violent crime or violent occured most often here(8.revenge attacks)"
label var Q239_i "What type of violent crime or violent occured most often here(9.violence against women/girls in the home)"
label var Q2310_j "What type of violent crime or violent occured most often here(10.violence against children in the homes)"
label var Q2388_k "What type of violent crime or violent occured most often here(88.Don't know)"
label var Q2399_l "What type of violent crime or violent occured most often here(99.Refuse to answer)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desccrime.doc") word replace: ///
mrtab Q232_b Q233_c Q234_d Q235_e Q236_f Q231_g Q238_h Q239_i Q2310_j, include response(1 2 3 4 5 6 7 8) sort des
mrtab Q232_b Q233_c Q234_d Q235_e Q236_f Q231_g Q238_h Q239_i Q2310_j, by( Q11) col include response(1 2 3 4 5 6 7 8) sort des

** What factors do you associate with biggest sources of conflict or insecurity in your commmunity(Multiple responses)***
destring Q241, gen(Q241_a)
drop if Q241_a==2
drop if Q241_a==6
destring Q242, gen(Q242_b)
destring Q243, gen(Q243_c)
drop if Q243_c==4
destring Q244, gen(Q244_d)
destring Q245, gen(Q245_e)
drop if Q245_e==4
destring Q246, gen(Q246_f)
destring Q247, gen(Q247_g)
destring Q248, gen(Q248_h)
destring Q249, gen(Q249_i)
destring Q2410, gen(Q2410_j)
destring Q2411, gen(Q2411_k)
destring Q2412, gen(Q2412_l)
destring Q2413, gen(Q2413_m)
destring Q2414, gen(Q2414_n)
destring Q2415, gen(Q2415_o)

label var Q241_a "What factors would you associate as the biggest source of conflict and insecurity in your community(1.Financial insecurity)"
label var Q242_b "What factors would you associate as the biggest source of conflict and insecurity in your community(2.few opportunities for young people)"
label var Q243_c "What factors would you associate as the biggest source of conflict and insecurity in your community(3.Crime)"
label var Q244_d "What factors would you associate as the biggest source of conflict and insecurity in your community(4.cattle)"
label var Q245_e "What factors would you associate as the biggest source of conflict and insecurity in your community(5.availability of small arms(guns))"
label var Q246_f "What factors would you associate as the biggest source of conflict and insecurity in your community(6.use of alchol/drugs)"
label var Q247_g "What factors would you associate as the biggest source of conflict and insecurity in your community(7.Marriage/dowry, domestic violence etc)"
label var Q248_h "What factors would you associate as the biggest source of conflict and insecurity in your community(8.competition for resources)"
label var Q249_i "What factors would you associate as the biggest source of conflict and insecurity in your community(9.Family issues"
label var Q2410_j "What factors would you associate as the biggest source of conflict and insecurity in your community(10.inter-communal conflict)"
label var Q2411_k "What factors would you associate as the biggest source of conflict and insecurity in your community(11.security agencies(polic, army))"
label var Q2412_l "What factors would you associate as the biggest source of conflict and insecurity in your community(12.rumours/uncertainity about security)"
label var Q2413_m "What factors would you associate as the biggest source of conflict and insecurity in your community(13.limited freedom of movement)"
label var Q2414_n "What factors would you associate as the biggest source of conflict and insecurity in your community(14.competition over local leadership)"
label var Q2415_o "What factors would you associate as the biggest source of conflict and insecurity in your community(15.competition over political office)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desccconflict.doc") word replace: ///
mrtab Q241_a Q242_b Q243_c Q244_d Q245_e Q246_f Q247_g Q248_h Q249_i Q2410_j Q2411_k Q2412_l Q2413_m Q2414_n Q2415_o , include response(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) sort des

mrtab Q241_a Q242_b Q243_c Q244_d Q245_e Q246_f Q247_g Q248_h Q249_i Q2410_j Q2411_k Q2412_l Q2413_m Q2414_n Q2415_o ,by(Q11) col include response(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) sort des
mrtab Q241_a Q242_b Q243_c Q244_d Q245_e Q246_f Q247_g Q248_h Q249_i Q2410_j Q2411_k Q2412_l Q2413_m Q2414_n Q2415_o ,by(C) col include response(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) sort des

*** Q25 Has any of your family member been attacked, threatened or harrassed in last 12 months****
destring Q25, gen(Attacked) 
label define Attacked 1 "Yes" 2 "No" 88"Don't Know" 99 "Refused to Answer"
label values Attacked Attacked
drop if Attacked==.
graph pie state, over(Attacked) missing pie(_all, explode) plabel(_all percent) title(Have Been Attacked in last 12 Months) legend(on cols(7)) 

*** If yes in (Q25), How many times have been attacked**** 
tab numberoftimesthreatned Attacked, col row cell /// Pick only the totals///

**** If yes in (Q25), where the Last attck happen****(Recode the data correctly)


*** If yes in (Q25), what was the sex of the person attcked**
tab Attacked Sex_Attacked, col row cell
drop if Sex_Attacked==. /// (793 obs deleted)
graph pie Attacked, over(Sex_Attacked) missing pie(_all, explode) plabel(_all percent) title(Sex of the Pesron Attacked) legend(on cols(7)) /// Data has alot of missing points//
graph pie Attacked, over(Sex_Attacked) plabel(_all percent) title(Sex of the Pesron Attacked) legend(on cols(7))

histogram Sex Attacked, width(1) start(13) percent

***** If yes in (Q25), By whom (perpetrator of the incident) (Not found in the Dataset) ***
**** Q210 ; What was the sex of the attcker****( Not found in the dataset)***
**** Q211; How do you see safety and security of your own and your family in the community***
destring Q211, gen(safety_Security) 
label define safety_Security 1 "safe" 2 "Somewhat safe" 3 "Somewhat unsafe" 4 "Unsafe" 88 "Do't Know" 99 "Refused to Answer"
label values safety_Security safety_Security
tab safety_Security state, col row cell

label define state 1 "Lankien" 2 "Ganyiel" 3 "Rubkona" 4 "Yei"
label values state state
graph hbar (sum) safety_Security, over(state) by(, title(Safety & Security of Individuals in Communities)) by(safety_Security)

*** Q212; How safe would feel walking alone after dark*** 
destring Q212, gen(safety_after_dark)
label define safety_after_dark 1 "safe" 2 "Somewhat safe" 3 "somewhat unsafe" 4 "Unsafe" 88 "Don't Know" 99 "Refused to Answer" 
label values safety_after_dark safety_after_dark
tab safety_after_dark state, col row cell
graph hbar (sum) safety_after_dark, over(state) by(, title(Safety & Security of Individuals in Communities After Dark)) by(safety_after_dark)
graph pie safety_after_dark, over(state) missing pie(_all, explode) plabel(_all percent) by(, title(Safety & Security of Individuals in Communities After Dark)) by(safety_after_Dark)

*** Q213; How safe would feel walking alon during day times ?***
tab safewalkingduringday state, col row

*** Q214; How safe would u feel walking alone outside of PoC/Village/town?
destring walkingoutsidePocVillage, gen(safety_outside_POC)
tab walkingoutsidePocVillage state, col row

*** Q215; What Motivates your movements outside your PoC/Village/town?***( Multiple Responses Variable) ****
destring Q2151, gen(Q2151_a)
destring Q2152, gen(Q2152_b)
destring Q2153, gen(Q2153_b)
destring Q2154, gen(Q2154_b)
destring Q2155, gen(Q2155_b)
destring Q2156, gen(Q2156_b)
destring Q2157, gen(Q2157_b)
destring Q2158, gen(Q2158_b)

label var Q2152_b "What motivates your movements outside your PoC/village/community(1.To collect resources firewood/charcoal/food/other supplies)"
label var Q2153_b "What motivates your movements outside your PoC/village/community(2.To access services)"
label var Q2154_b "What motivates your movements outside your PoC/village/community(3.To visit the market)"
label var Q2155_b "What motivates your movements outside your PoC/village/community(4.To visit friends/family)"
label var Q2156_b "What motivates your movements outside your PoC/village/community(5.To study)"
label var Q2157_b "What motivates your movements outside your PoC/village/community(6.To conduct business)"
label var Q2158_b "What motivates your movements outside your PoC/village/community(7.To visit pre-crisis home)"

 mrtab Q2152_b Q2153_b Q2154_b Q2155_b Q2156_b Q2157_b Q2158_b, include response (2 3 4 5 6 7 8) by(Q11) col sort des // by gender cross tabulations
 mrtab Q2152_b Q2153_b Q2154_b Q2155_b Q2156_b Q2157_b Q2158_b, include response (2 3 4 5 6 7 8) by(C) col sort des /// by states


*** Q216; How safe and secure you and your family are cf. to 1 year ago*** 
destring Q216, gen(safety_now)
label define safety_now 1 "More safe" 2 "No Change, same" 3 "Less Safe" 4 "Others" 88 "Don't Know" 99 "Refused to Answer" 
label values safety_now safety_now
tab safety_now state
drop if safety_now==4
graph hbar (sum) safety_now, over(state) by(, title(Safety of Individuals in Communities Compared to One year Ago)) by(safety_now)

****Q216; Other options/answers****
tab Q216_Other state  /// Remove double coded labels e.g 1, 2, 3 as in q216 above ,etc.

***** Q2171; Who from community would you reach out first if there is a conflict or security***(However Poorly Coded) 
ren Q2171 Reachoutfirst
destring Reachoutfirst, gen(Reach_Out_Org)
label define Reach_Out_Org 1 "Community Leader" 2 "Neighbor" 3 "UN Authorities" 4 "Local Leadership" 5 "Community Protection team" ///
6 "Religious leader" 7 "Elders" 8 "Youth Peacekeeping Local Leadership" 9 "Police" 10 "NGO" 11 "Women's Peacekeeping Teams" 13 "Block Leaders" 14 "Zone Leaders" 15 "Others" 88 "Dont Know" 99 "Refused to Answer" 
label values Reach_Out_Org Reach_Out_Org
drop if Reach_Out_Org==12
tab Reach_Out_Org state, col row 
catplot state Reach_Out_Org  [w= Reach_Out_Org ], percent( Reach_Out_Org) asyvars stack subtitle(% state)legend(on cols(4))

**** Q2171; Other Responses ** Given Out****
tab Q217_Other state, col row cell /// Remove double coded labels e.g 1, 2, 3 as in q2171 above ,etc.///

**** Q218; What would MOST like to see done to improve your security?****
ren Q218 Mostlikebedone
destring Mostlikebedone, gen(Most_Like_Done)
label define Most_Like_Done 1 "Nothing" 2 "NGO projects for security" 3 "Better policing" 4 "Better Army" 5 "Socially responsible citizenry" ///
6 "Social and Political action" 7 "Suppot to re-locate" 8 "Prayers" 9 "Community Policing" 10 "Trainings" 11 "Others" 88 "Dont Know" 99 "Refused to Answer" 
label values Most_Like_Done Most_Like_Done
tab Most_Like_Done state, col row
catplot state Reach_Out_Org  [w= Most_Like_Done ], percent( Most_Like_Done) asyvars stack subtitle(% state)legend(on cols(4))
histogram Most_Like_Done, percent xtitle(, size(large) color(green) orientation(horizontal)) by(, title(What Must Be Done to Improve Security)) legend(colgap(large) region(fcolor(yellow))) by(state, total) xla(, labsize(*0.8))

*** Q218_Others : Other Responses solicited from respondents***8
table Q218_Other state, col row


**** Q219;Are there any institiutions/ organisations offering general protetcion and support services in your area? ****
ren Q219 Institns 
destring Institns, gen(Instns_offering_General)
label define Instns_offering_General 1 "YES" 2 "NO" 3 "Dont Know"
label values Instns_offering_General Instns_offering_General
drop if Instns_offering_General==4
drop if Instns_offering_General==6
drop if Instns_offering_General==7
tab Instns_offering_General state, col row
graph pie Instns_offering_General, over(state) missing pie(_all, explode) plabel(_all percent) by(, title(Awareness About Instns Offering General Protn Services)) by(Instns_offering_General) legend(on cols(4))

*** Q220; Which Organisations Do You Know?*** Multiple Response are allowed**** 
/*destring Q2201, gen(Orgn)
label define Orgn 1 "NGOs" 2 "Health Center" 3 "Police" 4 "Others"
label values Orgn Orgn
drop if Orgn==5 
drop if Orgn==7
graph bar Orgn ,by(state) name(B,replace)
graph pie Orgn, over(state) missing pie(_all, explode) plabel(_all percent) by(, title(Awareness About Which Instns Respondents Know Offering GP services)) by(Orgn) legend(on cols(4))*/


*** Q220; Which Organisations Do You Know?*** Multiple Response are allowed**** 

destring Q2201, gen(Q2201_a)
destring Q2202, gen(Q2203_b)
destring Q2203, gen(Q2204_c)

label var Q2201_a "Which organisations do you know?(1. NGOs)"
label var Q2203_b "Which organisations do you know?(2. Health centers)"
label var Q2204_c "Which organisations do you know?(1. Police)"

mrtab Q2201_a Q2203_b Q2204_c, by(C) col include response(1 2 3) sort des
mrtab Q2201_a Q2203_b Q2204_c, by(Q11) col include response(1 2 3) sort des

/*destring Q2202, gen(Orgn1)
label define Orgn1 1 "NGOs" 2 "Health Center" 3 "Police" 4 "Others"
label values Orgn1 Orgn1*/

*graph bar Orgn1 ,by(state) name(A,replace)

/*destring Q2203, gen(Orgn2)
label define Orgn2 1 "NGOs" 2 "Health Center" 3 "Police" 4 "Others"
label values Orgn2 Orgn2
graph bar Orgn2 ,by(state) name(C,replace)*/

*graph combine A B C 


*** Q220_Other; Which Organisations Do You Know?***

table Q220_Other state,col row ////Explain in terms of NP reference to others///


******* SECTION 3 CHILD PROTECTION ***************************************************************************

*** Load Data Afresh Again*****
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear

	

***Q31; How do you see safety and Security of Children in this Community***
ren Q31 sschild
destring sschild, gen(SSCHILD)
label define SSCHILD 1 "safe" 2 "Somewhat safe" 3 "somewhat unsafe" 4 "Unsafe" 88 "Don't Know" 99 "Refused to Answer" 
label values SSCHILD SSCHILD
drop if SSCHILD==9
tab SSCHILD state,col row cell
graph bar SSCHILD ,by(state) name(A,replace)
catplot state SSCHILD  [w= SSCHILD ], percent( SSCHILD) asyvars stack subtitle(% state)legend(on cols(4))


*** Q32; How Do You rate the risk and Death of children in Your Community compared to a year ago****
ren Q32 RDChild
destring RDChild, gen(rdchild)
label define rdchild 1 "Increased" 2 "Decreased" 3 "Remained the same" 88 "Don't Know" 99 "Refused to Answer" 
label values rdchild rdchild 
drop if rdchild==10 
tab rdchild state, col row 
graph hbar (sum) rdchild, over(state) by(, title(Rating of Child Risks that lead to Death Cf. to One year Ago)) by(rdchild)
graph hbar (mean) rdchild, over(state) by(, title(Rating of Child Risks that lead to Death Cf. to One year Ago)) by(rdchild)
graph hbar (median) rdchild, over(state) by(, title(Rating of Child Risks that lead to Death Cf. to One year Ago)) by(rdchild)

*** Q33; Do You believe in Physical Punishment of Children (Likert Scale)(LIKERT SCALE)****
ren Q33 childpunish
destring childpunish, gen(ChildPunish)
label define ChildPunish 1 "Strongly Agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 88 "Don't Know" 99 "Refused to Answer" 
label values ChildPunish ChildPunish
drop if ChildPunish==Refused to Answer
graph pie ChildPunish, over(state) missing pie(_all, explode) plabel(_all percent) by(, title(Belief In Child Physical Punishment)) by(ChildPunish)



***Q34; What Do  children need protection from ?(Multiple Response)****
destring Q341, replace
destring Q342, replace
destring Q343, replace
destring Q344, replace
destring Q345, replace
destring Q346, replace
destring Q347, replace
destring Q348, replace
drop if Q341=="nonviolent"
destring Q349, replace

label var Q341 "What do children need protection from?(Physical abuse)"
label var Q342 "What do children need protection from?(Child labor)"
label var Q343 "What do children need protection from?(Child sexual abuse)"
label var Q344 "What do children need protection from?(neglect/abandoment)"
label var Q345 "What do children need protection from?(abductions)"
label var Q346 "What do children need protection from?(emotional abuse)"
label var Q347 "What do children need protection from?(forced marriage)"
label var Q348 "What do children need protection from?(Early marriages)"
label var Q349 "What do children need protection from?(depriving the right to education)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchildprotec.doc") word replace: ///
mrtab Q341 Q342 Q343 Q345 Q346 Q347 Q348 Q349, by(C) col include response(1 2 3 4 5 6 7 8 9) sort des





***Q34; Other responses;


****Q35; What do Think are the Specific Childrens Rights (Multiple Response)****
destring Q351, replace
destring Q352, replace
destring Q353, replace
destring Q354, replace
destring Q355, replace
destring Q356, replace
destring Q357, replace
destring Q358, replace
destring Q349, replace
destring Q3510, replace
destring Q3511, replace

label var Q351 "What do you think are the children's specific rights?(The Right to life)"
label var Q352 "What do you think are the children's specific rights?(The Right to have parents)"
label var Q353 "What do you think are the children's specific rights?(The child's right to birth registration)"
label var Q354 "What do you think are the children's specific rights?(The child's right to a name, nationality and family relations)"
label var Q355 "What do you think are the children's specific rights?(The child's right to freedom of expression)"
label var Q356 "What do you think are the children's specific rights?(The right of child belongoing to ethnic)"
label var Q357 "What do you think are the children's specific rights?(The Right to be protected from economic exploitation)"
label var Q358 "What do you think are the children's specific rights?(The Right to be protected from sexual child exploitation)"
label var Q359 "What do you think are the children's specific rights?(The Right to be protected from other child's exploitation)"
label var Q3510 "What do you think are the children's specific rights?(The Right a standard of living)"
label var Q3511 "What do you think are the children's specific rights?(The Right to education)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchildrights.doc") word replace: ///
mrtab Q351 Q353 Q354 Q355 Q356 Q357 Q358  Q3510 Q3511, by(C) col include response(1 2 3 4 5 6 7 8 9 10 11) sort des 


*** Q36; Most Common Abuses/Violence that children face in your face(Multiple Response)***

destring Q361, replace
destring Q362, replace
destring Q363, replace
destring Q364, replace
destring Q365, replace
destring Q366, replace
destring Q367, replace
destring Q368, replace
destring Q369, replace

label var Q361 "What are most common abuses of children?(pysical abuse)"
label var Q362 "What are most common abuses of children?(child labour)"
label var Q363 "What are most common abuses of children?(child sexual abuse)"
label var Q364 "What are most common abuses of children?(neglect/abondonment)"
label var Q365 "What are most common abuses of children?(abductions)"
label var Q366 "What are most common abuses of children?(emotional abuse)"
label var Q367 "What are most common abuses of children?(forced marriage)"
label var Q368 "What are most common abuses of children?(early marriage)"
label var Q369 "What are most common abuses of children?(depriving the right to education)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchilviolencemost.doc") word replace: ///
mrtab Q361 Q362 Q363  Q365 Q366 Q367 Q368 Q369, by(C) col include response( 1 2 3 4 5 6 7 8 9) sort des 



***Q37; What are the perpertors of this Violence( Multiple Response)*****

destring Q371, replace 
destring Q372, replace 
destring Q373, replace 
destring Q374, replace 
destring Q375, replace 

label var Q371 "What are the perpetrators of this violence?(parents)"
label var Q372 "What are the perpetrators of this violence?(strangers)"
label var Q373 "What are the perpetrators of this violence?(relatives)"
label var Q374 "What are the perpetrators of this violence?(neighbor)"
label var Q375 "What are the perpetrators of this violence?(policy/army)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchilvioleperp.doc") word replace: ///
mrtab Q371 Q372 Q373 Q374 Q375, by(C) col include response(1 2 3 4 5) sort des 


***Q38; If Child can ask for Help****
ren Q38 childask4help
destring childask4help, gen(Children_Help)
label define Children_Help 1 "Yes" 2 "No" 88 "Don't Know" 99 "Refuse to Answer" 
label values Children_Help Children_Help
drop if Children_Help==9
drop if Children_Help==12
tab Children_Help state, col row cell
graph hbar (sum) Children_Help, over(state) by(, title(Children Ask for Help In case of Abuse)) by(Children_Help)


****Q39; If A Child faces Violence where and to whom can he/she ask for help(Multiple Responses)****
destring Q391, replace 
destring Q392, replace 
destring D2Q393, replace 
destring Q394, replace 
destring Q395, replace 
destring Q396, replace 
destring Q397, replace 

label var Q391 "Where and to whom can he/she ask for help(Police)"
label var Q392 "Where and to whom can he/she ask for help(community leaders)"
label var D2Q393 "Where and to whom can he/she ask for help(NGO/CBO)"
label var Q394 "Where and to whom can he/she ask for help(Health care)"
label var Q395 "Where and to whom can he/she ask for help(Parents/caregivers)"
label var Q396 "Where and to whom can he/she ask for help(relatives)"
label var Q397 "Where and to whom can he/she ask for help(religious leaders)"
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchildwhere.doc") word replace: ///
mrtab Q391 Q392 D2Q393 Q394 Q395 Q396 Q397, by(C) col include response(1 2 3 4 5 6 7) sort des 

*** Q310; What type of help would she/he recieve?(Multiple Responses) ***

destring Q3101, replace
destring Q3102, replace
destring Q3103, replace
destring Q3104, replace
destring Q3105, replace
destring Q3106, replace

label var Q3101 " What type of help would she/he receive(Health care)"
label var Q3102 " What type of help would she/he receive(psyco-social support)"
label var Q3103 " What type of help would she/he receive(legal aid)"
label var Q3104 " What type of help would she/he receive(counselling)"
label var Q3105 " What type of help would she/he receive(Referral)"
label var Q3106 " What type of help would she/he receive(accompaniment)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descctype.doc") word replace: ///
mrtab Q3101 Q3102 Q3103 Q3104 Q3105 Q3106, by(C) col include response(1 2 3 4 5 6) sort des 

*** Q311; Do You child Protection services are accessible in your community***
ren Q311 AccessChildprotection
destring AccessChildprotection, gen(AcessChild)
label define AcessChild 1 "Yes" 2 "No" 
label values AcessChild AcessChild 
drop if AcessChild==4 
drop if AcessChild==88
tab AcessChild state, col row 

**** Q312; If No in Q311 above, What are obstacles do children/parents face in accessing these services***
ren Q312 child
destring child, gen(Child_Accessibility)
label define Child_Accessibility 1 "Distance" 2 "Poor Service Delivery" 3 "Safety Concerns" 4 "Others"
label values Child_Accessibility Child_Accessibility

tab childobstacles state, col row
drop if childobstacles==5 

***Q313;  To what extent do child protection services support/meet needs of children***
ren Q313 meetschildneeds
destring meetschildneeds, gen(Meets_Child_Needs)
label define Meets_Child_Needs 1 "Meets needs" 2 "Partially meet needs" 3 "Don't meet needs" 88 "Don't Know" 99 "refused to Answer" 
label values Meets_Child_Needs Meets_Child_Needs
drop if Meets_Child_Needs==7
tab Meets_Child_Needs state, col row 
graph hbar (sum) Meets_Child_Needs, over(state) by(, title(Children Protection Meets Needs)) by(Meets_Child_Needs)

*** Q314; In Your Own Opinion, How Important are Children Protection services specifically to children***///
destring Q314, gen(Child_Protection_Importance)
label define Child_Protection_Importance 1 "Very Important" 2 "Moderately important" 3 "Not Important" 4 "Don't Know" 
label values Child_Protection_Importance Child_Protection_Importance
drop if Child_Protection_Importance==11
tab Child_Protection_Importance state, col row

*** Q315; Are there safe places for children in this community**
destring Q315, gen(Safe_Child_Places)
label define Safe_Child_Places 1 "Yes" 2 "No" 
label values Safe_Child_Places Safe_Child_Places
catplot state Safe_Child_Places  [w= Safe_Child_Places ], percent( Safe_Child_Places) asyvars stack subtitle(% State Safe Child Places in Communities )legend(on cols(4))
graph export results.pdf
drop if Safe_Child_Places==3
drop if Safe_Child_Places==9

table Safe_Child_Places state, col row
tab Safe_Child_Places state, col row

***Q316; If yes in (Q315 above), Are children in this household attending thses safe_Child_places***
destring Q316, gen(Attendance_CFS)
label define Attendance_CFS 1 "Yes" 2 "No" 3 "Sometimes"
label values Attendance_CFS Attendance_CFS
drop if Attendance_CFS==4
drop if Attendance_CFS==88

tab Safe_Child_Places Attendance_CFS, col row 
catplot Attendance_CFS Safe_Child_Places  [w= Safe_Child_Places ], percent( Safe_Child_Places) asyvars stack subtitle(% Attendance_CFS in Communities )legend(on cols(4))

****Q317; If yes in (Q315 above) , Have you Noticed changes in Children behavior since they started attending CFS**
destring Q317, gen(Child_Changes2)
label define Child_Changes2 1 "Yes" 2 "No" 3 "Don't Know" 
label values Child_Changes2 Child_Changes2 

tab Safe_Child_Places Child_Changes2, col row



***Q318; If yes in(Q317 above), What kind of behaviors changes have you noticed (Multiple Responses)***

destring Q3181, replace
destring Q3182, replace
destring Q3183, replace
destring Q3184, replace
destring Q3185, replace
*destring Q3186, replace
destring Q3187, replace
destring Q3188, replace
destring Q3189, replace
destring Q31810, replace
destring Q31811, replace

label var Q3181 "What kind of bahaviors have you noticed?(1. Attending school regularly)"
label var Q3182 "What kind of bahaviors have you noticed?(2. Caring for others in community)"
label var Q3183 "What kind of bahaviors have you noticed?(3. spending more time on sport and playing)"
label var Q3184 "What kind of bahaviors have you noticed?(4. helping parents more than before)"
label var Q3185 "What kind of bahaviors have you noticed?(5. spending more time with friends)"
label var Q3187 "What kind of bahaviors have you noticed?(7. Unwilling to go to school)"
label var Q3188 "What kind of bahaviors have you noticed?(8. Disrespectful behavior in the family)"
label var Q3189 "What kind of bahaviors have you noticed?(9. sadness)"
label var Q31810 "What kind of bahaviors have you noticed?(10. anti-social bahaviors)"
label var Q31811 "What kind of bahaviors have you noticed?(11. engaging in high risk sexual bahavior)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchildbahaviors.doc") word replace: ///
mrtab Q3181 Q3182 Q3183 Q3184 Q3185 Q3187 Q3188 Q3189 Q31810 Q31811, by(C) col include response(1 2 3 4 5 7 8 9 10 11) sort des



***Q319; Have Noticed any changes  in parents/guardians behaviors since they started participating in CFS Trainings ***
destring Q319, gen(Parents_Beh_Changes)
label define Parents_Beh_Changes 1 "Yes" 2 "No" 3 "Don't Know" 4 "No Response" 
label values Parents_Beh_Changes Parents_Beh_Changes
drop if Parents_Beh_Changes==5
drop if Parents_Beh_Changes==88
drop if Parents_Beh_Changes==8
tab Parents_Beh_Changes state, col row

**** Q320; If You know a child was experiencing Abuse, What Would do? ***
destring Q320, gen(Child_Abuse_Do)
label define Child_Abuse_Do 1 "Confront the perpetrator" 2 "Offer care to the Child" 3 "Keep quiet/do nothing" 4 "Others" 88 "Don't Know" 99 "Refuse to Answer"
label values Child_Abuse_Do Child_Abuse_Do
drop if Child_Abuse_Do==9
tab Child_Abuse_Do state, col row

**** Q321; Would do you report a case of child abuse****
destring Q321, gen(Child_Abuse_Report)
label define Child_Abuse_Report 1 "Yes" 2 "No" 
label values Child_Abuse_Report Child_Abuse_Report
drop if Child_Abuse_Report==3
drop if Child_Abuse_Report==99
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desc5.doc") word replace: ///
tab Child_Abuse_Report state, col row
****If No, what would be your reasons for not reporting a case of child abuse***

*** Q322; If yes in (Q321 above) to whom would do you report a case of child abuse(Multiple Response Qn) ****
destring Q3221, replace 
destring Q3222, replace 
destring Q3223, replace 
destring Q3224, replace 
destring Q3225, replace 
*destring Q3226, replace 
destring Q3227, replace 
destring Q3228, replace 
destring Q3229, replace 

label var Q3221 "To whom do report a case of child abuse?(1. M'ber of child's family)"
label var Q3222 "To whom do report a case of child abuse?(2. Chief/community leader)"
label var Q3223 "To whom do report a case of child abuse?(3. child protection committee)"
label var Q3224 "To whom do report a case of child abuse?(4. Religious leader)"
label var Q3225 "To whom do report a case of child abuse?(5. school/school organisation)"
*label var Q3226 "To whom do report a case of child abuse?(6. social/health worker)"
label var Q3227 "To whom do report a case of child abuse?(7. Government authority)"
label var Q3228 "To whom do report a case of child abuse?(8. NGO authority)"
label var Q3229 "To whom do report a case of child abuse?(9. Police)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchildabusereport_to.doc") word replace: ///
mrtab Q3221 Q3222 Q3223 Q3224 Q3225 Q3227 Q3228 Q3229, by(C) col include response(1 2 3 4 5 7 8 9) sort des

*** Q323; If No in (Q321 above) What reasons for not reporting a case of child abuse(Multiple Response Qn) ****
destring Q3231, replace 
destring Q3232, replace 
destring Q3233, replace 
destring Q3234, replace 
destring Q3235, replace 
destring Q3236, replace 

label var Q3231 "What reasons for not reporting a case of child abuse?(1. Don't know where or who to report to)"
label var Q3232 "What reasons for not reporting a case of child abuse?(2. No Action is likely to be taken)"
label var Q3233 "What reasons for not reporting a case of child abuse?(3. It is not my business)"
label var Q3234 "What reasons for not reporting a case of child abuse?(4. Its normal for such things to happen)"
label var Q3235 "What reasons for not reporting a case of child abuse?(5. Fear of retaliation"
label var Q3236 "What reasons for not reporting a case of child abuse?(6. Prefer to speak to perprator first)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descchildabusereasons_for_NOT_Reporting.doc") word replace: ///
mrtab Q3231 Q3232 Q3233 Q3234 Q3235 Q3236, by(C) col include response(1 2 3 4 5 6) sort des


**** wQ324; Are You interested in  trainings (Lessons/courses) that could help you in dealing with child care and protection activities***
destring Q324, gen(Interest_Trainings)
label define Interest_Trainings 1 "Yes" 2 "No" 
label values Interest_Trainings Interest_Trainings
drop if Interest_Trainings==3
drop if Interest_Trainings==4
drop if Interest_Trainings==11
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desc3.xlsx") excel replace: ///
tab Interest_Trainings state, col row 


*** Q325;If Yes in (Q324 above), For which issues/problems would you prefer to be trained?( Multiple Response)***
 destring Q3251, replace
 destring Q3252, replace 
 destring Q3253, replace
 destring Q3254, replace
 destring Q3255, replace
 destring Q3256, replace
 destring Q3257, replace
 destring Q3258, replace
destring Q3259, replace
destring Q32510, replace
destring Q32511, replace
destring Q32512, replace


label var Q3251 "Training for which issues/problems would you prefer?(1. Violence against children)"
label var Q3252 "Training for which issues/problems would you prefer?(2. Sexuality & Children)"
label var Q3253 "Training for which issues/problems would you prefer?(3. Risk Behaviors)"
label var Q3254 "Training for which issues/problems would you prefer?(4. Sexual education)"
label var Q3255 "Training for which issues/problems would you prefer?(5. Teenage pregnancy)"
label var Q3256 "Training for which issues/problems would you prefer?(6. Family planning)"
label var Q3257 "Training for which issues/problems would you prefer?(7. Sexual Violence)"
label var Q3258 "Training for which issues/problems would you prefer?(8. Childrens rights)"
label var Q3259 "Training for which issues/problems would you prefer?(9. Nutrition & Hygiene)"
label var Q32510 "Training for which issues/problems would you prefer?(10. First Aid)"
label var Q32511 "Training for which issues/problems would you prefer?(11. Sexual Transmitted Disease)"
label var Q32512 "Training for which issues/problems would you prefer?(12. family Reinforcement)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descTrainings_Prefer.doc") word replace: ///
mrtab Q3251 Q3252 Q3253 Q3254 Q3255 Q3256 Q3257 Q3258 Q3259 Q32510 Q32511 Q32512, by(Interest_Trainings) col include response(1 2 3 4 5 6 7 8 9 10 11 12) sort des
****Q326; Is/are there(a) child protection committee(s) in this community
destring Q326, gen(CPC)
label define CPC 1 "Yes" 2 "No" 
label values CPC CPC
drop if CPC==3
drop if CPC==4
drop if CPC==5
drop if CPC==6
drop if CPC==88

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desc2.xlsx") excel replace: ///
tab CPC state 

histogram CPC, by(state, cols(1)) start(0) percent xtitle(Child Protection ) xlabel(0(2)5) legend(off)
histogram CPC, percent title(Child Protection Committees)

****Q327;  What did you would think is the role of CPC (Multiple Response)****
destring Q3271, replace 
destring Q3272, replace 
destring Q3273, replace 
destring Q3274, replace 
destring Q3275, replace 

label var Q3271 "What Do You should/is the role of CPC?(1.Raise awareness on child rights)"
label var Q3272 "What Do You should/is the role of CPC?(2.Monitor Child Protection in community/identify vulnerable childrn)"
label var Q3273 "What Do You should/is the role of CPC?(3.Give advice to children, parents, and other community mbrs)"
label var Q3274 "What Do You should/is the role of CPC?(4.care children in ECD centers 4)"
label var Q3275 "What Do You should/is the role of CPC?(5.Refer cases to social workers)"



logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descCPCRole_inCommunity.doc") word replace: ///
mrtab Q3271 Q3272 Q3273 Q3274 Q3275, by(C) col include response(1 2 3 4 5) sort des

 
 *** Likert Scale *** 
 ** 1. Strongly Agree , 2. Agree, 3. Neutral, 4. Disagree, 5. Strongly Agree, 88. Donot Know, 
destring Q328, gen(Adult_Beat_Child)
destring Q329, gen(Child_abused)
destring Q330, gen(Child_Dont_Speak)
destring Q331, gen(ChildAbusers_Poor)
destring Q332, gen(Child_Marriage_ok)
destring Q333, gen(Child_Family_Outside)
destring Q334, gen(Child_Without_Higher_Risks)
destring Q335, gen(Child_support_Family)

label define  Adult_Beat_Child 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values Adult_Beat_Child Adult_Beat_Child

 
label define Child_abused 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values Child_abused Child_abused


label define  Child_Dont_Speak 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values Child_Dont_Speak Child_Dont_Speak


label define  ChildAbusers_Poor 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values ChildAbusers_Poor ChildAbusers_Poor


label define  Child_Marriage_ok 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values Child_Marriage_ok Child_Marriage_ok


label define  Child_Family_Outside 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values Child_Family_Outside Child_Family_Outside


label define  Child_Without_Higher_Risks 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values Child_Without_Higher_Risks Child_Without_Higher_Risks


label define  Child_support_Family 1 "Strongly Agree" 2 "Agree" 3 "Neutral" 4 "Disagree" 5 "Strongly Disagree" 88 "Dont Know/Refused to Answer"
label values Child_support_Family Child_support_Family


logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desc5.xlsx") excel replace: ///
tab Child_support_Family state, col row 


*** Tables and Summary stats***
*logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\desc.xlsx") excel replace: ///
*tabstat Adult_Beat_Child Child_abused Child_Dont_Speak ChildAbusers_Poor Child_Marriage_ok Child_Family_Outside Child_Without_Higher_Risks Child_support_Family, stats (N mean sd  min max cv sk k)col (var) by(state) nototal


*** Others Stats Based on Gender*** 
*bys Gender: tabstat Adult_Beat_Child Child_abused Child_Dont_Speak ChildAbusers_Poor Child_Marriage_ok Child_Family_Outside Child_Without_Higher_Risks Child_support_Family, stats(n mean sd min max)
bysort gender: tabstat education, stats(n mean sd min max)///



 
******* SECTION 4 GBV Prevention & Response****************************************************************************
*** Load Data Afresh Again*****
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear



*****Q41; Types of Violence(Multiple Responses)******

destring Q411, replace 
destring Q412, replace 
destring Q413, replace 
destring Q414, replace 
destring Q415, replace 
destring Q416, replace 
destring Q417, replace 
destring Q418, replace 
destring Q419, replace 
destring Q4110, replace 
destring Q4111, replace 
destring Q4112, replace 


label var Q411 " List types of GBV that you know?(1. Denial of resources)"
label var Q412 " List types of GBV that you know?(2. Emotional violence)"
label var Q413 " List types of GBV that you know?(3. Forced marriage)"
label var Q414 " List types of GBV that you know?(4. Early marriage)"
label var Q415 " List types of GBV that you know?(5. Hitting)"
label var Q416 " List types of GBV that you know?(6. Insults & Intimidation)"
label var Q417 " List types of GBV that you know?(7. Rape)"
label var Q418 " List types of GBV that you know?(8. Sexual harassment)"
label var Q419 " List types of GBV that you know?(9. Restrictions of freedom of movement)"
label var Q4110 " List types of GBV that you know?(10. sexual deprivation)"
label var Q4111 " List types of GBV that you know?(11. isolation from friends/family members)"
label var Q4112 " List types of GBV that you know?(12. Early marriages for girls under 18yrs)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVForms_inCommunity.doc") word replace: ///
mrtab Q411 Q412 Q413 Q414 Q415 Q416 Q417 Q418 Q419 Q4110 Q4111 Q4112, by(C) col include response(1 2 3 4 5 6 7 8 9 10 11 12) sort des

*****Q42; To what Extent do you think GBV is a problem in the community**
destring Q42, gen(GBV)
label define GBV 1 "Major Problem" 2 "Moderate Problem" 3 "Minor Problem" 4 "Not a Problem" 88 "Dont Know" 99 "Refused to Answer" 
label values GBV GBV
drop if GBV==5
drop if GBV==6
drop if GBV==7
drop if GBV==11

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBV.xlsx") excel replace: /// 
tab GBV state, col row
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBV2.xlsx") excel replace: /// 
tab GBV gender, col row
drop if gender==.
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBV3.xlsx") excel replace: /// 
bysort gender: tabstat GBV, stats(n mean sd min max)

catplot state GBV  [w= GBV], percent( GBV) asyvars stack subtitle(%  state GBV_problem  )legend(on cols(6))
catplot gender GBV [w= GBV], percent( GBV) asyvars stack subtitle(% gender GBV_problem  )legend(on cols(6))

*****Q43; What are Major Forms of GBV occuring in the community( Multiple Responses)****
destring Q431, replace 
destring Q432, replace 
destring Q433, replace 
destring Q434, replace 
destring Q435, replace 
destring Q436, replace 
destring Q437, replace 
destring Q438, replace 
destring Q439, replace 
destring Q4310, replace 
destring Q4311, replace 
destring Q4312, replace 


label var Q431 " What are main forms of GBV occuring in community?(1. Denial of resources)"
label var Q432 " What are main forms of GBV occuring in community?(2. Emotional violence)"
label var Q433 " What are main forms of GBV occuring in community?(3. Forced marriage)"
label var Q434 " What are main forms of GBV occuring in community?(4. Early marriage)"
label var Q435 " What are main forms of GBV occuring in community?(5. Hitting)"
label var Q436 " What are main forms of GBV occuring in community?(6. Insults & Intimidation)"
label var Q437 " What are main forms of GBV occuring in community?(7. Rape)"
label var Q438 " What are main forms of GBV occuring in community?(8. Sexual harassment)"
label var Q439 " What are main forms of GBV occuring in community?(9. Restrictions of freedom of movement)"
label var Q4310 " What are main forms of GBV occuring in community?(10. sexual deprivation)"
label var Q4311 " What are main forms of GBV occuring in community?(11. isolation from friends/family members)"
label var Q4312 " What are main forms of GBV occuring in community?(12. Early marriages for girls under 18yrs)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVForms_inCommunity.doc") word replace: ///
mrtab Q431 Q432 Q433 Q434 Q435 Q436 Q437 Q438 Q439 Q4310 Q4311 Q4312, by(C) col include response(1 2 3 4 5 6 7 8 9 10 11 12) sort des


*****Q44; What are the Consequences of GBV(Multiple Responses)****
destring Q441, replace
destring Q442, replace
destring Q443, replace
destring Q444, replace
destring Q445, replace
destring Q446, replace
destring Q447, replace
destring Q448, replace
destring Q449, replace

label var Q441 "What are the consequencies of GBV(1. Injury/disability)"
label var Q442 "What are the consequencies of GBV(2. Unwanted pregnancy)"
label var Q443 "What are the consequencies of GBV(3. Sexuality transmitted disease and other health problem)"
label var Q444 "What are the consequencies of GBV(4. Depresssion/emotional problems/suicide)"
label var Q445 "What are the consequencies of GBV(5. Rejection by family or husband)"
label var Q446 "What are the consequencies of GBV(6. Isolation from friend/family members)"
label var Q447 "What are the consequencies of GBV(7. Early Marriage)"
label var Q448 "What are the consequencies of GBV(8. Forced Marriage)"
label var Q449 "What are the consequencies of GBV(9. Povery & Loss of property)"
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVConsequencies_inCommunity.doc") word replace: ///
mrtab Q441 Q442 Q443 Q444 Q445 Q446 Q447 Q448  Q449, by(C) col include response(1 2 3 4 5 6 7 8 9) sort des


*****Q45; In Your Opinion, how is the Prevalence of GBV compared to one year ago****
destring Q45, gen(Gbvprevalence)
label define Gbvprevalence 1 "Increased" 2 "Decreased" 88 "Dont Know" 99 "Refused to Answer"
label values Gbvprevalence Gbvprevalence
 drop if Gbvprevalence==4
 drop if Gbvprevalence==7
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVPr.xlsx") excel replace: /// 
tab Gbvprevalence state, col row 
catplot state GBV  [w= Gbvprevalence], percent( Gbvprevalence) asyvars stack subtitle(%  state Gbvprevalence  )legend(on cols(6))
catplot gender GBV  [w= Gbvprevalence], percent( Gbvprevalence) asyvars stack subtitle(%  gender Gbvprevalence  )legend(on cols(6))
graph hbar (mean) gender Gbvprevalence, over(state)

***Q46; Who are the main perpertors of Violence/promoters of Violence(Multiple Responses)***

destring Q461, replace
*destring Q462, replace
destring Q463, replace
destring Q464, replace
destring Q465, replace
destring Q466, replace
destring Q467, replace
destring Q468, replace
destring Q469, replace
destring Q4610, replace

label var Q461 "What are main perptrators of GBV(1. Husband/By friend)"
label var Q462 "What are main perptrators of GBV(2. Women/girls)"
label var Q463 "What are main perptrators of GBV(3. Parent)"
label var Q464 "What are main perptrators of GBV(4. Other member of community)"
label var Q465 "What are main perptrators of GBV(5. Neighbor/community member/PoC member)"
label var Q466 "What are main perptrators of GBV(6. Police or army)"
label var Q467 "What are main perptrators of GBV(7. other armed youth/gangs)"
label var Q468 "What are main perptrators of GBV(8. Religious leaders)"
label var Q469 "What are main perptrators of GBV(9. Community leader)"
label var Q4610 "What are main perptrators of GBV(10. Stranger/unknown person)"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVMainperprtaors_inCommunity.doc") word replace: ///
mrtab Q461 Q463 Q464 Q465 Q466 Q467 Q468 Q469 Q4610, by(C) col include response(1 2 3 4 5 6 7 8 9 10) 




***Q47; From which following places where do you think the risk of Violence is MORE prevalent ****
destring Q47, gen(Gbvplaces)
label define Gbvplaces 1 "At Home" 2 "At Toilet/shower" 3 "At Firewood collection places" 4 "In a neighbor's friend's home" 5 "At Market" ///
6 "On the street/at public spaces" 7 "At school" 8 "At the work places" 9 "At hospital/health center" 10 "Others" 88 "Dont Know" 99 "Refused to Answer"
label values Gbvplaces Gbvplaces 

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVPlaces.xlsx") excel replace: /// 
tab Gbvplaces state, col row
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVPlaces2.xlsx") excel replace: /// 
tab Gbvplaces gender, col row
catplot gender Gbvplaces  [w= gender], percent( gender) asyvars stack subtitle(%  Gender More GBV Prevalent Places  )legend(on cols(6))

***Q47 Other Responses; 


******Q48; Have you been or member of your family been a victim of violence related to gender***
destring Q48, gen(Gbvvictim)
label define Gbvvictim 1 "Yes" 2 "No" 99 "Refused to Answer" 
label values Gbvvictim Gbvvictim
drop if Gbvvictim==7
drop if Gbvvictim==8 
drop if Gbvvictim==9
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVvictim.xlsx") excel replace: /// 
tab Gbvvictim gender, col row
catplot gender Gbvvictim  [w= gender], percent( gender) asyvars stack subtitle(%  Gender Experienced GBV  Related to Gender  )legend(on cols(6))


*****Q49; If this person wasnot you, what was the sex of the person,*** Sex of the Person experienced violence***
destring Q49, gen(Victimsex)
label define Victimsex 1 "Female" 2 "Male" 
label values Victimsex Victimsex
drop if Victimsex==88
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descvictimsex.xlsx") excel replace: /// 
tab Victimsex state, col row 
catplot gender Victimsex  [w= gender], percent( gender) asyvars stack subtitle(%  Gender Experienced GBV  Related to Gender  )legend(on cols(6))


**** Q410; If yes in (Q48 above), Where did the last incident happen***
destring Q410, gen(LastInc_event)
drop if Q410=="killing one"
label define LastInc_event 1 "At Home" 2 "At Toilet/shower" 3 "At Firewood collection places" 4 "In a neighbor's friend's home" 5 "At Market" ///
6 "On the street/at public spaces" 7 "At school" 8 "At the work places" 9 "At hospital/health center" 10 "Others" 88 "Dont Know" 99 "Refused to Answer"
label values LastInc_event LastInc_event
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVPlacesLast.xlsx") excel replace: /// 
tab LastInc_event state, col row
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVPlacesLast.xlsx") excel replace: /// 
tab LastInc_event Gbvvictim, col row
graph bar LastInc_event gender, over(state)(A, replace)

*****Q411; What types of violence has your family meber experienced(Multiple Responses)****
destring Q4111, replace
destring Q4112, replace
destring Q4113, replace
destring Q4114, replace
destring Q4115, replace
destring Q4116, replace
destring Q4117, replace
destring Q4118, replace
destring Q4119, replace


label var Q4111 "Which typ(s) of violence have you or your family member experienced(1.Hitting)"
label var Q4112 "Which typ(s) of violence have you or your family member experienced(2.Insult and intimidation)"
label var Q4113 "Which typ(s) of violence have you or your family member experienced(3.Rape)"
label var Q4114 "Which typ(s) of violence have you or your family member experienced(4.Sexual Harassment)"
label var Q4115 "Which typ(s) of violence have you or your family member experienced(5.deprivation)"
label var Q4116 "Which typ(s) of violence have you or your family member experienced(6.Restrictions/denial of freedom of movement)"
label var Q4117 "Which typ(s) of violence have you or your family member experienced(7.Isoloation)"
label var Q4118 "Which typ(s) of violence have you or your family member experienced(8.Early Marriage)"
label var Q4119 "Which typ(s) of violence have you or your family member experienced(9.Forced Marriage)"


mrtab Q4111 Q4112 Q4114 Q4115  Q4118 , by(Gbvvictim) col include response(1 2 3 4 5 6 7 8 9) sort des


***Q412; If yes in (Q48 above), Was this(these) incident(s) reported to anyone?***
destring Q412, gen(Incident_Reported)
label define Incident_Reported 1 "Yes" 2 "No" 
label values Incident_Reported Incident_Reported
drop if Incident_Reported==3
drop if Incident_Reported==4
drop if Incident_Reported==5
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVReported.xlsx") excel replace: /// 
tab Incident_Reported gender, col row 

****Q413; If yes in (Q412 above), was there any action taken against the perprator***
destring Q413, gen(Action_taken)
label define Action_taken 1 "Yes" 2 "No" 
label values Action_taken Action_taken
drop if Action_taken==3
drop if Action_taken==4
drop if Action_taken==5
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descActiontaken.xlsx") excel replace: /// 
tab Action_taken Incident_Reported, col row 
 
**** Q414; If yes in (Q412 above), how was the servivor influenced to be indulged in the violence acts***
destring Q414, gen(Indulge_Acts2)
label define Indulge_Acts2 1 "Threat to use or use of physicla force" 2 "Threat to use a weapon such a knife" 3 "Intimidation blackmailing threats to others" 4 "Others" ///
88 "Dont Know" 99 "Refused to Answer"
label values Indulge_Acts2 Indulge_Acts2
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descIndulge_acts2.xlsx") excel replace: /// 
tab Indulge_Acts2 state, col row 

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descIndulge_acts2Reported.xlsx") excel replace: /// 
tab Indulge_Acts2 Incident_Reported, col row 


graph pie state, over(Indulge_Acts2) missing pie(_all, explode) plabel(_all percent) by(, title(How Servivor Indulged in Acts)) by(state)
*graph bar state, over(Indulge_Acts2) by(, title(How Servivor Indulged in Acts)) by(state)///


**** Q415; If yes(Q414 above), was the perprator alone or with a group of other people****
destring Q415, gen(Alone_Group2)
label define Alone_Group2 1 "Alone" 2 "group/gang" 3 "Not sure" 5 "Dont Know"
label values Alone_Group2 Alone_Group2
drop if Alone_Group2==4

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descAlone_Group2_Indulgeacts2.xlsx") excel replace: /// 
tab Alone_Group2 Indulge_Acts2, col row

**** Q416 If yes in (Q48 above); What was the sex of the perpetrator of the last incident?***
destring Q416, gen(Sex_LastIncident)
label define Sex_LastIncident 1 "Male" 2 "Female" 
label values Sex_LastIncident Sex_LastIncident
drop if Sex_LastIncident==3
drop if Sex_LastIncident==4
drop if Sex_LastIncident==5
drop if Sex_LastIncident==6
tab Sex_LastIncident state, col row


****Q417; If Yes in (Q48 above), Did the GBV servivor access GBV support servies*** (%ge of those who agreed/)
destring Q417, gen(GBV_accesssupport2)
label define GBV_accesssupport2 7 "Yes" 3 "No" 
label values GBV_accesssupport2 GBV_accesssupport2
drop if GBV_accesssupport2==2
drop if GBV_accesssupport==4
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descAccessSupport_LastInc.xlsx") excel replace: /// 
tab GBV_accesssupport2 LastInc_event, col row

****Q419; To what extent are women involved in  Decision making in community matters?***/// Not Data ffound in the dataset>>>>/////
/*destring Q419, gen(Women_DecisionMake)///
label define Women_DecisionMake 1 "Actively Involved" 2 "Moderately Involved" 3 "To a less Extent" 4 "Not all" 5 "Not Sure"/// 
label values Women_DecisionMake Women_DecisionMake////
tab Women_DecisionMake*/


****Q420; To what extent are women involved in collective security action matters and protection in the community?***
destring Q420, gen(Women_SecurityMatters)
label define Women_SecurityMatters 1 "Actively Involved" 2 "Moderately Involved" 3 "To a less Extent" 4 "Not all" 5 "Not Sure" 
label values Women_SecurityMatters Women_SecurityMatters
drop if Women_SecurityMatters==88

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descWomen_SecurityMatters.xlsx") excel replace: /// 
tab Women_SecurityMatters state, col row


****Q421; What are the Reasons for Insufficient participation of women participation(Qualitative Question)****
*Count Most occuring reason for Women Insufficient participation in Decision making)//


****ACCESS, SERVICES & UTILIZATION -GBV****

*** Load Data Afresh Again*****
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear

*** Q422; Are any GBV (Existence of GBV) services in the community****
destring Q422, gen(GBV_Exists)
label define GBV_Exists 1 "Yes" 2 "No" 
label values GBV_Exists GBV_Exists

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBV_Exists.xlsx") excel replace: /// 
tab GBV_Exists state, col row 

*** Q423; Do you know where to access any of the following post-incident support services(Multiple Responses)****
destring Q4231, replace 
destring Q4232, replace 
destring Q4233, replace 

label var Q4231 "Do You know where to access any of the following post-incident support services for GBV incidents(1. Medical)"
label var Q4232 "Do You know where to access any of the following post-incident support services for GBV incidents(2. Psycho-social support services)"
label var Q4233 "Do You know where to access any of the following post-incident support services for GBV incidents(3. Justice mechanism)"
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBV_services.xlsx") excel replace: /// 
mrtab Q4231 Q4232 Q4233, by(C) col include response(1 2 3) sort des



*** Q424; Which servies are you aware of(Multiple responses)***
destring Q4241, replace 
destring Q4242, replace 
destring Q4243, replace 
destring Q4244, replace 
destring Q4245, replace 
destring Q4246, replace 

label var Q4241 "Which services are you aware of ?(1. health care)"
label var Q4242 "Which services are you aware of ?(2. Pyscho-social support)"
label var Q4243 "Which services are you aware of ?(3. protective accompaniment to services)"
label var Q4244 "Which services are you aware of ?(4. legal aid)"
label var Q4245 "Which services are you aware of ?(5. Referral to safe houses)"
label var Q4246 "Which services are you aware of ?(6. Counselling)"

mrtab Q4241 Q4242 Q4244 , by(C) col include response(1 2 3 4 5 6) sort des  

***Q425; Who are the main providers of GBV protection and support are accessible (Multiple Responses)**

destring Q4251, replace 
destring Q4252, replace 
destring Q4253, replace 
*destring Q4254, replace 
destring Q4255, replace 
destring Q4256, replace 
destring Q4257, replace 

label var Q4251 "Who are the main providers of GBV protection and support(Medical/Pyscho-social)?(1. Gov't)"
label var Q4252 "Who are the main providers of GBV protection and support(Medical/Pyscho-social)?(2. Police)"
label var Q4253 "Who are the main providers of GBV protection and support(Medical/Pyscho-social)?(3. NGO)"
label var Q4254 "Who are the main providers of GBV protection and support(Medical/Pyscho-social)?(4. CBO)"
label var Q4255 "Who are the main providers of GBV protection and support(Medical/Pyscho-social)?(5. Church)"
label var Q4256 "Who are the main providers of GBV protection and support(Medical/Pyscho-social)?(6. Religious Orgn)"
label var Q4257 "Who are the main providers of GBV protection and support(Medical/Pyscho-social)?(7. WPTs)"

mrtab Q4251 Q4252 Q4253 Q4255 Q4256 Q4257, by(C) col include response(1 2 3 4 5 6 7) sort des




***Q426; Do you think these GBV servies and support are accessible to women/girls**
destring Q426, gen(GBV_WomenGilsAcess)
label define GBV_WomenGilsAcess 1 "Yes" 2 "No" 
label values GBV_WomenGilsAcess GBV_WomenGilsAcess
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBV_WomenGirlsAcess.xlsx") excel replace: /// 
tab GBV_WomenGilsAcess state, col row
graph bar GBV_WomenGilsAcess, over(state), title(Women/Girls GBV Sevices Acess) legend(label(1 "Yes") label(2 "No"))
graph hbar (mean) GBV_WomenGilsAcess age, over(gender) over(state, label(labsize(small))) blabel(bar) title(Women/Girls GBV Sevices Acess) legend(label(1 "Yes") label(2 "No"))

***Q427; What obstacles do women/girls face in accessing the services(Multiple Responses)**
destring Q4271, replace 
destring Q4272, replace 
destring Q4273, replace 
destring Q42788, replace 
destring Q42799, replace 

label var Q4271 "What Obstacles do women/girls face in accessing these services(1. Distance)"
label var Q4272 "What Obstacles do women/girls face in accessing these services(2. Poor service delivery)"
label var Q4273 "What Obstacles do women/girls face in accessing these services(3. safety concerns)"
label var Q42788 "What Obstacles do women/girls face in accessing these services(4. Don't Know)"
label var Q42799 "What Obstacles do women/girls face in accessing these services(5. Refused to answer)"

mrtab Q4271 Q4272 Q4273 Q42788 Q42799, by(GBV_WomenGilsAcess) col include response(1 2 3 88 99) sort des


***Q428; Would you be able to utilize the GBV Prevention services if provided to you***
destring Q428, gen(Able_GBVUltilise)
label define Able_GBVUltilise 1 "Yes" 2 "No" 
label values Able_GBVUltilise Able_GBVUltilise
drop if Able_GBVUltilise==3
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVUtilise_Able.xlsx") excel replace: /// 
tab Able_GBVUltilise state, col row


***Q429; If No, ask why?***
destring Q428, gen(Obstacle_toaccess)
label define Obstacle_toaccess 1 "Distance" 2 "Poor service delivery" 3 "Safety concerns" 4 "Others" 88 "Dont Know" 99 "Refused to Answer" 
label values Obstacle_toaccess Obstacle_toaccess
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVAccess_Obstacles.xlsx") excel replace: /// 
tab Obstacle_toaccess state, col row

***Q430; Have you or Any of your family member used such GBV services available in your community***
destring Q430, gen(Used_GBVSer)
label define Used_GBVSer 1 "Yes" 2 "No" 88 "Dont Know" 99 "Refused to Answer" 
label values Used_GBVSer Used_GBVSer
drop if Used_GBVSer==3
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVserv_Used.xlsx") excel replace: /// 
table Used_GBVSer gender,by(state)

***Q431; If yes in (Q430 above), To what extent did the services you accessed meet your needs**
destring Q431, gen(GBVServ_Meetneeds)
label define GBVServ_Meetneeds 1 "Meet Needs" 2 "Partially meet needs" 3 "Didnot meet needs" 
label values GBVServ_Meetneeds GBVServ_Meetneeds
drop if GBVServ_Meetneeds==4
table GBVServ_Meetneeds gender, by(state) 


***Q432; If yes in Q419 above, In Your Opinion how important/useful are these services of help specifically to girls and women***
destring Q432, gen(Serv_Import)
label define Serv_Import 1 "Very Important" 2 "Moderately Important" 3 "Not Important" 88 "Dont Know" 99 "Refused to Answer" 
label values Serv_Import Serv_Import
drop if Serv_Import==5
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descGBVserv_Import.xlsx") excel replace: /// 
tab Serv_Import state, col row

******ATITUDES AND PRACTICES(LIKERT SCALE) ****************************************************************************
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear

**Likert Scale**
*1. Agree 2. Partially Agree 3. Do not agree
**Husband duty to beat wifes**
destring Q433, gen(Husband_Bwife)
label define Husband_Bwife 1 "Agree" 2 "Partially Agree" 3 "Do not Agree" 
label values Husband_Bwife Husband_Bwife
drop if Husband_Bwife==4
tab Husband_Bwife state, col row 
table Husband_Bwife state 
**Times when Women deserve to be beaten**
destring Q434, gen(Wife_BDesrvess)
label define Wife_BDesrvess 1 "Agree" 2 "Partially Agree" 4 "Do not Agree" 
label values Wife_BDesrvess Wife_BDesrvess
tab Wife_BDesrvess state, col row 

**Women should tolerate Violence to keep family***
destring Q435, gen(Woman_TolViolence)
label define Woman_TolViolence 1 "Agree" 2 "Partially Agree" 5 "Do not Agree" 
label values Woman_TolViolence Woman_TolViolence

tab Woman_TolViolence state, col row 

**It is right for a man to beat heer wife if, she fails her duties***

tab Q436
destring Q436, gen(ManRight_Bwife)
label define ManRight_Bwife 1 "Agree" 2 "Partially Agree" 6 "Do not Agree" 
label values ManRight_Bwife ManRight_Bwife
tab ManRight_Bwife state, col row 

**Aman can beat his wife , in case of denial of sex***
tab Q437
destring Q437, gen(ManHits_NoSex)
label define ManHits_NoSex 2 "Agree" 3 "Partially Agree" 7 "Do not Agree" 
label values ManHits_NoSex ManHits_NoSex
tab ManHits_NoSex state, col row

**If a man is insulted, he should defend reputaion with force, or Violence**
tab Q438
destring Q438, gen(ManDefend_Repu)
label define ManDefend_Repu 3 "Agree" 4 "Partially Agree" 8 "Do not Agree" 
label values ManDefend_Repu ManDefend_Repu
tab ManDefend_Repu state, col row

**A man using violence against his wife is a private matter , not to be discussed in public***
tab Q439
destring Q439, gen(ManVio_Private)
label define ManVio_Private 4 "Agree" 5 "Partially Agree" 9 "Do not Agree" 
label values ManVio_Private ManVio_Private
tab ManVio_Private state, col row

**Men neever face GBV, its only for women***
tab Q440
destring Q440, gen(WomenGBV_Preva)
label define WomenGBV_Preva 1 "Agree" 2 "Partially Agree" 3 "Do not Agree" 
label values WomenGBV_Preva WomenGBV_Preva
tab WomenGBV_Preva state, col row

**Men should not disclose violence , GBV****
tab Q441
destring Q441, gen(ManNot_DiscViol)
label define ManNot_DiscViol 1 "Agree" 11 "Partially Agree" 
label values ManNot_DiscViol ManNot_DiscViol
tab ManNot_DiscViol state, col row

**Whose opininon is more important in decision making*** Does not make sense
tab Q442
destring Q442, gen(Whose_BOpinion)
label define Whose_BOpinion 1 "Man's" 2 "Woman's" 3 "Both have equal rights" 4 "Decline to reply" 5 "Difficult to answer" 
label values Whose_BOpinion Whose_BOpinion
tab Whose_BOpinion state, col row 



******* SECTION 5 PROTECTION COORDINATION , ADVOCACY & INFORMATION******************************************************
*** Load Data Afresh Again*****
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear

***Q51; How you would rate your knowledge of genrsl protection**
tab Q51
destring Q51, gen(rate_Know)
label define rate_Know 1 "Low" 2 "Moderate" 3 "High" 
label values rate_Know rate_Know
drop if rate_Know==4
drop if rate_Know==33

tab rate_Know state, col row

***Q52; What iss your Main source of Information about Child Protection services****
tab Q52
destring Q52, gen(MainSorce_Info)
label define MainSorce_Info 1 "Radio" 2 "Newspaper" 3 "television" 4 "Word of Mouth" 5 "Internet/Social media" 6 "Others" 
label values MainSorce_Info MainSorce_Info

tab MainSorce_Info state, col row 
catplot state MainSorce_Info [w= state], percent( MainSorce_Info) asyvars stack subtitle(%  MainSorce_Info About CP By State  )legend(on cols(6))


****Q52_Others Responses***(Data doesnot make sense)


***Q53; What is the Main Source of Information about GBV and protection**
tab Q53
destring Q53, gen(MainSorce_InfoGBV)
label define MainSorce_InfoGBV 1 "Radio" 2 "Newspaper" 3 "television" 4 "Word of Mouth" 5 "Internet/Social media" 6 "Others" 
label values MainSorce_InfoGBV MainSorce_InfoGBV

tab MainSorce_InfoGBV state, col row 
catplot state MainSorce_InfoGBV [w= state], percent( MainSorce_InfoGBV) asyvars stack subtitle(%  MainSorce_InfoGBV About GBVP By State  )legend(on cols(6))

***Q55; Recommedations(two key) priorities to further rduce violence and increase safety & security of civilians in this community 
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descRecommedns.xlsx") excel replace: /// 
tab Q55 state, col row 


*******SECTION 6 NP AWARENESS *******************************************************************************************
*** Load Data Afresh Again*****
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear

***Q61; Are you aware of orgn: NOnviolent Peaceforce***
tab Q61
drop if Q61=="Awareness and training of civilians"
drop if Q61=="TRAINING ON gbv PREVETION, FOLLOW UP ACT "
drop if Q61=="Q6.1"
replace Q61 = "" in 70
replace Q61 = "" in 652

destring Q61, gen(NP_awareness)
label define NP_awareness 1 "Yes" 2 "No" 88 "Dont Know" 99 "Refuses to Answer"
label values NP_awareness NP_awareness
drop if NP_awareness==3
drop if NP_awareness==4
drop if NP_awareness==5
drop if NP_awareness==8
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descNP_Awareness.xlsx") excel replace: /// 
tab NP_awareness C, col row 
table NP_awareness C

catplot state NP_awareness [w= state], percent( NP_awareness) asyvars stack subtitle(% state Aware About NP  )legend(on cols(6))

***Q62; If NP organized a training , which course or what areas(Multiple Responses Possible) ***
destring Q621, replace 
destring Q622, replace 
destring Q623, replace 
destring Q624, replace 

label var Q621 "If NP Organize a training on what areas you want to be trained?(1. Basic Child protection)"
label var Q622 "If NP Organize a training on what areas you want to be trained?(2. GBV Prevention & Response)"
label var Q623 "If NP Organize a training on what areas you want to be trained?(3. Community(Civilian) Protection)"
label var Q624 "If NP Organize a training on what areas you want to be trained?(4. Early Response Warning)"

mrtab Q621 Q623 Q624, by(C) col include response(1 2 3 4) sort des


/*destring Q622, gen(Option1)
label define Option1 1 "Basic Child Prevention" 2 "GBV Prevention and Response" 3 "Community(Civilian) Protection" 4 "early Warning Early Response" 5 "Other" 
label values Option1 Option1
destring Q623, gen(Option2)
label define Option2 1 "Basic Child Prevention" 2 "GBV Prevention and Response" 3 "Community(Civilian) Protection" 4 "early Warning Early Response" 5 "Other" 
label values Option2 Option2

destring Q624, gen(Option3)
label define Option3 1 "Basic Child Prevention" 2 "GBV Prevention and Response" 3 "Community(Civilian) Protection" 4 "early Warning Early Response" 5 "Other" 
label values Option3 Option3
destring Q6288, gen(Do_Not_Know)
destring Q6299, gen(Refused_To_Answer)
tab Option1 state, col row 
tab Option2 state, col row 
tab Option3 state, col row
tab  Do_Not_Know state, col row
tab Refused_To_Answer state, col row */

***Q63; What you would like to see done to improve security in the community**
destring Q63, gen(Bedone_Improvesec)
label define Bedone_Improvesec 1 "Better Policing" 2 "Better army" 3 "Social & political action" 4 "Support to re-locate" ///
5 "Community/PoC Policing" 6 "Trainings" 7 "Others" 88 "Don't Know" 99 "Refused to Answer"
label values Bedone_Improvesec Bedone_Improvesec
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descBeDone_Improvesec.xlsx") excel replace: /// 
tab Bedone_Improvesec state, col row 

** Q63_Others 
drop if Q63_Other==1
drop if Q63_Other==2
drop if Q63_Other==3

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descBeDone_ImprovesecOthers.xlsx") excel replace: /// 
tab Q63_Other state, col row 


*** END YEI Questionaire Here******
drop if state==4
clear all
** Load Data Again & Delete all responses for Yei Region/state***
set more off 
use "E:\Work Consultancy\Documents for Godfrey\NP_Endline\data\clean dataset",clear

*To Stop Yei Qestionaire)- Delete Responses with Region ID==4 
drop if C==4


******* SECTION 7 AWARENESS, RELEVANCE , EFFECTIVENSS, & IMPACT OF THE PROJECT******************************************


***Q71; If yes in (Q61 above); How important is the NP in improving security in your community***

destring Q71, gen(NP_Import)
label define NP_Import 1 "Not all important" 2 "Somehow important" 3 "Important" 4 "Very Important" 88 "Don't Know" 99 "Refused to Answer"
label values NP_Import NP_Import

drop if NP_Import==6
drop if NP_Import==8
drop if NP_Import==10
drop if NP_awareness=="No"
drop if NP_awareness=="Dont Know"
drop if NP_awareness=="Refused to answer"

logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descNP_Importance.xlsx") excel replace: /// 
tab NP_Import NP_awareness, col row
catplot NP_Import NP_awareness [w= NP_Import], percent( NP_Import) asyvars stack subtitle(%  NP_Import About NP Given NP_awareness  )legend(on cols(6))


***In what activities of NP were you Involved in (Multiple Responses) ***

destring Q72b1, replace 
*destring Q72b2, replace 
*destring Q72b3, replace 
destring Q72b4, replace 
destring Q72b5, replace 
destring Q72b6, replace 
destring Q72b7, replace 
*destring Q72b8, replace 
destring Q72b9, replace 
destring Q72b10, replace
destring Q72b11, replace  

label var Q72b1 "In What activities of NP were you involved?(1. Training)"
label var Q72b2 "In What activities of NP were you involved?(2. Awareness raising/community mobilization)"
label var Q72b3 "In What activities of NP were you involved?(3. Patrolling risky areas)"
label var Q72b4 "In What activities of NP were you involved?(4. Protective presence)"
label var Q72b5 "In What activities of NP were you involved?(5. accompaniment of vulnerable/victims)"
label var Q72b6 "In What activities of NP were you involved?(6. Referring for medical/psycho-social)"
label var Q72b7 "In What activities of NP were you involved?(7. Child Friendly services)"
label var Q72b8 "In What activities of NP were you involved?(8. Dailogue facilitation/mediation process)"
label var Q72b9 "In What activities of NP were you involved?(9. coordination meetings)"
label var Q72b10 "In What activities of NP were you involved?(10. community protection meetings)"
label var Q72b11 "In What activities of NP were you involved?(11. activities with youth)"

mrtab Q72b1 Q72b4 Q72b5 Q72b6 Q72b7 Q72b9 Q72b10 Q72b11, by(C) col include response(1 2 3 4 5 6 7 8 9 10 11) sort des


***If yes, Which activities did you find MOST important to the community***
tab Q73
destring Q73, gen(NP_activities)
label define NP_activities 1 "Training" 2 "Awareness raising/community mobilization" 3 "Patrolling of risky areas" 4 "Accompaniment of vulnerable/vicitms" ///
6 "Referring to medical and pyscho-social services" 7 "Child friendly services" 8 "Dailogue facilitation/mediation process" 9 "Coordination meetings" ///
10 "Community protection meetings" 11 "Activities with youth" 12 "None of Them" 88 "Dont Know" 99 "Refused to Answer"
label values NP_activities NP_activities
drop if NP_activities==5
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descNP_Activities.xlsx") excel replace: /// 
tab NP_activities C, col row 

***Q74; If Yes, (in Q71 above) Have  You Noticed any change in the community general security situation after participating in NP activities***
destring Q74, gen(Change_AfterNPact)
label define Change_AfterNPact 1 "Yes" 2 "No" 88 "Dont Know" 99 "Refused to Answer" 
label values Change_AfterNPact Change_AfterNPact
drop if Change_AfterNPact==3
drop if Change_AfterNPact==4
drop if Change_AfterNPact==8
tab Change_AfterNPact C, col row
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descChange_AfterNPact.xlsx") excel replace: /// 
tab Change_AfterNPact NP_activities, col row 

***Q75; If Yes (in Q74 above), What changes have you noticed(Mutiple Answers)***
destring Q751, replace
destring Q752, replace
destring Q753, replace
destring Q754, replace
destring Q755, replace
destring Q7588, replace
destring Q7599, replace

label var Q751 "What Changes have you noticed?(1. People feel safer to do their daily activities)"
label var Q752 "What Changes have you noticed?(2. People have better knowledge on conflicts)"
label var Q753 "What Changes have you noticed?(3. people started resolving conflicts in anonviolent way)"
label var Q754 "What Changes have you noticed?(4. Community members are participating in unarmed peacekeeping activities)"
label var Q755 "What Changes have you noticed?(5. People better know how to protect themselves in the time of conflicts)"
label var Q7588 "What Changes have you noticed?(6. Don't Know)"
label var Q7599 "What Changes have you noticed?(7. Refuse to Answer)"

mrtab Q751 Q752 Q753 Q754 Q755 Q7588 Q7599, by(C) col include response(1 2 3 4 5 6 7) sort des

***Q76; Which elements of this project do you think made the most impact in reducing violence and increasing the safety and security of civilians inthe community***
destring Q76, gen(Most_ImpactProj)
label define Most_ImpactProj 1 "Creation of Children's safe spaces" 2 "Operationalisation of Referral pathways" 3 "Trainings in Child protection" ///
4 "Protective Accompaniment" 5 "Patrolling and presence Activities" 6 "Trainings in GBV prevention" 7 "Others" 88 "Dont Know" 99 "Refused to Answer" 
label values Most_ImpactProj Most_ImpactProj
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descMost_ImpactProj.xlsx") excel replace: /// 
tab Most_ImpactProj C, col row

***Q77; In Your Opinion, How Important is NP in improving security in this community***
destring Q77, gen(NP_ImportImproSec)
label define NP_ImportImproSec 1 "Not all important" 2 "Somehow important" 3 "Important" 4 "Very Important" 88 "Don't Know" 99 "Refused to Answer"
label values NP_ImportImproSec NP_ImportImproSec
drop if NP_ImportImproSec==6
logout, save("E:\Work Consultancy\Documents for Godfrey\NP_Endline\results\descNp_ImportImproSec.xlsx") excel replace: /// 
tab NP_ImportImproSec C, col row // Very Important in Improving the security in the coommunities of operation//

***Q78; To what extent can you tell that this project has helped reduce violence and increase security in this community***
destring Q78, gen(Extent_SesafetyImpr)
label define Extent_SesafetyImpr 1 "To a large extent" 2 "Moderately" 3 "To a less extent"
label values Extent_SesafetyImpr Extent_SesafetyImpr
drop if Extent_SesafetyImpr==4
drop if Extent_SesafetyImpr==88

tab Extent_SesafetyImpr C, col row 
catplot C Extent_SesafetyImpr [w= C], percent( Extent_SesafetyImpr) asyvars stack subtitle(%  Extent_SesafetyImpr About Ssafety in states  )legend(on cols(6))

***Q79; To what extent are satisfied with the support received from NP***
destring Q79, gen(Npsup_satisfied)
label define Npsup_satisfied 1 "very Satisfied" 2 "Somewhat satisfied" 3 "Not Sustainable" 88 "Don't Know" 99 "Refused to Answer"
label values Npsup_satisfied Npsup_satisfied
drop if Npsup_satisfied==4
drop if Npsup_satisfied==5
drop if Npsup_satisfied==11
tab Npsup_satisfied C, col row 

table Npsup_satisfied Q11, by(C)
tab Npsup_satisfied Q11, col row 
catplot Q11 Npsup_satisfied [w= Q11], percent( Npsup_satisfied) asyvars stack subtitle(%  Npsup_satisfied About Support Received from NP in states  )legend(on cols(6))
catplot C Npsup_satisfied [w= C], percent( Npsup_satisfied) asyvars stack subtitle(%  Npsup_satisfied About Support Received from NP in states  )legend(on cols(6))

***Q710; How sustainable will be the effects of/changes brought by the project should NP activities stop***
destring Q710, gen(Benefits_Sust)
label define Benefits_Sust 1 "Highly sustainable" 2 "Somehow sustainable" 3 "Not Sustainable" 88 "Don't Know" 99 "Refused to Answer"
label values Benefits_Sust Benefits_Sust
tab Benefits_Sust C, col row 
tab Benefits_Sust Q11, col row 
***Q711; Did you receive any trainings from NP as part of the project**
destring Q711, gen(Proj_Trainings)
label define Proj_Trainings 1 "Yes" 2 "No" 
label values Proj_Trainings Proj_Trainings

drop if Proj_Trainings==3
drop if Proj_Trainings==4
drop if Proj_Trainings==88
tab Proj_Trainings C, col row 
tab Proj_Trainings Q11, col row

***Q712; If yes, what were trained on ?(Multiple Responses)***
destring Q7121, replace 
destring Q7122, replace
destring Q7123, replace
destring Q7124, replace

label var Q7121 "What were You trained on?(1. Basic Child Protection)"
label var Q7122 "What were You trained on?(2. GBV Prevention & Response)"
label var Q7123 "What were You trained on?(3. Community(Civilian) Protection)"
label var Q7124 "What were You trained on?(4. Early Warning Early Response)"

mrtab Q7121 Q7122 Q7123 Q7124, by(C) col include response(1 2 3 4 5 6 7) sort des 


***Q713; What do you think were the main challenges of affected the implemetation of this project(Multiple Responses)***
destring Q7131, replace
destring Q7132, replace
destring Q7133, replace
destring Q7134, replace
destring Q7135, replace
destring Q7136, replace

label var Q7131 "What do you think were the main challenges that affected the implementation of this project?(1.Community Perceptions)"
label var Q7132 "What do you think were the main challenges that affected the implementation of this project?(2.Lack of commitment among project participants)"
label var Q7133 "What do you think were the main challenges that affected the implementation of this project?(3.negative attitudes towards project staff)"
label var Q7134 "What do you think were the main challenges that affected the implementation of this project?(4.Lack of key support from key actors)"
label var Q7135 "What do you think were the main challenges that affected the implementation of this project?(5.Inter-clan tensions)"
label var Q7136 "What do you think were the main challenges that affected the implementation of this project?(6.No Challenges)"

mrtab Q7131 Q7132 Q7133 Q7134 Q7135 Q7136, by(C) col include response(1 2 3 4 5 6) sort des






***Q714; What could have been done better in implementing this project(Learnings and Going Forward for Project Improvements)****






**** END of Analysis***Master Do file****
