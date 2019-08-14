









select H.ACCOUNTID, COUNT(*) no_of_calls_made, min(STARTDATE) as Start_Date, SIGNED_DATE 
from sysdba.HISTORY h inner join sysdba.ACCOUNT_FSI_CONTRACT a on h.ACCOUNTID = a.ACCOUNTID 
where CATEGORY in ('Call') AND h.STARTDATE < a.SIGNED_DATE
group by h.ACCOUNTID, SIGNED_DATE
HAVING a.SIGNED_DATE IS NOT NULL
ORDER BY COUNT(*)	