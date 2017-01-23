import java.util.ArrayList;

import fileIO.FileLister;
import fileIO.TemplateWriter;

public class Main 
{
	public static String rootDir;
	
	public static void main(String[] args) 
	{
		rootDir = "C:/Users/Istvan/Documents/PROGI/free_librarian/database";
	    FileLister fileLister = new FileLister();
	    TemplateWriter tempWriter = new TemplateWriter();
	    fileLister.setRootDir(rootDir);    
	    
	    //sequences
	    fileLister.setOkExt("sql");
		ArrayList<String> fileList = fileLister.getAllFiles("sequences");
		
		tempWriter.setTemplateString("prompt ==  Create sequence: [$1]");	
		for (int i=0; i<fileList.size(); ++i) 
		{
			tempWriter.printTemplate(fileList.get(i));
			tempWriter.setTemplateString("@[$1]");	
			tempWriter.printTemplate(fileList.get(i));
		}
	    
		//tables
	    fileLister.setOkExt("sql");
		fileList = fileLister.getAllFiles("tables");
		
		tempWriter.setTemplateString("prompt ==  Create table: [$1]");	
		for (int i=0; i<fileList.size(); ++i) 
		{
			tempWriter.printTemplate(fileList.get(i));
			tempWriter.setTemplateString("@[$1]");	
			tempWriter.printTemplate(fileList.get(i));
		}
		
		//foreign keys
	    fileLister.setOkExt("sql");
		fileList = fileLister.getAllFiles("foreign_keys");
		
		for (int i=0; i<fileList.size(); ++i) 
		{
			tempWriter.setTemplateString("prompt ==  Create foreign key: [$1]");	
			tempWriter.printTemplate(fileList.get(i));
			tempWriter.setTemplateString("@[$1]");	
			tempWriter.printTemplate(fileList.get(i));
		}
		
		//triggers
	    fileLister.setOkExt("trg");
		fileList = fileLister.getAllFiles("triggers");
		
		for (int i=0; i<fileList.size(); ++i) 
		{
			tempWriter.setTemplateString("prompt ==  Create trigger: [$1]");	
			tempWriter.printTemplate(fileList.get(i));
			tempWriter.setTemplateString("@[$1]");	
			tempWriter.printTemplate(fileList.get(i));
		}
		
		//stored procedures
	    fileLister.setOkExt("prc");
		fileList = fileLister.getAllFiles("procedures");
		
		for (int i=0; i<fileList.size(); ++i) 
		{
			tempWriter.setTemplateString("prompt ==  Create procedure: [$1]");	
			tempWriter.printTemplate(fileList.get(i));
			tempWriter.setTemplateString("@[$1]");	
			tempWriter.printTemplate(fileList.get(i));
		}
		
		//packages species
	    fileLister.setOkExt("spc");
		fileList = fileLister.getAllFiles("packages");
		
		for (int i=0; i<fileList.size(); ++i) 
		{
			tempWriter.setTemplateString("prompt ==  Create package: [$1]");	
			tempWriter.printTemplate(fileList.get(i));
			tempWriter.setTemplateString("@[$1]");	
			tempWriter.printTemplate(fileList.get(i));
		}
		
		//packages bodies
	    fileLister.setOkExt("spc");
		fileList = fileLister.getAllFiles("packages");
		
		for (int i=0; i<fileList.size(); ++i) 
		{
			tempWriter.setTemplateString("prompt ==  Create package body: [$1]");	
			tempWriter.printTemplate(fileList.get(i));
			tempWriter.setTemplateString("@[$1]");	
			tempWriter.printTemplate(fileList.get(i));
		}
	}

}
