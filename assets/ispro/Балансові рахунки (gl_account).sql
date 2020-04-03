-- �������� ������� (gl_account)
-- �����! ����� ���������� ����� ���� �� ����������� ����� ������� �� ���������������� � ������� ��� ���������� ��������, �� � ����� ���������. 
-- ����� ��������� ��� ��������� ������� �������� "�����������", "����� ������������� �����", "����� ���������� �� ��������".
-- �������� �� ������������.
-- ���� ������� �� ����������� � ������� ���� ������� �� ������� �������
-- ��������� ���� �������� ������� (gl_account.csv) ����� �� �����������, ��������������� ����� ��� ��������� ������� ����������
-- �� ��� �������� ��� ��������� - 8 - 12 ������.
/*BEGIN-OF-HEAD*/
select 'ID', 'code', 'name', 'description'
union all
/*END-OF-HEAD*/
select 
	cast(sprpls_rcd as varchar) ID	
	,sprpls_sch code	
	,sprpls_nm name	
	,sprpls_sch + ' ' + sprpls_nm description	
from sprpls p1
where sprpls_rcd in (
	select distinct KpuPrkz_Sch
	from kpuprk1
	where KpuPrkz_Sch <> 0
/*
	union
	select distinct kpurl_cdsch
	from kpurlospz
	where kpurl_cdsch <> 0
	union
	select distinct KpuF_CdSch
	from kpufa1
	where kpuf_cdsch <> 0
*/
)	