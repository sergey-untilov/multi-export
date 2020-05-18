select 
row_number() over(ORDER BY positionID) as "�/�",
cast(positionID as varchar) as "������� ���",
SprD_Cd as "���������� ���.",  
(
Select cast(sprpdr_rcd as varchar) from sprpdr Where sprpdr.SprPdr_Rcd = departmentID
)   as "��� ��������",
CONVERT(VARCHAR(10), SprD_BegDat , 121)  as "���� ���������",
'' as "� ���������",
'' as "���� ���������",
'' as "���� ��������",
'' as "� ���-�� ���.",
'' as "���� ���-�� ���",
'N' as "���. ����������",
'' as "���� ������",
'' as "���� ������.",
'' as "����������",
SprD_oKlMin as "̳������. �����",
SprD_oklmax as "��������. �����",
SprD_OKLdEF as "��������� �����",
'' as "������ �������.",
'0' as "���. �����-���",
'0' as "���������-���",
'' as "� ��������� ���.",
'' as "����. ������ ��",
'' as "����� ������",
SprD_NMR as "����� (�������)",
SprD_NMD as "����� (���-���)",
SprD_NMT as "����� (�������)",
'' as "��� ������",
SprD_PrFNmR as "�������",
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = Sprd_KatCd
and SprSpr_Cd = 580
) as "��� ������ ��",
(
Select Spr_Nm from pspr Where pspr.Spr_Rcd = Sprd_KatCdK1
)   as "���. ������ ��",
(
Select Spr_Nm from pspr Where pspr.Spr_Rcd = Sprd_KatGSCd
) as "��. ���. ����� ��",
'' as "���������� ��",
'' as "������ �����"
 FROM SPRDOL
inner join (
	select distinct kpuprk1.kpuprkz_pdrcd * 10000 + kpuprk1.kpuprkz_dol positionID, kpuprk1.kpuprkz_pdrcd departmentID, kpuprk1.kpuprkz_dol dictPositionID
	from kpuprk1
) t1 on t1.dictPositionID = SprD_Cd
where sprd_prz = 0 or exists (
	select null
	from kpuprk1
	where kpuprkz_dol = SprD_Cd
)