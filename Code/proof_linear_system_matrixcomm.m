clear all;
clc;
syms C11 C12 C13 C21 C22 C23 C31 C32 C33
syms A11 A12 A13
syms D11 D12 D13
syms B11 B12 B13 B21 B22 B23 B31 B32 B33

A = [A11 A12 A13].';
B = [B11 B12 B13 ;B21 B22 B23; B31 B32 B33];
C = [C11 C12 C13; C21 C22 C23; C31 C32 C33];
D = [D11 D12 D13].';

%%
n = size(C,1);
MA = sym(zeros(n,n*n));
for i = 1:n
    for j = 1:n
        MA(i,(i-1)*n+j) = A(j); 
    end
end

M1 = sym(zeros(n,n*n));

for i = 1:n
    for j = 1:n*n
        dIndex = mod(j-1,n)+1;
        M1(i,j) = -D(dIndex) * B(i,floor((j-1)/n)+1); 
    end
end

M=MA+M1;
X = [C11;C12;C13;C21;C22;C23;C31;C32;C33];

expand(M*X)==expand(C*A-B*C*D)