-- ������������ ����� ���� �������� ������ � �������  (��� ���������� ������������ � ������� hr_empStateMilitary)
--KpuWar1 - �������� ����
--KpuNVP1 - ��������� ������� ����������
--KpuVZBP1 - ���������� �������� ������ �� �����������
--KpuBtl1 - ������� � ������ ���������


select
row_number() over(ORDER BY KPUC1.Kpu_CdNlp) AS "�/�",
KPUC1.Kpu_CdNlp AS "������", --taxCode
KPUC1.Kpu_rcd  AS "������ ϲ�", --fullFIO
CONVERT(VARCHAR(10), Kpu_DtRoj , 121) AS "���� ����������", --birthDate
case  
when KpuWar_VobCd = 2 then '03'
when KpuWar_VobCd = 1 then '02'
when KpuWar_VobCd = 3 then '01'
when KpuWar_VobCd = 4 then '04'
else '' 
 end AS "���� �����", --dictStateMilitaryID
(
Select Spr_NmLong from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_CdGr
and pspr.sprspr_cd = 680973
) AS "����� �����", --groupAccounting
case  
when KpuWar_CdKat = 1 then '01'
when KpuWar_CdKat = 2 then '02'
else '' 
 end  AS "�������. �����",  -- dictCategMilitaryID
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_CdSos
and pspr.sprspr_cd = 680975
) AS "�����",	--composition
KpuWar_CdZvn AS "��� �����. ��.",
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_CdZvn
and pspr.sprspr_cd = 531
) AS "³����. ������" , --dictMilitaryRankID
KpuWar_CdSos AS "��� �� �� ���.",  --
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_CdSos
and pspr.sprspr_cd = 680975
) AS "������� �� ���", --
KpuWar_nMRsP AS "���",  --dictMilitarySpecialtyID
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_doc
and pspr.sprspr_cd = 681071
) AS "����� ���", --
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_Godn
and pspr.sprspr_cd = 680977
) AS "�������. �� ��", --
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_Godn
and pspr.sprspr_cd = 680977
) AS "����������",  --dictMilitarySuitableID
'' AS "�������", 
'' AS "���� ��. �����",
'' AS "��� ����. 2-3 �.",
CONVERT(VARCHAR(10), KpuWar_DtDoc , 121) AS "���� ������ ��",
KpuWar_DocN AS "����� ������",
'' AS "����������",
'' AS "����� ������� ��",
KpuWar_Spu AS "� ���������",
KpuWar_Beg AS "���� ���������",
KpuWar_Spu AS "��������",
''  AS "���� ���������",
''  AS "³�������� ��",
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_RVR
and pspr.sprspr_cd = 680978
) AS "��� �������.",	 --office
''  AS "��������, ����",
''  AS "��������, �",
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuWar1.KpuWar_CdMP
and pspr.sprspr_cd = 681018
)  AS "���. ���������.",
case  
when KpuWar_EndCd = 1 then '�� ����'
when KpuWar_EndCd = 2 then '�� ������ ������"�'
when KpuWar_EndCd = 3 then '��� ����������'
when KpuWar_EndCd = 4 then '������� �� ��� ������ �� ���'
else '' 
 end AS "������� ������",
KPUC1.Kpu_rcd  AS "������� ���"
 from KpuWar1
 join KPUC1
 ON KPUC1.Kpu_Rcd = KpuWar1.Kpu_Rcd