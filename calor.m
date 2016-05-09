% calor.m
%
% Ejemplo de difuminado de una imagen a partir de la ec. del calor:
% A partir de una imagen en tonos de gris (fig. 1) que asimilamos a temperatura, 
% tenemos una distribucion inicial de temperaturas (fig. 2).
% Aplicamos la ec. del calor sobre la malla de pixels 
% y vemos los efectos sobre la temperatura (fig. 3) y
% sobre la imagen inicial (fig.4).
%--------------------------------------------------------------------

% Leer la imagen original 'coins.png' y mostrarla
close all

A=imread('coins.png');

A=im2double(A);
Z=A;
figure(1)
  imshow(A);
  
% Distribucion inicial de temperaturas f(x,y)
figure(2)
  mesh(A);
  
%----------------------------------------------------------------------
% Aplicar la ec. del calor (Euler explicito + diferencias finitas) 
% a la distribucion inicial de temperaturas.
%
% Usar los siguientes valores para los parametros:
%  - coeficiente de difusion D=0.1
%  - tiempo de integracion T=10 seg.
%----------------------------------------------------------------------
D=0.1;
deltaX=10;
deltaY=10;
deltaT=.5;
T=0;
%calculo las sigmas para la ecuación de calor, donde sigma1 es para x y
%sigma2 es para y
sigma1=D*deltaT/(deltaX*deltaX);
sigma2=D*deltaT/(deltaY*deltaY);
sigma=sigma1/(deltaY*deltaY);
x=size(A);
%itero hasta que se cumplan los diez segundos con un paso de deltaT
while(T<10)
    T=deltaT+T;   %aumento el paso
    B=matriz2D(A,sigma1,sigma2,x(1),x(2)); %calculo los valores de los extremos de la matriz solución
    C=MatrizSolucion2(A,B,sigma1,sigma2,x(1),x(2));   
    A=C; 
end

% Mostrar la distribucion final de temperaturas (despues de 10 segundos).
figure(3)
  imshow(A);

% Mostrar la imagen final difuminada.
figure(4)
  mesh(A);
