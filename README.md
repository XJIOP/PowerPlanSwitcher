# PowerPlanSwitcher
Simple Power plan switcher between Balanced and High performance during GPU temperature for Windows 10.

Edit PowerPlanSwitcher.bat
=========

Get power plan scheme from cmd output -> powercfg -list
```
SET balanced=xxx-xxx-xxx-xxx-xxx
SET performance=xxx-xxx-xxx-xxx-xxx
```

Location of nvidia drivers to get GPU temperature
```
SET nvidia="C:\PROGRA~1\NVIDIA~1\NVSMI\nvidia-smi.exe --query-gpu=temperature.gpu --format=csv"
```

Temperature at which to switch High performance
```
SET max=50
```

Temperature at which to switch Balanced
```
SET min=35
```

Example to usage with MSI Afterburner
=========
- Go to settings -> Monitoring -> GPU temperature
- Set -> Alarm when value is out of range (35 - 50)
- Click to -> ...
- Select -> Launch application on alarm (PowerPlanSwitcher.vbs)