FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue'; $verbosePreference='Continue';"]
ADD https://aka.ms/vs/16/release/vc_redist.x64.exe C:/temp/vcredist_x64.exe
ADD https://nmap.org/dist/nmap-7.91-win32.zip nmap.zip

RUN Start-Process -filepath C:/temp/vcredist_x64.exe -ArgumentList "/install", "/passive", "/norestart", "'/log c:/temp/a.txt'" -PassThru | wait-process
RUN Expand-Archive -DestinationPath . -Path nmap.zip
RUN Start-Process -filepath C:/nmap-7.91/vcredist_x86.exe -ArgumentList "/install", "/passive", "/norestart" -PassThru | Wait-Process

# Copy the startup script
COPY start.ps1 start.ps1

ENTRYPOINT ["powershell.exe", "C:\\start.ps1"]
