-- ���� ����� �������� ���� (hr_dictTimeCost)
/*
select
	'ID' ID
	,'code' code
	,'name' name	
	,'nameShort' nameShort	
	,'timeCostType' timeCostType	
	,'orderClassID' orderClassID	
	,'isClose' isClose	
	,'description' description	
	,'nameSmall' nameSmall	
	,'dictTimePrintID' dictTimePrintID
union all
*/
select
	'1' ID
	,'����' code
	,'������ ������, ���������� ��������� ����������� ��������� ����������' name	
	,'�' nameShort	
	,'WORK' timeCostType	
	,null orderClassID	
	,'0' isClose	
	,'���� ������ ������, ���������� ��������� ����������� ��������� ���������� �' description	
	,'�������' nameSmall	
	,null dictTimePrintID
union all
select
	'2' ID
	,'���' code
	,'��������' name	
	,'���' nameShort	
	,'FREE' timeCostType	
	,null orderClassID	
	,'0' isClose	
	,'��� �������� ���' description	
	,'��������' nameSmall	
	,null dictTimePrintID

