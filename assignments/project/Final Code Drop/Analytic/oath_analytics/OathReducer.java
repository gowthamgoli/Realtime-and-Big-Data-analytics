import java.io.IOException;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapreduce.Reducer;

public class OathReducer extends Reducer<Text, IntWritable, Text, IntWritable> {

	protected Text word_value = new Text();
	
	@Override
	public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {

		int sum = 0;
		for(IntWritable val: values){
			sum = sum + val.get();
		}
		context.write(key, new IntWritable(sum));
	}
	
}
