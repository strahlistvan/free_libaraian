package fileIO;

public class TemplateWriter {
	
	private String templateString;

	public String getTemplateString() {
		return templateString;
	}

	public void setTemplateString(String templateString) {
		this.templateString = templateString;
	}
	
	public void printTemplate(String ... values) 
	{
		String tempStr = this.templateString;
		for (int i=0; i<values.length; ++i) 
		{
			String pattern = "[$"+(i+1)+"]";
			tempStr = tempStr.replace(pattern, values[i]);
		}
		System.out.println(tempStr);
	}

	public void print(String value)
	{
		System.out.print(value);
	}
	
	public void printLine(String value)
	{
		System.out.println(value);
	}
}
