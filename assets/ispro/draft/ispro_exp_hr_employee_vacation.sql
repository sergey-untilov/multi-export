select
row_number() over(ORDER BY KPUC1.Kpu_CdNlp) AS "�/�",
KPUC1.Kpu_CdNlp AS "������", --taxCode
KPUC1.kpu_rcd  AS "������ ϲ�", --fullFIO
CONVERT(VARCHAR(10), Kpu_DtRoj , 121) AS "���� ����������", --birthDate
(
Select Spr_Nm from pspr Where pspr.Spr_Cd = KpuOtpf1.KpuOtpF_Cd
and pspr.sprspr_cd = 787202
)  AS "��� ��������", --
CONVERT(VARCHAR(10), KpuOtpF_PDn , 121)  AS "������� ������", --
CONVERT(VARCHAR(10), KpuOtpF_PDk , 121)  AS "ʳ���� ������", --
KpuOtpF_Len  AS "�� ��������", --
SUM(KpuOtpF_Use)  AS "���������� ��", --
CONVERT(VARCHAR(10), KPUC1.kpu_DtPst , 121)  AS "���� ���������", --
KPUC1.kpu_rcd  AS "������� ���" --
from KpuOtpf1
join KPUC1
 ON KPUC1.Kpu_Rcd = KpuOtpf1.Kpu_Rcd
 where KpuOtpf1.KpuOtpF_Len >0
Group by KPUC1.Kpu_CdNlp, KPUC1.kpu_rcd, Kpu_DtRoj, KpuOtpf1.KpuOtpF_Cd, KpuOtpf1.KpuOtpF_PDn,KpuOtpF_PDk, KPUC1.kpu_DtPst, KpuOtpf1.KpuOtpF_Len