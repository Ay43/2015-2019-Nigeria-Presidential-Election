/* First Step is to get the table information. Here,we would be using
   two(2) different tables namely 2015 presidential election and
   2019 presidential election data */

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
   insights and overview on the registered_voters, accredited_voters, votes_cast, 
   valid_votes and rejected_votes across the states and geopolitical zones in the 
   country */ 
   
--Viewing the total states and total geopolitical zone on the tables individually   
SELECT COUNT(DISTINCT(e2015.state)),
       COUNT(DISTINCT(e2015.geopolitical_zone))
    FROM election_2015 e2015;
    
SELECT COUNT(DISTINCT(e2019.state)),
       COUNT(DISTINCT(e2019.geopolitical_zone))
    FROM election_2019 e2019;
   
   
--Viewing the top 10 states with the highest number of registered voters in 2015 & 2019
SELECT election_2015.state, 
                           election_2015.registered_voters "2015",
                           election_2019.registered_voters "2019"                         
    FROM election_2015
    JOIN election_2019
    ON election_2015.state = election_2019.state
    ORDER BY 3 DESC
    limit 10;          


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




/* Exploratory Analysis on the two(2) tables merged (2015 & 2019 election data) for 
   insights and overview on how APC and PDP were able to  gather votes across
   the states and geopolitical zones in the country */      
    
--Viewing the top 10 states won by APC and PDP in the 2015 & 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",
                    e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",
                    e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state = e2019.state
    ORDER BY 2 DESC,3 DESC
    LIMIT 10;
      
    
--Viewing how APC & PDP were voted for across geopolitical zones in 2015 and 2019 Presidential Election
SELECT e2015.geopolitical_zone,
              SUM(e2015.apc_votes) "Apc 2015",SUM(e2015.pdp_votes) "Pdp 2015",
              SUM(e2019.apc_votes) "Apc 2019",SUM(e2019.pdp_votes) "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    GROUP BY 1
    ORDER BY 2 DESC, 3 DESC
    
    
--Viewing how the states in the North West voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North West' 
    AND   e2019.geopolitical_zone = 'North West' 
    ORDER BY 2 DESC, 3 DESC;
    
    
--Viewing how the states in the North East voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North East' 
    AND   e2019.geopolitical_zone = 'North East' 
    ORDER BY 2 DESC, 3 DESC;
    
    
--Viewing how the states in the South West voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South West' 
    AND   e2019.geopolitical_zone = 'South West' 
    ORDER BY 2 DESC, 3 DESC;
    
    
--Viewing how the states in the North Central voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'North Central' 
    AND   e2019.geopolitical_zone = 'North Central' 
    ORDER BY 2 DESC, 3 DESC;
    
    
--Viewing how the states in the South South voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South South' 
    AND   e2019.geopolitical_zone = 'South South' 
    ORDER BY 2 DESC, 3 DESC;
    
    
--Viewing how the states in the South East voted APC & PDP during the 2015 and 2019 Presidential Election
SELECT e2015.state, e2015.apc_votes "Apc 2015",e2015.pdp_votes "Pdp 2015",
                    e2019.apc_votes "Apc 2019",e2019.pdp_votes "Pdp 2019"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone = 'South East' 
    AND   e2019.geopolitical_zone = 'South East' 
    ORDER BY 2 DESC, 3 DESC; 
    
    
--Viewing the Total votes gathered by APC and PDP in the 2015 & 2019 Presidential Election across the geopolitical_zone   
SELECT SUM(e2015.apc_votes) "2015 Apc Total_votes", 
       SUM(e2015.pdp_votes) "2015 Pdp Total_votes",
       SUM(e2019.apc_votes) "2019 Apc Total_votes",
       SUM(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone 
    IN ('North West', 'South West', 'North Central', 'South South', 'North East', 'South East')
    ;


--Viewing the Average votes gathered by APC and PDP in the 2015 & 2019 Presidential Election across the geopolitical_zone   
SELECT AVG(e2015.apc_votes) "2015 Apc Total_votes", 
       AVG(e2015.pdp_votes) "2015 Pdp Total_votes",
       AVG(e2019.apc_votes) "2019 Apc Total_votes",
       AVG(e2019.pdp_votes) "2019 Pdp Total_votes"
    FROM election_2015 e2015
    JOIN election_2019 e2019
    ON e2015.state=e2019.state
    WHERE e2015.geopolitical_zone 
    IN ('North West', 'South West', 'North Central', 'South South', 'North East', 'South East')
    ;
  

/* Final Step is to understand how many votes were gathered by Apc and Pdp in the
   2015 and 2019 presidential election by certain fraction (25%, 50% and 75%) across the 
   geopolitical_zone */
   
-- 25% Fraction of votes gathered by Apc and Pdp in the 2015 & 2019 presidential Election across the geopolitical_zone  
SELECT PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY e2015.apc_votes) "Apc_2015(25%)",
       PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY e2015.pdp_votes) "Pdp_2015(25%)",
       PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY e2019.apc_votes) "Apc_2019(25%)",
       PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY e2019.pdp_votes) "Pdp_2019(25%)"
    FROM election_2015 e2015
    join election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone 
    IN ('North West', 'South West', 'North Central', 'South South', 'North East', 'South East')
    ;


-- 50% Fraction of votes gathered by Apc and Pdp in the 2015 & 2019 presidential Election across the  geopolitical_zone 
SELECT PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY e2015.apc_votes) "Apc_2015(50%)",
       PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY e2015.pdp_votes) "Pdp_2015(50%)",
       PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY e2019.apc_votes) "Apc_2019(50%)",
       PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY e2019.pdp_votes) "Pdp_2019(50%)"
    FROM election_2015 e2015
    join election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone 
    IN ('North West', 'South West', 'North Central', 'South South', 'North East', 'South East')
    ;


-- 75% Fraction of votes gathered by Apc and Pdp in the 2015 & 2019 presidential Election across the  geopolitical_zone 
SELECT PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY e2015.apc_votes) "Apc_2015(75%)",
       PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY e2015.pdp_votes) "Pdp_2015(75%)",
       PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY e2019.apc_votes) "Apc_2019(75%)",
       PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY e2019.pdp_votes) "Pdp_2019(75%)"
    FROM election_2015 e2015
    join election_2019 e2019
    ON e2015.state = e2019.state
    WHERE e2015.geopolitical_zone 
    IN ('North West', 'South West', 'North Central', 'South South', 'North East', 'South East')
    ;
    
    
--Thank you