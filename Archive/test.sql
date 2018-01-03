SELECT       	dbo.OrgUnit.id AS LevelID, OrgUnit_1.id AS ParentID, OrgUnit_2.id AS GrandParentID, OrgUnit_3.id AS GreatGrandParentID, OrgUnit_4.id AS GreatGreatGrandParentID,  
				dbo.GroupsAndProjects.name AS LevelName, GroupsAndProjects_1.name AS ParentName,  GroupsAndProjects_2.name as GrandParentName, GroupsAndProjects_3.name AS GreatGrandParentName,  
				GroupsAndProjects_4.name AS GreatGreatGrandParentName 
				         FROM dbo.OrgUnit As OrgUnit_0 Inner Join dbo.OrgUnit As OrgUnit_1 On OrgUnit_0.parentId = OrgUnit_1.id	




						 
                         dbo.GroupsAndProjects AS GroupsAndProjects ON dbo.OrgUnit.id = GroupsAndProjects.orgUnitId RIGHT OUTER JOIN
                         dbo.GroupsAndProjects AS GroupsAndProjects_3 INNER JOIN
                         dbo.OrgUnit AS OrgUnit_3 ON GroupsAndProjects_3.orgUnitId = OrgUnit_3.id ON dbo.OrgUnit.id = OrgUnit_3.parentId LEFT OUTER JOIN
                         dbo.GroupsAndProjects AS GroupsAndProjects_2 INNER JOIN
                         dbo.OrgUnit AS OrgUnit_2 ON GroupsAndProjects_2.orgUnitId = OrgUnit_2.id ON OrgUnit_3.id = OrgUnit_2.parentId FULL OUTER JOIN
                         dbo.OrgUnit AS OrgUnit_4 INNER JOIN
                         dbo.GroupsAndProjects ON OrgUnit_4.id = dbo.GroupsAndProjects.orgUnitId LEFT OUTER JOIN
                         dbo.OrgUnit AS OrgUnit_1 INNER JOIN
                         dbo.GroupsAndProjects AS GroupsAndProjects_1 ON OrgUnit_1.id = GroupsAndProjects_1.orgUnitId ON OrgUnit_4.parentId = OrgUnit_1.id ON OrgUnit_2.id = OrgUnit_1.parentId
						 
						 
						 
						 SELECT        OrgUnit_4.id AS LevelName, OrgUnit_1.id, OrgUnit_2.id AS Expr1, OrgUnit_3.id AS Expr2, dbo.OrgUnit.id AS Expr3
						 FROM            dbo.OrgUnit AS OrgUnit_4 LEFT OUTER JOIN
                         dbo.OrgUnit AS OrgUnit_1 FULL OUTER JOIN
                         dbo.OrgUnit AS OrgUnit_3 LEFT OUTER JOIN
                         dbo.OrgUnit ON OrgUnit_3.parentId = dbo.OrgUnit.id LEFT OUTER JOIN
                         dbo.OrgUnit AS OrgUnit_2 ON OrgUnit_3.id = OrgUnit_2.parentId ON OrgUnit_1.parentId = OrgUnit_2.id ON OrgUnit_4.parentId = OrgUnit_1.id

						 
						 
						 
						 SELECT        OrgUnit_0.id AS LevelID, OrgUnit_1.id AS ParentID, dbo.OrgUnit.id
FROM            dbo.OrgUnit AS OrgUnit_0 INNER JOIN
                         dbo.OrgUnit AS OrgUnit_1 ON OrgUnit_0.parentId = OrgUnit_1.id LEFT OUTER JOIN
                         dbo.OrgUnit ON OrgUnit_1.parentId = dbo.OrgUnit.id