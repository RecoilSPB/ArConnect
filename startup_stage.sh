export STAGE_MODE=$1

if [ "$STAGE_MODE" == "" ]
  then
    echo "Usage: $0 <service stage>"
  else
    docker compose --env-file .env.$STAGE_MODE --project-name ariadna-connect-$STAGE_MODE up --build -d
fi