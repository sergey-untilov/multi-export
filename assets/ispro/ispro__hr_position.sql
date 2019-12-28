-- ������� ����� (�� ������� �������) (hr_position)
/*
select 
	'ID' ID, 'code' code, 'name' name, 'fullName' fullName, 'parentUnitID' parentUnitID, 'state' state, 'psCategory' psCategory, 'positionType' positionType, 
	'dictProfessionID' dictProfessionID, 'dictWagePayID' dictWagePayID, 'description' description, 'nameGen' nameGen, 'nameDat' nameDat, 'fullNameGen' fullNameGen, 
	'fullNameDat' fullNameDat, 'nameOr' nameOr, 'fullNameOr' fullNameOr, 'quantity' quantity, 'personalType' personalType, 'positionCategory' positionCategory,
	'dictStatePayID' dictStatePayID, 'accrualSum' accrualSum, 'payElID' payElID, 'dictStaffCatID' dictStaffCatID, 'dictFundSourceID' dictFundSourceID, 'nameAcc' nameAcc,
	'fullNameAcc' fullNameAcc, 'entryOrderID' entryOrderID, 'nameLoc' nameLoc, 'fullNameLoc' fullNameLoc, 'nameNom' nameNom, 'nameVoc' nameVoc, 'fullNameNom' fullNameNom,
	'fullNameVoc' fullNameVoc, 'liquidate' liquidate
union all	
*/
select 
	--cast(SprD_Cd as varchar) ID,
	cast(positionID as varchar) ID,
	cast(SprD_Cd as varchar) code,
	case when sprD_NmIm is null or len(sprD_NmIm) = 0 then cast(SprD_Cd as varchar) else sprD_NmIm end name,
	case when sprD_NmIm is null or len(sprD_NmIm) = 0 then cast(SprD_Cd as varchar) else sprD_NmIm end fullName,
	--null parentUnitID,
	cast(departmentID as varchar) parentUnitID,
	'ACTIVE' state,
	null psCategory,	
	null positionType,
	null dictProfessionID,	
	null dictWagePayID,	
	sprD_NmIm description,	
	sprD_NmIm nameGen,	
	sprD_NmD nameDat,	
	sprD_NmIm fullNameGen,	
	sprD_NmD fullNameDat,	
	sprD_NmT nameOr,
	sprD_NmT fullNameOr,	
	'0' quantity,
	null personalType,	
	null positionCategory,	
	null dictStatePayID,	
	null accrualSum,	
	null payElID,	
	null dictStaffCatID,	
	null dictFundSourceID,	
	sprD_NmIm nameAcc,	
	sprD_NmIm fullNameAcc,	
	null entryOrderID,	
	sprD_NmIm nameLoc,	
	sprD_NmIm fullNameLoc,	
	sprD_NmIm nameNom,	
	sprD_NmIm nameVoc,	
	sprD_NmIm fullNameNom,	
	sprD_NmIm fullNameVoc,	
	'0' liquidate
from SPRDOL
inner join (
	select distinct kpuprk1.kpuprkz_pdrcd * 10000 + kpuprk1.kpuprkz_dol positionID, kpuprk1.kpuprkz_pdrcd departmentID, kpuprk1.kpuprkz_dol dictPositionID
	from kpuprk1
) t1 on t1.dictPositionID = SprD_Cd
where sprd_prz = 0 or exists (
	select null
	from kpuprk1
	where kpuprkz_dol = SprD_Cd
)