import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;


public class WaterQualityMapper extends Mapper<LongWritable, Text, Text, IntWritable> {

	protected Text word_key = new Text();
	private final static IntWritable one = new IntWritable(1);

	
	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {

		String date = "";
		String borough = "";
		String line = value.toString();
		String[] tokens = line.split(",");
		
		if(tokens.length == 2){
			borough = tokens[1];
			date = tokens[0];
			word_key.set(date+"\t"+borough);
			context.write(word_key, one);
		}
						
	}
}
