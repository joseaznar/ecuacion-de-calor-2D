function C = MatrizSolucion2(A,B,sigma1,sigma2,tamF,tamC)
%lleno la matriz con la ecuación de calor en 2D con respecto a la matriz
%del paso anterior (A)
for i=3:tamF
    for j=3:tamC
        C(i,j)=-sigma1*(A(i,j-2)+A(i,j))-sigma2*(A(i,j)+A(i-2,j))+(2*sigma1)*A(i,j-1)+(2*sigma2)*A(i-1,j)+A(i-1,j-1);    
    end
end
C=C+B;
end