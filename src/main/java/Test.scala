import org.apache.spark.sql.SparkSession

object Test{
  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder().master("local[*]")
      .config("spark.sql.parquet.binaryAsString","true")
      .appName("test")
      .config("spark.testing.memory", 471859200)
      .getOrCreate();
    spark.sparkContext.setLogLevel("WARN")
    import spark.implicits._
    val df = List(("alice", 10), ("bob", 20)).toDF("name", "age")
    df.filter("age > 10").show()
  }
}