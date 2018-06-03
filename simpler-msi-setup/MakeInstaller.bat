@echo off

set projectDir=.\bin

rem Automatically generated fragment file for application files
"%WIX%bin\heat.exe" dir "bin" -cg APPLICATIONFOLDER_comp -gg -scom -sreg -sfrag -srd -dr APPLICATIONFOLDER -var var.ProjectDir -out "Product.Files.wxs"
"%WIX%bin\candle.exe" "Product.Files.wxs" -out "_Product.Files.wixobj" -dProjectDir="%projectDir%"

rem Create setup-1.msi
"%WIX%bin\candle.exe" "Product.wxs" -out "_Product.wixobj" -nologo
"%WIX%bin\light.exe" "_Product.Files.wixobj" "_Product.wixobj" -cultures:en-US -ext WixUIExtension -ext WixNetFxExtension -out "setup1.msi" -nologo

rem msiexec /i setup1.msi /quiet /qn /norestart /log install.log