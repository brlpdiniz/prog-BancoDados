import org.apache.spark.sql.SQLContext
import org.apache.spark.sql.functions._
import java.text.SimpleDateFormat
import org.apache.spark.sql.Row
import org.apache.spark.sql.types.{StructType, StructField, StringType, IntegerType, FloatType, DoubleType}
import org.apache.spark.ml.feature.VectorAssembler
import org.apache.spark.ml.regression.{LinearRegression, RandomForestRegressor, GBTRegressor}
import org.apache.spark.ml.evaluation.RegressionEvaluator
import org.apache.spark.ml.attribute.Attribute
import org.apache.spark.ml.feature.{IndexToString, StringIndexer}

val customSchema = StructType(Array(
StructField("uf_busca", StringType, true),
StructField("cidade_busca", StringType, true),
StructField("universidade_nome", StringType, true),
StructField("campus_nome", StringType, true),
StructField("nome", StringType, true),
StructField("grau", StringType, true),
StructField("turno", StringType, true),
StructField("mensalidade", DoubleType, true),
StructField("bolsa_integral_cotas", IntegerType, true),
StructField("bolsa_integral_ampla", IntegerType, true),
StructField("bolsa_parcial_cotas", IntegerType, true),
StructField("bolsa_parcial_ampla", IntegerType, true),
StructField("nota_integral_ampla", DoubleType, true),
StructField("nota_integral_cotas", DoubleType, true),
StructField("nota_parcial_ampla", DoubleType, true),
StructField("nota_parcial_cotas", DoubleType, true)))

val df = spark.read.format("csv").option("delimiter",",").option("quote","").option("header", "true").schema(customSchema).load("cursos-prouni.csv")

df.createOrReplaceTempView("ProUni")

spark.sql("SELECT * FROM ProUni").show