@echo off

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Get power plan scheme from cmd output -> powercfg -list ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Power plan
SET balanced=381b4222-f694-41f0-9685-ff5bb260df2e
SET performance=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Location of nvidia drivers to get GPU temperature
SET nvidia="C:\PROGRA~1\NVIDIA~1\NVSMI\nvidia-smi.exe --query-gpu=temperature.gpu --format=csv"

:: Temperature at which to switch High performance
SET max=50

:: Temperature at which to switch Balanced
SET min=35

:: Get current GPU temp
FOR /F "skip=1" %%A IN ('%nvidia%') DO (;
	SET temp=%%A
)

:: Check temperature max and min
IF %temp% GEQ %max% (SET plan=%performance%) 
IF %temp% LEQ %min% (SET plan=%balanced%)

:: Switch power plan
IF NOT "%plan%" == "" (
	FOR /F "tokens=4 skip=1" %%A IN ('powercfg -list ^| findstr \*') DO (;
		IF NOT %%A == %plan% (powercfg /setactive %plan%)
	)
)

exit
