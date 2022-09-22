
spark-submit \
    --master yarn \
    --deploy-mode client \
    --driver-memory 2G \
    --executor-memory 3G \
    --executor-cores 2 \
    --num-executors 3 \
    --conf spark.network.timeout=10000001 \
    --conf spark.executor.heartbeatInterval=10000000 \
    --conf spark.executor.extraJavaOptions=-XX:-UseGCOverheadLimit\
    --conf spark.yarn.executor.memoryOverhead=4G \
    --conf spark.kryoserializer.buffer.max=1024m \
    --conf spark.sql.parquet.binaryAsString=true \
    --conf spark.port.maxRetries=40 \
    --files /data/ecomtech/config/hbase-site.xml \
    --class com.vcc.adopt.guid_dg_connected_component_v3.RunTest \
    target/guid-dg-connected-component-1.0-SNAPSHOT.jar /