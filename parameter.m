%% ==================================
% deklarasi variabel yang diasumsikan
%% ==================================

Vin = 17.5
Vo = 7;
fsw = 10000;
Pout = 21;
CurrentR = 0.2;
VoltageR = 0.02;
D = Vo/Vin;
i = Pout/Vo;
R = Vo/i;
di = CurrentR * i;
dv = VoltageR * Vo;

L = ((1-D) * Vo) / (di * fsw) ;
C = (Vo * (1 - D)) / (8*L*dv*(fsw*fsw));

%% =====================
% parameter outer loop
%% =====================

outer_Fbp = fsw / 20;              
outer_Fbi = outer_Fbp / 10;        

outer_Kp  = 2 * pi * outer_Fbp * C;           % Kp_v = 2πfC
outer_Ki  = 2 * pi * outer_Fbi * outer_Kp;    % Ki_v = 2πf * Kp

%% =====================
% parameter inner loop
%% =====================

inner_Fbp = fsw / 200;              
inner_Fbi = inner_Fbp / 10;       
inner_Fbd = inner_Fbp * 10;  

inner_Kp  = 2 * pi * inner_Fbp * L;           % Kp_i = 2πfL
inner_Ki  = 2 * pi * inner_Fbi * inner_Kp;    % Ki_i = 2πf * Kp
