#!/usr/bin/env bash

CMD="airflow"
FERNET_KEY=$(python -c "from cryptography.fernet import Fernet; FERNET_KEY = Fernet.generate_key().decode(); print FERNET_KEY")

# Generate Fernet key
sed -i "s/{FERNET_KEY}/${FERNET_KEY}/" $AIRFLOW_HOME/airflow.cfg

if [ -f /usr/local/airflow/airflow.db ]; then
  echo "Upgrade database..."
  $CMD upgradedb
else
  echo "Initialize database..."
  $CMD initdb
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf --nodaemon
