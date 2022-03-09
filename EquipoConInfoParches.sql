SELECT comTarget.[Name] as Equipo
   -- ,infoBasic.State 
   -- ,[update].SecurityBulletin
    ,[update].KnowledgebaseArticle as KB
    ,[update].DefaultTitle as 'Nombre KB'
   -- ,[update].ArrivalDate
    ,[update].MsrcSeverity as Criticidad
    ,'Estado'=
    CASE
WHEN infoBasic.State = 6 THEN 'Pendiente de reinicio'
WHEN infoBasic.state = 5 THEN 'Error'
WHEN infoBasic.State = 4 THEN 'Instalado / No aplicable'
WHEN infoBasic.State = 2 THEN 'No Instalado'
WHEN infoBasic.State = 3 THEN 'Necesario'

END
 FROM [SUSDB].[PUBLIC_VIEWS].[vComputerTarget] comTarget
 JOIN [SUSDB].PUBLIC_VIEWS.vUpdateInstallationInfoBasic infoBasic on comTarget.ComputerTargetId = infoBasic.ComputerTargetId
 JOIN [SUSDB].PUBLIC_VIEWS.vUpdate [update] on infoBasic.UpdateId = [update].updateid
  

Order by Name