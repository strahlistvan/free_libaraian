package configXML;

import java.util.ArrayList;

public class ConfigDataBean 
{
	private String rootDir;
	private String outputFile;
	private ArrayList<String> acceptedExtensions = new ArrayList<String>();
	public String getRootDir() {
		return rootDir;
	}
	public void setRootDir(String rootDir) {
		this.rootDir = rootDir;
	}
	public String getOutputFile() {
		return outputFile;
	}
	public void setOutputFile(String outputFile) {
		this.outputFile = outputFile;
	}
	public ArrayList<String> getAcceptedExtensions() {
		return acceptedExtensions;
	}
	public void setAcceptedExtensions(ArrayList<String> acceptedExtensions) {
		this.acceptedExtensions = acceptedExtensions;
	}
	
	public void addNewExtension(String extension) {
		this.acceptedExtensions.add(extension);
	}
	
	public String getExtension(Integer index) {
		return this.acceptedExtensions.get(index);
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("rootDir: ");
		builder.append(this.rootDir);
		builder.append(", outputFile: ");
		builder.append(this.outputFile);
		if (this.acceptedExtensions.size() > 0)
		{
			builder.append(", accepted_extensions: { ");
			builder.append(this.acceptedExtensions.get(0));
			for (int i=1; i<this.acceptedExtensions.size(); ++i)
			{
				builder.append(", ");
				builder.append(this.acceptedExtensions.get(i));
			}
			builder.append(" }");
		}
		return builder.toString();
	}
}
