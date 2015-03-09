docker run -p 45432:5432 -e POSTGRES_PASSWORD=123456 -d postgres:ch

BASEDIR=$(dirname $0)
echo $BASEDIR

cd $BASEDIR/..

while :
do
    echo "try to connect to database"
    PGPASSWORD=123456 psql -p 35432 -h localhost -U postgres -c "create database im;"
    createResult=$?
    echo ${createResult}
    if [ ${createResult} -eq 0 ]; then
        break
    else
        echo "wait for 1s"
        sleep 1
    fi
done

PGPASSWORD=123456 psql -p 45432 -h localhost -U postgres -c "CREATE EXTENSION zhparser;"
PGPASSWORD=123456 psql -p 45432 -h localhost -U postgres -c "CREATE TEXT SEARCH CONFIGURATION testzhcfg (PARSER = zhparser);"
PGPASSWORD=123456 psql -p 45432 -h localhost -U postgres -c "ALTER TEXT SEARCH CONFIGURATION testzhcfg ADD MAPPING FOR n,v,a,i,e,l WITH simple;"
