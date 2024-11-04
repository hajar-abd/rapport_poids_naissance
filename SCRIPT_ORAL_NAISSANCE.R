############################################# ETUDE POIDS NAISSANCE ###############################################################################################################################################################
#ABDAOUI Hâjar
#ROMANA Shaïnez
#ZOUZANE Karima 

# OBJECTIF= etudier les facteurs influençant sur le poids du foetus 

############## 1) ANALYSE DESCRIPTIVE  ###########################################################################################################################################################################################
dim(poids_naissance) # Dimension de la base de données

mater<-data.frame(poids_naissance$AGE,poids_naissance$LWT,poids_naissance$RACE,poids_naissance$SMOKE,poids_naissance$PTL,poids_naissance$HT,poids_naissance$UI,poids_naissance$FVT,poids_naissance$BWT)
mater # nous avons nommé "mater" notre base de données
names(mater)<-c("agemere","poidsmere","racemere","tabagisme","antprema","hypertension","irritUterine","nbrvisitMED","poidsnourrisson")
mater$poidsmere<-mater$poidsmere*0.453592 # conversion du poids de la mère lors du dernier cycle menstruel en kilogrammes
mater$poidsnourrisson<-mater$poidsnourrisson*0.001 #conversion du poids du nourrison en kg
str(mater) #structure des données 

# Transformation des variables qualitatives en facteurs:
mater$racemere<-factor(mater$racemere,levels=c(1,2,3),labels = c("Blanche","Noire","Autre"))
mater$tabagisme<-factor(mater$tabagisme,levels=c(0,1),labels = c("NON","OUI"))
mater$hypertension<-factor(mater$hypertension,levels =c(0,1),labels = c("NON","OUI"))
mater$irritUterine<-factor(mater$irritUterine,levels = c(0,1),labels = c("NON","OUI"))
mater$antprema<-factor(mater$antprema,levels = c(0,1,2,3),labels = c("NON","UN","DEUX","TROIS"))
mater$nbrvisitMED<-factor(mater$nbrvisitMED,levels = c(0,1,2,3,4,5,6),labels = c("AUCUNE","UN","DEUX","TROIS","QUATRE","CINQ","SIX"))
mater
summary(mater) # description de toutes les variables
boxplot(mater$poidsnourrisson) 
summary(mater$poidsnourrisson)
hist(mater$poidsnourrisson,xlab = "Poids du nourrison en Kg",ylab = "Effectifs",main= "Distribution de la variable poidsnaissance", col = "#9A579D")

boxplot(mater$poidsmere)
hist(mater$poidsmere,xlab = "Poids de la mère en Kg",ylab = "Effectifs",main= "Distribution de la variable poidsmere", col = "#CF9BBC",freq = FALSE)
summary(mater$poidsmere)

boxplot(mater$agemere)
hist(mater$agemere,xlab = "âge de la mère (années)",ylab = "Effectifs",main= "Distribution de la variable agemere", col = "#CF9BBC",freq = FALSE)
summary(mater$agemere)

############# 2) ANALYSE COORELATION  ##################################################################################################################################################################################################
pairs(mater[,c("poidsnourrisson","agemere","poidsmere")], main="Nuages de points entre chaque variable quantitative",)
cor(mater[,c("poidsnourrisson","agemere")])
plot(mater$agemere,mater$poidsnourrisson) 
plot(mater$poidsmere,mater$poidsnourrisson)
cor.test(mater$poidsmere,mater$poidsnourrisson)# p-value < 5%, le poids de la mère a un effet signficatif sur le poids du nourrisson 
cor.test(mater$poidsnourrisson,mater$agemere)# p-value > 5% = l'age n'aurait aucun effet sur lle poids du bébé à la naissance 

############ 3) REGRESSION LINEAIRE SIMPLE ######################################################################################################################################################################################################################
RS1=lm(mater$poidsnourrisson~mater$poidsmere)
plot(mater$poidsmere,mater$poidsnourrisson);abline(RS1,col="red")
summary(RS1)
RS2=lm(mater$poidsnourrisson~mater$agemere)
plot(mater$agemere,mater$poidsnourrisson);abline(RS2,col="red")
summary(RS2)

############ 4) REGRESSION LINEAIRE MULTIPLE ############################################################################################################################################
RM1=lm(poidsnourrisson~racemere+tabagisme+antprema+hypertension+irritUterine+nbrvisitMED+agemere+poidsmere,data=mater)
summary(RM1)
step(RM1)
RM2=lm(formula = poidsnourrisson ~ racemere + tabagisme + antprema + hypertension + irritUterine + poidsmere, data =mater)
summary(RM2)
plot(RM2)# représentation du nuage de points de la régression linéaire multiple finale 
plot(RM2,4)# étude des valeurs éloignées grâce au diagramme de Cook

