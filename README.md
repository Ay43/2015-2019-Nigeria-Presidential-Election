# 2015-2019-Presidential-Election-Analysis-with-SQL
>*A Case Study on APC & PDP party in Nigeria*


![](ELECTION.jpg)



## Introduction:

This is a presidential election analysis report that occured in Nigeria between the year 2015 & 2019. In this report, we would be focusing on the top or major parties (APC & PDP) involved in the election and a breakdown of how they got their respective votes across the states and geopolitical zones in the country.
 
 
In this project, would be covering the following;
 
 
* Objectives      [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#objectives)
* Data Sourcing   [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#data-sourcing)
* Data Loading And Arrangement    [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#data-loading-and-arrangement)
* Findings    [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#findings)
* Conclusion    [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#conclusions)
* Recommended Solutions   [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#recommended-solutions)
* Codes   [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#codes)
* Tools   [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#tools)
* Credits [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#credits)
 

## Objectives:

The Objective of this analysis is to help answer some questions mentioned in the **findings** section of this project, which is to help give insight or  overview on how APC and PDP were able to gathered votes across all states and geopolitical zones at the 2015 and 2019 Presidential Election in Nigeria. 

Also, the Findings from this report would provide us with a data driven prediction on what is expected to play out in the 2023 presidential election in the country.

You can skip all other process and jump right in to the **Findings** by clicking  [here](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/README.md#findings) 
 
 
 
## Data Sourcing:

Data was provided in the raw form and can be found [here](https://www.kaggle.com/datasets/somtoe/nigerian-presidential-election-results?select=2023elections.csv)
 
 
 
## Data Loading And Arrangement:

* The table structure was created before the raw file could be loaded into the database with the below command

>*2015 & 2019 Presidential Election Command*

|        2015     |     2019      |
|:----------------|:--------------:|
![](e2015.png)   |![](e2019.png)

* The data was loaded into the database from Server/PostgresSQL14/Databases/postgres/Schemas/Public/Tables/ then the 2 tables created namely election_2015 and election_2019.

* From each of the tables created right-click/Import/filename/locate the file/click the format option/select csv/ go to columns and uncheck other colums that are not present in the file/ then OK. At this point our file has been loaded to the database and it is ready for queries 🙂. However, lets have a look on the table information of the two(2) tables namely election_2015 & elections_2019
 
 
>*Table Information*

The 2 tables (election_2015 and election_2019) consist of Eleven(11) columns each


| election_2015     | election_2019      |
|:----------------  |:--------------:|
![](e2015_infr.png)   |![](e2019_infr.png)


The table structure has been created, data  has been loaded, we have an idea of each table informations so *lets dive into the findings*
  
 
 
## Findings:
 
>*How many states and geopolitical_zones contributed to the 2015 and 2019 presidential election?*

In Nigeria, there are **36 states** and **1 Federal Capital Territory** present in the country making the sum total equals **37 states** available on the dataset and 6 geopolitical_zones in the country.


| Command Prompt    | Result     |
|:----------------  |:--------------:|
![](s&gpcmd.png)   |![](s&gpr.png)

Let us have a look at how APC & PDP were able to gather votes across the states and geopolitical zones in the country.

 &nbsp; 
>*What is the AVERAGE votes the 2 parties (Apc & Pdp) got in 2015 & 2019*

It was discovered that APC **(2015: *416890*, 2019: *410590*)** average votes were more than PDP **(2015: *347383*, 2019: *304405*)** average votes in 2015 & 2019 respectively. However, APC votes **fell** 🔽 by 6300 votes in 2019 compare to their average votes in 2015 while PDP votes also **fell** 🔽 by 42978 votes in 2019 compare to their average votes in 2015.


| Command Prompt    | Result     |
|:----------------  |:--------------:|
![](avg_vcmd.png)   |![](avg_votes.png)


Let us have a look at how the 2 parties were individually affected by the average votes.



 &nbsp;

>*How many votes by APC were above its average **(2015: *416890*, 2019: *410590*)** votes got in 2015 & 2019?*



It appears that APC had **13** states out of the 37 cumulative number of states (including the federal capital territory) votes that were above the AVERAGE votes they got in 2015 and 2019.


| Command Prompt    | Result     |
|:----------------  |:--------------:|
![](apc_avgcmd.png)   |![](apc_avgr.png)

 
 &nbsp; 

>*How many votes by PDP were above its average **(2015: *347383*, 2019: *304405*)** votes got in 2015 & 2019?*



It also appears that PDP had **9** states out of the 37 cumulative number of states (including the federal capital territory) votes that were above the AVERAGE votes they got in 2015 and 2019.


| Command Prompt    | Result     |
|:----------------  |:--------------:|
![](pdp_avgcmd.png)   |![](pdp_avgr.png)


Let us do a COMPARISON between the 2 parties, we would be looking at how many votes by states did one party had above the average votes gotten by the other party in 2015 and 2019.


 &nbsp; 

>*How many votes by APC were ABOVE PDP average **(2015: *347383*, 2019: *304405*)** votes got in 2015 & 2019?*



It was discovered that APC had **18** states out of the 37 cumulative number of states (includlng the federal capital territory) votes that were ABOVE the PDP AVERAGE votes in 2015 and 2019.


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](apc_pdp_avgcmd.png) |![](apc_pdp_avgr.png)

 
 &nbsp; 

>*How many votes by PDP were ABOVE APC average **(2015: *416890*, 2019: *410590*)** votes got in 2015 & 2019?*



It was also discovered that PDP had **6** states out of the 37 cumulative number of states (including the federal capital territory) votes that were ABOVE the APC AVERAGE votes in 2015 and 2019.


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](pdp_apc_avgcmd.png) |![](pdp_apc_avgr.png)


At this point, we already have an understanding how the 2 parties were affected by the average votes they got individually and in comparison in 2015 and 2019. *Lets take it further to see the highest vote they got in 2015 & 2019 and how they were affected by it individually and in comparison*.


 &nbsp; 
 
>*What is the HIGHEST votes the 2 parties (Apc & Pdp) got in 2015 & 2019*


In 2015, the HIGHEST votes gotten by the 2 parties (apc & pdp) were 1,903,999 & 1,487,075 respectively while 2019 HIGHEST votes were 1,464,768 & 649,612 respectively. 

However, APC votes **fell** 🔽 by 439,231 in 2019 compare to their highest votes in 2015 while PDP votes also **fell** 🔽 by 837,463 votes in 2019 compare to their highest votes in 2015.


| Command Prompt    | Result     |
|:----------------  |:--------------:|
![](max_vcmd.png)   |![](max_vr.png)


Let us have a look at a comparison of how many states were WON by APC that were ABOVE pdp Highest votes in 2015 & 2019.


&nbsp; 
 
>*How many states votes were gotten by APC above PDP **(2015: *1487075* , 2019: *649612*)** HIGHEST votes in 2015 and 2019*

In **2015**, Kano state was the only state with **1,903,999** votes for apc which were higher than pdp highest votes *1,487,075* in the country


| Command Prompt       | Result     |
|:----------------     |:--------------:|
![](apc_p2015_mc.png)  |![](apc_p2015_mr.png)


While

In **2019**, "Kano"
"Katsina"
"Kaduna"
"Borno"
"Bauchi"
"Jigawa" states were the states with votes for apc that were higher than pdp highest votes *649,612* in the country


| Command Prompt       | Result     |
|:----------------     |:--------------:|
![](apc_p2019_mc.png)  |![](apc_p2019_mr.png)


*Hol up a sec, wouldnt be nice to know which state delivered more votes for apc that were HIGHER than pdp highest in 2015 and still delivered more votes for apc during the 2019 presidential election which were still HIGHER pdp highest in 2019? Yea, you guessed right.* Kano did 🙂. Let me show you


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](apc_p2015.9_mc.png) |![](apc_p2015.9_mr.png)


 Kano delivered **1,903,999** votes in 2015 for apc (Higher than the most votes 1,487,075 pdp got in the same year) and still delivered **1,464,768** votes in 2019 for apc (Higher than the most votes 649,612 pdp got in the same year).

Okay enough for all the apc wins let us have a look at how pdp got more votes than apc highest in 2015 and 2019.


&nbsp; 
 
>*How many states votes were gotten by PDP above APC **(2015: *1903999* , 2019: *1464768*)** HIGHEST votes in 2015 and 2019*

Apparently, there were no states votes by pdp above apc highest in 2015

| Command Prompt       | Result     |
|:----------------     |:--------------:|
![](pdp_a2015_mc.png)  |![](pdp_a2015_mr.png)


Also

Samething happened in 2019. There were no states votes by pdp above apc highest in 2019.


| Command Prompt       | Result     |
|:----------------     |:--------------:|
![](pdp_a2019_mc.png)  |![](pdp_a2019_mr.png)


*if there were no states votes won by pdp above apc highest in the individual years, Of course you can guess there would be nothing when we check for the years combined* 😞


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](pdp_a2015.9_mc.png) |![](pdp_a2015.9_mr.png)


Okay that is that. Let me now show you the states WON by APC and the percentage difference compare to PDP number of votes from the same states during the 2015 and 2019 Presidential election


&nbsp; 
 
>*How many states were WON by APC in 2015 & 2019 Presidential Election and in what percentage?*

In **2015**, It was discovered that APC WON **21** states out of the 37 cumulative number of states during the presidential election with the HIGHEST percentage votes gap from BORNO state leading pdp in the state with *90%* votes and the least percentage votes gap was from ONDO state leading pdp with *9%* votes


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](apcp_p2015mc.png)   |![](apcp_p2015mr.png) 


Also, In **2019**, data has shown that APC WON **19** states out of the 37 cumulative number of states during the presidential election with the HIGHEST percentage votes gap from BORNO state again (borno must be very loyal to apc 😆) leading pdp in the state with *84%* votes (that's like 6% fall 🔽 compare to 2015) and the least percentage votes gap were from OSUN & NASSARAWA states leading pdp with *1%* votes each respectively in the state


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](apcp_p2019mc.png)   |![](apcp_p2019mr.png) 


And thats not all, I went further to check for the states WON by APC in both years and by their percentage (i.e states that apc won in 2015 and still won in 2019). However, It was discovered that **17** states out of the 37 cumulative number of states were WON by APC in 2015 & 2019 presidential election in the country.


| Command Prompt          | Result     |
|:----------------        |:--------------:|
![](apcp_p2015.9mc.png)   |![](apcp_p2015.9mr.png) 


What does this tell us? Apparently 17 states are loyal to APC in the country 🤔. Let us now have a look at states WON by PDP and the percentage difference compare to APC number of votes from the same states during the 2015 and 2019 Presidential election


&nbsp; 
 
>*How many states were WON by PDP in 2015 & 2019 Presidential Election and in what percentage?*

In **2015**, The data has shown that PDP WON **16** states out of the 37 cumulative number of states during the presidential election leading apc with the HIGHEST percentage votes gap of *97%* from BAYELSA state while FCT (federal capital territory) gave PDP the least percentage votes gap leading apc with *4%* votes


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](pdp.a_2015_mc.png)   |![](pdp.a_2015_mr.png) 


While, In **2019**, PDP WON **18** states out of the 37 cumulative number of states during the presidential election with the HIGHEST percentage votes gap from ANAMBRA state leading apc in the state with *88.1%* votes and the least percentage votes gap were from OYO states leading apc with *0.2%* votes in the state


| Command Prompt        | Result     |
|:----------------      |:--------------:|
![](pdp.a_2019_mc.png)   |![](pdp.a_2019_mr.png) 


Also, Let us have a look at the states WON by PDP in 2015 and 2019 combined (i.e states won by pdp in 2015 and still won in 2019)


| Command Prompt          | Result     |
|:----------------        |:--------------:|
![](pdp.a_2015_9_mc.png)   |![](pdp.a_2015_9_mr.png) 

Apparently, The total number of states WON by PDP in 2015 and 2019 were **14** states. This could also mean 14 states are loyal to PDP in the country 🤔. Let us have a view on how PDP and APC influenced the votes in the geopolitical zones in the country during the 2015 and 2019 presidential Election.


&nbsp; 
 
>*What is the Total Votes gotten by APC and PDP from the geopolitical zones in the country during the 2015 & 2019 Presidential election?*


Data Shown that APC **(2015: *15,424,921*, 2019: *15,191,847*)** total votes gotten by APC were more than PDP **(2015: *12,853,162*, 2019: *11,262,978*)** total votes in 2015 & 2019 respectively. However, APC votes **fell** 🔽 by 233,074 votes in 2019 compare to the total votes gotten in 2015 while PDP votes also **fell** 🔽 by 1,590,184 votes in 2019 compare to the total votes gotten in 2015.


| Command Prompt    | Result     |
|:----------------  |:--------------:|
![](avg_vcmd.png)   |![](avg_votes.png)


Let us have a look at how the 2 parties were individually affected by the average votes.









## Conclusions:

>*Overall Findings shows that;*



 
## Recommended Solutions

>*For ;*




## Codes

[Click here]([https://drive.google.com/file/d/1Ta9c0XaGWdDUMatOMZsyPz4cMAKqDLS-/view?usp=sharing](https://github.com/Ay43/2015-2019-Nigeria-Presidential-Election/blob/main/presidential%20election%20(2015%20%26%202019).sql))


## Tools

* Postgresql


## Credits

* @Somtoe
* Kaggle 
* Google
* Github


## Contacts and other Projects

[Click here](https://ay43.github.io/)
