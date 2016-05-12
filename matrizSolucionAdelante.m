function C = matrizSolucionAdelante(A,sigma1,sigma2,numFilas,numColumnas)
%Ocupo diferencias finitas hacia adelante para llenar la matriz, cualquier
%índice que esté fuera de la matriz lo considero como 0, pues al ser un 
%sistema aislado solo es afectado por lo que ocurre en él mismo
C=zeros(numFilas,numColumnas);
for i=1:numFilas
    for j=1:numColumnas
        if i==numFilas
            if j==numColumnas
                C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2);  
            else
                if j==numColumnas-1
                    C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i,j+1)*sigma2;
                else
                    C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i,j+1)*sigma2+A(i,j+2)*sigma2;
                end
            end
        else
            if j==numColumnas
               if i==numFilas-1
                    C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i+1,j)*sigma1;
                else
                    C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i+1,j)*sigma1+A(i+2,j)*sigma1;
                end
            else
                if i==numFilas-1
                    if j==numColumnas-1
                        C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i+1,j)*sigma1+A(i,j+1)*sigma2;
                    else
                        C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i+1,j)*sigma1+A(i,j+1)*sigma2+A(i,j+2)*sigma2;
                    end
                else
                    if j==numColumnas-1
                        C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i+1,j)*sigma1+A(i,j+1)*sigma2+A(i+2,j)*sigma1;
                    else
                        C(i,j)=A(i,j)*(1-2*sigma1-2*sigma2)+A(i+1,j)*sigma1+A(i,j+1)*sigma2+A(i+2,j)*sigma1+A(i,j+2)*sigma2;
                    end
                end
            end
        end               
    end
end
end