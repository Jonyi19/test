@echo off
set now=%date:~-2%-100+1
set /a Y=%DATE:~-10,4%, M=1%DATE:~-5,2%-100, D=1%DATE:~-2%-100+1
if %D% leq 28 goto ans
if %D%==32 set /a M+=1, D=1&if not %M%==12 goto ans
if %M%==13 set /a Y+=1, M=1&goto ans
if %M%==2 if %D% geq 29 set /a D+=2-(!(Y%%4)^^!(Y%%100)^^!(Y%%400))*(31-D)
for %%M in (2 4 6 9 11) do if %M%%D%==%%M31 set /a M+=1, D=1
:ans
set /a ANS=Y*10000+M*100+D

if %D%==1 (
    set ANS=True
) else set ANS=False
echo %ANS%