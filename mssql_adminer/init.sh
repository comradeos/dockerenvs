#!/usr/bin/env bash
set -euo pipefail

echo "Waiting for MSSQL on mssql:1433 ..."
until (exec 3<>/dev/tcp/mssql/1433) 2>/dev/null; do
  sleep 2
done
echo "MSSQL is up."

SQLCMD="/opt/mssql-tools/bin/sqlcmd"
if [ ! -x "$SQLCMD" ]; then
  SQLCMD="/opt/mssql-tools18/bin/sqlcmd"
fi

"$SQLCMD" -S mssql -U SA -P "$SA_PASSWORD" -l 30 -d master -i /init.sql
echo "Init script finished."