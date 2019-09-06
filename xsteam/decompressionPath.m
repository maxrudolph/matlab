%Calculate internal energy
clear

pmin = 1.0;
pmax = 1000;
Pres = 900; %bar
Tres = 110; %celsius

P = linspace(pmin,pmax,100);
 P = logspace(log10(pmin),log10(pmax),500);
T = zeros(length(P),1);
T(length(T)) = Tres;

resEnthalpy = XSteam('h_pT',Pres,Tres);

T = zeros(length(P),1);
for iP = 1:length(P)
    T(iP) = XSteam('T_ph',P(iP),resEnthalpy);
end

figure(1)
clf;

hold on
plot(log10(P),T);
xlabel('log10(Pressure)')
ylabel('T in C')

