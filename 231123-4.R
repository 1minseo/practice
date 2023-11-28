library(dplyr)
library(readxl)
library(ggplot2)]

#1. �־��� ���� �����͸� �о� R������������ smokers�� �����Ͽ���
smokers <- read_excel("C:/workspace/easy_r/data/smoke.xlsx")
smokers

#2. smokers���� �ڷ��� ��(���ڵ��� ��)�� ���Ͻÿ�
View(smokers)
nrow(smokers)

#3. smokers �ڷ��� ���������� 10���� ���ڵ带 ����Ͽ���
head(smokers,10)
smoker[1:10,] #�� ��ü

#4. �ڷῡ�� ���ڿ� ������ ���� ���Ͻÿ�
table(smokers$Gender)

aggregate(smokers$Age, list(smokers$Gender), length)

#5. �ڷῡ�� �������� ���� ���������� ���Ͻÿ�
n_smokers = table(smokers$Smoker)[2]
n_smokers
n_smokers/nrow(smokers)

n_smokers1=sum(smokers$Smoker=="yes")
n_smokers1/nrow(smokers)

#6. �ڷῡ�� ���� �������� ���� ���������� ���Ͻÿ�
tx=table(smoker=smokers$Smoker, Gender=smokers$Gender)
prop.table(tx,2)

tx[2,]/table(smokers$Gender) #yes�� ����

#7. BMI(ü��������)�� �����Ը� Ű�� �������� ���� ���̴�. �ڷῡ�� BMI�� ���Ͽ���
smokers$BMI = smokers$Weight/(smokers$Height/100)^2
head(smokers)

#8. ���� BMI�� ��հ� ǥ�������� ���϶�
mean(smokers$BMI)

mean(smokers$BMI[smokers$Gender=="F"]) #���ڵ鸸
mean(smokers$BMI[smokers$Gender=="M"]) #���ڵ鸸

aggregate(BMI ~ Gender, data=smokers,mean)

aggregate(smokers$BMI, list(smokers$Gender), mean)
aggregate(smokers$BMI, list(smokers$Gender), sd)

#9. ���� BMI�� ���ڱ׸����� �׷���
boxplot(BMI ~ Gender,data = smokers, ylab="BMI", xlab = "Gender")

#10. ���� �� ���������� BMI�� ��հ� ǥ�������� ���϶�
mean(smokers$BMI[smokers$Smoker=="yes"])
mean(smokers$BMI[smokers$Smoker=="no"])
aggregate(BMI ~ Gender, data = smokers, sd)

#11. ���� �� ���������� BMI�� ���ڱ׸����� �׷���
# HOWLong �����Ⱓ
# Cigarettes ��������(����)
boxplot(BMI~smoker,data = smokers,ylab="BMI", xlab = "smoker")