import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


public class AirQualityMapper extends Mapper<LongWritable, Text, Text, FloatWritable> {

	protected Text word_key = new Text();
	//private final static IntWritable one = new IntWritable(1);

	
	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {

		String year = "";
		String borough = "";
		float quality; 
		String line = value.toString();
		String[] tokens = line.split(",");
		
		if(tokens.length == 3){
			borough = tokens[0];
			year = tokens[1];
			quality = Float.parseFloat(tokens[2]);
			word_key.set(year+"\t"+borough);
			context.write(word_key, new FloatWritable(quality));
		}
						
	}
}
