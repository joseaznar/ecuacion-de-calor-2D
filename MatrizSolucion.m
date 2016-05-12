function C = MatrizSolucion(A,sigma1,sigma2,tamF,tamC)
%lleno la matriz con la ecuación de calor en 2D con respecto a la matriz
%del paso anterior (A) con diferencias finitas centradas
%checo las excepciones en los límites de la matriz, al ser un sistema
%aislado cuando un índice está fuera de la matriz no afecta al siguiente
%estado en el tiempo.
C=zeros(tamF,tamC);
for i=1:tamF
    for j=1:tamC
        if i==1
            if j==1
                C(i,j)=sigma1*(A(i,j+1))+sigma2*(A(i+1,j))+(1-2*sigma1-2*sigma2)*A(i,j); 
            else
                if j==tamC
                    C(i,j)=sigma1*(A(i,j-1))+sigma2*(A(i+1,j))+(1-2*sigma1-2*sigma2)*A(i,j); 
                else
                    C(i,j)=sigma1*(A(i,j-1)+A(i,j+1))+sigma2*(A(i+1,j))+(1-2*sigma1-2*sigma2)*A(i,j); 
                end
            end  
        else
            if i==tamF
                if j==1
                    C(i,j)=sigma1*(A(i,j+1))+sigma2*(A(i-1,j))+(1-2*sigma1-2*sigma2)*A(i,j); 
                else
                    if j==tamC
                        C(i,j)=sigma1*(A(i,j-1))+sigma2*(A(i-1,j))+(1-2*sigma1-2*sigma2)*A(i,j); 
                    else
                        C(i,j)=sigma1*(A(i,j-1)+A(i,j+1))+sigma2*(A(i-1,j))+(1-2*sigma1-2*sigma2)*A(i,j); 
                    end
                end  
            end
            if j==1
                if i==1
                    C(i,j)=sigma1*(A(i,j+1))+sigma2*(A(i+1,j))+(1-2*sigma1-2*sigma2)*A(i,j);   
                else
                    if i==tamF
                       C(i,j)=sigma1*(A(i,j+1))+sigma2*(A(i-1,j))+(1-2*sigma1-2*sigma2)*A(i,j);  
                    else
                       C(i,j)=sigma1*(A(i,j+1))+sigma2*(A(i-1,j)+A(i+1,j))+(1-2*sigma1-2*sigma2)*A(i,j);  
                    end
                end
            else
                if j==tamC
                    if i==1
                        C(i,j)=sigma1*(A(i,j-1))+sigma2*(A(i+1,j))+(1-2*sigma1-2*sigma2)*A(i,j);   
                    else
                        if i==tamF
                           C(i,j)=sigma1*(A(i,j-1))+sigma2*(A(i-1,j))+(1-2*sigma1-2*sigma2)*A(i,j); 
                        else
                           C(i,j)=sigma1*(A(i,j-1))+sigma2*(A(i-1,j)+A(i+1,j))+(1-2*sigma1-2*sigma2)*A(i,j);
                        end
                    end    
                else
                    if i~=1 && i~=tamF
                        C(i,j)=sigma1*(A(i,j-1)+A(i,j+1))+sigma2*(A(i+1,j)+A(i-1,j))+(1-2*sigma1-2*sigma2)*A(i,j);
                    end
                end
            end                      
        end     
    end
end
end