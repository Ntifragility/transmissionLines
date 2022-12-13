clear, clc, close all;

%% PARAMETROS FUENTE DE TENSION
Scc   = 300*10^6;  % [VA]
Sbase = 300*10^6;  % [VA]
Z1    = 0.2+0.4*i; % [Ohm fase/km]
Vsec  = 23*10^3;   % [V]

%% PARAMETROS TRANSFORMADOR
Str   = 60*10^6;   % [VA]
X     = 0.18;      % [pu]

%% PARAMETROS DISTANCIAS LINEAS
d1    = 3;         % [km]
d2    = 6;         % [km]
d3    = 9;         % [km]

%% CALCULOS FUENTE DE TENSION
Xf_pu = i*Sbase/Scc
Vpu   = 1;
Ibase = Sbase/(sqrt(3)*Vsec)
Vfase = Vsec/sqrt(3)
Zbase = Vfase/Ibase

%% CALCULOS TRANSFORMADOR
Xtr   = i*Scc/Str*X

%% CALCULOS IMPEDANCIA LINEA
Z_B   = Z1*d1;
Z_C   = Z1*d2;
Z_D   = Z1*d3;

Z_Bpu = Z_B/Zbase
Z_Cpu = Z_C/Zbase
Z_Dpu = Z_D/Zbase

%% CALCULOS DE CC EN A
Z_Atot = Xf_pu + Xtr
IA_pu  = 1/Z_Atot
IccA   = abs(IA_pu*Ibase)

%% CALCULOS DE CC EN B
Z_Btot = Xf_pu + Xtr + Z_Bpu
IB_pu  = 1/Z_Btot
IccB   = abs(IB_pu*Ibase)

%% CALCULOS DE CC EN C
Z_Ctot = Xf_pu + Xtr + Z_Bpu + Z_Cpu
IC_pu  = 1/Z_Ctot
IccC   = abs(IC_pu*Ibase)

%% CALCULOS DE CC EN D
Z_Dtot = Xf_pu + Xtr + Z_Bpu + Z_Cpu + Z_dpu
ID_pu  = 1/Z_Dtot
IccD   = abs(ID_pu*Ibase)


