  --PART I
  
  
  CREATE TABLESPACE quiz_noche 
    DATAFILE 'maximo_data_0.ora' SIZE 1G,
             'maximo_data_1.ora' SIZE 1G;

    CREATE USER user1
    IDENTIFIED BY user1
    DEFAULT TABLESPACE quiz_noche;
    GRANT CREATE SESSION TO user1;
    GRANT CREATE TABLE TO user1;
    
    CREATE USER user2
    IDENTIFIED BY user2
    DEFAULT TABLESPACE quiz_noche;
    GRANT CREATE SESSION TO user2;
    
  CREATE PROFILE estudiante LIMIT 
  PASSWORD_LIFE_TIME               40   -- dias
  SESSIONS_PER_USER                 1   -- Una por usuario
  IDLE_TIME                        10   -- minutos
  FAILED_LOGIN_ATTEMPTS             4;  -- Logins fallidos
   
   
   
     ALTER USER user1 PROFILE estudiante;
     ALTER USER user2 PROFILE estudiante;
 
   --PART II 
    create table attacks (
	id INT,
	url VARCHAR(2048),
	ip_address VARCHAR(255),
	number_of_attacks INT,
	time_of_last_attack TIMESTAMP
);

GRANT  DBA TO user2;
 
 --PART III
   SELECT * FROM attacks;
   
   
   --QUERY 1
   
   SELECT * FROM attacks WHERE URL LIKE '%http%';
  
  --QUERY2
   SELECT url FROM attacks WHERE URL LIKE '%google%'
   ORDER BY number_of_attacks DESC;
  
  --QUERY 3
  SELECT ip_address, time_of_last_attack FROM attacks WHERE time_of_last_attack LIKE '%18%'
   ORDER BY number_of_attacks DESC;

    --QUERY4
    
  SELECT ip_address, number_of_attacks FROM attacks
  order by number_of_attacks desc;
 
 QUERY 5
  SELECT ip_address, number_of_attacks FROM attacks 
  WHERE url LIKE '%instagram%' and url like '%http%';
 

  