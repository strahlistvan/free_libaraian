package fileIO;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;

public class TemplateWriter {
	
	private String templateString;
	private String outputFileName;
	private PrintStream outputWriter = new PrintStream(System.out);

	public String getTemplateString() {
		return templateString;
	}

	public void setTemplateString(String templateString) {
		this.templateString = templateString;
	}
	
	public String getOutputFileName() {
		return outputFileName;
	}

	public void setOutputFile(String outputFileName) 
	{
		try 
		{
			this.outputFileName = outputFileName;
			this.outputWriter = new PrintStream(new File(outputFileName));
		}
		catch (IOException e) 
		{
			System.err.println("Can not open "+outputFileName);
			e.printStackTrace();
		}
	}
	
	public void printTemplate(String ... values) 
	{
		String tempStr = this.templateString;
		for (int i=0; i<values.length; ++i) 
		{
			String pattern = "[$"+(i+1)+"]";
			tempStr = tempStr.replace(pattern, values[i]);
		}
		this.outputWriter.print(tempStr);
	}
	
	public void printLine(String value)
	{
		this.outputWriter.print(value+"\n");	
	}	
}
