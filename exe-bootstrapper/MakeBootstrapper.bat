@echo off

"%WIX%bin\candle.exe" "Bootstrapper.wxs" -out "_Bootstrapper.wixobj" -ext WixNetFxExtension -ext WixBalExtension -ext WixUtilExtension -nologo
"%WIX%bin\light.exe" "_Bootstrapper.wixobj" -out "Bootstrapper.exe" -ext WixNetFxExtension -ext WixBalExtension -ext WixUtilExtension -nologo