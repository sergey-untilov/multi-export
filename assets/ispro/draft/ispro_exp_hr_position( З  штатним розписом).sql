select 
row_number() over(ORDER BY KdrSRSP_rcd) as "�/�",
KdrSRSP_rcd as "������� ���",
KdrSRSP_PdCd as "���������� ���.",  
(
Select cast(sprpdr_rcd as varchar) from sprpdr Where sprpdr.SprPdr_Pd = KdrSRSP_pdcd
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
 SprD_oKlMax as "��������. �����",
KdrSRSP_Okl as "��������� �����",
'' as "������ �������.",
'0' as "���. �����-���",
'0' as "���������-���",
'' as "� ��������� ���.",
'' as "����. ������ ��",
SprD_NmIm  as "����� ������",
SprD_NMR as "����� (�������)",
 SprD_NMD as "����� (���-���)",
 SprD_NMT as "����� (�������)",
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KdrSRSP_Kat
and SprSpr_Cd = 549
) as "��� ������",
 SprD_PrFNmR as "�������",
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = Sprd_KatCd
and SprSpr_Cd = 580
) as "��� ������ ��",
(
Select Spr_Nm from pspr Where pspr.Spr_Rcd = Sprd_KatCdK1
)  as "���. ������ ��",
(
Select Spr_Nm from pspr Where pspr.Spr_Rcd = Sprd_KatGSCd
) as "��. ���. ����� ��",
'' as "���������� ��",
'' as "������ �����"
 FROM KdrSRSP
join KdrSRCt
ON KdrSRCt.KdrSRCt_Rcd = KdrSRSP_CtRcd
left join SPRDOL
ON SPRDOL.SprD_Cd = KdrSRSP_Dol
where KdrSRCt_Stt = 1 
