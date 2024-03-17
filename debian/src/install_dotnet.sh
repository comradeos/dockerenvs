cd /src && \
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
chmod +x ./dotnet-install.sh && \
./dotnet-install.sh --version latest && \   
./dotnet-install.sh --version latest --runtime aspnetcore && \
./dotnet-install.sh --channel 8.0 && \
find / -name dotnet 2>/dev/null && \
export PATH=$PATH:/root/.dotnet

