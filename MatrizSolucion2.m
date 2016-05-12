function C = MatrizSolucion2(A,B,sigma1,sigma2,tamF,tamC)
%lleno la matriz con la ecuaci�n de calor en 2D con respecto a la matriz
%del paso anterior (A) con diferencias finitas hacia atr�s, utilizo los
%bordes que ya llen� con el m�todo matriz2D() para ya no tener que
%controlas las excepciones aqu�
C=zeros(tamF,tamC);
C(:,[1,2])=B(:,[1,2]);
C([1,2],:)=B([1,2],:);
for i=3:tamF
    for j=3:tamC
        C(i,j)=(A(i,j)-C(i,j-1)*2*sigma2-C(i-1,j)*2*sigma1+C(i-2,j)*sigma1+C(i,j-2)*sigma2)/(1-sigma1-sigma2);   
    end
end

end