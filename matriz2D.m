function C = matriz2D(A,sigma1,sigma2,numFilas,numColumnas)
%en este m�todo calculamos el contorno con diferencias finitas hacia atr�s
%de la matriz para que sea m�s f�cil evaluar en el siguiente
C=zeros(numFilas,numColumnas);
for i=1:numFilas
    for j=1:numColumnas
        if i==1 
            if j==1
                C(i,j)=(A(i,j))/(1+2*sigma1+2*sigma2);   
            else
                if j==2
                    C(i,j)=(A(i,j)+C(i,j-1)*sigma2)/(1+2*sigma1+2*sigma2);
                else
                    C(i,j)=(A(i,j)+C(i,j-1)*sigma2+C(i,j-2)*sigma2)/(1+2*sigma1+2*sigma2);
                end
            end
        else
            if j==1
               if i==2
                    C(i,j)=(A(i,j)+C(i-1,j)*sigma1)/(1+2*sigma1+2*sigma2);
                else
                    C(i,j)=(A(i,j)+C(i-1,j)*sigma1+C(i-2,j)*sigma1)/(1+2*sigma1+2*sigma2);
                end
            else
                if i==2
                    if j==2
                        C(i,j)=(A(i,j)+C(i,j-1)*sigma2+C(i-1,j)*sigma1)/(1+2*sigma1+2*sigma2);
                    else
                        C(i,j)=(A(i,j)+C(i,j-1)*sigma2+C(i-1,j)*sigma1+C(i,j-2)*sigma2)/(1+2*sigma1+2*sigma2); 
                    end
                else
                    if j==2
                        C(i,j)=(A(i,j)+C(i,j-1)*sigma2+C(i-1,j)*sigma1+C(i-2,j)*sigma1)/(1+2*sigma1+2*sigma2);
                    end
                end
            end
        end               
    end
end
end