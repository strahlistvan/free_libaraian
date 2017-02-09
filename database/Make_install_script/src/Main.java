import java.util.ArrayList;

import configXML.ConfigDataBean;
import configXML.XMLHandler;
import fileIO.FileLister;
import fileIO.TemplateWriter;

public class Main 
{
    public static TemplateWriter tempWriter = new TemplateWriter();
 	
	public static void main(String[] args) 
	{
		String inputXML = (args.length > 0) ? args[0] : "config.xml";
		String inputXSD = (args.length > 1) ? args[1] : "config_schema.xsd";
		
		XMLHandler xmlHandler = new XMLHandler(inputXSD);
		ConfigDataBean configData = xmlHandler.extractData(inputXML);
		tempWriter.setOutputFile(configData.getOutputFile());
		
		makeScript(configData);
		System.out.println(configData.getOutputFile()+" script successfully created.");
		
	}
	
	public static void makeScript(ConfigDataBean config)
	{
	    appendScript("sequences", "-- Create sequences", config);
	    appendScript("foreign_keys", "-- Create foreign_keys", config);
	    appendScript("triggers", "-- Create triggers", config);
	    appendScript("procedures", "-- Create procedure", config);
	    config.setAcceptedExtensions("spc");
	    appendScript("packages", "-- Create package", config);
	    config.setAcceptedExtensions("bdy");
	    appendScript("packages", "-- Create package body", config);
	}
	
	public static void appendScript( String folder, 
			String promptText, ConfigDataBean configData) 
	{
		System.out.println(promptText);
	    FileLister fileLister = new FileLister();
	    fileLister.setRootDir(configData.getRootDir());    
	    fileLister.setOkExt(configData.getAcceptedExtensions());
		ArrayList<String> fileList = fileLister.getAllFiles(folder);
		
		tempWriter.printLine(promptText);	
		tempWriter.setTemplateString("prompt === Create [$1] === \n@[$1]\n");

		for (int i=0; i<fileList.size(); ++i) 
		{	
			tempWriter.printTemplate(fileList.get(i));
		}
	}
}
