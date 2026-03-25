#vectors
va=seq(from=10, to=20, by=2)
vb= c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
vc =c(rep(x=1, times=5),rep(x=0,times=5))
vd=rep(x=1, times=11)
va+2
va/2
va+vb # error because we cant add characters with numeric
va+vc #warning for recycle numbers
va+vd
va=(4)
va(2:5)
vd[-11]
#matrix
m1=matrix(data=(8), nrow = 5,ncol = 4)
m1=m1/4
m2=cbind(va[1:5],vb[1:5],vc[1:5],vc[1:5]-vd[1:5])
typeof(m2)# character matrix 
m3= m1+m2#We can’t do A + B because B has letters and you can’t add numbers to letters.
m1[5,2]
m2[4,]
m1+3
2*m2#cant mix chr with numeric
va+m1
va[1:5]+m1
va[5]+m1
m1[1,]
m1[-1,]
m1[,1]+va[1:5]
