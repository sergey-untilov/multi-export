
select 
row_number() over(ORDER BY KPUC1.Kpu_CdNlp) AS "�/�",
KPUC1.Kpu_CdNlp AS "������", --taxCode
KPUC1.Kpu_fio  AS "������ ϲ�", --fullFIO
CONVERT(VARCHAR(10), Kpu_DtRoj , 121) AS "���� ����������", --birthDate
kpu_tn AS "��������� �����",
KPUC1.Kpu_rcd AS "������� ���",
KdrSREd_SPRcd AS "��-��� ������",
'' AS "��-��� ������",
CONVERT(VARCHAR(10), KdrSREd_DatN , 121) AS "���� �������-��",
'' AS "����� ��� �����.",
'' AS "���� ���. �����.",
'' AS "���� �������-��",
'' AS "���� �����. ���.",
KdrSRSP_Grf AS "������ ������",
'' AS "�-�� �����",
'1' AS "�������",
'' AS "����������",
'' AS "� � ������",
CONVERT(VARCHAR(10), KdrSREd_PrvDatN , 121) AS "���� ���������" 
from KdrSREd
 left join KPUC1 ON KPUC1.Kpu_Rcd = KdrSREd.KdrSREd_KpuRcd
 left join kpux on kpux.kpu_rcd = KdrSREd.KdrSREd_KpuRcd
 left join KdrSRSP on KdrSRSP.KdrSRSP_Rcd = KdrSREd.KdrSREd_SPRcd

 

