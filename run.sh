# Read env parameters
. conf/env.conf

# Get repository
git clone https://github.com/aiven/python-fake-data-producer-for-apache-kafka.git
pip install -r python-fake-data-producer-for-apache-kafka/requirements.txt
pip install aiven-client

# Get Hostname and Port
HOSTNAME=$(avn --auth-token $TOKEN service get $SERVICE_NAME --project $PROJECT_NAME --json | jq -r '.components[] | select(.component=="kafka").host') 
PORT=$(avn --auth-token $TOKEN service get $SERVICE_NAME --project $PROJECT_NAME --json | jq -r '.components[] | select(.component=="kafka").port')
echo $HOSTNAME $PORT

if [ $PRIVATELINK == "YES" ]; then
  HOSTNAME=$(avn --auth-token $TOKEN service get $SERVICE_NAME --project $PROJECT_NAME --json | jq -r '.components[] | select(.route=="privatelink" and .component=="kafka").host') 
  PORT=$(avn --auth-token $TOKEN service get $SERVICE_NAME --project $PROJECT_NAME --json | jq -r '.components[] | select(.route=="privatelink" and .component=="kafka").port')
fi

# Get Certificates
rm -rf ./certs
avn --auth-token $TOKEN service user-creds-download $SERVICE_NAME  --project $PROJECT_NAME --username avnadmin -d ./certs

# Create topic
avn --auth-token $TOKEN service topic-create $SERVICE_NAME $TOPIC --project $PROJECT_NAME --partitions $PARTITIONS --replication $REPLICATION

# Gererate Data
python python-fake-data-producer-for-apache-kafka/main.py --cert-folder ./certs/ \
  --host $HOSTNAME \
  --port $PORT \
  --topic-name $TOPIC \
  --nr-messages $NR_MESSAGES \
  --max-waiting-time $MAX_TIME \
  --subject $SUBJECT	\
  --security-protocol $SECURITY
