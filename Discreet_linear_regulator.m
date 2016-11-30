A=[0.9974 0.0539; -0.1078 1.1591];
B=[0.0013; 0.0539];
H=0;
Q=[0.25 0.00;0.00 0.05];
R=0.05;
N=200;
P=zeros(2,2);
Pc = P ;
X=[];
X(:,1)=[2;1];
F=[];
U=[];
 
for k = 1:N-1
 
F(N-k,:) = -inv(R+transpose(B)*Pc(:,end-1:end)*B).*(transpose(B)*Pc(:,end-1:end)*A);
 
P = transpose(A+B*F(N-k,:))*Pc(:,end-1:end)*(A+B*F(N-k,:)) + transpose(F(N-k,:))*R*F(N-k,:) + Q;
Pc = [Pc P] ;
 
end
 
for k = 1:N-1
 
U(k,1) = F(k,:)*X(:,k);
X(:,k+1) = A*X(:,k)+B*U(k,1);
 
end
 
U(N,1)=0;
 
plot(U)
plot(X(1,:))
plot(X(2,:))
plot(F(:,1))
plot(F(:,2))
 
