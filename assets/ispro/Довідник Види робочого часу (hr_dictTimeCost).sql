-- ������� ���� �������� ���� (hr_dictTimeCost)
/*BEGIN-OF-HEAD*/
select 
	'ID' ID	
	,'code' code	
	,'name' name	
	,'timeCostType' timeCostType
union all	
/*END-OF-HEAD*/
select 
	'1' ID	
	,'���' code	
	,'��������' name	
	,'FREE' timeCostType
union all	
select 
	'2' ID	
	,'����' code	
	,'�������' name	
	,'WORK' timeCostType
