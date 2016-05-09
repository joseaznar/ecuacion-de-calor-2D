function C = matriz2D(A,sigma1,sigma2,numFilas,numColumnas)
for i=1:numFilas
    for j=1:numColumnas
        if i==1 
            if j==1
                C(i,j)=-(sigma1+sigma2)*A(i,j);
            else
                if j==2
                    C(i,j)=-sigma1*(A(i,j))-sigma2*(A(i,j))+(2*sigma1)*A(i,j-1);
                else
                    C(i,j)=-sigma1*(A(i,j)+A(i,j-2))-sigma2*(A(i,j))+(2*sigma1)*A(i,j-1);
                end
            end
        else
            if j==1
               if i==2
                    C(i,j)=-sigma1*(A(i,j))-sigma2*(A(i,j))+(2*sigma2)*A(i-1,j);
                else
                    C(i,j)=-sigma1*(A(i,j))-sigma2*(A(i,j)+A(i-2,j))+(2*sigma2)*A(i-1,j);
                end
            else
                if i==2
                    if j==2
                        C(i,j)=-sigma1*(A(i,j))-sigma2*(A(i,j))+(2*sigma1)*A(i,j-1)+(2*sigma2)*A(i-1,j)+A(i-1,j-1); 
                    else
                        C(i,j)=-sigma1*(A(i,j-2)+A(i,j))-sigma2*(A(i,j))+(2*sigma1)*A(i,j-1)+(2*sigma2)*A(i-1,j)+A(i-1,j-1);  
                    end
                else
                    if j==2
                        C(i,j)=-sigma1*(A(i,j))-sigma2*(A(i,j)+A(i-2,j))+(2*sigma1)*A(i,j-1)+(2*sigma2)*A(i-1,j)+A(i-1,j-1);  
                    end
                end
            end
        end               
    end
end
end