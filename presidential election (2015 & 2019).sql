/* First Step is to create the table structure then get the table information. Here,we would be using
   two(2) different tables namely 2015 presidential election and
   2019 presidential election data */

-- Create the table structure for the 2015 election 
CREATE TABLE election_2015(
   state TEXT,
   geopolitical_zone TEXT,
   registered_voters INTEGER,
   accredited_voters INTEGER,
   votes_cast INTEGER,
   valid_votes INTEGER,
   rejected_votes INTEGER,
   pdp_votes INTEGER,
   apc_votes INTEGER,
   pdp_percentage_votes NUMERIC,
   apc_percentage_votes NUMERIC 
    );
	
-- Create the table structure for the 2015 election 
CREATE TABLE election_2019(
   state TEXT,
   geopolitical_zone TEXT,
   registered_voters INTEGER,
   accredited_voters INTEGER,
   votes_cast INTEGER,
   valid_votes INTEGER,
   rejected_votes INTEGER,
   pdp_votes INTEGER,
   apc_votes INTEGER,
   pdp_percentage_votes NUMERIC,
   apc_percentage_votes NUMERIC 
    );

--Viewing the table information on the 2015 election data
SELECT column_name, data_type  
    FROM information_schema.columns
    WHERE table_name = 'election_2015';
    
    
--Viewing the table information on the 2019 election data
SELECT column_name, data_type
    FROM information_schema.columns
    WHERE table_name = 'election_2019';
    
    
--Viewing the individual table
SELECT * FROM election_2015;
SELECT * FROM election_2019;


/* Second Step is to merge the the two(2) tables together on a column they both
   have in common */
   
--Viewing the 2 tables merged
SELECT * FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state;



/* Exploratory Analysis on the two(2) tables merged (2015 & 2019 election data) for 
   overview on the registered_voters, accredited_voters, votes_cast, 
   valid_votes and rejected_votes across the states and geopolitical zones in the 
   country */ 
   
--Viewing the total states and total geopolitical zone on the 2015 and 2019 tables    
   
SELECT COUNT(DISTINCT(e2015.state)) "2015 State",
       COUNT(DISTINCT(e2015.geopolitical_zone)) "2015 G_Zone",
       COUNT(DISTINCT(e2019.state)) "2019 State",
       COUNT(DISTINCT(e2019.geopolitical_zone)) "2019 G_Zone"
    FROM election_2015 e2015
    JOIN election_2019 e2019 
    ON e2015.state = e2019.state;
    

--Viewing 2015 TOTAL registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
SELECT SUM(registered_voters) Total_registered_voters,
       SUM(accredited_voters) Total_accredited_voters,
       SUM(votes_cast) Total_votes_cast,
       SUM(valid_votes) Total_valid_votes,
       SUM(rejected_votes) Total_rejected_votes
    FROM election_2015 


--Viewing 2015 HIGHEST number of registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
SELECT MAX(registered_voters) Highest_no_of_registered_voters,
       MAX(accredited_voters) Highest_no_of_accredited_voters,
       MAX(votes_cast) Highest_no_of_votes_cast,
       MAX(valid_votes) Highest_no_of_valid_votes,
       MAX(rejected_votes) Highest_no_of_rejected_votes
    FROM election_2015 
    

--Viewing 2015 HIGHEST number of registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
--By States
WITH category AS ((SELECT state, registered_voters values FROM election_2015 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, accredited_voters FROM election_2015 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, votes_cast FROM election_2015 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, valid_votes FROM election_2015 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, rejected_votes FROM election_2015 ORDER BY 2 DESC LIMIT 1))
select * from category;


--Viewing 2015 TOTAL registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
--By geopolitical zones
SELECT geopolitical_zone, SUM(registered_voters) registered_voters,
       SUM(accredited_voters) accredited_voters,
       SUM(votes_cast) votes_cast,
       SUM(valid_votes) valid_votes,
       SUM(rejected_votes) rejected_votes
    FROM election_2015
    GROUP BY 1;


--Viewing 2019 TOTAL registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
SELECT SUM(registered_voters) Total_registered_voters,
       SUM(accredited_voters) Total_accredited_voters,
       SUM(votes_cast) Total_votes_cast,
       SUM(valid_votes) Total_valid_votes,
       SUM(rejected_votes) Total_rejected_votes
    FROM election_2019 


--Viewing 2019 HIGHEST number of registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
SELECT MAX(registered_voters) Highest_no_of_registered_voters,
       MAX(accredited_voters) Highest_no_of_accredited_voters,
       MAX(votes_cast) Highest_no_of_votes_cast,
       MAX(valid_votes) Highest_no_of_valid_votes,
       MAX(rejected_votes) Highest_no_of_rejected_votes
    FROM election_2019 
    

--Viewing 2015 HIGHEST number of registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
--By States
WITH category AS ((SELECT state, registered_voters values FROM election_2019 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, accredited_voters FROM election_2019 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, votes_cast FROM election_2019 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, valid_votes FROM election_2019 ORDER BY 2 DESC LIMIT 1)
UNION ALL
(SELECT state, rejected_votes FROM election_2019 ORDER BY 2 DESC LIMIT 1))
select * from category;


    
--Viewing 2019 TOTAL registered_voters, accredited_voters, votes_cast, valid_votes and rejected_votes
--By geopolitical zones
SELECT geopolitical_zone, SUM(registered_voters) registered_voters,
       SUM(accredited_voters) accredited_voters,
       SUM(votes_cast) votes_cast,
       SUM(valid_votes) valid_votes,
       SUM(rejected_votes) rejected_votes
    FROM election_2019
    GROUP BY 1;
    

--Viewing the Total number of registered voters in 2015 & 2019 by geopolitical zones
SELECT e2015.geopolitical_zone, SUM(e2015.registered_voters) "2015",
                                SUM(e2019.registered_voters) "2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    GROUP BY 1
    ORDER BY 3 DESC;
    

--Viewing the top 10 states with the highest number of accredited voters in 2015 & 2019
SELECT e2015.state, e2015.accredited_voters "2015",
                    e2019.accredited_voters "2019"                         
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    ORDER BY 3 DESC
    limit 10; 
        

--Viewing the Total number of accredited voters in 2015 & 2019 by geopolitical zones
SELECT e2015.geopolitical_zone, SUM(e2015.accredited_voters) "2015",
                                SUM(e2019.accredited_voters) "2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    GROUP BY 1
    ORDER BY 3 DESC;
    

--Viewing the top 10 states with the highest number of votes_casted in 2015 & 2019
SELECT e2015.state, e2015.votes_cast "2015",
                    e2019.votes_cast "2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    ORDER BY 3 DESC
    limit 10;
    
    
--Viewing the Total number of votes_casted in 2015 & 2019 by geopolitical zones
SELECT e2015.geopolitical_zone, SUM(e2015.votes_cast) "2015",
                                SUM(e2019.votes_cast) "2019"   
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    GROUP BY 1
    ORDER BY 3 DESC;


--Viewing the top 10 states with the highest number of valid_votes in 2015 & 2019
SELECT e2015.state, e2015.valid_votes "2015",
                    e2019.valid_votes "2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    ORDER BY 3 DESC
    limit 10;
                 
              
--Viewing the Total number of valid_votes in 2015 & 2019 by geopolitical zones
SELECT e2015.geopolitical_zone, SUM(e2015.valid_votes) "2015",
                                SUM(e2019.valid_votes) "2019"   
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    GROUP BY 1
    ORDER BY 3 DESC;
        
    
--Viewing how votes were rejected across the state (Top 10) in 2015 & 2019
SELECT e2015.state, e2015.rejected_votes "2015",
                    e2019.rejected_votes "2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    ORDER BY 3 DESC
    limit 10;
    
    
--Viewing how votes were rejected across geopolitical zone in 2015 & 2019
SELECT e2015.geopolitical_zone, SUM(e2015.rejected_votes) "2015",
                                SUM(e2019.rejected_votes) "2019"   
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    GROUP BY 1
    ORDER BY 3 DESC;


/* Insights and overview on how APC and PDP were able to gather votes across
   the states and geopolitical zones in the country in 2015 & 2019 election data */      

--Viewing the AVERAGE votes gathered by APC and PDP in 2015 and 2019 Presidential Election
SELECT ROUND(AVG(e2015.apc_votes)) "apc_2015", 
       ROUND(AVG(e2015.pdp_votes)) "pdp_2015",
       ROUND(AVG(e2019.apc_votes)) "apc_2019", 
       ROUND(AVG(e2019.pdp_votes)) "pdp_2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state;



--Viewing the states WON by APC above the AVERAGE votes they got in 2015 and 2019 
WITH j AS
        (SELECT e2015.state state, e2015.apc_votes e2015apc, e2019.apc_votes e2019apc 
        FROM election_2015 e2015
        JOIN election_2019 e2019
        ON e2015.state = e2019.state)
    SELECT j.state, j.e2015apc, j.e2019apc FROM j 
    WHERE j.e2015apc >= (SELECT AVG(apc_votes) FROM election_2015)  
    AND j.e2019apc >= (SELECT AVG(apc_votes) FROM election_2019)
    ORDER BY j.e2015apc DESC, j.e2019apc DESC;


--Viewing the states WON by PDP above the AVERAGE votes they got in 2015 and 2019 
WITH j AS
        (SELECT e2015.state state, e2015.pdp_votes e2015pdp, e2019.pdp_votes e2019pdp 
        FROM election_2015 e2015
        JOIN election_2019 e2019
        ON e2015.state = e2019.state)
    SELECT j.state, j.e2015pdp, j.e2019pdp FROM j 
    WHERE j.e2015pdp >= (SELECT AVG(pdp_votes) FROM election_2015)  
    AND j.e2019pdp >= (SELECT AVG(pdp_votes) FROM election_2019)
    ORDER BY j.e2015pdp DESC, j.e2019pdp DESC;
    

--Viewing the states WON by APC above PDP average votes in 2015 and 2019 
WITH j AS
        (SELECT e2015.state state, e2015.apc_votes e2015apc, e2019.apc_votes e2019apc 
        FROM election_2015 e2015
        JOIN election_2019 e2019
        ON e2015.state = e2019.state)
    SELECT j.state, j.e2015apc, j.e2019apc FROM j 
    WHERE j.e2015apc >= (SELECT AVG(pdp_votes) FROM election_2015)  
    AND j.e2019apc >= (SELECT AVG(pdp_votes) FROM election_2019)
    ORDER BY j.e2015apc DESC, j.e2019apc DESC;


--Viewing the states WON by PDP above APC average votes in 2015 and 2019 
WITH j AS
        (SELECT e2015.state state, e2015.pdp_votes e2015pdp, e2019.pdp_votes e2019pdp 
        FROM election_2015 e2015
        JOIN election_2019 e2019
        ON e2015.state = e2019.state)
    SELECT j.state, j.e2015pdp, j.e2019pdp FROM j 
    WHERE j.e2015pdp >= (SELECT AVG(apc_votes) FROM election_2015)  
    AND j.e2019pdp >= (SELECT AVG(apc_votes) FROM election_2019)
    ORDER BY j.e2015pdp DESC, j.e2019pdp DESC;


--Viewing the HIGHEST votes gathered by APC and PDP in 2015 and 2019 Presidential Election
SELECT MAX(e2015.apc_votes) "apc_2015", 
       MAX(e2015.pdp_votes) "pdp_2015",
       MAX(e2019.apc_votes) "apc_2019", 
       MAX(e2019.pdp_votes) "pdp_2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state;



--Viewing the states WON by APC above PDP HIGHEST votes in 2015 and 2019  

--2015
SELECT state , apc_votes 
        FROM election_2015 e2015
        where apc_votes >= (SELECT MAX(pdp_votes) FROM election_2015)
        ORDER BY 2 DESC;        

--2019
SELECT state , apc_votes 
        FROM election_2019 e2019
        where apc_votes >= (SELECT MAX(pdp_votes) FROM election_2019)
        ORDER BY 2 DESC; 

-- 2015 & 2019 Combined
 WITH j AS
        (SELECT e2015.state state, e2015.apc_votes e2015apc, e2019.apc_votes e2019apc 
        FROM election_2015 e2015
        JOIN election_2019 e2019
        ON e2015.state = e2019.state)
    SELECT j.state, j.e2015apc, j.e2019apc FROM j 
    WHERE j.e2015apc >= (SELECT MAX(pdp_votes) FROM election_2015)  
    AND j.e2019apc >= (SELECT MAX(pdp_votes) FROM election_2019)
    ORDER BY j.e2015apc DESC, j.e2019apc DESC;
        
 
 --Viewing the states WON by PDP above APC HIGHEST votes in 2015 and 2019  

--2015
SELECT state , pdp_votes 
        FROM election_2015 e2015
        where pdp_votes >= (SELECT MAX(apc_votes) FROM election_2015)
        ORDER BY 2 DESC;        

--2019
SELECT state , pdp_votes 
        FROM election_2019 e2019
        where pdp_votes >= (SELECT MAX(apc_votes) FROM election_2019)
        ORDER BY 2 DESC; 

-- 2015 & 2019 Combined
  WITH j AS
        (SELECT e2015.state state, e2015.pdp_votes e2015pdp, e2019.pdp_votes e2019pdp 
        FROM election_2015 e2015
        JOIN election_2019 e2019
        ON e2015.state = e2019.state)
    SELECT j.state, j.e2015pdp, j.e2019pdp FROM j 
    WHERE j.e2015pdp >= (SELECT MAX(apc_votes) FROM election_2015)  
    AND j.e2019pdp >= (SELECT MAX(apc_votes) FROM election_2019)
    ORDER BY j.e2015pdp DESC, j.e2019pdp DESC;
    
    
--Viewing the PERCENTAGE votes WON by APC in the states compare to PDP in 2015 and 2019 Presidential Election

--2015 %
SELECT state, apc_votes, pdp_votes, 
              CONCAT(ROUND(((apc_votes - pdp_votes) / AVG(apc_votes + pdp_votes)) *100), '%') "2015 %"
    FROM election_2015
    WHERE apc_votes >= pdp_votes
    GROUP BY 1,2,3
    ORDER BY 4 DESC;   
    
--2019 %
SELECT state, apc_votes, pdp_votes, 
              CONCAT(ROUND(((apc_votes - pdp_votes) / AVG(apc_votes + pdp_votes)) *100), '%') "2019 %"
    FROM election_2019
    WHERE apc_votes >= pdp_votes
    GROUP BY 1,2,3
    ORDER BY 4 DESC;    

-- 2015% and 2019% Combined
SELECT * FROM
    (SELECT state, apc_votes, pdp_votes, 
              CONCAT(ROUND(((apc_votes - pdp_votes) / AVG(apc_votes + pdp_votes)) *100), '%') "2015 %"
    FROM election_2015
    WHERE apc_votes >= pdp_votes
    GROUP BY 1,2,3
    ORDER BY 4 DESC) apc2015
     JOIN     
    (SELECT state, apc_votes, pdp_votes, 
              CONCAT(ROUND(((apc_votes - pdp_votes) / AVG(apc_votes + pdp_votes)) *100), '%') "2019 %"
    FROM election_2019
    WHERE apc_votes >= pdp_votes
    GROUP BY 1,2,3
    ORDER BY 4 DESC) apc2019
    ON apc2015.state=apc2019.state;
    
    
--Viewing the PERCENTAGE votes WON by PDP in the states compare to APC in 2015 and 2019 Presidential Election

--2015 %
SELECT state, pdp_votes, apc_votes,  
              CONCAT(ROUND(((pdp_votes - apc_votes) / AVG(pdp_votes + apc_votes)) *100), '%') "2015 %"
    FROM election_2015
    WHERE pdp_votes >= apc_votes  
    GROUP BY 1,2,3
    ORDER BY 4 DESC;   
    
--2019 %
SELECT state, pdp_votes, apc_votes,  
              CONCAT(ROUND(((pdp_votes - apc_votes) / AVG(pdp_votes + apc_votes)) *100,1), '%') "2019 %"
    FROM election_2019
    WHERE pdp_votes >= apc_votes  
    GROUP BY 1,2,3
    ORDER BY 4 DESC;    

-- 2015% and 2019% Merged
SELECT * FROM
    (SELECT state, pdp_votes, apc_votes,  
              CONCAT(ROUND(((pdp_votes - apc_votes) / AVG(pdp_votes + apc_votes)) *100), '%') "2015 %"
    FROM election_2015
    WHERE pdp_votes >= apc_votes  
    GROUP BY 1,2,3
    ORDER BY 4 DESC) pdp2015  
     JOIN     
    (SELECT state, pdp_votes, apc_votes,  
              CONCAT(ROUND(((pdp_votes - apc_votes) / AVG(pdp_votes + apc_votes)) *100), '%') "2019 %"
    FROM election_2019
    WHERE pdp_votes >= apc_votes  
    GROUP BY 1,2,3
    ORDER BY 2 DESC) pdp2019
    ON pdp2015.state = pdp2019.state;        
    


--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election across the geopolitical_zone   
SELECT SUM(e2015.apc_votes) "2015 Apc Total_votes", 
       SUM(e2015.pdp_votes) "2015 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone  
    IN ('North West', 'South West', 'North Central', 'South South', 'North East', 'South East')
    ;

    
--Viewing how APC & PDP were voted for across geopolitical zones in 2015 and 2019 Presidential Election
SELECT e2015.geopolitical_zone,
              SUM(e2015.apc_votes) "Apc 2015",SUM(e2015.pdp_votes) "Pdp 2015",
              SUM(e2019.apc_votes) "Apc 2019",SUM(e2019.pdp_votes) "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    GROUP BY 1
    ORDER BY 2 DESC, 3 DESC    
    
    
--Viewing the percentage votes of geopolitical zones WON by APC compare to PDP in 2015 and 2019 Presidential Election

--2015 %

WITH j AS
        (SELECT e2015.geopolitical_zone geopolitical_zone, 
         SUM(e2015.apc_votes) e2015apc, SUM(e2015.pdp_votes) e2015pdp 
        FROM election_2015 e2015
         WHERE (SELECT  SUM(e2015.apc_votes) FROM election_2015 e2015) 
                              >= (SELECT SUM(e2015.pdp_votes) 
                                  FROM election_2015 e2015)                             
        GROUP BY 1
        ORDER BY 2 DESC)
    SELECT j.geopolitical_zone, j.e2015apc, j.e2015pdp,
    CONCAT(ROUND(((j.e2015apc - j.e2015pdp) / AVG(j.e2015apc + j.e2015pdp)) *100), '%') "e2015%"
    FROM j WHERE j.e2015apc >= j.e2015pdp
    GROUP BY 1, 2, 3
    ORDER BY 4 DESC;
   
   
--2019 %

 WITH j AS
        (SELECT e2019.geopolitical_zone geopolitical_zone, 
         SUM(e2019.apc_votes) e2019apc, SUM(e2019.pdp_votes) e2019pdp 
        FROM election_2019 e2019
         WHERE (SELECT  SUM(e2019.apc_votes) FROM election_2019 e2019) 
                              >= (SELECT SUM(e2019.pdp_votes) 
                                  FROM election_2019 e2019)                             
        GROUP BY 1
        ORDER BY 2 DESC)
    SELECT j.geopolitical_zone, j.e2019apc, j.e2019pdp,
    CONCAT(ROUND(((j.e2019apc - j.e2019pdp) / AVG(j.e2019apc + j.e2019pdp)) *100), '%') "e2019%"
    FROM j WHERE j.e2019apc >= j.e2019pdp
    GROUP BY 1, 2, 3
    ORDER BY 4 DESC;          
        

--Viewing the percentage votes of geopolitical zones WON by PDP compare to APC in 2015 and 2019 Presidential Election

--2015 %
       WITH j AS
        (SELECT e2015.geopolitical_zone geopolitical_zone, SUM(e2015.apc_votes) e2015apc, SUM(e2015.pdp_votes) e2015pdp 
        FROM election_2015 e2015
         WHERE (SELECT  SUM(e2015.apc_votes) FROM election_2015 e2015) 
                              >= (SELECT SUM(e2015.pdp_votes) 
                                  FROM election_2015 e2015)                             
        GROUP BY 1
        ORDER BY 2 DESC)
        SELECT j.geopolitical_zone, j.e2015pdp, j.e2015apc, 
           CONCAT(ROUND(((j.e2015pdp - j.e2015apc) / AVG(j.e2015pdp + j.e2015apc)) *100), '%') "e2015%"
           FROM j WHERE j.e2015pdp >= j.e2015apc
           GROUP BY 1, 2, 3
        ORDER BY 4 DESC;
   
--2019 %

 WITH j AS
        (SELECT e2019.geopolitical_zone e2019gz, SUM(e2019.apc_votes) e2019apc, SUM(e2019.pdp_votes) e2019pdp 
        FROM election_2019 e2019
         WHERE (SELECT  SUM(e2019.apc_votes) FROM election_2019 e2019) 
                              >= (SELECT SUM(e2019.pdp_votes) 
                                  FROM election_2019 e2019)                             
        GROUP BY 1
        ORDER BY 2 DESC)
        SELECT j.e2019gz, j.e2019pdp, j.e2019apc, 
           CONCAT(ROUND(((j.e2019pdp - j.e2019apc) / AVG(j.e2019pdp + j.e2019apc)) *100), '%') "e2019%"
           FROM j WHERE j.e2019pdp >= j.e2019apc
           GROUP BY 1, 2, 3
        ORDER BY 2 DESC;   




/* Breakdown of how VOTES were gathered by the 2 parties across the geopolitical_zone */    


--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election from the NORTH WEST   
SELECT SUM(e2015.apc_votes) "2015 Apc Total_votes", 
       SUM(e2015.pdp_votes) "2015 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone = 'North West';
    
    
--Viewing how the states in the North West voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North West' 
    AND   e2019.geopolitical_zone = 'North West' 
    ORDER BY 2 DESC, 3 DESC;
    
    
--Viewing states WON by APC in the North West over Pdp in the 2015 and 2019 Presidential Election since they have the MOST votes in that region
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North West' 
    AND   e2019.geopolitical_zone = 'North West' 
    GROUP BY 1, 2,3,4,5
    HAVING e2015.apc_votes > e2015.pdp_votes
            AND e2019.apc_votes > e2019.pdp_votes
    ORDER BY 2 DESC, 3 DESC;

    
    
--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election in the SOUTH WEST   
SELECT SUM(e2015.apc_votes) "2015 Apc Total_votes", 
       SUM(e2015.pdp_votes) "2015 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone = 'South West';   
    
    
    
--Viewing how the states in the South West voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South West' 
    AND   e2019.geopolitical_zone = 'South West'
    ORDER BY 2 DESC, 3 DESC;        
    
       
--Viewing states WON by APC in the South West over Pdp in the 2015 and 2019 Presidential Election since they have the MOST votes in that region
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South West' 
    AND   e2019.geopolitical_zone = 'South West'
    GROUP BY 1, 2,3,4,5
    HAVING e2015.apc_votes > e2015.pdp_votes
            AND e2019.apc_votes > e2019.pdp_votes
    ORDER BY 2 DESC, 3 DESC;    


--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election in the NORTH CENTRAL   
SELECT SUM(e2015.apc_votes) "2015 Apc Total_votes", 
       SUM(e2015.pdp_votes) "2015 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone = 'North Central';
        
    
--Viewing how the states in the North Central voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North Central' 
    AND   e2019.geopolitical_zone = 'North Central' 
    ORDER BY 2 DESC, 3 DESC; 


--Viewing states WON by APC in the North Central over PDP in the 2015 and 2019 Presidential Election since they have the MOST votes in that region
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North Central' 
    AND   e2019.geopolitical_zone = 'North Central'
    GROUP BY 1, 2,3,4,5
    HAVING e2015.apc_votes > e2015.pdp_votes
            AND e2019.apc_votes > e2019.pdp_votes
    ORDER BY 2 DESC, 3 DESC;     
    


--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election in the SOUTH SOUTH   
SELECT SUM(e2015.apc_votes) "2015 Apc Total_votes", 
       SUM(e2015.pdp_votes) "2015 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone = 'South South';
    
    
--Viewing how the states in the South South voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.pdp_votes "Pdp 2015", e2015.apc_votes "Apc 2015",
                    e2019.pdp_votes "Pdp 2019", e2019.apc_votes "Apc 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South South' 
    AND   e2019.geopolitical_zone = 'South South' 
    ORDER BY 2 DESC, 3 DESC;
    

--Viewing states WON by PDP in the South South over Apc in the 2015 and 2019 Presidential Election since they have the MOST votes in that region
SELECT e2015.state, e2015.pdp_votes "Pdp 2015", e2015.apc_votes "Apc 2015",
                    e2019.pdp_votes "Pdp 2019", e2019.apc_votes "Apc 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South South' 
    AND   e2019.geopolitical_zone = 'South South'
    GROUP BY 1, 2,3,4,5
    HAVING e2015.pdp_votes > e2015.apc_votes 
            AND e2019.pdp_votes > e2019.apc_votes
    ORDER BY 2 DESC, 3 DESC;



--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election in the NORTH EAST   
SELECT SUM(e2015.apc_votes) "2015 Apc Total_votes", 
       SUM(e2015.pdp_votes) "2015 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone = 'North East';    


    
--Viewing how the states in the North East voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North East' 
    AND   e2019.geopolitical_zone = 'North East' 
    ORDER BY 2 DESC, 3 DESC;
    
    
--Viewing states WON by APC in the North East over Pdp in the 2015 and 2019 Presidential Election since they have the MOST votes in that region
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North East' 
    AND   e2019.geopolitical_zone = 'North East' 
    GROUP BY 1, 2,3,4,5
    HAVING e2015.apc_votes > e2015.pdp_votes
            AND e2019.apc_votes > e2019.pdp_votes
    ORDER BY 2 DESC, 3 DESC;    


--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election in the SOUTH EAST   
SELECT SUM(e2015.pdp_votes) "2015 Pdp Total_votes", 
       SUM(e2015.apc_votes) "2015 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone = 'South East';               
    
    
--Viewing how the states in the South East voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.pdp_votes "Pdp 2015", e2015.apc_votes "Apc 2015",
                    e2019.pdp_votes "Pdp 2019", e2019.apc_votes "Apc 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South East' 
    AND   e2019.geopolitical_zone = 'South East' 
    ORDER BY 2 DESC, 3 DESC; 
    
    
--Viewing states WON by PDP in the South East over Apc in the 2015 and 2019 Presidential Election since they have the MOST votes in that region
SELECT e2015.state, e2015.pdp_votes "Pdp 2015", e2015.apc_votes "Apc 2015",
                    e2019.pdp_votes "Pdp 2019", e2019.apc_votes "Apc 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South East' 
    AND   e2019.geopolitical_zone = 'South East'
    GROUP BY 1, 2,3,4,5
    HAVING e2015.pdp_votes > e2015.apc_votes 
            AND e2019.pdp_votes > e2019.apc_votes
    ORDER BY 2 DESC, 3 DESC;    
    
--Thank you
