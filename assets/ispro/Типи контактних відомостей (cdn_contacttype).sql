-- ���� ���������� ��������� (cdn_contacttype)
/*BEGIN-OF-HEAD*/
select 'ID' ID, 'code' code, 'name' name
union all
/*END-OF-HEAD*/
select '1' ID, 'email' code, '���������� ������' name
union all
select '2' ID, 'legalAddr' code, '������ ���������' name
union all
select '3' ID, 'actualAddr' code, '������ ���������� ����������' name
union all
select '4' ID, 'phone' code, '�������' name
union all
select '5' ID, 'mobPhone' code, '�������� �������' name
union all
select '6' ID, 'filName' code, '����� ��볿' name
union all
select '7' ID, 'postAddr' code, '������� ������' name
union all
select '8' ID, 'fax' code, '����' name
union all
select '9' ID, 'other' code, '�����' name
