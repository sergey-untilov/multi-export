-- ������������ ����� ���� ��������� ������� � ������� KpuNau1 (��� ���������� ������������ � ������� hr_empRangeScience)

select
row_number() over(ORDER BY KPUC1.Kpu_CdNlp) AS "�/�",
KPUC1.Kpu_CdNlp AS "������", --taxCode
KPUC1.kpu_rcd  AS "������ ϲ�", --fullFIO
CONVERT(VARCHAR(10), Kpu_DtRoj , 121) AS "���� ����������", --birthDate
KpuNau_CdNS  AS "��� ����. ��.", -- dictDegreeID
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuNau1.KpuNau_CdNS
and pspr.sprspr_cd = 680964
)  AS "����. ������", 
KpuNau_CdSp  AS "��� �������-�", --dictspecialtyID
KpuNau_SpNm  AS "�������-�� ���",
KpuNau_NmrD  AS "� �-�� ��� �����.", --docNumber
CONVERT(VARCHAR(10), KpuNau_DtVD , 121)  AS "���� ���������", --docDate
KpuNau_YPr  AS "г� ���������",
KpuNau_Dsr  AS "���� ��������.",
KPUC1.kpu_rcd  AS "������� ���"
from KpuNau1
join KPUC1
 ON KPUC1.Kpu_Rcd = KpuNau1.Kpu_Rcd
