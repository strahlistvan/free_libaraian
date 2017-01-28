import java.util.ArrayList;

import fileIO.FileLister;
import fileIO.TemplateWriter;

public class Main 
{
	public static String rootDir;
    public static TemplateWriter tempWriter = new TemplateWriter();
 	
	public static void main(String[] args) 
	{
		rootDir = "C:/Users/Istvan/Documents/PROGI/free_librarian/database";
		tempWriter.setOutputFile("create01.sql");
		
	    appendScript(rootDir, "sequences", "-- Create sequences", "sql");
	    appendScript(rootDir, "foreign_keys", "-- Create foreign_keys", "sql");
	    appendScript(rootDir, "triggers", "-- Create triggers", "trg");
	    appendScript(rootDir, "procedures", "-- Create procedure", "prc");
	    appendScript(rootDir, "packages", "-- Create package", "spc");
	    appendScript(rootDir, "packages", "-- Create package body", "bdy");
	    
	}
	
	public static void appendScript(String rootDir, String folder, 
			String promptText, String... okExts) 
	{
		rootDir = "C:/Users/Istvan/Documents/PROGI/free_librarian/database";
		System.out.println(promptText);
	    FileLister fileLister = new FileLister();
	    fileLister.setRootDir(rootDir);    
	    fileLister.setOkExt(okExts);
		ArrayList<String> fileList = fileLister.getAllFiles(folder);
		
		tempWriter.printLine(promptText);	
		tempWriter.setTemplateString("prompt === Create [$1] === \n@[$1]\n");

		for (int i=0; i<fileList.size(); ++i) 
		{	
			tempWriter.printTemplate(fileList.get(i));
		}
	}
}
