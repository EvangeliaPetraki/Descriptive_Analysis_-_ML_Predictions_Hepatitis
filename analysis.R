library(tidyverse)

HCR <- read.csv('HepatitisCdata.csv')

names(HCR)

summary(HCR)

HCR$Category <- factor(HCR$Category)
HCR$Sex <- factor(HCR$Sex)

ggplot(HCR, aes(Category, fill= factor(Category))) + 
  geom_bar()+
  labs(title= 'Number of People in Each Category', 
       x='Category of Person', 
       y="Frequency",
       fill= 'Categories')+
  scale_y_continuous(limits = c(0,550), breaks=seq(0,550,25))

ggplot(HCR, aes(Sex, fill= factor(Sex))) + 
  geom_bar()+
  labs(title= 'Number of People in Each Gender', 
       x='Gender', 
       y="Frequency",
       fill= 'Genders')+
  scale_y_continuous(limits = c(0,380), breaks=seq(0,380,20))

ggplot(HCR, aes(Age, fill= factor(Age))) + 
  geom_histogram(col='black')+
  labs(title= 'Age distribution ', 
       x='Age', 
       y="Frequency",
       fill= 'Age')+
  scale_y_continuous(limits = c(0,60), breaks=seq(0,60,5))+
  scale_x_continuous(limits = c(19,77), breaks = seq(19,77,3))

ggplot(HCR, aes(Age, fill= factor(Age))) + 
  geom_histogram(col='black')+
  labs(title= 'Age distribution ', 
       x='Age', 
       y="Frequency",
       fill= 'Age')+
  scale_y_continuous(limits = c(0,60), breaks=seq(0,60,5))+
  scale_x_continuous(limits = c(19,77), breaks = seq(19,77,3))



ggplot(HCR, aes(ALB, Category, fill=factor(Category)))+
  geom_boxplot()+
  scale_x_continuous(limits = c(14.9,82.2), breaks = seq(14.9,82.2,10))+
  labs(title='Albumin levels in Each category',
       fill= 'Categories')

ggplot(HCR, aes(ALP, Category, fill=factor(Category)))+
  geom_boxplot()+
  scale_x_continuous(limits = c(11.3,416.6), breaks = seq(11.3,416.6, 70))+
  labs(title='ALP levels in Each category',
       fill= 'Categories')

ggplot(HCR, aes(ALP, Category, fill=factor(Category)))+
  geom_boxplot()+
scale_x_continuous(limits = c(11.3,150), breaks = seq(11.3,150,20))+
labs(title='ALP levels in Each category',
     fill= 'Categories')

ggplot(HCR, aes(ALT, Category, fill=factor(Category)))+
  geom_boxplot()+
  scale_x_continuous(limits = c(0,120), breaks = seq(0,120,20))+
  labs(title='ALT levels in Each category',
       fill= 'Categories')

ggplot(HCR, aes(AST, Category, fill=factor(Category)))+
  geom_boxplot()+
  scale_x_continuous(limits = c(4.5,150), breaks = seq(4.5, 150,20))+
  labs(title='AST levels in Each category',
       fill= 'Categories')

ggplot(HCR, aes(GGT, Category, fill=factor(Category)))+
  geom_boxplot()+
  scale_x_continuous(limits = c(10.6,200), breaks = seq(10.6,200,30))+
  labs(title='GGT levels in Each category',
       fill= 'Categories')

ggplot(HCR, aes(BIL, Category, fill=factor(Category)))+
  geom_boxplot()+
  scale_x_continuous(limits = c(0,30), breaks = seq(0,30,2))+
  labs(title='Bilirubin levels in Each category',
       fill= 'Categories')


#cholinesterase
ggplot(HCR, aes(CHE, Category, fill=factor(Category)))+
  geom_boxplot()+
  scale_x_continuous(limits = c(0,16), breaks = seq(0,16,1))+
  labs(title = 'Cholinesterase levels in Each category',
       fill= 'Categories')

ggplot(HCR, aes(PROT, Category, fill=factor(Category)))+
  geom_boxplot()

ggplot(HCR, aes(CHOL, Category, fill=factor(Category)))+
  geom_boxplot()

