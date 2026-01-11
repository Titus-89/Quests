# Création du dossier à partager à la racine

New-Item -Path C:\ -Name "Documents_Entreprises" -ItemType Directory

# Création des sous-dossiers

New-Item -Path "C:\Documents_Entreprises\Direction", "C:\Documents_Entreprises\RH", "C:\Documents_Entreprises\Comptabilité" -ItemType Directory

# Création du partage 

New-SmbShare -Name "Docs" -Path "C:\Documents_Entreprises" 

# Liste des partages

Get-SmbShare

# Création des groupes AD dans l'OU "LabSecurite" avec scope "global" et type "security"

New-ADGroup -Name "Direction" -Path "OU=LabSecurite,DC=lab,DC=lan" -GroupScope Global -GroupCategory Security

New-ADGroup -Name "RH" -Path "OU=LabSecurite,DC=lab,DC=lan" -GroupScope Global -GroupCategory Security

New-ADGroup -Name "Comptabilité" -Path "OU=LabSecurite,DC=lab,DC=lan" -GroupScope Global -GroupCategory Security

# Affichage des groupes AD dans l'OU "LabSecurite

Get-ADGroup -Filter * -SearchBase "OU=LabSecurite,DC=lab,DC=lan" | Select-Object Name

# Ajout des utilisateurs aux groupes 

Add-ADGroupMember -Members "pjb" -Identity "Direction"

Add-ADGroupMember -Members "Wilder" -Identity "RH"

Add-ADGroupMember -Members "User2" -Identity "Comptabilité"

