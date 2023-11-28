# 13-2. t ����-�� ������ ��� ��
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg) #ggplot2�ȿ� �ִ� mpg������
library(dplyr)
mpg_diff <- mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact","suv"))
mpg_diff

t.test(data=mpg_diff, cty ~ class, var.equal=T)

mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r","p")) #r: regular, p: premium
t.test(data=mpg_diff2, cty ~ fl, var.equal=T)

# 13-3. ����м�-�� ������ ���輺 �м�
economics  <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce) #unemploy: �Ǿ��� ��, pce: ���� �Һ� ����

# ������ ��Ʈ�� �����
# mtcars: �ڵ��� 32���� 11�� �Ӽ��� ���� ������ ��� �ִ� R�� ����� ������
head(mtcars)
car_cor <- cor(mtcars) #cor(): ������ �����
round(car_cor,2) #�Ҽ��� ��°�ڸ�����
install.packages("corrplot")
library(corrplot)
corrplot(car_cor)
corrplot(car_cor,method = "number") #���ڷ� �ٲٰ����� ��

col <- colorRampPalette(c("#BB4444","#ee9988","#FFFFFF","#77aadd","#4477aa"))
corrplot(car_cor, method = "color", #����� ǥ��
         col=col(200), #���� 200�� ����
         type = "lower", #���� �Ʒ� ��ĸ� ǥ��
         order="hclust", #������ ���������� ����ȭ
         addCoef.col = "black", #������ ����
         tl.col = "black", #������ ����
         tl.str = 45, #������ 45�� �����
         diag = F) #�밢��� ����